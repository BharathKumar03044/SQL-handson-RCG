-- Create and use the new database
CREATE DATABASE Bharath_RCG_SQL_handson;
USE Bharath_RCG_SQL_handson;

-- Create Customers table
CREATE TABLE Customers(
    First_name VARCHAR(20),
    Last_name VARCHAR(20),
    Email VARCHAR(30),
    City VARCHAR(20),
    DateOfPurchase DATE
);

-- Add a primary key column (CustomerID)
ALTER TABLE Customers ADD CustomerID INT PRIMARY KEY;

-- Drop the City column
ALTER TABLE Customers DROP COLUMN City;

-- Add the City column back
ALTER TABLE Customers ADD City VARCHAR(20);

-- Insert sample data into Customers
INSERT INTO Customers (First_name, Last_name, Email, DateOfPurchase, CustomerID, City) 
VALUES 
    ('Vinay', 'Nagarjuna', 'vinay.nagarjuna@zoho.in', '2023-12-12', 1, 'Bangalore'),
    ('Giri', 'Bharath', 'giri.lokesh@zoho.in', '2023-12-12', 2, 'Hyderabad');

-- Select all from Customers
SELECT * FROM Customers;

-- 1) Add NOT NULL and UNIQUE constraints to Students table
CREATE TABLE Students(
    First_name VARCHAR(20),
    Last_name VARCHAR(20),
    Email VARCHAR(30),
    City VARCHAR(20),
    DateOfJoining DATE
);

-- Drop the First_name column and then add it back with NOT NULL constraint
ALTER TABLE Students DROP COLUMN First_name;
ALTER TABLE Students ADD First_name VARCHAR(20) NOT NULL;

-- Add a UNIQUE constraint to the Email column
ALTER TABLE Students ADD CONSTRAINT UC_Email UNIQUE (Email);

-- 2) Add birthdate column to the Students table
ALTER TABLE Students ADD birthdate DATE;

-- 3) Drop the Customers table
DROP TABLE Customers;

-- 4) Create Courses table and perform operations like inserting data, truncating the table
CREATE TABLE Courses(
    First_name VARCHAR(20),
    Last_name VARCHAR(20),
    Email VARCHAR(30),
    course VARCHAR(20),
    DateOfJoining DATE,
    StudentID INT  -- Add StudentID column here before inserting data
);

-- Add a StudentID to the Students table (done earlier)

-- Insert data into the Courses table
INSERT INTO Courses (First_name, Last_name, Email, course, DateOfJoining, StudentID) 
VALUES 
    ('Vinay', 'Test', 'vinay.nagarjuna@zoho.in', 'SQL', '2024-10-13', 111); -- Corrected insert

-- Select all records from the Courses table
SELECT * FROM Courses;

-- Truncate all records from Courses (without dropping the table)
TRUNCATE TABLE Courses;

-- 5) Create Enrollments table and insert sample data
CREATE TABLE Enrollments(
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE
);

-- Insert data into Enrollments table
INSERT INTO Enrollments (EnrollmentID, StudentID, CourseID, EnrollmentDate) 
VALUES 
    (1, 1, 101, '2024-03-08'),
    (2, 2, 102, '2024-03-09'),
    (3, 3, 103, '2024-03-10'),
    (4, 1, 102, '2024-03-11');

-- Select all records from Enrollments
SELECT * FROM Enrollments;

-- 6) Update a student's email in the Students table
INSERT INTO Students (First_name, Last_name, Email, City, DateOfJoining, birthdate, StudentID) 
VALUES
    ('Vinay', 'Nagarjuna', 'vinay.nagarjuna@zoho.in', 'Chennai', '2012-04-12', '1997-04-02', 111),
    ('Smitha', 'Patel', 'smitha.patel@zoho.in', 'Chennai', '2012-04-12', '1996-11-23', 222);

-- Update email for a specific student
UPDATE Students 
SET Email = 'vinay.nagarjuna.new@zoho.in' 
WHERE StudentID = 111;

-- 7) Delete a specific student from the Students table
DELETE FROM Students WHERE StudentID = 222;
