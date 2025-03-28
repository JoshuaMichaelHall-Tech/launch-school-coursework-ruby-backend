# Database Applications with Python Study Guide

## Introduction to Database Applications

### What is a Database Application?
A database application is a program that interacts with a database to store, retrieve, update, and delete data. In PY185, we focus on building applications that use PostgreSQL as the database backend with Python as the programming language.

### Why Use a Database in Applications?
- **Data Persistence**: Store data that survives beyond program execution
- **Data Integrity**: Enforce constraints and relationships between data
- **Concurrent Access**: Allow multiple users to access and modify data simultaneously
- **Query Capabilities**: Efficiently retrieve and filter large amounts of data
- **Scalability**: Handle growing amounts of data and users
- **Security**: Control access to sensitive data

### The Python-PostgreSQL Stack
- **Python**: Versatile programming language with extensive library support
- **PostgreSQL**: Powerful open-source relational database
- **psycopg2**: PostgreSQL adapter for Python
- **Flask**: Lightweight web framework (for web applications)

## PostgreSQL Adapter: psycopg2

### Basic Connection and Interaction
Understanding how to connect to a PostgreSQL database from Python is fundamental:

```python
import psycopg2

# Establish connection
conn = psycopg2.connect(
    host="localhost",
    database="expenses",
    user="postgres",
    password="password"
)

# Create a cursor
cur = conn.cursor()

# Execute a query
cur.execute("SELECT * FROM expenses;")

# Fetch results
expenses = cur.fetchall()

# Clean up
cur.close()
conn.close()
```

Key concepts to understand:
- Connection objects
- Cursor objects
- Executing SQL
- Fetching results (fetchone, fetchall, fetchmany)
- Proper resource cleanup

### Connection Management
Study different approaches to connection management:

1. **Manual connection management**:
   ```python
   conn = psycopg2.connect(...)
   try:
       # Use connection
   finally:
       conn.close()
   ```

2. **Context manager approach**:
   ```python
   with psycopg2.connect(...) as conn:
       # Use connection
   # Connection automatically closed
   ```

3. **Connection pooling**:
   ```python
   from psycopg2 import pool
   
   connection_pool = pool.SimpleConnectionPool(1, 10, ...)
   
   # Get connection from pool
   conn = connection_pool.getconn()
   # Use connection
   connection_pool.putconn(conn)
   ```

### SQL Injection Prevention
Understanding parameter binding is crucial for security:

```python
# UNSAFE - Never do this
amount = "50; DROP TABLE expenses;"
cur.execute(f"SELECT * FROM expenses WHERE amount > {amount};")  # SQL Injection vulnerability!

# SAFE - Always use parameter binding
cur.execute("SELECT * FROM expenses WHERE amount > %s;", (amount,))
```

Learn different parameter styles:
- Positional parameters: `%s`
- Named parameters: `%(name)s`

## Command-Line Database Applications

### Project Structure
Study how to organize a command-line database application:
- Separate modules for database operations
- Command parsers
- User interface
- Configuration management

### Schema Design and Creation
Learn to design and automatically create database schemas:

```python
def setup_schema():
    """Set up the database schema."""
    with conn.cursor() as cur:
        cur.execute("""
        CREATE TABLE IF NOT EXISTS expenses (
            id SERIAL PRIMARY KEY,
            amount NUMERIC(6,2) NOT NULL,
            memo TEXT NOT NULL,
            created_on DATE NOT NULL
        );
        """)
        conn.commit()
```

### CRUD Operations
Study how to implement Create, Read, Update, Delete operations:

1. **Create (Insert)**:
   ```python
   def add_expense(amount, memo, date):
       with conn.cursor() as cur:
           cur.execute(
               "INSERT INTO expenses (amount, memo, created_on) VALUES (%s, %s, %s) RETURNING id;",
               (amount, memo, date)
           )
           expense_id = cur.fetchone()[0]
           conn.commit()
           return expense_id
   ```

2. **Read (Select)**:
   ```python
   def list_expenses():
       with conn.cursor() as cur:
           cur.execute("SELECT * FROM expenses ORDER BY created_on;")
           return cur.fetchall()
   ```

3. **Update**:
   ```python
   def update_expense(expense_id, amount, memo, date):
       with conn.cursor() as cur:
           cur.execute(
               "UPDATE expenses SET amount = %s, memo = %s, created_on = %s WHERE id = %s;",
               (amount, memo, date, expense_id)
           )
           conn.commit()
           return cur.rowcount > 0
   ```

4. **Delete**:
   ```python
   def delete_expense(expense_id):
       with conn.cursor() as cur:
           cur.execute("DELETE FROM expenses WHERE id = %s;", (expense_id,))
           conn.commit()
           return cur.rowcount > 0
   ```

### Error Handling
Learn proper error handling for database operations:

```python
try:
    conn = psycopg2.connect(...)
    # Database operations
except psycopg2.Error as e:
    print(f"Database error: {e}")
    conn.rollback()  # Important for transaction safety
finally:
    if conn:
        conn.close()
```

## Web Application Database Integration

### Session Persistence
Understand how to implement session persistence with a database:

```python
class SessionPersistence:
    def __init__(self, connection_string):
        self.connection_string = connection_string
    
    def _db_connection(self):
        return psycopg2.connect(self.connection_string)
    
    def find_lists(self):
        with self._db_connection() as conn:
            with conn.cursor() as cur:
                cur.execute("SELECT * FROM lists ORDER BY id;")
                return cur.fetchall()
    
    # More methods for CRUD operations...
```

### Database Connection in Flask
Learn how to manage database connections in a Flask application:

```python
import psycopg2
from flask import Flask, g

app = Flask(__name__)

def get_db():
    if 'db' not in g:
        g.db = psycopg2.connect(DATABASE_URL)
    return g.db

@app.teardown_appcontext
def close_db(e=None):
    db = g.pop('db', None)
    if db is not None:
        db.close()

@app.route('/todos')
def todos():
    conn = get_db()
    with conn.cursor() as cur:
        cur.execute("SELECT * FROM todos;")
        todos = cur.fetchall()
    return render_template('todos.html', todos=todos)
```

### Database Schema Creation
Understand how to automatically set up schema in a web application:

```python
def init_schema():
    conn = get_db()
    with conn.cursor() as cur:
        # Create tables if they don't exist
        cur.execute("""
        CREATE TABLE IF NOT EXISTS lists (
            id SERIAL PRIMARY KEY,
            name TEXT NOT NULL UNIQUE,
            created_on TIMESTAMP DEFAULT NOW()
        );
        
        CREATE TABLE IF NOT EXISTS todos (
            id SERIAL PRIMARY KEY,
            list_id INTEGER NOT NULL REFERENCES lists(id) ON DELETE CASCADE,
            name TEXT NOT NULL,
            completed BOOLEAN NOT NULL DEFAULT FALSE,
            created_on TIMESTAMP DEFAULT NOW()
        );
        """)
        conn.commit()
```

## Performance Optimization

### The N+1 Query Problem
Understand the N+1 query problem and how to solve it:

```python
# Problematic approach - N+1 queries
def get_lists_with_todos_n_plus_1():
    lists = []
    with conn.cursor() as cur:
        cur.execute("SELECT id, name FROM lists;")
        for list_id, name in cur.fetchall():
            list_data = {'id': list_id, 'name': name, 'todos': []}
            
            # For each list, we perform an additional query - this is the N+1 problem!
            with conn.cursor() as todo_cur:
                todo_cur.execute("SELECT id, name, completed FROM todos WHERE list_id = %s;", (list_id,))
                for todo_id, todo_name, completed in todo_cur.fetchall():
                    list_data['todos'].append({'id': todo_id, 'name': todo_name, 'completed': completed})
            
            lists.append(list_data)
    return lists

# Better approach - single query with JOIN
def get_lists_with_todos_optimized():
    query = """
    SELECT l.id, l.name, t.id AS todo_id, t.name AS todo_name, t.completed
    FROM lists l
    LEFT JOIN todos t ON l.id = t.list_id
    ORDER BY l.id, t.id;
    """
    
    lists = {}
    with conn.cursor() as cur:
        cur.execute(query)
        for list_id, list_name, todo_id, todo_name, completed in cur.fetchall():
            if list_id not in lists:
                lists[list_id] = {'id': list_id, 'name': list_name, 'todos': []}
            
            if todo_id is not None:
                lists[list_id]['todos'].append({
                    'id': todo_id,
                    'name': todo_name,
                    'completed': completed
                })
    
    return list(lists.values())
```

### Query Optimization Techniques
Study additional query optimization techniques:
- Using appropriate indexes
- Limiting result sets
- Selecting only needed columns
- Using prepared statements
- Batch processing

### Database Logging and Analysis
Understand how to log and analyze database operations:

```python
import logging
import time

logging.basicConfig(level=logging.DEBUG)
logger = logging.getLogger('db')

def execute_query(query, params=None):
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
            execution_time = time.time() - start_time
            logger.debug(f"Query executed in {execution_time:.3f} seconds, returned {len(result)} rows")
            return result
    except Exception as e:
        logger.error(f"Query failed: {e}")
        raise
```

## Database Design and Schema

### Normalization
Understand database normalization principles:
- First Normal Form (1NF): Atomic values, no repeating groups
- Second Normal Form (2NF): No partial dependencies
- Third Normal Form (3NF): No transitive dependencies

### Relationships
Study how to implement relationships in a database:
- One-to-One
- One-to-Many
- Many-to-Many

Example of a Many-to-Many relationship:
```sql
CREATE TABLE tags (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL UNIQUE
);

CREATE TABLE expenses (
    id SERIAL PRIMARY KEY,
    amount NUMERIC(6,2) NOT NULL,
    memo TEXT NOT NULL,
    created_on DATE NOT NULL
);

CREATE TABLE expense_tags (
    expense_id INTEGER REFERENCES expenses(id) ON DELETE CASCADE,
    tag_id INTEGER REFERENCES tags(id) ON DELETE CASCADE,
    PRIMARY KEY (expense_id, tag_id)
);
```

### Constraints
Understand how to implement database constraints:
- Primary Key
- Foreign Key
- Unique
- Not Null
- Check
- Default
- Cascading Actions

## Deployment and Operations

### Environment Configuration
Learn how to configure your application for different environments:

```python
import os
from dotenv import load_dotenv

# Load .env file if it exists
load_dotenv()

# Database configuration
DATABASE_URL = os.environ.get('DATABASE_URL', 'postgresql://localhost/mydb')

# Check if running on Render and adjust URL if needed
if DATABASE_URL.startswith("postgres://"):
    DATABASE_URL = DATABASE_URL.replace("postgres://", "postgresql://", 1)
```

### Deploying to Render
Understand how to deploy a database application to Render:
- Creating a PostgreSQL database on Render
- Configuring environment variables
- Setting up database connection
- Handling database migration and initialization

### Database Maintenance
Study database maintenance tasks:
- Regular backups
- Monitoring database performance
- Handling database migrations
- Updating schemas

## Advanced Topics

### Transactions
Understand transaction management:

```python
conn = psycopg2.connect(...)
try:
    # Create a cursor
    cur = conn.cursor()
    
    # First operation
    cur.execute("INSERT INTO accounts (name, balance) VALUES (%s, %s);", ("Alice", 1000))
    
    # Second operation (part of the same transaction)
    cur.execute("INSERT INTO accounts (name, balance) VALUES (%s, %s);", ("Bob", 500))
    
    # Commit the transaction
    conn.commit()
except Exception as e:
    # Roll back the transaction in case of an error
    conn.rollback()
    print(f"Error: {e}")
finally:
    conn.close()
```

### Connection Pooling
Learn how to implement connection pooling for better performance:

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

def get_connection():
    return connection_pool.getconn()

def release_connection(conn):
    connection_pool.putconn(conn)

# Example usage
conn = get_connection()
try:
    # Use connection
    ...
finally:
    release_connection(conn)
```

### Advanced SQL Features
Study advanced SQL features supported by PostgreSQL:
- Common Table Expressions (CTEs)
- Window Functions
- JSON Data Types
- Full-Text Search
- Triggers and Stored Procedures

## Study Tips

1. **Build Sample Applications**: Implement small database applications to reinforce concepts
2. **Test Your Code**: Write tests for your database operations
3. **Experiment with Optimization**: Measure performance before and after optimizations
4. **Study Edge Cases**: Practice handling errors and edge cases
5. **Review Security Best Practices**: Focus on preventing SQL injection and securing credentials
