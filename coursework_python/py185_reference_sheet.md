# Database Applications with Python Reference Sheet

## PostgreSQL Setup and Connection

### Installing PostgreSQL
```bash
# On Ubuntu/Debian
sudo apt-get update
sudo apt-get install postgresql postgresql-contrib

# On macOS with Homebrew
brew install postgresql

# On Windows, use the installer from postgresql.org
```

### Installing psycopg2
```bash
# Install psycopg2 (PostgreSQL adapter for Python)
pip install psycopg2

# For systems without development headers, use the binary version
pip install psycopg2-binary
```

### Basic Connection
```python
import psycopg2

# Connect to an existing database
conn = psycopg2.connect(
    host="localhost",
    database="mydb",
    user="postgres",
    password="password"
)

# Open a cursor to perform database operations
cur = conn.cursor()

# Execute a command
cur.execute("SELECT version();")

# Retrieve query results
version = cur.fetchone()
print(f"PostgreSQL version: {version}")

# Close communication with the database
cur.close()
conn.close()
```

### Connection String Format
```python
# URI format
conn = psycopg2.connect("postgresql://username:password@localhost:5432/mydb")

# Keyword arguments
conn = psycopg2.connect(
    host="localhost",
    port="5432",
    database="mydb",
    user="username",
    password="password"
)

# Using environment variables for security
import os
conn = psycopg2.connect(
    host=os.environ.get("DB_HOST", "localhost"),
    database=os.environ.get("DB_NAME", "mydb"),
    user=os.environ.get("DB_USER", "postgres"),
    password=os.environ.get("DB_PASSWORD", "")
)
```

### Connection Context Manager
```python
import psycopg2

# Using with statement to automatically close the connection
with psycopg2.connect(
    host="localhost",
    database="mydb",
    user="postgres",
    password="password"
) as conn:
    # Auto-commit is off by default
    with conn.cursor() as cur:
        cur.execute("SELECT version();")
        version = cur.fetchone()
        print(f"PostgreSQL version: {version}")
    # The transaction is committed when the with block exits
```

## Basic Database Operations

### Creating Tables
```python
# Create a table
create_table_query = """
CREATE TABLE expenses (
    id SERIAL PRIMARY KEY,
    amount NUMERIC(6,2) NOT NULL,
    memo TEXT NOT NULL,
    created_on DATE NOT NULL
);
"""

with conn.cursor() as cur:
    cur.execute(create_table_query)
    conn.commit()
```

### Inserting Data
```python
# Simple insert
insert_query = """
INSERT INTO expenses (amount, memo, created_on)
VALUES (%s, %s, %s);
"""
with conn.cursor() as cur:
    cur.execute(insert_query, (50.25, "Grocery shopping", "2023-01-15"))
    conn.commit()

# Insert multiple rows
data_to_insert = [
    (25.50, "Lunch", "2023-01-16"),
    (10.00, "Bus fare", "2023-01-16"),
    (125.00, "Electricity bill", "2023-01-17")
]
with conn.cursor() as cur:
    cur.executemany(insert_query, data_to_insert)
    conn.commit()

# Insert with returning clause
insert_returning_query = """
INSERT INTO expenses (amount, memo, created_on)
VALUES (%s, %s, %s)
RETURNING id;
"""
with conn.cursor() as cur:
    cur.execute(insert_returning_query, (75.25, "Dinner", "2023-01-18"))
    new_id = cur.fetchone()[0]
    print(f"New expense ID: {new_id}")
    conn.commit()
```

### Selecting Data
```python
# Select all rows
select_query = "SELECT * FROM expenses;"
with conn.cursor() as cur:
    cur.execute(select_query)
    expenses = cur.fetchall()
    for expense in expenses:
        print(expense)

# Select with filter
select_filter_query = "SELECT * FROM expenses WHERE amount > %s;"
with conn.cursor() as cur:
    cur.execute(select_filter_query, (50,))
    expenses = cur.fetchall()
    for expense in expenses:
        print(expense)

# Fetch one row at a time
with conn.cursor() as cur:
    cur.execute(select_query)
    while True:
        row = cur.fetchone()
        if row is None:
            break
        print(row)

# Fetch in batches
with conn.cursor() as cur:
    cur.execute(select_query)
    while True:
        rows = cur.fetchmany(size=2)  # Fetch 2 rows at a time
        if not rows:
            break
        for row in rows:
            print(row)
```

### Updating Data
```python
# Update a record
update_query = "UPDATE expenses SET amount = %s WHERE id = %s;"
with conn.cursor() as cur:
    cur.execute(update_query, (60.00, 1))
    print(f"Updated {cur.rowcount} row(s)")
    conn.commit()

# Update with returning clause
update_returning_query = """
UPDATE expenses 
SET memo = %s 
WHERE id = %s
RETURNING memo, amount;
"""
with conn.cursor() as cur:
    cur.execute(update_returning_query, ("Updated grocery expense", 1))
    updated_data = cur.fetchone()
    print(f"Updated data: {updated_data}")
    conn.commit()
```

### Deleting Data
```python
# Delete a record
delete_query = "DELETE FROM expenses WHERE id = %s;"
with conn.cursor() as cur:
    cur.execute(delete_query, (3,))
    print(f"Deleted {cur.rowcount} row(s)")
    conn.commit()

# Delete with filter
delete_filter_query = "DELETE FROM expenses WHERE amount < %s;"
with conn.cursor() as cur:
    cur.execute(delete_filter_query, (10,))
    print(f"Deleted {cur.rowcount} row(s)")
    conn.commit()

# Delete all records
delete_all_query = "DELETE FROM expenses;"
with conn.cursor() as cur:
    cur.execute(delete_all_query)
    print(f"Deleted {cur.rowcount} row(s)")
    conn.commit()
```

### Transactions
```python
# Manual transaction control
conn = psycopg2.connect(
    host="localhost",
    database="mydb",
    user="postgres",
    password="password"
)
try:
    # Create a cursor
    cur = conn.cursor()
    
    # Execute commands
    cur.execute("INSERT INTO expenses (amount, memo, created_on) VALUES (%s, %s, %s);", 
                (100.00, "Rent", "2023-01-20"))
    cur.execute("INSERT INTO expenses (amount, memo, created_on) VALUES (%s, %s, %s);", 
                (45.00, "Internet", "2023-01-20"))
    
    # Commit the transaction
    conn.commit()
    print("Transaction committed")
    
except Exception as e:
    # Roll back the transaction in case of an error
    conn.rollback()
    print(f"Transaction rolled back: {e}")
    
finally:
    # Close the cursor and connection
    if cur:
        cur.close()
    if conn:
        conn.close()
```

## Advanced Database Techniques

### Parameter Binding for Security
```python
# NEVER use string formatting for SQL - vulnerable to SQL injection
# BAD EXAMPLE - DO NOT USE
amount = 50
query = f"SELECT * FROM expenses WHERE amount > {amount};"  # VULNERABLE TO SQL INJECTION

# GOOD EXAMPLE - Use parameter binding
query = "SELECT * FROM expenses WHERE amount > %s;"
params = (amount,)
with conn.cursor() as cur:
    cur.execute(query, params)  # Safe from SQL injection
    results = cur.fetchall()
```

### Different Parameter Styles
```python
# PostgreSQL standard placeholders (%s)
cur.execute("SELECT * FROM expenses WHERE id = %s AND memo = %s;", (1, "Lunch"))

# Named parameters with psycopg2
cur.execute("SELECT * FROM expenses WHERE id = %(id)s AND memo = %(memo)s;", 
           {'id': 1, 'memo': "Lunch"})
```

### Handling Different Data Types
```python
# Dates
from datetime import date, datetime

# Insert a date
cur.execute("INSERT INTO expenses (amount, memo, created_on) VALUES (%s, %s, %s);",
           (50.00, "Groceries", date.today()))

# Insert a timestamp
cur.execute("INSERT INTO events (event_name, event_time) VALUES (%s, %s);",
           ("Meeting", datetime.now()))

# Arrays
cur.execute("INSERT INTO tags (tag_name, related_tags) VALUES (%s, %s);",
           ("Python", ["Programming", "Coding", "Development"]))

# JSON
import json
data = {"name": "John", "skills": ["Python", "SQL"]}
cur.execute("INSERT INTO profiles (user_id, data) VALUES (%s, %s);",
           (1, json.dumps(data)))

# Or with psycopg2's JSON adapter
from psycopg2.extras import Json
cur.execute("INSERT INTO profiles (user_id, data) VALUES (%s, %s);",
           (1, Json(data)))
```

### Using Different Cursor Types
```python
import psycopg2
import psycopg2.extras

# Dictionary cursor (returns results as dictionaries)
with psycopg2.connect("dbname=mydb user=postgres") as conn:
    with conn.cursor(cursor_factory=psycopg2.extras.DictCursor) as cur:
        cur.execute("SELECT id, amount, memo FROM expenses WHERE id = %s;", (1,))
        record = cur.fetchone()
        print(f"ID: {record['id']}, Amount: {record['amount']}, Memo: {record['memo']}")

# Named tuple cursor (returns results as named tuples)
with psycopg2.connect("dbname=mydb user=postgres") as conn:
    with conn.cursor(cursor_factory=psycopg2.extras.NamedTupleCursor) as cur:
        cur.execute("SELECT id, amount, memo FROM expenses WHERE id = %s;", (1,))
        record = cur.fetchone()
        print(f"ID: {record.id}, Amount: {record.amount}, Memo: {record.memo}")

# Real dictionary cursor (returns dictionaries, not custom objects)
with psycopg2.connect("dbname=mydb user=postgres") as conn:
    with conn.cursor(cursor_factory=psycopg2.extras.RealDictCursor) as cur:
        cur.execute("SELECT id, amount, memo FROM expenses WHERE id = %s;", (1,))
        record = cur.fetchone()
        print(record)  # {'id': 1, 'amount': 50.25, 'memo': 'Groceries'}
```

### Working with COPY Command
```python
import psycopg2

# Copy data from CSV to table
with open('expenses.csv', 'r') as f:
    with psycopg2.connect("dbname=mydb user=postgres") as conn:
        with conn.cursor() as cur:
            cur.copy_expert("COPY expenses(amount, memo, created_on) FROM STDIN WITH CSV HEADER", f)
            conn.commit()

# Copy data from table to CSV
with open('expenses_export.csv', 'w') as f:
    with psycopg2.connect("dbname=mydb user=postgres") as conn:
        with conn.cursor() as cur:
            cur.copy_expert("COPY expenses TO STDIN WITH CSV HEADER", f)
```

## Web Application Integration

### Flask Database Connection Setup
```python
import os
import psycopg2
from flask import Flask, g

app = Flask(__name__)

# Database connection function
def get_db():
    if 'db' not in g:
        g.db = psycopg2.connect(
            host=os.environ.get("DB_HOST", "localhost"),
            database=os.environ.get("DB_NAME", "mydb"),
            user=os.environ.get("DB_USER", "postgres"),
            password=os.environ.get("DB_PASSWORD", "")
        )
    return g.db

# Close database connection
@app.teardown_appcontext
def close_db(e=None):
    db = g.pop('db', None)
    if db is not None:
        db.close()

# Example route using database
@app.route('/expenses')
def expenses():
    conn = get_db()
    with conn.cursor() as cur:
        cur.execute("SELECT * FROM expenses ORDER BY created_on DESC;")
        expenses = cur.fetchall()
    
    # Process and return data
    return {'expenses': expenses}
```

### Schema Initialization
```python
# schema.sql file
"""
DROP TABLE IF EXISTS expenses;

CREATE TABLE expenses (
    id SERIAL PRIMARY KEY,
    amount NUMERIC(6,2) NOT NULL,
    memo TEXT NOT NULL,
    created_on DATE NOT NULL
);
"""

# In Python file
def init_db():
    conn = get_db()
    with conn.cursor() as cur:
        with open('schema.sql', 'r') as f:
            cur.execute(f.read())
        conn.commit()

@app.cli.command('init-db')
def init_db_command():
    """Clear the existing data and create new tables."""
    init_db()
    print('Initialized the database.')
```

### Session Persistence Module
```python
import psycopg2

class DatabasePersistence:
    def __init__(self, connection_string):
        self.connection_string = connection_string
    
    def _db_connection(self):
        return psycopg2.connect(self.connection_string)
    
    def find_todos(self):
        with self._db_connection() as conn:
            with conn.cursor() as cur:
                cur.execute("SELECT * FROM todos ORDER BY id;")
                todos = cur.fetchall()
        return todos
    
    def add_todo(self, todo_name):
        with self._db_connection() as conn:
            with conn.cursor() as cur:
                cur.execute(
                    "INSERT INTO todos (name, completed) VALUES (%s, %s) RETURNING id;",
                    (todo_name, False)
                )
                todo_id = cur.fetchone()[0]
                conn.commit()
        return todo_id
    
    def toggle_todo_status(self, todo_id):
        with self._db_connection() as conn:
            with conn.cursor() as cur:
                cur.execute(
                    "UPDATE todos SET completed = NOT completed WHERE id = %s;",
                    (todo_id,)
                )
                conn.commit()
```

## Performance Optimization

### Solving N+1 Query Problem
```python
# BAD EXAMPLE - N+1 Query Problem
def get_todos_with_items_n_plus_1():
    todos = []
    with conn.cursor() as cur:
        cur.execute("SELECT id, title FROM todos;")
        for todo_id, title in cur.fetchall():
            todos.append({'id': todo_id, 'title': title})
            
            # This creates an additional query for each todo - N+1 problem!
            with conn.cursor() as items_cur:
                items_cur.execute("SELECT id, description FROM items WHERE todo_id = %s;", (todo_id,))
                items = [{'id': item_id, 'description': desc} for item_id, desc in items_cur]
                todos[-1]['items'] = items
    return todos

# GOOD EXAMPLE - Using JOINs to solve N+1
def get_todos_with_items_optimized():
    query = """
    SELECT t.id, t.title, i.id as item_id, i.description
    FROM todos t
    LEFT JOIN items i ON t.id = i.todo_id
    ORDER BY t.id, i.id;
    """
    
    todos = {}
    with conn.cursor() as cur:
        cur.execute(query)
        for todo_id, title, item_id, description in cur:
            if todo_id not in todos:
                todos[todo_id] = {'id': todo_id, 'title': title, 'items': []}
            
            if item_id is not None:
                todos[todo_id]['items'].append({'id': item_id, 'description': description})
    
    return list(todos.values())
```

### Query Logging and Timing
```python
import time
import logging

# Set up logging
logging.basicConfig(
    level=logging.DEBUG,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s',
    filename='database.log'
)
logger = logging.getLogger('db_operations')

def execute_query(query, params=None):
    """Execute a query with timing and logging."""
    start_time = time.time()
    conn = get_db()
    
    try:
        with conn.cursor() as cur:
            if params:
                logger.debug(f"Executing query: {query} with params: {params}")
                cur.execute(query, params)
            else:
                logger.debug(f"Executing query: {query}")
                cur.execute(query)
            
            result = cur.fetchall()
            conn.commit()
            
            execution_time = time.time() - start_time
            logger.debug(f"Query executed in {execution_time:.3f} seconds, returned {len(result)} rows")
            
            return result
    except Exception as e:
        conn.rollback()
        logger.error(f"Query failed: {e}")
        raise
```

### Database Connection Pooling
```python
from psycopg2 import pool

# Create a connection pool
connection_pool = pool.SimpleConnectionPool(
    minconn=1,
    maxconn=10,
    host="localhost",
    database="mydb",
    user="postgres",
    password="password"
)

def get_db_from_pool():
    return connection_pool.getconn()

def return_db_to_pool(conn):
    connection_pool.putconn(conn)

# Example usage
try:
    conn = get_db_from_pool()
    with conn.cursor() as cur:
        cur.execute("SELECT * FROM expenses;")
        expenses = cur.fetchall()
finally:
    return_db_to_pool(conn)

# Clean up at application shutdown
def close_pool():
    if connection_pool:
        connection_pool.closeall()
```

## Deployment

### Setting Up for Render Deployment
```python
import os
import psycopg2
from flask import Flask

app = Flask(__name__)

# Get database URL from environment (Render sets this)
DATABASE_URL = os.environ.get('DATABASE_URL', 'postgresql://localhost/mydb')

# Check if running on Render and adjust URL if needed
if DATABASE_URL.startswith("postgres://"):
    DATABASE_URL = DATABASE_URL.replace("postgres://", "postgresql://", 1)

def get_db():
    return psycopg2.connect(DATABASE_URL)

# Example route
@app.route('/')
def index():
    conn = get_db()
    try:
        with conn.cursor() as cur:
            cur.execute("SELECT version();")
            version = cur.fetchone()[0]
        return f"Connected to PostgreSQL: {version}"
    finally:
        conn.close()

if __name__ == '__main__':
    # Get port from environment (Render sets this)
    port = int(os.environ.get('PORT', 5000))
    app.run(host='0.0.0.0', port=port)
```

### Environment Configuration Example
```bash
# .env file for local development
DB_HOST=localhost
DB_NAME=mydb
DB_USER=postgres
DB_PASSWORD=password
PORT=5000
```

```python
# In Python code
import os
from dotenv import load_dotenv

# Load environment variables from .env file if it exists
load_dotenv()

# Database configuration
DB_CONFIG = {
    'host': os.environ.get('DB_HOST', 'localhost'),
    'database': os.environ.get('DB_NAME', 'mydb'),
    'user': os.environ.get('DB_USER', 'postgres'),
    'password': os.environ.get('DB_PASSWORD', '')
}

# Example usage
import psycopg2

def get_db_connection():
    return psycopg2.connect(**DB_CONFIG)
```
