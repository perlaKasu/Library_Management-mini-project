# Library Management System

**Author:** perlakasubabu  
**Project Type:** MySQL Database Mini Project  
**Database:** MySQL  
**Database Name:** `library_management_System`

## Project Overview

The Library Management System is a MySQL database mini project designed to manage books, students, librarians, memberships, book issues, publishers, fines, and reservations.

The project creates a relational database and demonstrates database concepts such as primary keys, foreign keys, unique constraints, many-to-many relationships, data insertion, filtering, sorting, aggregate functions, updates, deletes, and multi-table JOIN queries.

## Main Features

- Manage publishers
- Manage librarians and their shifts
- Manage books, authors, categories, prices, and quantities
- Manage students
- Manage student memberships
- Record issued books and return dates
- Track fines and payment status
- Manage book reservations
- Query library information using SQL
- Retrieve overdue and unreturned books
- Find unpaid fines
- Combine information from multiple related tables

## Database Tables

| Table | Purpose |
|---|---|
| `publishers` | Stores publisher information |
| `librarians` | Stores librarian details and shifts |
| `books` | Stores book information and inventory quantity |
| `students` | Stores student information |
| `memberships` | Stores student membership details |
| `issued_books` | Records book issue and return transactions |
| `book_publishers` | Connects books with publishers |
| `fines` | Stores fines associated with issued books |
| `reservations` | Stores book reservation information |

The SQL file defines these tables and their relationships using primary keys and foreign keys.

## SQL Concepts Used

- `CREATE DATABASE`
- `CREATE TABLE`
- Primary Keys
- Foreign Keys
- `AUTO_INCREMENT`
- `UNIQUE`
- `NOT NULL`
- `INSERT`
- `SELECT`
- `WHERE`
- `LIKE`
- `ORDER BY`
- `COUNT()`
- `AVG()`
- `MAX()`
- `MIN()`
- `UPDATE`
- `DELETE`
- `JOIN`
- `LEFT JOIN`
- `CURDATE()`

## How to Run

1. Install MySQL Server and MySQL Workbench.
2. Open MySQL Workbench.
3. Open `library_management mini project.sql`.
4. Execute the SQL script.
5. The database `library_management_System` will be created.
6. Use:

```sql
USE library_management_System;
```

7. Check the tables with:

```sql
SHOW TABLES;
```

8. Run the SELECT and JOIN queries included in the SQL file.

## Example Queries

```sql
SELECT * FROM books;

SELECT * FROM students;

SELECT * FROM books
WHERE price > 500;

SELECT * FROM books
WHERE category = 'Programming';

SELECT * FROM students
WHERE city = 'Visakhapatnam';

SELECT COUNT(*) AS total_books
FROM books;
```

## Project Author

**perlakasubabu**

## License

This project is released under the MIT License. See the `LICENSE` file for details.
