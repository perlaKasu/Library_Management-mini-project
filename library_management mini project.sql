
CREATE DATABASE IF NOT EXISTS library_management_System;
USE library_management_System;
CREATE TABLE publishers (
    publisher_id INT PRIMARY KEY AUTO_INCREMENT,
    publisher_name VARCHAR(120) NOT NULL,
    city VARCHAR(80) NOT NULL,
    email VARCHAR(120) NOT NULL
);

CREATE TABLE librarians (
    librarian_id INT PRIMARY KEY AUTO_INCREMENT,
    librarian_name VARCHAR(100) NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE,
    phone VARCHAR(15) NOT NULL,
    shift VARCHAR(20) NOT NULL
);

CREATE TABLE books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    book_name VARCHAR(150) NOT NULL,
    author VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    quantity INT NOT NULL
);

CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(100) NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE,
    phone VARCHAR(15) NOT NULL,
    city VARCHAR(80) NOT NULL
);

CREATE TABLE memberships (
    membership_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL UNIQUE,
    membership_type VARCHAR(20) NOT NULL,
    start_date DATE NOT NULL,
    expiry_date DATE NOT NULL,
    status VARCHAR(20) NOT NULL,
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);

CREATE TABLE issued_books (
    issue_id INT PRIMARY KEY AUTO_INCREMENT,
    book_id INT NOT NULL,
    student_id INT NOT NULL,
    librarian_id INT NOT NULL,
    issue_date DATE NOT NULL,
    due_date DATE NOT NULL,
    return_date DATE NULL,
    FOREIGN KEY (book_id) REFERENCES books(book_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (librarian_id) REFERENCES librarians(librarian_id)
);

CREATE TABLE book_publishers (
    book_id INT NOT NULL,
    publisher_id INT NOT NULL,
    PRIMARY KEY (book_id, publisher_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id),
    FOREIGN KEY (publisher_id) REFERENCES publishers(publisher_id)
);

CREATE TABLE fines (
    fine_id INT PRIMARY KEY AUTO_INCREMENT,
    issue_id INT NOT NULL,
    fine_amount DECIMAL(8, 2) NOT NULL,
    fine_reason VARCHAR(100) NOT NULL,
    paid_status VARCHAR(20) NOT NULL,
    fine_date DATE NOT NULL,
    FOREIGN KEY (issue_id) REFERENCES issued_books(issue_id)
);

CREATE TABLE reservations (
    reservation_id INT PRIMARY KEY AUTO_INCREMENT,
    book_id INT NOT NULL,
    student_id INT NOT NULL,
    reserve_date DATE NOT NULL,
    status VARCHAR(20) NOT NULL,
    FOREIGN KEY (book_id) REFERENCES books(book_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);

INSERT INTO publishers (publisher_name, city, email) VALUES
('O\'Reilly Media', 'Sebastopol', 'info@oreilly.com'),
('Pearson Education', 'London', 'hello@pearson.com'),
('McGraw Hill', 'New York', 'contact@mh.com'),
('Penguin Random House', 'New York', 'help@penguin.com'),
('HarperCollins', 'New York', 'info@harpercollins.com'),
('Wiley', 'Hoboken', 'info@wiley.com'),
('Oxford University Press', 'Oxford', 'academic@oup.com'),
('Cambridge University Press', 'Cambridge', 'info@cambridge.org'),
('S. Chand', 'New Delhi', 'sales@schand.com'),
('Arihant Publications', 'Meerut', 'info@arihant.com');

INSERT INTO librarians (librarian_name, email, phone, shift) VALUES
('Lakshmi Rao', 'lakshmi.rao@library.edu', '9000000001', 'Morning'),
('Suresh Babu', 'suresh.babu@library.edu', '9000000002', 'Morning'),
('Fatima Sheikh', 'fatima.sheikh@library.edu', '9000000003', 'Afternoon'),
('John Abraham', 'john.abraham@library.edu', '9000000004', 'Afternoon'),
('Nisha Kulkarni', 'nisha.kulkarni@library.edu', '9000000005', 'Evening'),
('Ramesh Naidu', 'ramesh.naidu@library.edu', '9000000006', 'Evening'),
('Ayesha Khan', 'ayesha.khan@library.edu', '9000000007', 'Morning'),
('Vivek Sharma', 'vivek.sharma@library.edu', '9000000008', 'Afternoon'),
('Meenakshi Pillai', 'meenakshi.pillai@library.edu', '9000000009', 'Evening'),
('Daniel Thomas', 'daniel.thomas@library.edu', '9000000010', 'Morning');

INSERT INTO books (book_name, author, category, price, quantity) VALUES
('Python Crash Course', 'Eric Matthes', 'Programming', 650.00, 12),
('Let Us C', 'Yashavant Kanetkar', 'Programming', 420.00, 15),
('Clean Code', 'Robert C. Martin', 'Programming', 899.00, 8),
('Harry Potter and the Philosopher\'s Stone', 'J.K. Rowling', 'Fiction', 499.00, 20),
('The Alchemist', 'Paulo Coelho', 'Fiction', 350.00, 18),
('Database System Concepts', 'Silberschatz', 'Database', 980.00, 6),
('Introduction to Algorithms', 'Cormen', 'Programming', 1250.00, 5),
('Wings of Fire', 'A.P.J. Abdul Kalam', 'Biography', 299.00, 25),
('Python for Data Analysis', 'Wes McKinney', 'Programming', 750.00, 9),
('Indian Polity', 'M. Laxmikanth', 'Competitive', 545.00, 14),
('Head First Java', 'Kathy Sierra', 'Programming', 780.00, 11),
('Effective Java', 'Joshua Bloch', 'Programming', 920.00, 7),
('Java: The Complete Reference', 'Herbert Schildt', 'Programming', 860.00, 10),
('C++ Primer', 'Stanley Lippman', 'Programming', 1100.00, 6),
('The C Programming Language', 'Kernighan and Ritchie', 'Programming', 540.00, 14),
('Eloquent JavaScript', 'Marijn Haverbeke', 'Programming', 620.00, 9),
('You Don\'t Know JS', 'Kyle Simpson', 'Programming', 480.00, 12),
('JavaScript: The Good Parts', 'Douglas Crockford', 'Programming', 410.00, 8),
('Learning Python', 'Mark Lutz', 'Programming', 990.00, 7),
('Fluent Python', 'Luciano Ramalho', 'Programming', 1150.00, 5),
('Automate the Boring Stuff with Python', 'Al Sweigart', 'Programming', 560.00, 16),
('Think Python', 'Allen Downey', 'Programming', 390.00, 13),
('Python Cookbook', 'David Beazley', 'Programming', 870.00, 6),
('Deep Learning with Python', 'Francois Chollet', 'Programming', 980.00, 8),
('Hands-On Machine Learning', 'Aurelien Geron', 'Programming', 1240.00, 5),
('Pattern Recognition and Machine Learning', 'Christopher Bishop', 'Programming', 1320.00, 4),
('Artificial Intelligence: A Modern Approach', 'Russell and Norvig', 'Programming', 1450.00, 4),
('Computer Networks', 'Andrew Tanenbaum', 'Programming', 890.00, 9),
('Operating System Concepts', 'Abraham Silberschatz', 'Programming', 970.00, 8),
('Computer Organization and Design', 'Patterson and Hennessy', 'Programming', 1080.00, 6),
('Compilers: Principles, Techniques, and Tools', 'Aho and Ullman', 'Programming', 1190.00, 5),
('The Pragmatic Programmer', 'Hunt and Thomas', 'Programming', 760.00, 10),
('Design Patterns', 'Gang of Four', 'Programming', 850.00, 7),
('Refactoring', 'Martin Fowler', 'Programming', 910.00, 6),
('Code Complete', 'Steve McConnell', 'Programming', 940.00, 7),
('The Mythical Man-Month', 'Fred Brooks', 'Programming', 520.00, 9),
('Structure and Interpretation of Computer Programs', 'Abelson and Sussman', 'Programming', 880.00, 5),
('Grokking Algorithms', 'Aditya Bhargava', 'Programming', 640.00, 12),
('Cracking the Coding Interview', 'Gayle Laakmann McDowell', 'Programming', 799.00, 15),
('SQL in 10 Minutes', 'Ben Forta', 'Database', 350.00, 18),
('Learning SQL', 'Alan Beaulieu', 'Database', 620.00, 10),
('SQL Queries for Mere Mortals', 'John Viescas', 'Database', 710.00, 8),
('MySQL Cookbook', 'Paul DuBois', 'Database', 840.00, 7),
('High Performance MySQL', 'Baron Schwartz', 'Database', 1020.00, 5),
('MongoDB: The Definitive Guide', 'Kristina Chodorow', 'Database', 780.00, 6),
('Seven Databases in Seven Weeks', 'Eric Redmond', 'Database', 690.00, 7),
('Designing Data-Intensive Applications', 'Martin Kleppmann', 'Database', 1350.00, 5),
('Fundamentals of Database Systems', 'Elmasri and Navathe', 'Database', 1050.00, 6),
('NoSQL Distilled', 'Pramod Sadalage', 'Database', 560.00, 9),
('Harry Potter and the Chamber of Secrets', 'J.K. Rowling', 'Fiction', 499.00, 18),
('Harry Potter and the Prisoner of Azkaban', 'J.K. Rowling', 'Fiction', 520.00, 16),
('Harry Potter and the Goblet of Fire', 'J.K. Rowling', 'Fiction', 560.00, 14),
('The Hobbit', 'J.R.R. Tolkien', 'Fiction', 430.00, 20),
('The Fellowship of the Ring', 'J.R.R. Tolkien', 'Fiction', 480.00, 12),
('The Two Towers', 'J.R.R. Tolkien', 'Fiction', 480.00, 11),
('The Return of the King', 'J.R.R. Tolkien', 'Fiction', 490.00, 11),
('Pride and Prejudice', 'Jane Austen', 'Fiction', 280.00, 22),
('To Kill a Mockingbird', 'Harper Lee', 'Fiction', 320.00, 15),
('1984', 'George Orwell', 'Fiction', 299.00, 19),
('Animal Farm', 'George Orwell', 'Fiction', 220.00, 24),
('The Great Gatsby', 'F. Scott Fitzgerald', 'Fiction', 260.00, 17),
('Jane Eyre', 'Charlotte Bronte', 'Fiction', 310.00, 10),
('Wuthering Heights', 'Emily Bronte', 'Fiction', 290.00, 9),
('Moby Dick', 'Herman Melville', 'Fiction', 340.00, 8),
('Crime and Punishment', 'Fyodor Dostoevsky', 'Fiction', 380.00, 7),
('The Kite Runner', 'Khaled Hosseini', 'Fiction', 399.00, 13),
('Life of Pi', 'Yann Martel', 'Fiction', 360.00, 12),
('The Da Vinci Code', 'Dan Brown', 'Fiction', 420.00, 16),
('Angels and Demons', 'Dan Brown', 'Fiction', 410.00, 14),
('Inferno', 'Dan Brown', 'Fiction', 430.00, 11),
('The Catcher in the Rye', 'J.D. Salinger', 'Fiction', 300.00, 10),
('The Book Thief', 'Markus Zusak', 'Fiction', 370.00, 12),
('A Brief History of Time', 'Stephen Hawking', 'Science', 450.00, 10),
('The Selfish Gene', 'Richard Dawkins', 'Science', 480.00, 8),
('Cosmos', 'Carl Sagan', 'Science', 520.00, 9),
('Sapiens', 'Yuval Noah Harari', 'Science', 550.00, 18),
('Homo Deus', 'Yuval Noah Harari', 'Science', 560.00, 12),
('The Gene', 'Siddhartha Mukherjee', 'Science', 690.00, 7),
('The Emperor of All Maladies', 'Siddhartha Mukherjee', 'Science', 720.00, 6),
('Silent Spring', 'Rachel Carson', 'Science', 400.00, 8),
('The Origin of Species', 'Charles Darwin', 'Science', 330.00, 9),
('Surely You\'re Joking, Mr. Feynman', 'Richard Feynman', 'Science', 410.00, 11),
('The Elegant Universe', 'Brian Greene', 'Science', 530.00, 7),
('Astrophysics for People in a Hurry', 'Neil deGrasse Tyson', 'Science', 390.00, 14),
('The Discovery of India', 'Jawaharlal Nehru', 'History', 450.00, 10),
('India After Gandhi', 'Ramachandra Guha', 'History', 780.00, 8),
('The Argumentative Indian', 'Amartya Sen', 'History', 420.00, 9),
('A History of South India', 'K.A. Nilakanta Sastri', 'History', 510.00, 6),
('The Wonder That Was India', 'A.L. Basham', 'History', 490.00, 7),
('Freedom at Midnight', 'Collins and Lapierre', 'History', 460.00, 11),
('The World Is Flat', 'Thomas Friedman', 'History', 440.00, 8),
('Guns, Germs, and Steel', 'Jared Diamond', 'History', 580.00, 7),
('A Short History of Nearly Everything', 'Bill Bryson', 'History', 500.00, 12),
('The Silk Roads', 'Peter Frankopan', 'History', 640.00, 6),
('My Experiments with Truth', 'M.K. Gandhi', 'Biography', 250.00, 20),
('Long Walk to Freedom', 'Nelson Mandela', 'Biography', 480.00, 9),
('Steve Jobs', 'Walter Isaacson', 'Biography', 650.00, 10),
('Einstein: His Life and Universe', 'Walter Isaacson', 'Biography', 620.00, 7),
('Elon Musk', 'Ashlee Vance', 'Biography', 590.00, 11),
('Becoming', 'Michelle Obama', 'Biography', 540.00, 13),
('I Am Malala', 'Malala Yousafzai', 'Biography', 360.00, 15),
('The Story of My Life', 'Helen Keller', 'Biography', 220.00, 16),
('Ignited Minds', 'A.P.J. Abdul Kalam', 'Biography', 280.00, 18),
('Playing It My Way', 'Sachin Tendulkar', 'Biography', 499.00, 12),
('Quantitative Aptitude', 'R.S. Aggarwal', 'Competitive', 480.00, 22),
('Verbal and Non-Verbal Reasoning', 'R.S. Aggarwal', 'Competitive', 460.00, 20),
('Objective General English', 'S.P. Bakshi', 'Competitive', 390.00, 18),
('Lucent General Knowledge', 'Lucent', 'Competitive', 320.00, 25),
('Fast Track Objective Arithmetic', 'Rajesh Verma', 'Competitive', 410.00, 16),
('Word Power Made Easy', 'Norman Lewis', 'Competitive', 250.00, 24);

INSERT INTO students (student_name, email, phone, city) VALUES
('Ananya Sharma', 'ananya.sharma@email.com', '9876500001', 'Visakhapatnam'),
('Rohan Patel', 'rohan.patel@email.com', '9876500002', 'Hyderabad'),
('Arjun Reddy', 'arjun.reddy@email.com', '9876500003', 'Visakhapatnam'),
('Meera Iyer', 'meera.iyer@email.com', '9876500004', 'Chennai'),
('Vikram Singh', 'vikram.singh@email.com', '9876500005', 'Delhi'),
('Sneha Rao', 'sneha.rao@email.com', '9876500006', 'Visakhapatnam'),
('Aditi Nair', 'aditi.nair@email.com', '9876500007', 'Bengaluru'),
('Karthik Menon', 'karthik.menon@email.com', '9876500008', 'Kochi'),
('Priya Das', 'priya.das@email.com', '9876500009', 'Kolkata'),
('Rahul Verma', 'rahul.verma@email.com', '9876500010', 'Mumbai'),
('Aarav Kumar', 'student011@email.com', '9800000011', 'Visakhapatnam'),
('Diya Reddy', 'student012@email.com', '9800000012', 'Hyderabad'),
('Ishaan Nair', 'student013@email.com', '9800000013', 'Chennai'),
('Kavya Gupta', 'student014@email.com', '9800000014', 'Delhi'),
('Neha Joshi', 'student015@email.com', '9800000015', 'Bengaluru'),
('Omar Pillai', 'student016@email.com', '9800000016', 'Kochi'),
('Pooja Shah', 'student017@email.com', '9800000017', 'Kolkata'),
('Ravi Mehta', 'student018@email.com', '9800000018', 'Mumbai'),
('Sana Khan', 'student019@email.com', '9800000019', 'Pune'),
('Tanvi Das', 'student020@email.com', '9800000020', 'Ahmedabad'),
('Uday Roy', 'student021@email.com', '9800000021', 'Jaipur'),
('Varun Iyer', 'student022@email.com', '9800000022', 'Lucknow'),
('Walia Rao', 'student023@email.com', '9800000023', 'Visakhapatnam'),
('Yash Mishra', 'student024@email.com', '9800000024', 'Hyderabad'),
('Zara Bose', 'student025@email.com', '9800000025', 'Chennai'),
('Bhavya Kapoor', 'student026@email.com', '9800000026', 'Delhi'),
('Chetan Kumar', 'student027@email.com', '9800000027', 'Bengaluru'),
('Deepa Reddy', 'student028@email.com', '9800000028', 'Kochi'),
('Esha Nair', 'student029@email.com', '9800000029', 'Kolkata'),
('Farhan Gupta', 'student030@email.com', '9800000030', 'Mumbai'),
('Gita Joshi', 'student031@email.com', '9800000031', 'Pune'),
('Harsh Pillai', 'student032@email.com', '9800000032', 'Ahmedabad'),
('Ira Shah', 'student033@email.com', '9800000033', 'Jaipur'),
('Jatin Mehta', 'student034@email.com', '9800000034', 'Lucknow'),
('Aarav Khan', 'student035@email.com', '9800000035', 'Visakhapatnam'),
('Diya Das', 'student036@email.com', '9800000036', 'Hyderabad'),
('Ishaan Roy', 'student037@email.com', '9800000037', 'Chennai'),
('Kavya Iyer', 'student038@email.com', '9800000038', 'Delhi'),
('Neha Rao', 'student039@email.com', '9800000039', 'Bengaluru'),
('Omar Mishra', 'student040@email.com', '9800000040', 'Kochi'),
('Pooja Bose', 'student041@email.com', '9800000041', 'Kolkata'),
('Ravi Kapoor', 'student042@email.com', '9800000042', 'Mumbai'),
('Sana Kumar', 'student043@email.com', '9800000043', 'Pune'),
('Tanvi Reddy', 'student044@email.com', '9800000044', 'Ahmedabad'),
('Uday Nair', 'student045@email.com', '9800000045', 'Jaipur'),
('Varun Gupta', 'student046@email.com', '9800000046', 'Lucknow'),
('Walia Joshi', 'student047@email.com', '9800000047', 'Visakhapatnam'),
('Yash Pillai', 'student048@email.com', '9800000048', 'Hyderabad'),
('Zara Shah', 'student049@email.com', '9800000049', 'Chennai'),
('Bhavya Mehta', 'student050@email.com', '9800000050', 'Delhi'),
('Chetan Khan', 'student051@email.com', '9800000051', 'Bengaluru'),
('Deepa Das', 'student052@email.com', '9800000052', 'Kochi'),
('Esha Roy', 'student053@email.com', '9800000053', 'Kolkata'),
('Farhan Iyer', 'student054@email.com', '9800000054', 'Mumbai'),
('Gita Rao', 'student055@email.com', '9800000055', 'Pune'),
('Harsh Mishra', 'student056@email.com', '9800000056', 'Ahmedabad'),
('Ira Bose', 'student057@email.com', '9800000057', 'Jaipur'),
('Jatin Kapoor', 'student058@email.com', '9800000058', 'Lucknow'),
('Aarav Kumar 59', 'student059@email.com', '9800000059', 'Visakhapatnam'),
('Diya Reddy 60', 'student060@email.com', '9800000060', 'Hyderabad'),
('Ishaan Nair 61', 'student061@email.com', '9800000061', 'Chennai'),
('Kavya Gupta 62', 'student062@email.com', '9800000062', 'Delhi'),
('Neha Joshi 63', 'student063@email.com', '9800000063', 'Bengaluru'),
('Omar Pillai 64', 'student064@email.com', '9800000064', 'Kochi'),
('Pooja Shah 65', 'student065@email.com', '9800000065', 'Kolkata'),
('Ravi Mehta 66', 'student066@email.com', '9800000066', 'Mumbai'),
('Sana Khan 67', 'student067@email.com', '9800000067', 'Pune'),
('Tanvi Das 68', 'student068@email.com', '9800000068', 'Ahmedabad'),
('Uday Roy 69', 'student069@email.com', '9800000069', 'Jaipur'),
('Varun Iyer 70', 'student070@email.com', '9800000070', 'Lucknow'),
('Walia Rao 71', 'student071@email.com', '9800000071', 'Visakhapatnam'),
('Yash Mishra 72', 'student072@email.com', '9800000072', 'Hyderabad'),
('Zara Bose 73', 'student073@email.com', '9800000073', 'Chennai'),
('Bhavya Kapoor 74', 'student074@email.com', '9800000074', 'Delhi'),
('Chetan Kumar 75', 'student075@email.com', '9800000075', 'Bengaluru'),
('Deepa Reddy 76', 'student076@email.com', '9800000076', 'Kochi'),
('Esha Nair 77', 'student077@email.com', '9800000077', 'Kolkata'),
('Farhan Gupta 78', 'student078@email.com', '9800000078', 'Mumbai'),
('Gita Joshi 79', 'student079@email.com', '9800000079', 'Pune'),
('Harsh Pillai 80', 'student080@email.com', '9800000080', 'Ahmedabad'),
('Ira Shah 81', 'student081@email.com', '9800000081', 'Jaipur'),
('Jatin Mehta 82', 'student082@email.com', '9800000082', 'Lucknow'),
('Aarav Khan 83', 'student083@email.com', '9800000083', 'Visakhapatnam'),
('Diya Das 84', 'student084@email.com', '9800000084', 'Hyderabad'),
('Ishaan Roy 85', 'student085@email.com', '9800000085', 'Chennai'),
('Kavya Iyer 86', 'student086@email.com', '9800000086', 'Delhi'),
('Neha Rao 87', 'student087@email.com', '9800000087', 'Bengaluru'),
('Omar Mishra 88', 'student088@email.com', '9800000088', 'Kochi'),
('Pooja Bose 89', 'student089@email.com', '9800000089', 'Kolkata'),
('Ravi Kapoor 90', 'student090@email.com', '9800000090', 'Mumbai'),
('Sana Kumar 91', 'student091@email.com', '9800000091', 'Pune'),
('Tanvi Reddy 92', 'student092@email.com', '9800000092', 'Ahmedabad'),
('Uday Nair 93', 'student093@email.com', '9800000093', 'Jaipur'),
('Varun Gupta 94', 'student094@email.com', '9800000094', 'Lucknow'),
('Walia Joshi 95', 'student095@email.com', '9800000095', 'Visakhapatnam'),
('Yash Pillai 96', 'student096@email.com', '9800000096', 'Hyderabad'),
('Zara Shah 97', 'student097@email.com', '9800000097', 'Chennai'),
('Bhavya Mehta 98', 'student098@email.com', '9800000098', 'Delhi'),
('Chetan Khan 99', 'student099@email.com', '9800000099', 'Bengaluru'),
('Deepa Das 100', 'student100@email.com', '9800000100', 'Kochi'),
('Esha Roy 101', 'student101@email.com', '9800000101', 'Kolkata'),
('Farhan Iyer 102', 'student102@email.com', '9800000102', 'Mumbai'),
('Gita Rao 103', 'student103@email.com', '9800000103', 'Pune'),
('Harsh Mishra 104', 'student104@email.com', '9800000104', 'Ahmedabad'),
('Ira Bose 105', 'student105@email.com', '9800000105', 'Jaipur'),
('Jatin Kapoor 106', 'student106@email.com', '9800000106', 'Lucknow'),
('Aarav Kumar 107', 'student107@email.com', '9800000107', 'Visakhapatnam'),
('Diya Reddy 108', 'student108@email.com', '9800000108', 'Hyderabad'),
('Ishaan Nair 109', 'student109@email.com', '9800000109', 'Chennai'),
('Kavya Gupta 110', 'student110@email.com', '9800000110', 'Delhi');

INSERT INTO memberships (student_id, membership_type, start_date, expiry_date, status) VALUES
(1, 'Gold', '2026-01-02', '2027-01-02', 'Active'),
(2, 'Silver', '2026-01-03', '2027-01-03', 'Active'),
(3, 'Bronze', '2026-01-04', '2027-01-04', 'Active'),
(4, 'Gold', '2026-01-05', '2027-01-05', 'Active'),
(5, 'Silver', '2026-01-06', '2027-01-06', 'Active'),
(6, 'Bronze', '2026-01-07', '2027-01-07', 'Active'),
(7, 'Gold', '2026-01-08', '2027-01-08', 'Active'),
(8, 'Silver', '2026-01-09', '2027-01-09', 'Active'),
(9, 'Bronze', '2026-01-10', '2027-01-10', 'Active'),
(11, 'Silver', '2026-01-12', '2027-01-12', 'Active'),
(12, 'Bronze', '2026-01-13', '2027-01-13', 'Active'),
(13, 'Gold', '2026-01-14', '2027-01-14', 'Active'),
(14, 'Silver', '2026-01-15', '2027-01-15', 'Active'),
(15, 'Bronze', '2026-01-16', '2027-01-16', 'Expired'),
(16, 'Gold', '2026-01-17', '2027-01-17', 'Active'),
(17, 'Silver', '2026-01-18', '2027-01-18', 'Active'),
(18, 'Bronze', '2026-01-19', '2027-01-19', 'Active'),
(19, 'Gold', '2026-01-20', '2027-01-20', 'Active'),
(20, 'Silver', '2026-01-21', '2027-01-21', 'Active'),
(21, 'Bronze', '2026-01-22', '2027-01-22', 'Active'),
(22, 'Gold', '2026-01-23', '2027-01-23', 'Active'),
(23, 'Silver', '2026-01-24', '2027-01-24', 'Active'),
(24, 'Bronze', '2026-01-25', '2027-01-25', 'Active'),
(25, 'Gold', '2026-01-26', '2027-01-26', 'Active'),
(26, 'Silver', '2026-01-27', '2027-01-27', 'Active'),
(27, 'Bronze', '2026-01-28', '2027-01-28', 'Active'),
(28, 'Gold', '2026-01-29', '2027-01-29', 'Active'),
(29, 'Silver', '2026-01-30', '2027-01-30', 'Active'),
(30, 'Bronze', '2026-01-31', '2027-01-31', 'Expired'),
(31, 'Gold', '2026-02-01', '2027-02-01', 'Active'),
(32, 'Silver', '2026-02-02', '2027-02-02', 'Active'),
(33, 'Bronze', '2026-02-03', '2027-02-03', 'Active'),
(34, 'Gold', '2026-02-04', '2027-02-04', 'Active'),
(35, 'Silver', '2026-02-05', '2027-02-05', 'Active'),
(36, 'Bronze', '2026-02-06', '2027-02-06', 'Active'),
(37, 'Gold', '2026-02-07', '2027-02-07', 'Active'),
(38, 'Silver', '2026-02-08', '2027-02-08', 'Active'),
(39, 'Bronze', '2026-02-09', '2027-02-09', 'Active'),
(40, 'Gold', '2026-02-10', '2027-02-10', 'Active'),
(41, 'Silver', '2026-02-11', '2027-02-11', 'Active'),
(42, 'Bronze', '2026-02-12', '2027-02-12', 'Active'),
(43, 'Gold', '2026-02-13', '2027-02-13', 'Active'),
(44, 'Silver', '2026-02-14', '2027-02-14', 'Active'),
(45, 'Bronze', '2026-02-15', '2027-02-15', 'Expired'),
(46, 'Gold', '2026-02-16', '2027-02-16', 'Active'),
(47, 'Silver', '2026-02-17', '2027-02-17', 'Active'),
(48, 'Bronze', '2026-02-18', '2027-02-18', 'Active'),
(49, 'Gold', '2026-02-19', '2027-02-19', 'Active'),
(50, 'Silver', '2026-02-20', '2027-02-20', 'Active'),
(51, 'Bronze', '2026-02-21', '2027-02-21', 'Active'),
(52, 'Gold', '2026-02-22', '2027-02-22', 'Active'),
(53, 'Silver', '2026-02-23', '2027-02-23', 'Active'),
(54, 'Bronze', '2026-02-24', '2027-02-24', 'Active'),
(55, 'Gold', '2026-02-25', '2027-02-25', 'Active'),
(56, 'Silver', '2026-02-26', '2027-02-26', 'Active'),
(57, 'Bronze', '2026-02-27', '2027-02-27', 'Active'),
(58, 'Gold', '2026-02-28', '2027-02-28', 'Active'),
(59, 'Silver', '2026-03-01', '2027-03-01', 'Active'),
(60, 'Bronze', '2026-03-02', '2027-03-02', 'Expired'),
(61, 'Gold', '2026-03-03', '2027-03-03', 'Active'),
(62, 'Silver', '2026-03-04', '2027-03-04', 'Active'),
(63, 'Bronze', '2026-03-05', '2027-03-05', 'Active'),
(64, 'Gold', '2026-03-06', '2027-03-06', 'Active'),
(65, 'Silver', '2026-03-07', '2027-03-07', 'Active'),
(66, 'Bronze', '2026-03-08', '2027-03-08', 'Active'),
(67, 'Gold', '2026-03-09', '2027-03-09', 'Active'),
(68, 'Silver', '2026-03-10', '2027-03-10', 'Active'),
(69, 'Bronze', '2026-03-11', '2027-03-11', 'Active'),
(70, 'Gold', '2026-03-12', '2027-03-12', 'Active'),
(71, 'Silver', '2026-03-13', '2027-03-13', 'Active'),
(72, 'Bronze', '2026-03-14', '2027-03-14', 'Active'),
(73, 'Gold', '2026-03-15', '2027-03-15', 'Active'),
(74, 'Silver', '2026-03-16', '2027-03-16', 'Active'),
(75, 'Bronze', '2026-03-17', '2027-03-17', 'Expired'),
(76, 'Gold', '2026-03-18', '2027-03-18', 'Active'),
(77, 'Silver', '2026-03-19', '2027-03-19', 'Active'),
(78, 'Bronze', '2026-03-20', '2027-03-20', 'Active'),
(79, 'Gold', '2026-03-21', '2027-03-21', 'Active'),
(80, 'Silver', '2026-03-22', '2027-03-22', 'Active'),
(81, 'Bronze', '2026-03-23', '2027-03-23', 'Active'),
(82, 'Gold', '2026-03-24', '2027-03-24', 'Active'),
(83, 'Silver', '2026-03-25', '2027-03-25', 'Active'),
(84, 'Bronze', '2026-03-26', '2027-03-26', 'Active'),
(85, 'Gold', '2026-03-27', '2027-03-27', 'Active'),
(86, 'Silver', '2026-03-28', '2027-03-28', 'Active'),
(87, 'Bronze', '2026-03-29', '2027-03-29', 'Active'),
(88, 'Gold', '2026-03-30', '2027-03-30', 'Active'),
(89, 'Silver', '2026-03-31', '2027-03-31', 'Active'),
(90, 'Bronze', '2026-04-01', '2027-04-01', 'Expired'),
(91, 'Gold', '2026-04-02', '2027-04-02', 'Active'),
(92, 'Silver', '2026-04-03', '2027-04-03', 'Active'),
(93, 'Bronze', '2026-04-04', '2027-04-04', 'Active'),
(94, 'Gold', '2026-04-05', '2027-04-05', 'Active'),
(95, 'Silver', '2026-04-06', '2027-04-06', 'Active'),
(96, 'Bronze', '2026-04-07', '2027-04-07', 'Active'),
(97, 'Gold', '2026-04-08', '2027-04-08', 'Active'),
(98, 'Silver', '2026-04-09', '2027-04-09', 'Active'),
(99, 'Bronze', '2026-04-10', '2027-04-10', 'Active'),
(100, 'Gold', '2026-04-11', '2027-04-11', 'Active'),
(101, 'Silver', '2026-04-12', '2027-04-12', 'Active'),
(102, 'Bronze', '2026-04-13', '2027-04-13', 'Active'),
(103, 'Gold', '2026-04-14', '2027-04-14', 'Active'),
(104, 'Silver', '2026-04-15', '2027-04-15', 'Active'),
(105, 'Bronze', '2026-04-16', '2027-04-16', 'Expired'),
(106, 'Gold', '2026-04-17', '2027-04-17', 'Active'),
(107, 'Silver', '2026-04-18', '2027-04-18', 'Active'),
(108, 'Bronze', '2026-04-19', '2027-04-19', 'Active'),
(109, 'Gold', '2026-04-20', '2027-04-20', 'Active'),
(110, 'Silver', '2026-04-21', '2027-04-21', 'Active');

INSERT INTO issued_books (book_id, student_id, librarian_id, issue_date, due_date, return_date) VALUES
(1, 1, 1, '2026-08-01', '2026-08-15', '2026-08-15'),
(3, 2, 2, '2026-08-05', '2026-08-19', NULL),
(9, 3, 3, '2026-08-10', '2026-08-24', '2026-08-24'),
(6, 4, 4, '2026-08-12', '2026-08-26', NULL),
(2, 5, 5, '2026-08-18', '2026-09-01', '2026-09-01'),
(7, 1, 6, '2026-08-20', '2026-09-03', NULL),
(4, 6, 7, '2026-08-22', '2026-09-05', '2026-09-05'),
(10, 8, 8, '2026-08-25', '2026-09-08', NULL),
(5, 7, 9, '2026-09-01', '2026-09-15', '2026-09-10'),
(8, 9, 10, '2026-09-05', '2026-09-19', NULL),
(11, 1, 1, '2026-07-23', '2026-08-06', '2026-08-05'),
(12, 2, 2, '2026-07-25', '2026-08-08', NULL),
(13, 3, 3, '2026-07-27', '2026-08-10', '2026-08-11'),
(14, 4, 4, '2026-07-29', '2026-08-12', '2026-08-14'),
(15, 5, 5, '2026-07-31', '2026-08-14', NULL),
(16, 6, 6, '2026-08-02', '2026-08-16', '2026-08-12'),
(17, 7, 7, '2026-08-04', '2026-08-18', '2026-08-15'),
(18, 8, 8, '2026-08-06', '2026-08-20', NULL),
(19, 9, 9, '2026-08-08', '2026-08-22', '2026-08-21'),
(20, 11, 10, '2026-08-10', '2026-08-24', '2026-08-24'),
(21, 12, 1, '2026-08-12', '2026-08-26', NULL),
(22, 13, 2, '2026-08-14', '2026-08-28', '2026-08-30'),
(23, 14, 3, '2026-08-16', '2026-08-30', '2026-09-02'),
(24, 15, 4, '2026-08-18', '2026-09-01', NULL),
(25, 16, 5, '2026-08-20', '2026-09-03', '2026-08-31'),
(26, 17, 6, '2026-08-22', '2026-09-05', '2026-09-03'),
(27, 18, 7, '2026-08-24', '2026-09-07', NULL),
(28, 19, 8, '2026-08-26', '2026-09-09', '2026-09-09'),
(29, 20, 9, '2026-08-28', '2026-09-11', '2026-09-12'),
(30, 21, 10, '2026-08-30', '2026-09-13', NULL),
(31, 22, 1, '2026-09-01', '2026-09-15', '2026-09-18'),
(32, 23, 2, '2026-09-03', '2026-09-17', '2026-09-13'),
(33, 24, 3, '2026-09-05', '2026-09-19', NULL),
(34, 25, 4, '2026-09-07', '2026-09-21', '2026-09-19'),
(35, 26, 5, '2026-09-09', '2026-09-23', '2026-09-22'),
(36, 27, 6, '2026-09-11', '2026-09-25', NULL),
(37, 28, 7, '2026-09-13', '2026-09-27', '2026-09-28'),
(38, 29, 8, '2026-09-15', '2026-09-29', '2026-10-01'),
(39, 30, 9, '2026-09-17', '2026-10-01', NULL),
(40, 31, 10, '2026-07-01', '2026-07-15', '2026-07-11'),
(41, 32, 1, '2026-07-03', '2026-07-17', '2026-07-14'),
(42, 33, 2, '2026-07-05', '2026-07-19', NULL),
(43, 34, 3, '2026-07-07', '2026-07-21', '2026-07-20'),
(44, 35, 4, '2026-07-09', '2026-07-23', '2026-07-23'),
(45, 36, 5, '2026-07-11', '2026-07-25', NULL),
(46, 37, 6, '2026-07-13', '2026-07-27', '2026-07-29'),
(47, 38, 7, '2026-07-15', '2026-07-29', '2026-08-01'),
(48, 39, 8, '2026-07-17', '2026-07-31', NULL),
(49, 40, 9, '2026-07-19', '2026-08-02', '2026-07-30'),
(50, 41, 10, '2026-07-21', '2026-08-04', '2026-08-02'),
(51, 42, 1, '2026-07-23', '2026-08-06', NULL),
(52, 43, 2, '2026-07-25', '2026-08-08', '2026-08-08'),
(53, 44, 3, '2026-07-27', '2026-08-10', '2026-08-11'),
(54, 45, 4, '2026-07-29', '2026-08-12', NULL),
(55, 46, 5, '2026-07-31', '2026-08-14', '2026-08-17'),
(56, 47, 6, '2026-08-02', '2026-08-16', '2026-08-12'),
(57, 48, 7, '2026-08-04', '2026-08-18', NULL),
(58, 49, 8, '2026-08-06', '2026-08-20', '2026-08-18'),
(59, 50, 9, '2026-08-08', '2026-08-22', '2026-08-21'),
(60, 51, 10, '2026-08-10', '2026-08-24', NULL),
(61, 52, 1, '2026-08-12', '2026-08-26', '2026-08-27'),
(62, 53, 2, '2026-08-14', '2026-08-28', '2026-08-30'),
(63, 54, 3, '2026-08-16', '2026-08-30', NULL),
(64, 55, 4, '2026-08-18', '2026-09-01', '2026-08-28'),
(65, 56, 5, '2026-08-20', '2026-09-03', '2026-08-31'),
(66, 57, 6, '2026-08-22', '2026-09-05', NULL),
(67, 58, 7, '2026-08-24', '2026-09-07', '2026-09-06'),
(68, 59, 8, '2026-08-26', '2026-09-09', '2026-09-09'),
(69, 60, 9, '2026-08-28', '2026-09-11', NULL),
(70, 61, 10, '2026-08-30', '2026-09-13', '2026-09-15'),
(71, 62, 1, '2026-09-01', '2026-09-15', '2026-09-18'),
(72, 63, 2, '2026-09-03', '2026-09-17', NULL),
(73, 64, 3, '2026-09-05', '2026-09-19', '2026-09-16'),
(74, 65, 4, '2026-09-07', '2026-09-21', '2026-09-19'),
(75, 66, 5, '2026-09-09', '2026-09-23', NULL),
(76, 67, 6, '2026-09-11', '2026-09-25', '2026-09-25'),
(77, 68, 7, '2026-09-13', '2026-09-27', '2026-09-28'),
(78, 69, 8, '2026-09-15', '2026-09-29', NULL),
(79, 70, 9, '2026-09-17', '2026-10-01', '2026-10-04'),
(80, 71, 10, '2026-07-01', '2026-07-15', '2026-07-11'),
(81, 72, 1, '2026-07-03', '2026-07-17', NULL),
(82, 73, 2, '2026-07-05', '2026-07-19', '2026-07-17'),
(83, 74, 3, '2026-07-07', '2026-07-21', '2026-07-20'),
(84, 75, 4, '2026-07-09', '2026-07-23', NULL),
(85, 76, 5, '2026-07-11', '2026-07-25', '2026-07-26'),
(86, 77, 6, '2026-07-13', '2026-07-27', '2026-07-29'),
(87, 78, 7, '2026-07-15', '2026-07-29', NULL),
(88, 79, 8, '2026-07-17', '2026-07-31', '2026-07-27'),
(89, 80, 9, '2026-07-19', '2026-08-02', '2026-07-30'),
(90, 81, 10, '2026-07-21', '2026-08-04', NULL),
(91, 82, 1, '2026-07-23', '2026-08-06', '2026-08-05'),
(92, 83, 2, '2026-07-25', '2026-08-08', '2026-08-08'),
(93, 84, 3, '2026-07-27', '2026-08-10', NULL),
(94, 85, 4, '2026-07-29', '2026-08-12', '2026-08-14'),
(95, 86, 5, '2026-07-31', '2026-08-14', '2026-08-17'),
(96, 87, 6, '2026-08-02', '2026-08-16', NULL),
(97, 88, 7, '2026-08-04', '2026-08-18', '2026-08-15'),
(98, 89, 8, '2026-08-06', '2026-08-20', '2026-08-18'),
(99, 90, 9, '2026-08-08', '2026-08-22', NULL),
(100, 91, 10, '2026-08-10', '2026-08-24', '2026-08-24'),
(101, 92, 1, '2026-08-12', '2026-08-26', '2026-08-27'),
(102, 93, 2, '2026-08-14', '2026-08-28', NULL),
(103, 94, 3, '2026-08-16', '2026-08-30', '2026-09-02'),
(104, 95, 4, '2026-08-18', '2026-09-01', '2026-08-28'),
(105, 96, 5, '2026-08-20', '2026-09-03', NULL),
(106, 97, 6, '2026-08-22', '2026-09-05', '2026-09-03'),
(107, 98, 7, '2026-08-24', '2026-09-07', '2026-09-06'),
(108, 99, 8, '2026-08-26', '2026-09-09', NULL),
(109, 100, 9, '2026-08-28', '2026-09-11', '2026-09-12'),
(110, 101, 10, '2026-08-30', '2026-09-13', '2026-09-15');

INSERT INTO book_publishers (book_id, publisher_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 1),
(12, 2),
(13, 3),
(14, 4),
(15, 5),
(16, 6),
(17, 7),
(18, 8),
(19, 9),
(20, 10),
(21, 1),
(22, 2),
(23, 3),
(24, 4),
(25, 5),
(26, 6),
(27, 7),
(28, 8),
(29, 9),
(30, 10),
(31, 1),
(32, 2),
(33, 3),
(34, 4),
(35, 5),
(36, 6),
(37, 7),
(38, 8),
(39, 9),
(40, 10),
(41, 1),
(42, 2),
(43, 3),
(44, 4),
(45, 5),
(46, 6),
(47, 7),
(48, 8),
(49, 9),
(50, 10),
(51, 1),
(52, 2),
(53, 3),
(54, 4),
(55, 5),
(56, 6),
(57, 7),
(58, 8),
(59, 9),
(60, 10),
(61, 1),
(62, 2),
(63, 3),
(64, 4),
(65, 5),
(66, 6),
(67, 7),
(68, 8),
(69, 9),
(70, 10),
(71, 1),
(72, 2),
(73, 3),
(74, 4),
(75, 5),
(76, 6),
(77, 7),
(78, 8),
(79, 9),
(80, 10),
(81, 1),
(82, 2),
(83, 3),
(84, 4),
(85, 5),
(86, 6),
(87, 7),
(88, 8),
(89, 9),
(90, 10),
(91, 1),
(92, 2),
(93, 3),
(94, 4),
(95, 5),
(96, 6),
(97, 7),
(98, 8),
(99, 9),
(100, 10),
(101, 1),
(102, 2),
(103, 3),
(104, 4),
(105, 5),
(106, 6),
(107, 7),
(108, 8),
(109, 9),
(110, 10);

INSERT INTO fines (issue_id, fine_amount, fine_reason, paid_status, fine_date) VALUES
(1, 20.00, 'Late return', 'Paid', '2026-08-15'),
(3, 50.00, 'Late return', 'Unpaid', '2026-08-24'),
(5, 10.00, 'Damaged pages', 'Paid', '2026-09-01'),
(7, 30.00, 'Late return', 'Unpaid', '2026-09-05'),
(9, 15.00, 'Late return', 'Paid', '2026-09-10'),
(2, 20.00, 'Lost card', 'Paid', '2026-08-05'),
(4, 30.00, 'Late return', 'Paid', '2026-08-12'),
(6, 40.00, 'Lost card', 'Paid', '2026-08-20'),
(8, 50.00, 'Late return', 'Paid', '2026-08-25'),
(10, 15.00, 'Lost card', 'Paid', '2026-09-05'),
(11, 20.00, 'Overdue reminder', 'Unpaid', '2026-08-05'),
(12, 25.00, 'Late return', 'Paid', '2026-07-25'),
(13, 30.00, 'Damaged pages', 'Unpaid', '2026-08-11'),
(14, 35.00, 'Lost card', 'Paid', '2026-08-14'),
(15, 40.00, 'Overdue reminder', 'Unpaid', '2026-07-31'),
(16, 45.00, 'Late return', 'Paid', '2026-08-12'),
(17, 50.00, 'Damaged pages', 'Unpaid', '2026-08-15'),
(18, 10.00, 'Lost card', 'Paid', '2026-08-06'),
(19, 15.00, 'Overdue reminder', 'Unpaid', '2026-08-21'),
(20, 20.00, 'Late return', 'Paid', '2026-08-24'),
(21, 25.00, 'Damaged pages', 'Unpaid', '2026-08-12'),
(22, 30.00, 'Lost card', 'Paid', '2026-08-30'),
(23, 35.00, 'Overdue reminder', 'Unpaid', '2026-09-02'),
(24, 40.00, 'Late return', 'Paid', '2026-08-18'),
(25, 45.00, 'Damaged pages', 'Unpaid', '2026-08-31'),
(26, 50.00, 'Lost card', 'Paid', '2026-09-03'),
(27, 10.00, 'Overdue reminder', 'Unpaid', '2026-08-24'),
(28, 15.00, 'Late return', 'Paid', '2026-09-09'),
(29, 20.00, 'Damaged pages', 'Unpaid', '2026-09-12'),
(30, 25.00, 'Lost card', 'Paid', '2026-08-30'),
(31, 30.00, 'Overdue reminder', 'Unpaid', '2026-09-18'),
(32, 35.00, 'Late return', 'Paid', '2026-09-13'),
(33, 40.00, 'Damaged pages', 'Unpaid', '2026-09-05'),
(34, 45.00, 'Lost card', 'Paid', '2026-09-19'),
(35, 50.00, 'Overdue reminder', 'Unpaid', '2026-09-22'),
(36, 10.00, 'Late return', 'Paid', '2026-09-11'),
(37, 15.00, 'Damaged pages', 'Unpaid', '2026-09-28'),
(38, 20.00, 'Lost card', 'Paid', '2026-10-01'),
(39, 25.00, 'Overdue reminder', 'Unpaid', '2026-09-17'),
(40, 30.00, 'Late return', 'Paid', '2026-07-11'),
(41, 35.00, 'Damaged pages', 'Unpaid', '2026-07-14'),
(42, 40.00, 'Lost card', 'Paid', '2026-07-05'),
(43, 45.00, 'Overdue reminder', 'Unpaid', '2026-07-20'),
(44, 50.00, 'Late return', 'Paid', '2026-07-23'),
(45, 10.00, 'Damaged pages', 'Unpaid', '2026-07-11'),
(46, 15.00, 'Lost card', 'Paid', '2026-07-29'),
(47, 20.00, 'Overdue reminder', 'Unpaid', '2026-08-01'),
(48, 25.00, 'Late return', 'Paid', '2026-07-17'),
(49, 30.00, 'Damaged pages', 'Unpaid', '2026-07-30'),
(50, 35.00, 'Lost card', 'Paid', '2026-08-02'),
(51, 40.00, 'Overdue reminder', 'Unpaid', '2026-07-23'),
(52, 45.00, 'Late return', 'Paid', '2026-08-08'),
(53, 50.00, 'Damaged pages', 'Unpaid', '2026-08-11'),
(54, 10.00, 'Lost card', 'Paid', '2026-07-29'),
(55, 15.00, 'Overdue reminder', 'Unpaid', '2026-08-17'),
(56, 20.00, 'Late return', 'Paid', '2026-08-12'),
(57, 25.00, 'Damaged pages', 'Unpaid', '2026-08-04'),
(58, 30.00, 'Lost card', 'Paid', '2026-08-18'),
(59, 35.00, 'Overdue reminder', 'Unpaid', '2026-08-21'),
(60, 40.00, 'Late return', 'Paid', '2026-08-10'),
(61, 45.00, 'Damaged pages', 'Unpaid', '2026-08-27'),
(62, 50.00, 'Lost card', 'Paid', '2026-08-30'),
(63, 10.00, 'Overdue reminder', 'Unpaid', '2026-08-16'),
(64, 15.00, 'Late return', 'Paid', '2026-08-28'),
(65, 20.00, 'Damaged pages', 'Unpaid', '2026-08-31'),
(66, 25.00, 'Lost card', 'Paid', '2026-08-22'),
(67, 30.00, 'Overdue reminder', 'Unpaid', '2026-09-06'),
(68, 35.00, 'Late return', 'Paid', '2026-09-09'),
(69, 40.00, 'Damaged pages', 'Unpaid', '2026-08-28'),
(70, 45.00, 'Lost card', 'Paid', '2026-09-15'),
(71, 50.00, 'Overdue reminder', 'Unpaid', '2026-09-18'),
(72, 10.00, 'Late return', 'Paid', '2026-09-03'),
(73, 15.00, 'Damaged pages', 'Unpaid', '2026-09-16'),
(74, 20.00, 'Lost card', 'Paid', '2026-09-19'),
(75, 25.00, 'Overdue reminder', 'Unpaid', '2026-09-09'),
(76, 30.00, 'Late return', 'Paid', '2026-09-25'),
(77, 35.00, 'Damaged pages', 'Unpaid', '2026-09-28'),
(78, 40.00, 'Lost card', 'Paid', '2026-09-15'),
(79, 45.00, 'Overdue reminder', 'Unpaid', '2026-10-04'),
(80, 50.00, 'Late return', 'Paid', '2026-07-11'),
(81, 10.00, 'Damaged pages', 'Unpaid', '2026-07-03'),
(82, 15.00, 'Lost card', 'Paid', '2026-07-17'),
(83, 20.00, 'Overdue reminder', 'Unpaid', '2026-07-20'),
(84, 25.00, 'Late return', 'Paid', '2026-07-09'),
(85, 30.00, 'Damaged pages', 'Unpaid', '2026-07-26'),
(86, 35.00, 'Lost card', 'Paid', '2026-07-29'),
(87, 40.00, 'Overdue reminder', 'Unpaid', '2026-07-15'),
(88, 45.00, 'Late return', 'Paid', '2026-07-27'),
(89, 50.00, 'Damaged pages', 'Unpaid', '2026-07-30'),
(90, 10.00, 'Lost card', 'Paid', '2026-07-21'),
(91, 15.00, 'Overdue reminder', 'Unpaid', '2026-08-05'),
(92, 20.00, 'Late return', 'Paid', '2026-08-08'),
(93, 25.00, 'Damaged pages', 'Unpaid', '2026-07-27'),
(94, 30.00, 'Lost card', 'Paid', '2026-08-14'),
(95, 35.00, 'Overdue reminder', 'Unpaid', '2026-08-17'),
(96, 40.00, 'Late return', 'Paid', '2026-08-02'),
(97, 45.00, 'Damaged pages', 'Unpaid', '2026-08-15'),
(98, 50.00, 'Lost card', 'Paid', '2026-08-18'),
(99, 10.00, 'Overdue reminder', 'Unpaid', '2026-08-08'),
(100, 15.00, 'Late return', 'Paid', '2026-08-24'),
(101, 20.00, 'Damaged pages', 'Unpaid', '2026-08-27'),
(102, 25.00, 'Lost card', 'Paid', '2026-08-14'),
(103, 30.00, 'Overdue reminder', 'Unpaid', '2026-09-02'),
(104, 35.00, 'Late return', 'Paid', '2026-08-28'),
(105, 40.00, 'Damaged pages', 'Unpaid', '2026-08-20'),
(106, 45.00, 'Lost card', 'Paid', '2026-09-03'),
(107, 50.00, 'Overdue reminder', 'Unpaid', '2026-09-06'),
(108, 10.00, 'Late return', 'Paid', '2026-08-26'),
(109, 15.00, 'Damaged pages', 'Unpaid', '2026-09-12'),
(110, 20.00, 'Lost card', 'Paid', '2026-09-15');

INSERT INTO reservations (book_id, student_id, reserve_date, status) VALUES
(12, 1, '2026-09-12', 'Pending'),
(20, 2, '2026-09-13', 'Fulfilled'),
(35, 3, '2026-09-14', 'Pending'),
(48, 4, '2026-09-15', 'Cancelled'),
(55, 5, '2026-09-16', 'Pending'),
(60, 6, '2026-09-17', 'Fulfilled'),
(72, 7, '2026-09-18', 'Pending'),
(80, 8, '2026-09-19', 'Pending'),
(91, 9, '2026-09-20', 'Fulfilled'),
(100, 11, '2026-09-21', 'Pending');




SELECT * FROM books;


SELECT * FROM students;


SELECT * FROM books WHERE price > 500;


SELECT * FROM books WHERE category = 'Programming';


SELECT * FROM students WHERE city = 'Visakhapatnam';


SELECT * FROM books ORDER BY price ASC;


SELECT * FROM books ORDER BY price DESC;


SELECT COUNT(*) AS total_books FROM books;


SELECT AVG(price) AS average_price FROM books;


SELECT MAX(price) AS highest_price FROM books;


SELECT MIN(price) AS lowest_price FROM books;


SELECT * FROM students WHERE student_name LIKE 'A%';


SELECT * FROM books WHERE book_name LIKE '%Python%';


UPDATE books SET price = 700.00
WHERE book_id = 1 AND book_name = 'Python Crash Course';


UPDATE students SET phone = '9998887776'
WHERE student_id = 2 AND student_name = 'Rohan Patel';


DELETE FROM students
WHERE student_id = 10 AND student_name = 'Rahul Verma';


SELECT * FROM issued_books;
SELECT ib.issue_id, b.book_name, s.student_name, ib.issue_date, ib.return_date
FROM issued_books ib
JOIN books b ON ib.book_id = b.book_id
JOIN students s ON ib.student_id = s.student_id
WHERE ib.return_date IS NULL;

SELECT COUNT(*) AS total_issued_books FROM issued_books;


SELECT
    b.book_id, b.book_name, b.author, b.category,
    s.student_id, s.student_name, s.city,
    ib.issue_date, ib.return_date
FROM issued_books ib
JOIN books b ON ib.book_id = b.book_id
JOIN students s ON ib.student_id = s.student_id;

SELECT
    f.fine_id, s.student_name, b.book_name,
    f.fine_amount, f.fine_reason, f.paid_status, f.fine_date
FROM fines f
JOIN issued_books ib ON f.issue_id = ib.issue_id
JOIN books b ON ib.book_id = b.book_id
JOIN students s ON ib.student_id = s.student_id;


SELECT ib.issue_id, b.book_name, s.student_name, ib.issue_date, ib.due_date
FROM issued_books ib
JOIN books b ON ib.book_id = b.book_id
JOIN students s ON ib.student_id = s.student_id
WHERE ib.return_date IS NULL AND ib.due_date < CURDATE();

SELECT l.librarian_name, s.student_name, b.book_name, f.fine_amount, f.paid_status
FROM fines f
JOIN issued_books ib ON f.issue_id = ib.issue_id
JOIN librarians l ON ib.librarian_id = l.librarian_id
JOIN students s ON ib.student_id = s.student_id
JOIN books b ON ib.book_id = b.book_id
WHERE f.paid_status = 'Unpaid';


SELECT s.student_name, m.membership_type, m.expiry_date, m.status
FROM memberships m
JOIN students s ON m.student_id = s.student_id
WHERE m.membership_type = 'Gold' AND m.status = 'Active';

SELECT r.reservation_id, s.student_name, b.book_name, r.reserve_date, r.status
FROM reservations r
JOIN students s ON r.student_id = s.student_id
JOIN books b ON r.book_id = b.book_id
WHERE r.status = 'Pending';

SELECT
    b.book_name, p.publisher_name, s.student_name,
    m.membership_type, l.librarian_name, l.shift,
    ib.issue_date, ib.due_date, ib.return_date,
    f.fine_amount, f.paid_status, r.status AS reservation_status
FROM issued_books ib
JOIN books b ON ib.book_id = b.book_id
JOIN book_publishers bp ON b.book_id = bp.book_id
JOIN publishers p ON bp.publisher_id = p.publisher_id
JOIN students s ON ib.student_id = s.student_id
JOIN memberships m ON s.student_id = m.student_id
JOIN librarians l ON ib.librarian_id = l.librarian_id
JOIN fines f ON f.issue_id = ib.issue_id
LEFT JOIN reservations r
    ON r.book_id = b.book_id AND r.student_id = s.student_id;

SHOW databases;
