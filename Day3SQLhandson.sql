-- Inserting updated data into the Students table
INSERT INTO Students
VALUES 
    ('Singh', 'arjunsingh@rediffmail.com', 'New Delhi', '2023-08-01', 'Arjun', '2000-05-15', 101),
    ('Patel', 'priyapatel@rediffmail.com', 'Mumbai', '2022-03-15', 'Priya', '1999-08-23', 102),
    ('Sharma', 'mohitsharma@rediffmail.com', 'Chennai', '2021-06-20', 'Mohit', '2001-12-03', 103),
    ('Kumar', 'deepakumar@rediffmail.com', 'Bangalore', '2020-11-10', 'Deraja', '2002-03-10', 104),
    ('Verma', 'sumanverma@rediffmail.com', 'Kolkata', '2024-05-15', 'Sunil', '1998-11-30', 105);

-- Inserting updated data into the Courses table
INSERT INTO Courses (First_name, Last_name, Email, course, DateOfJoining, StudentID, CourseID)
VALUES 
    ('Arjun', 'Singh', 'arjunsingh@rediffmail.com', 'Database Management', '2023-08-01', 101, 501),
    ('Priya', 'Patel', 'priyapatel@rediffmail.com', 'Software Engineering', '2022-03-15', 102, 502),
    ('Mohit', 'Sharma', 'mohitsharma@rediffmail.com', 'Data Structures', '2021-06-20', 103, 503),
    ('Deepak', 'Kumar', 'deepakumar@rediffmail.com', 'Network Security', '2020-11-10', 104, 504),
    ('Verma', 'sumanverma@rediffmail.com', 'Kolkata', '2024-05-15', 'Sunil', '1998-11-30', 205),
    ('jajun', 'Singh', 'arjunsingh@rediffmail.com', 'Database Management', '2023-08-01', 109, 509)
     ('Arjun', 'Singh', 'arjunsingh@rediffmail.com', 'Database Management', '2023-08-01', 108, 508);
-- Inserting updated data into the Instructor table
INSERT INTO Instructor
VALUES 
    (1, 501, 'Dr. Arjun Kapoor', 'arjunkapoor@rediffmail.com'),
    (2, 502, 'Prof. Priya Gupta', 'priyagupta@rediffmail.com'),
    (3, 503, 'Dr. Mohit Iyer', 'mohitiyer@rediffmail.com'),
    (4, 504, 'Prof. Deepak Reddy', 'deepakreddy@rediffmail.com'),
    (5, 505, 'Dr. Suman Sharma', 'sumansharma@rediffmail.com'),
    (6, 506, 'dr. mahesh Reddy', 'maheshreddy@rediffmail.com');

-- Inserting updated data into the Assignments table
INSERT INTO Assignments
VALUES 
    (1, 501, 'Database Normalization', '2024-12-15'),
    (2, 502, 'Software Design Patterns', '2024-12-20'),
    (3, 503, 'Algorithms and Sorting', '2025-01-10'),
    (4, 504, 'Network Security Basics', '2025-01-05'),
    (5, 505, 'Machine Learning Models', '2025-01-20');

-- Inserting updated data into the Grades table (adjusted grades for students)
INSERT INTO Grades 
VALUES 
    (1, 101, 1, 88.75),  -- Arjun Singh - 88.75 in 'Database Normalization'
    (2, 102, 1, 91.50),  -- Priya Patel - 91.50 in 'Database Normalization'
    (3, 103, 2, 76.30),  -- Mohit Sharma - 76.30 in 'Software Design Patterns'
    (4, 104, 3, 84.20),  -- Deepak Kumar - 84.20 in 'Algorithms and Sorting'
    (5, 105, 5, 97.50);  -- Suman Verma - 97.50 in 'Machine Learning Models'

-- Inserting updated data into the Attendance table
INSERT INTO Attendance
VALUES 
    (1, 101, 501, '2024-11-01', 'Present'),
    (2, 102, 501, '2024-11-01', 'Absent'),
    (3, 101, 501, '2024-11-02', 'Present'),
    (4, 103, 502, '2024-11-02', 'Present'),
    (5, 104, 503, '2024-11-03', 'Absent');

-- Query 1: Retrieve a list of students along with the names of courses they are enrolled in
SELECT Students.StudentID, Courses.course 
FROM Students
JOIN Enrollments ON Students.StudentID = Enrollments.StudentID
JOIN Courses ON Enrollments.CourseID = Courses.CourseID;

-- Query 2: List all students and the courses they are enrolled in, including students who are not enrolled in any course
SELECT Students.StudentID, Courses.course 
FROM Students
LEFT JOIN Enrollments ON Students.StudentID = Enrollments.StudentID
LEFT JOIN Courses ON Enrollments.CourseID = Courses.CourseID;

-- Query 3: List all courses and the students enrolled in each course, including courses with no students
SELECT Courses.CourseID, Courses.course 
FROM Courses
RIGHT JOIN Enrollments ON Courses.CourseID = Enrollments.CourseID
LEFT JOIN Students ON Enrollments.StudentID = Students.StudentID;

-- Query 4: Full Outer Join: Retrieve a list of all students and courses, including students without any courses and courses without any students
SELECT Students.StudentID, Courses.course 
FROM Students
FULL OUTER JOIN Enrollments ON Students.StudentID = Enrollments.StudentID
FULL OUTER JOIN Courses ON Enrollments.CourseID = Courses.CourseID;

-- Query 5: Retrieve each student's name along with their course name and instructor’s name
SELECT Students.StudentID, Courses.course, Instructor.Name 
FROM Students
JOIN Courses ON Students.StudentID = Courses.StudentID
JOIN Instructor ON Courses.CourseID = Instructor.CourseID;

-- Query 6: Use LEFT JOIN to find students who are not enrolled in any course
SELECT Students.StudentID, Courses.course 
FROM Students
LEFT JOIN Enrollments ON Students.StudentID = Enrollments.StudentID
LEFT JOIN Courses ON Enrollments.CourseID = Courses.CourseID
WHERE Enrollments.CourseID IS NULL;

-- Query 7: Retrieve the title of each assignment along with the student’s name and their score
SELECT Assignments.title, CONCAT(Students.First_name, ' ', Students.Last_name) AS student_name, Grades.Score 
FROM Grades
JOIN Assignments ON Grades.AssignmentID = Assignments.AssignmentID
JOIN Students ON Grades.StudentID = Students.StudentID;

-- Query 8: List each course name, the total number of enrolled students, and the instructor's name
SELECT Courses.course, COUNT(Enrollments.StudentID) AS total_enrolled_students, Instructor.Name AS InstructorName 
FROM Courses
LEFT JOIN Enrollments ON Courses.CourseID = Enrollments.CourseID
JOIN Instructor ON Courses.CourseID = Instructor.CourseID
GROUP BY Courses.course, Instructor.Name;

-- Query 9: Calculate the average attendance rate for each course (percentage of "Present" status)
SELECT Courses.course, 
       (SUM(CASE WHEN Attendance.Status = 'Present' THEN 1 ELSE 0 END) / COUNT(Attendance.AttendanceID)) * 100 AS average_attendance_rate 
FROM Attendance
JOIN Courses ON Attendance.CourseID = Courses.CourseID
GROUP BY Courses.course;
