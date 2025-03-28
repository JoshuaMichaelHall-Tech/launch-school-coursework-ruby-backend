# LS180: Database Foundations - Reference Sheet

## PostgreSQL Command Line

```bash
# Connect to a database
psql database_name

# Connect with specific user
psql -U username database_name

# List all databases
\l

# Connect to a different database
\c database_name

# List all tables
\dt

# Describe table structure
\d table_name

# List all schemas
\dn

# List all users
\du

# Show all commands
\?

# Quit psql
\q
```

## Basic SQL Queries

```sql
-- Create a database
CREATE DATABASE database_name;

-- Drop a database
DROP DATABASE database_name;

-- Create a table
CREATE TABLE table_name (
  id serial PRIMARY KEY,
  name varchar(100) NOT NULL,
  age integer,
  email varchar(100) UNIQUE,
  created_at timestamp DEFAULT NOW()
);

-- Drop a table
DROP TABLE table_name;

-- Alter a table
ALTER TABLE table_name ADD COLUMN new_column varchar(50);
ALTER TABLE table_name DROP COLUMN column_name;
ALTER TABLE table_name RENAME COLUMN old_name TO new_name;
ALTER TABLE table_name ALTER COLUMN column_name TYPE new_data_type;

-- Select data
SELECT * FROM table_name;
SELECT column1, column2 FROM table_name;
SELECT * FROM table_name WHERE condition;
SELECT * FROM table_name ORDER BY column_name;
SELECT * FROM table_name LIMIT 10 OFFSET 20;

-- Insert data
INSERT INTO table_name (column1, column2) VALUES (value1, value2);
INSERT INTO table_name VALUES (value1, value2, value3);

-- Update data
UPDATE table_name SET column1 = value1 WHERE condition;

-- Delete data
DELETE FROM table_name WHERE condition;
```

## Data Types

```sql
-- Common PostgreSQL Data Types
-- String Types
varchar(n)    -- Variable-length with limit
char(n)       -- Fixed-length, space padded
text          -- Variable unlimited length

-- Numeric Types
integer       -- Signed 4-byte integer
smallint      -- Signed 2-byte integer
bigint        -- Signed 8-byte integer
decimal(p,s)  -- Exact numeric with precision p, scale s
numeric(p,s)  -- Exact numeric with precision p, scale s
real          -- 4-byte floating point
double        -- 8-byte floating point
serial        -- Auto-incrementing 4-byte integer

-- Date/Time Types
date          -- Date (year, month, day)
time          -- Time of day
timestamp     -- Date and time
interval      -- Time interval

-- Boolean Type
boolean       -- true or false

-- Other Types
uuid          -- Universally Unique Identifier
json          -- JSON data
jsonb         -- Binary JSON data
array         -- Array of values
```

## Constraints

```sql
-- Primary Key
CREATE TABLE table_name (
  id serial PRIMARY KEY,
  -- other columns
);

-- Foreign Key
CREATE TABLE table_name (
  id serial PRIMARY KEY,
  other_table_id integer REFERENCES other_table(id)
);

-- Multiple Column Primary Key
CREATE TABLE table_name (
  column1 integer,
  column2 integer,
  PRIMARY KEY (column1, column2)
);

-- Not Null
CREATE TABLE table_name (
  id serial PRIMARY KEY,
  name varchar(100) NOT NULL
);

-- Unique
CREATE TABLE table_name (
  id serial PRIMARY KEY,
  email varchar(100) UNIQUE
);

-- Check Constraint
CREATE TABLE table_name (
  id serial PRIMARY KEY,
  age integer CHECK (age >= 18)
);

-- Default Value
CREATE TABLE table_name (
  id serial PRIMARY KEY,
  created_at timestamp DEFAULT NOW()
);
```

## Joins

```sql
-- Inner Join
SELECT * FROM table1
JOIN table2 ON table1.column_name = table2.column_name;

-- Left Join
SELECT * FROM table1
LEFT JOIN table2 ON table1.column_name = table2.column_name;

-- Right Join
SELECT * FROM table1
RIGHT JOIN table2 ON table1.column_name = table2.column_name;

-- Full Outer Join
SELECT * FROM table1
FULL OUTER JOIN table2 ON table1.column_name = table2.column_name;

-- Cross Join
SELECT * FROM table1
CROSS JOIN table2;

-- Multiple Joins
SELECT * FROM table1
JOIN table2 ON table1.column_name = table2.column_name
JOIN table3 ON table2.column_name = table3.column_name;
```

## Aggregate Functions and Grouping

```sql
-- Count
SELECT COUNT(*) FROM table_name;
SELECT COUNT(column_name) FROM table_name;

-- Sum
SELECT SUM(column_name) FROM table_name;

-- Average
SELECT AVG(column_name) FROM table_name;

-- Minimum and Maximum
SELECT MIN(column_name), MAX(column_name) FROM table_name;

-- Group By
SELECT column1, COUNT(*) FROM table_name
GROUP BY column1;

-- Having (like WHERE but for groups)
SELECT column1, COUNT(*) FROM table_name
GROUP BY column1
HAVING COUNT(*) > 5;
```

## Subqueries

```sql
-- Subquery in WHERE
SELECT * FROM table1
WHERE column_name IN (SELECT column_name FROM table2 WHERE condition);

-- Subquery with EXISTS
SELECT * FROM table1
WHERE EXISTS (SELECT 1 FROM table2 WHERE table2.column_name = table1.column_name);

-- Subquery in FROM
SELECT * FROM (SELECT column1, column2 FROM table_name) AS subquery;

-- Subquery in SELECT
SELECT 
  column1,
  (SELECT COUNT(*) FROM table2 WHERE table2.column_name = table1.column_name)
FROM table1;
```

## Indexes

```sql
-- Create an index
CREATE INDEX index_name ON table_name (column_name);

-- Create a unique index
CREATE UNIQUE INDEX index_name ON table_name (column_name);

-- Create a multi-column index
CREATE INDEX index_name ON table_name (column1, column2);

-- Drop an index
DROP INDEX index_name;
```

## Transactions

```sql
-- Start a transaction
BEGIN;

-- Execute statements
INSERT INTO table_name VALUES (1, 'value');
UPDATE other_table SET column = 'value' WHERE id = 1;

-- Commit the transaction
COMMIT;

-- OR rollback the transaction
ROLLBACK;
```

## Loading and Exporting Data

```bash
# Import from a SQL file
psql -d database_name -f file.sql

# Export data to a CSV file
\copy (SELECT * FROM table_name) TO '/path/to/file.csv' WITH CSV HEADER;

# Import data from a CSV file
\copy table_name FROM '/path/to/file.csv' WITH CSV HEADER;
```
