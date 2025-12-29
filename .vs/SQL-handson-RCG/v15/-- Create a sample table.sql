-- Create a sample table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    HireDate DATE,
    JobTitle VARCHAR(50),
    Salary DECIMAL(10, 2)
);

-- Insert sample data into the table
INSERT INTO Employees (EmployeeID, FirstName, LastName, HireDate, JobTitle, Salary)
VALUES
(1, 'John', 'markantony', '2020-01-15', 'Software Engineer', 75000.00),
(2, 'Jane', 'joySmith', '2019-03-10', 'Project Manager', 85000.00),
(3, 'Alice', 'villiyum', '2021-06-01', 'Data Analyst', 65000.00);

-- Query the table
SELECT * FROM Employees;