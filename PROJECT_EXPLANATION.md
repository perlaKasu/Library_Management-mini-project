# Project Explanation – Library Management System

**Project Name:** Library Management System  
**Author:** perlakasubabu  
**Technology:** MySQL / SQL  
**Database:** `library_management_System`

## 1. Introduction

This mini project implements a relational Library Management System using MySQL. It organizes library data into separate related tables so that books, students, librarians, memberships, issue transactions, publishers, fines, and reservations can be managed efficiently.

The SQL script starts by creating the `library_management_System` database and selecting it for use.

## 2. Database Design

The project contains nine main tables:

### 2.1 Publishers

The `publishers` table stores publisher details.

Columns:
- `publisher_id` – primary key with auto-increment
- `publisher_name`
- `city`
- `email`

### 2.2 Librarians

The `librarians` table stores library staff information.

Columns:
- `librarian_id` – primary key
- `librarian_name`
- `email` – unique
- `phone`
- `shift`

### 2.3 Books

The `books` table stores the library inventory.

Columns:
- `book_id` – primary key
- `book_name`
- `author`
- `category`
- `price`
- `quantity`

### 2.4 Students

The `students` table stores library members/students.

Columns:
- `student_id` – primary key
- `student_name`
- `email` – unique
- `phone`
- `city`

### 2.5 Memberships

The `memberships` table stores membership information for students.

Columns:
- `membership_id` – primary key
- `student_id` – foreign key referencing `students`
- `membership_type`
- `start_date`
- `expiry_date`
- `status`

The `student_id` column is also defined as `UNIQUE`, so each student can have at most one membership record in this design.

### 2.6 Issued Books

The `issued_books` table records book lending transactions.

Columns:
- `issue_id` – primary key
- `book_id` – foreign key referencing `books`
- `student_id` – foreign key referencing `students`
- `librarian_id` – foreign key referencing `librarians`
- `issue_date`
- `due_date`
- `return_date`

`return_date` can be `NULL`, which represents an issue that has not yet been returned.

### 2.7 Book Publishers

The `book_publishers` table connects books and publishers.

It contains:
- `book_id`
- `publisher_id`

The combination of `book_id` and `publisher_id` is the composite primary key. Both columns are foreign keys.

This table provides a many-to-many relationship structure between books and publishers.

### 2.8 Fines

The `fines` table stores fines associated with issued books.

Columns:
- `fine_id` – primary key
- `issue_id` – foreign key referencing `issued_books`
- `fine_amount`
- `fine_reason`
- `paid_status`
- `fine_date`

### 2.9 Reservations

The `reservations` table records book reservations made by students.

Columns:
- `reservation_id` – primary key
- `book_id` – foreign key referencing `books`
- `student_id` – foreign key referencing `students`
- `reserve_date`
- `status`

## 3. Relationships

The database uses foreign keys to connect related information:

```text
students
   |
   +---- memberships
   |
   +---- issued_books ---- books
   |          |
   |          +---- librarians
   |          |
   |          +---- fines
   |
   +---- reservations ---- books

books ---- book_publishers ---- publishers
```

Important relationships include:

- One student can have one membership in this design.
- A student can have multiple issued-book records.
- A librarian can handle multiple issue transactions.
- A book can appear in multiple issue transactions.
- An issued book can have a related fine.
- Students can reserve books.
- Books and publishers are connected through `book_publishers`.

## 4. Sample Data

The SQL script contains sample data for publishers, librarians, books, students, memberships, issued books, fines, and reservations.

The book data includes categories such as:
- Programming
- Database
- Fiction
- Science
- History
- Biography
- Competitive

The script also contains sample library activity with issue dates, due dates, return dates, fine records, membership statuses, and reservation statuses.

## 5. SQL Operations Demonstrated

### Basic SELECT

The project retrieves complete table data using queries such as:

```sql
SELECT * FROM books;
SELECT * FROM students;
SELECT * FROM issued_books;
```

### Filtering with WHERE

Examples include finding books costing more than 500 and books belonging to the Programming category.

```sql
SELECT * FROM books
WHERE price > 500;

SELECT * FROM books
WHERE category = 'Programming';
```

### Filtering by City

```sql
SELECT * FROM students
WHERE city = 'Visakhapatnam';
```

### Sorting

The project demonstrates both ascending and descending sorting by book price.

```sql
SELECT * FROM books
ORDER BY price ASC;

SELECT * FROM books
ORDER BY price DESC;
```

### Aggregate Functions

The SQL file demonstrates:

```sql
SELECT COUNT(*) AS total_books FROM books;
SELECT AVG(price) AS average_price FROM books;
SELECT MAX(price) AS highest_price FROM books;
SELECT MIN(price) AS lowest_price FROM books;
```

These queries demonstrate how SQL can summarize data.

### LIKE Operator

The project searches for students whose names start with `A` and books containing `Python`.

```sql
SELECT * FROM students
WHERE student_name LIKE 'A%';

SELECT * FROM books
WHERE book_name LIKE '%Python%';
```

### UPDATE

The project demonstrates updating a book price and a student's phone number.

```sql
UPDATE books
SET price = 700.00
WHERE book_id = 1
  AND book_name = 'Python Crash Course';
```

### DELETE

The SQL file also demonstrates deletion of a specific student record using identifying conditions.

```sql
DELETE FROM students
WHERE student_id = 10
  AND student_name = 'Rahul Verma';
```

## 6. JOIN Queries

JOIN operations are an important part of this project.

For example, the project combines `issued_books`, `books`, and `students` to show currently unreturned books:

```sql
SELECT ib.issue_id,
       b.book_name,
       s.student_name,
       ib.issue_date,
       ib.return_date
FROM issued_books ib
JOIN books b
  ON ib.book_id = b.book_id
JOIN students s
  ON ib.student_id = s.student_id
WHERE ib.return_date IS NULL;
```

The project also joins fines with issued books, books, and students to display fine details.

Another query identifies overdue unreturned books by comparing `due_date` with `CURDATE()`.

## 7. Library Management Use Cases

This database can answer questions such as:

1. What books are available in the database?
2. Which books belong to the Programming category?
3. Which students are from Visakhapatnam?
4. What is the highest-priced book?
5. What is the average book price?
6. Which books have not been returned?
7. Which issued books are overdue?
8. Which fines are unpaid?
9. Which students have active Gold memberships?
10. Which reservations are currently pending?
11. Which librarian handled a particular issue?
12. Which publisher is associated with a book?

## 8. Key Learning Outcomes

This project demonstrates practical SQL and database concepts:

- Relational database design
- Table creation
- Primary keys
- Foreign keys
- Composite primary keys
- Unique constraints
- Data types
- One-to-one style membership restriction
- Many-to-many relationship implementation
- Data insertion
- Data retrieval
- Filtering
- Sorting
- Aggregate functions
- Pattern matching
- Updating records
- Deleting records
- INNER JOIN
- LEFT JOIN
- Date functions
- Database management using MySQL

## 9. How to Execute the Project

1. Open MySQL Workbench.
2. Open the SQL file `library_management mini project.sql`.
3. Execute the database creation and table creation statements.
4. Execute the INSERT statements to load the sample data.
5. Run the SELECT, JOIN, UPDATE, and DELETE queries as required.
6. Use `SHOW DATABASES;` and `SHOW TABLES;` to verify the database.

## 10. Project Structure

```text
Library-Management-System/
│
├── library_management mini project.sql
├── README.md
├── LICENSE
└── PROJECT_EXPLANATION.md
```

## 11. Author

**perlakasubabu**

This project is intended as a SQL/MySQL mini project for learning and demonstrating relational database concepts.
