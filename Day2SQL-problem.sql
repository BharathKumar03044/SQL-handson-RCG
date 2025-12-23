----------                 Session2

-- Select all from Customers
SELECT * FROM Customers;

-- Insert new customer records with updated email addresses
INSERT INTO Customers (First_name, Last_name, Email, DateOfPurchase, CustomerID, City) 
VALUES
    ('Vinay', 'Nagarjuna', 'vinay.nagarjuna@zoho.in', '2013-06-04', 2, 'Salem'),
    ('Smitha', 'Patel', 'smitha.patel@zoho.in', '2013-11-09', 3, 'thirchy'),
    ('Nagarjuna', 'Raj', 'nagarjuna.raj@zoho.in', '2013-06-04', 4, 'Chennai');
    ('Giri', 'Gowtham', 'giri.raj@zoho.in', '2013-06-04', 5, 'madhurai');

-- Select all from Customers after insertion
SELECT * FROM Customers;

-- Select First_name and Email from Customers
SELECT First_name, Email FROM Customers;

-- Select First_name and Email from Customers where city is Chennai
SELECT First_name, Email FROM Customers WHERE City = 'Chennai';

-- Select First_name and Email from Customers where CustomerID is greater than 1
SELECT First_name, Email FROM Customers WHERE CustomerID > 1;

-- Select First_name and Email from Customers where CustomerID > 1 AND City is Chennai
SELECT First_name, Email FROM Customers WHERE CustomerID > 1 AND City = 'Chennai';

-- Select First_name and Email from Customers where CustomerID > 1 OR City is Chennai
SELECT First_name, Email FROM Customers WHERE CustomerID > 1 OR City = 'Chennai';

-- Select First_name and Email from Customers where NOT city is Chennai
SELECT First_name, Email FROM Customers WHERE NOT City = 'Chennai';

-- Select First_name and Email from Customers where city is in ('Chennai')
SELECT First_name, Email FROM Customers WHERE City IN ('Chennai');

-- Select First_name and Email from Customers where city is in ('Chennai') and order by First_name DESC
SELECT First_name, Email FROM Customers WHERE City IN ('Chennai') ORDER BY First_name DESC;

-- Select all from Customers and order by First_name, offset 2 rows
SELECT * FROM Customers ORDER BY First_name OFFSET 2 ROWS;

-- Select all from Customers and order by First_name, offset 2 rows, fetch next 3 rows only
SELECT * FROM Customers ORDER BY First_name OFFSET 2 ROWS FETCH NEXT 3 ROWS ONLY;

-- Select TOP 3 First_name, Email from Customers ordered by City
SELECT TOP 3 First_name, Email FROM Customers ORDER BY City;

-- Select DISTINCT City from Customers and order by City
SELECT DISTINCT City FROM Customers ORDER BY City;

-- Count the number of customers grouped by City
SELECT COUNT(CustomerID), City FROM Customers GROUP BY City;

-- Select the MAX CustomerID, grouped by City
SELECT MAX(CustomerID), City FROM Customers GROUP BY City;

-- 1) Retrieve all assignments with due dates in the next 7 days
SELECT * FROM Assignments;
SELECT Title FROM Assignments WHERE Duedate BETWEEN '2024-11-14' AND '2024-11-24';

-- 2) Find the average score of all students on a specific assignment
SELECT * FROM Grades;
SELECT AVG(Score) FROM Grades WHERE AssignmentID = 1;

-- 3) Count the total number of days each student was marked "Present"
SELECT * FROM Attendance;
SELECT COUNT(StudentID) AS NoOfDaysPresent FROM Attendance WHERE Status = 'Present';

-- 4) Retrieve a list of instructors who have an email address ending with "@zoho.in"
SELECT * FROM Instructor;
SELECT Name, Email FROM Instructor WHERE Email LIKE '%@zoho.in';

-- 5) List all students who scored above 90 on any assignment
SELECT * FROM Grades;
SELECT * FROM Grades WHERE Score > 90.00;

-- 6) Retrieve the names of all instructors who have not assigned a course
SELECT * FROM Instructor;
SELECT Name FROM Instructor WHERE CourseID IS NULL;

-- 7) Find students who have more than three absences
SELECT * FROM Attendance;
SELECT StudentID, COUNT(*) FROM Attendance WHERE Status = 'Absent' GROUP BY StudentID HAVING COUNT(*) > 3;

-- 8) For each assignment, find the highest score achieved by any student
SELECT * FROM Grades;
SELECT MAX(Score) AS HighestScore FROM Grades GROUP BY AssignmentID;

-- 9) Retrieve all assignments that were due more than a month ago
SELECT * FROM Assignments;
SELECT * FROM Assignments WHERE Duedate < DATEADD(MONTH, -1, GETDATE());

-- 10) Count the total number of assignments for each course
SELECT * FROM Assignments;
SELECT CourseID, COUNT(*) FROM Assignments GROUP BY CourseID;

-- 11) Retrieve a list of instructors, sorted by name in descending order
SELECT * FROM Instructor;
SELECT Name FROM Instructor ORDER BY Name DESC;

-- 12) List all students and their highest score across all assignments
SELECT * FROM Grades;
SELECT MAX(Score) AS HighestScore, StudentID FROM Grades GROUP BY StudentID;
