# LS180: Database Foundations - Glossary

## Database Fundamentals

**Relational Database**
: Database that organizes data into relations (tables), based on relational model of data

**SQL**
: Structured Query Language, used to communicate with relational databases

**PostgreSQL**
: Open-source relational database management system

**Table**
: Collection of related data organized in rows and columns

**Row**
: Single record in a table, also called a tuple

**Column**
: Vertical structure in a table that contains data of a single type, also called an attribute

**Schema**
: Blueprint that defines the organization of data in a database

**Field**
: Specific piece of data in a row/column intersection

**Query**
: Request for data from a database

**Result Set**
: Data returned from a database query

## Data Types and Constraints

**Data Type**
: Attribute that specifies the kind of data a column can hold (e.g., integer, text, date)

**Constraint**
: Rule enforced on data columns to maintain accuracy and reliability

**PRIMARY KEY**
: Column or set of columns that uniquely identifies each row in a table

**FOREIGN KEY**
: Column or set of columns that establishes a link between data in two tables

**UNIQUE**
: Constraint ensuring all values in a column are different

**NOT NULL**
: Constraint ensuring a column cannot have NULL values

**CHECK**
: Constraint enforcing that values in a column meet specific criteria

**DEFAULT**
: Value automatically assigned to a column when no value is specified

## Relationships

**Relationship**
: Association between tables in a database

**One-to-One**
: Relationship where each row in one table relates to exactly one row in another table

**One-to-Many**
: Relationship where each row in one table relates to multiple rows in another table

**Many-to-Many**
: Relationship where multiple rows in one table relate to multiple rows in another table

**Cardinality**
: Number of elements on each side of a relationship

**Modality**
: Indicates if a relationship is required (1) or optional (0)

**Join Table**
: Table that connects two tables in a many-to-many relationship

## SQL Operations

**DDL**
: Data Definition Language, SQL commands that define database structure (CREATE, ALTER, DROP)

**DML**
: Data Manipulation Language, SQL commands that manipulate data (SELECT, INSERT, UPDATE, DELETE)

**DCL**
: Data Control Language, SQL commands that control access (GRANT, REVOKE)

**TCL**
: Transaction Control Language, SQL commands that manage transactions (COMMIT, ROLLBACK)

**SELECT**
: SQL command to retrieve data from a database

**INSERT**
: SQL command to add new data to a database

**UPDATE**
: SQL command to modify existing data in a database

**DELETE**
: SQL command to remove data from a database

**JOIN**
: SQL operation that combines rows from two or more tables

**INNER JOIN**
: Returns rows when there is a match in both tables

**LEFT JOIN**
: Returns all rows from the left table and matched rows from the right table

**RIGHT JOIN**
: Returns all rows from the right table and matched rows from the left table

**FULL OUTER JOIN**
: Returns rows when there is a match in either table

**CROSS JOIN**
: Returns the Cartesian product of the two tables

## Database Design

**Normalization**
: Process of organizing database tables to minimize redundancy and dependency

**Denormalization**
: Process of adding redundant data to improve read performance

**Entity**
: Person, place, thing, or event about which data is collected

**Attribute**
: Characteristic or property of an entity

**Entity-Relationship Diagram (ERD)**
: Visual representation of database tables and their relationships

**Surrogate Key**
: Artificial identifier for a database entity (usually auto-incremented)

**Natural Key**
: Key formed from attributes that already exist in the real world

**Index**
: Data structure that improves the speed of data retrieval operations

**View**
: Virtual table based on the result of a SELECT query

## Advanced Concepts

**Subquery**
: Query nested inside another query

**Aggregate Function**
: Function that performs a calculation on a set of values (SUM, AVG, COUNT, MIN, MAX)

**Transaction**
: Sequence of operations performed as a single logical unit of work

**ACID**
: Properties of database transactions: Atomicity, Consistency, Isolation, Durability

**Execution Plan**
: Way database determines how to execute a query efficiently

**Database Dump**
: Backup file containing database structure and/or data
