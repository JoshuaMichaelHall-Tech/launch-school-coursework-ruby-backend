# Database Applications with Python Glossary

## Core Database Concepts

| Term | Definition |
|------|------------|
| RDBMS | Relational Database Management System - software that manages relational databases (e.g., PostgreSQL). |
| PostgreSQL | A powerful, open-source object-relational database system with a strong reputation for reliability and data integrity. |
| SQL | Structured Query Language - the standard language for interacting with relational databases. |
| Schema | The structure that defines the organization of data in a database, including tables, fields, relationships, and constraints. |
| Table | A collection of related data organized in rows and columns in a relational database. |
| Query | A request for data or information from a database, or an instruction to perform an action on the data. |
| Transaction | A sequence of database operations that are treated as a single logical unit of work, following ACID properties. |
| ACID | Atomicity, Consistency, Isolation, and Durability - properties that guarantee reliable processing of database transactions. |
| Index | A data structure that improves the speed of data retrieval operations on a database table. |
| Foreign Key | A field (or collection of fields) in one table that refers to the primary key in another table, establishing a relationship. |
| ORM | Object-Relational Mapping - a technique that lets you query and manipulate data from a database using an object-oriented paradigm. |
| Connection | An established communication session between a database application and a database server. |
| Connection Pool | A cache of database connections maintained so that connections can be reused when future requests to the database are required. |
| Cursor | A database object used to retrieve, insert, or update data in a set of rows. |

## Python Database Tools

| Term | Definition |
|------|------------|
| psycopg2 | A PostgreSQL adapter for Python that allows Python code to execute SQL commands in a PostgreSQL database. |
| Connection String | A string that specifies information about a data source and the means of connecting to it (e.g., database URL). |
| Parameter Binding | A technique for safely passing parameters to SQL queries to prevent SQL injection attacks. |
| Parameterized Query | A query in which placeholders are used for parameters and the actual parameter values are supplied at execution time. |
| Dynamic SQL | SQL code that is constructed at runtime based on program conditions or user input. |
| SQL Injection | A code injection technique that exploits vulnerabilities in applications that construct SQL statements dynamically. |
| Fetch | The action of retrieving rows from a result set after executing a query. |
| Migration | The process of managing incremental, reversible changes to database schemas. |
| Query Logging | Recording SQL queries executed by an application for debugging and performance analysis. |
| Database Driver | Software that allows a programming language to connect to and interact with a database. |

## Web Application Database Integration

| Term | Definition |
|------|------------|
| Session Persistence | The storage of user session data across multiple requests, typically in a database for web applications. |
| Database URI | A Uniform Resource Identifier that specifies the location of a database and how to connect to it. |
| Environment Variable | A variable whose value is set outside the program, often used to store database credentials securely. |
| Database Context | The context or environment in which database operations are executed. |
| Database Concurrency | The ability of a database to handle multiple requests simultaneously. |
| Connection Timeout | The maximum amount of time a database connection attempt should wait before giving up. |
| Database Initialization | The process of setting up a database schema when an application starts. |
| Flask-SQLAlchemy | An extension for Flask that adds support for SQLAlchemy, a Python SQL toolkit and ORM. |
| Request Context | In web applications, the context in which a request is processed, including database operations. |
| Database Testing | The process of testing database functionality, often using separate test databases. |

## Performance and Optimization

| Term | Definition |
|------|------------|
| N+1 Query Problem | A performance anti-pattern where a database query is executed for each record in a result set. |
| Query Optimization | The process of improving the execution time and efficiency of database queries. |
| Database Indexing | The creation and maintenance of indexes to speed up data retrieval operations. |
| Eager Loading | Loading related data in a single query to avoid multiple database hits. |
| Lazy Loading | Delaying the loading of data until it is actually needed. |
| Batch Processing | Processing multiple records in a single database operation for better performance. |
| Connection Pooling | Managing a pool of database connections for reuse to reduce overhead. |
| Query Caching | Storing the results of expensive database queries for reuse. |
| Execution Plan | The sequence of operations performed by a database engine to execute a query. |
| Database Profiling | Analyzing database performance to identify bottlenecks and optimization opportunities. |

## Schema Design and Data Modeling

| Term | Definition |
|------|------------|
| Normalization | The process of organizing data to reduce redundancy and improve integrity. |
| Entity | A distinct object or concept about which data is stored in a database. |
| Attribute | A data element that describes an entity (represented as a column in a table). |
| Relationship | An association between entities in a database. |
| Primary Key | A field or combination of fields that uniquely identifies a record in a table. |
| Composite Key | A key that consists of more than one attribute. |
| Data Type | A classification that specifies which type of value a column can hold. |
| Constraint | A rule enforced on data columns in a table to maintain data integrity. |
| Join | An SQL operation that combines rows from two or more tables based on related columns. |
| Cascade | An action that automatically propagates changes (like updates or deletes) to related tables. |

## Deployment and Operations

| Term | Definition |
|------|------------|
| Database Migration | The process of transferring data from one database to another with minimal disruption. |
| Database Backup | A copy of data from a database that can be used to restore the database. |
| Database Restore | The process of recreating a database from a backup. |
| Database Replication | The process of copying data from one database server to another. |
| Database Clustering | Multiple database servers working together to improve performance and availability. |
| Render | A cloud platform that can host both applications and their databases. |
| Environment Configuration | Setting up different database configurations for development, testing, and production. |
| Continuous Integration (CI) | The practice of automating the integration of code changes, including database changes. |
| Database Version Control | Tracking changes to database schema and reference data. |
| Database Monitoring | Tracking database performance and health metrics. |
