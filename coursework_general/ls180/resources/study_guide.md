# LS180: Database Foundations - Study Guide

## Fundamental Concepts

### 1. Relational Model and SQL
- **Relational Database Structure**: Tables, rows, columns, and relationships
- **SQL as a Language**: DDL, DML, DCL, and TCL statements
- **PostgreSQL**: Specific features and implementation details
- **SQL Syntax**: Command structure, clauses, and proper formatting
- **Data Types**: Choosing appropriate types for different data

### 2. Database Design
- **Entity-Relationship Modeling**: Identifying entities and relationships
- **Keys**: Primary keys, foreign keys, natural keys, surrogate keys
- **Normalization**: 1NF, 2NF, 3NF and when to denormalize
- **Constraints**: Ensuring data integrity through constraints
- **Indexes**: Optimizing queries with proper indexing

### 3. Working with Tables
- **Creating Tables**: Proper structure and naming conventions
- **Altering Tables**: Modifying structure without data loss
- **Constraints**: NOT NULL, UNIQUE, CHECK, DEFAULT
- **Keys and Indexes**: When and how to implement
- **Table Relationships**: One-to-one, one-to-many, many-to-many

### 4. Querying Data
- **SELECT Queries**: Basic to complex data retrieval
- **Filtering Data**: WHERE clauses and conditions
- **Sorting Results**: ORDER BY and sorting options
- **Limiting Results**: LIMIT and OFFSET for pagination
- **Aggregating Data**: GROUP BY and aggregate functions

### 5. Relationships and JOINs
- **Understanding Relationships**: Cardinality and modality
- **INNER JOIN**: Matching rows in both tables
- **OUTER JOINs**: LEFT, RIGHT, and FULL OUTER JOINs
- **CROSS JOIN**: Cartesian product of two tables
- **Self JOIN**: Joining a table to itself

## Deep Dive Topics

### Schema Design
- **Entity Identification**: Converting real-world concepts to database entities
- **Relationship Mapping**: Implementing relationships correctly
- **Normalization Rules**: Applying normalization principles
- **Denormalization Decisions**: When to prioritize performance over normalization
- **Database Diagrams**: Creating and interpreting ERDs

### SQL Query Development
- **Simple Queries**: Basic SELECT statements
- **Complex Joins**: Multiple table joins and subqueries
- **Aggregate Functions**: COUNT, SUM, AVG, MIN, MAX
- **Window Functions**: Running totals, moving averages
- **Common Table Expressions (CTEs)**: WITH clauses for readable queries

### Data Manipulation
- **INSERT**: Adding single and multiple rows
- **UPDATE**: Modifying existing data
- **DELETE**: Removing data safely
- **Transactions**: Ensuring atomicity of operations
- **Batch Processing**: Efficient bulk operations

### Query Optimization
- **Understanding Execution Plans**: EXPLAIN and ANALYZE
- **Index Selection**: Choosing the right indexes
- **Query Rewriting**: Optimizing slow queries
- **Join Optimization**: Improving join performance
- **Subquery Optimization**: When to use subqueries vs. joins

### Database Administration Basics
- **User Management**: Creating and managing database users
- **Permissions**: Granting appropriate access levels
- **Backup and Restore**: Protecting data
- **Database Dumps**: Creating and loading dumps
- **Maintenance Operations**: VACUUM, ANALYZE

## Practical Application

### 1. Database Setup and Management
- Set up PostgreSQL locally
- Create and manage databases
- Import and export data
- Use psql for database interaction
- Document database structure

### 2. Schema Implementation
- Design database schemas from requirements
- Create tables with appropriate constraints
- Establish relationships between tables
- Implement indexes for performance
- Validate schema against requirements

### 3. Query Writing
- Write queries to answer specific questions
- Combine multiple tables through JOINs
- Use subqueries and CTEs for complex logic
- Aggregate data for reports
- Optimize queries for performance

### 4. Data Integrity
- Implement constraints to enforce rules
- Use transactions for multi-step operations
- Validate input data before insertion
- Maintain referential integrity
- Implement error handling

### 5. Database Assessment
- Analyze existing database designs
- Identify design flaws and propose solutions
- Evaluate query performance
- Suggest optimization strategies
- Balance normalization with performance needs

## Study Tips

1. **Practice Writing SQL**: Regularly write queries of increasing complexity
2. **Draw Database Diagrams**: Visualize relationships between tables
3. **Analyze Real Databases**: Study structure of existing databases
4. **Explain Query Plans**: Understand how PostgreSQL executes queries
5. **Build Sample Applications**: Create small projects that use databases
