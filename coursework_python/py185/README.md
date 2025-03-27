# PY185: Database Applications with Python

## Overview
This course focuses on integrating relational databases with Python applications. It builds on database fundamentals and Python networking concepts to create applications that effectively use PostgreSQL for data persistence, with an emphasis on query optimization and proper database design.

## Learning Objectives
- Execute SQL statements from Python applications
- Develop command-line database applications
- Create database-backed web applications
- Optimize SQL queries for performance
- Design appropriate database schemas for applications
- Handle database parameters safely
- Deploy database applications to production environments

## Key Concepts
- **Database Connection**: Using psycopg2 to connect to PostgreSQL
- **Parameter Handling**: Safely executing SQL with parameters
- **Code Structure**: Organizing database-backed applications
- **Schema Creation**: Automatically creating and updating schemas
- **Session Persistence**: Managing data across HTTP requests
- **Database Design**: Creating appropriate schemas for applications
- **Query Optimization**: Solving N+1 query problems
- **Deployment**: Deploying database applications to production

## Major Assignments
1. **Expense Tracker CLI**
   - Purpose: Build a command-line database application
   - Implementation: Python application with PostgreSQL backend
   - Key Takeaways: Database connection and CRUD operations

2. **Database-backed Todo Application**
   - Purpose: Extend the Todo application with database persistence
   - Implementation: Flask app with PostgreSQL storage
   - Key Takeaways: Integrating databases with web applications

3. **Query Optimization**
   - Purpose: Improve performance of database-backed applications
   - Implementation: Refactoring existing database code
   - Key Takeaways: Identifying and fixing inefficient query patterns

## Challenges Encountered
- Managing database connections efficiently
- Designing appropriate database schemas
- Handling parameter sanitization and SQL injection prevention
- Optimizing queries for performance
- Managing database migrations and schema changes

## Resources
- [psycopg2 Documentation](https://www.psycopg.org/docs/)
- [PostgreSQL Documentation](https://www.postgresql.org/docs/)
- [SQLAlchemy Documentation](https://docs.sqlalchemy.org/) (for additional reference)

## Related Courses
- Builds on database foundations from LS180-181
- Integrates with web application concepts from PY175
