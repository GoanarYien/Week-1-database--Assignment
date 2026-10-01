SQL
-- =========================================================================
-- Assignment: Week 1 MySQL Database Assignment
-- Topic: Library Management System
-- Description: Creates a database, sets up tables with relationships, 
--              inserts sample data, and runs basic queries.
-- =========================================================================

-- Step 1: Create and select the database
DROP DATABASE IF EXISTS library_db;
CREATE DATABASE library_db;
USE library_db;

-- Step 2: Create the authors table
CREATE TABLE authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    birth_year INT
);

-- Step 3: Create the books table with a foreign key referencing authors
CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    author_id INT,
    published_year INT,
    available_copies INT DEFAULT 1,
    FOREIGN KEY (author_id) REFERENCES authors(author_id) ON DELETE SET NULL
);

-- Step 4: Create the members table
CREATE TABLE members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    join_date DATE DEFAULT (CURRENT_DATE)
);

-- Step 5: Insert sample data into authors
INSERT INTO authors (first_name, last_name, birth_year) VALUES
('J.K.', 'Rowling', 1965),
('George', 'Orwell', 1903),
('Jane', 'Austen', 1775);

-- Step 6: Insert sample data into books
INSERT INTO books (title, author_id, published_year, available_copies) VALUES
('Harry Potter and the Sorcerer\'s Stone', 1, 1997, 5),
('1984', 2, 1949, 3),
('Pride and Prejudice', 3, 1813, 4);

-- Step 7: Insert sample data into members
INSERT INTO members (first_name, last_name, email, join_date) VALUES
('Alice', 'Smith', 'alice.smith@example.com', '2026-01-15'),
('Bob', 'Johnson', 'bob.johnson@example.com', '2026-02-10');

-- Step 8: Verify data with sample queries
-- View all books with their respective authors
SELECT 
    b.book_id, 
    b.title AS book_title, 
    CONCAT(a.first_name, ' ', a.last_name) AS author_name, 
    b.published_year, 
    b.available_copies
FROM books b
LEFT JOIN authors a ON b.author_id = a.author_id;

-- View all library members
SELECT * FROM members;
