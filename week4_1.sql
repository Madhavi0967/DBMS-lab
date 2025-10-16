--Table Creation
CREATE TABLE Student2 (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(20),
    Major VARCHAR(20));
CREATE TABLE Course2 (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(20),
    Credits INT
);
CREATE TABLE Enrollment2 (
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    PRIMARY KEY (StudentID, CourseID),
    FOREIGN KEY (StudentID) REFERENCES Student2(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Course2(CourseID)
);
CREATE TABLE Instructor2(
    InstructorID INT PRIMARY KEY,
    InstructorName VARCHAR(25),
    Phone VARCHAR(20)
);
CREATE TABLE Course_Instructor2 (
    CourseID INT,
    InstructorID INT,
    PRIMARY KEY (CourseID, InstructorID),
    FOREIGN KEY (CourseID) REFERENCES Course2(CourseID),
    FOREIGN KEY (InstructorID) REFERENCES Instructor2(InstructorID)
);
--Data Insertion
INSERT INTO Student2 (StudentID, StudentName, Major) VALUES
(1, 'Alice Smith', 'Computer Science'),
(2, 'Bob Johnson', 'Mathematics'),
(3, 'Charlie Brown', 'Physics');
INSERT INTO Course2 (CourseID, CourseName, Credits) VALUES
(101, 'Introduction to Prog’, 3),
(102, 'Calculus I', 4),
(103, 'Classical Mecha', 3);
Data Insertion
INSERT INTO Student2 (StudentID, StudentName, Major) VALUES
(1, 'Alice Smith', 'Computer Science'),
(2, 'Bob Johnson', 'Mathematics'),
(3, 'Charlie Brown', 'Physics');
INSERT INTO Course2 (CourseID, CourseName, Credits) VALUES
(101, 'Introduction to Prog’, 3),
(102, 'Calculus I', 4),
(103, 'Classical Mecha', 3);
-- Queries



--1. Retrieve all students and their majors
SELECT StudentID, StudentName, Major
FROM Student2;
--2. List all courses along with the number of credits
SELECT CourseID, CourseName, Credits
FROM Course2;
--3. Find all students enrolled in a specific course (e.g., ' Introduction to Prog’ ')
SELECT s.StudentName, c.CourseName
FROM Student2 s
JOIN Enrollment2 e ON s.StudentID = e.StudentID
JOIN Course2 c ON e.CourseID = c.CourseID
WHERE c.CourseName = 'Introduction to Prog';
--4. Get the list of instructors teaching a specific course
SELECT DISTINCT i.InstructorName, c.CourseName
FROM Instructor2 i
JOIN Course_Instructor2 ci ON i.InstructorID = ci.InstructorID
JOIN Course2 c ON ci.CourseID = c.CourseID
WHERE c.CourseName = 'Introduction to Prog';
--5. Count the number of students enrolled in each course
SELECT c.CourseName, COUNT(e.StudentID) AS StudentCount
FROM Course2 c
LEFT JOIN Enrollment2 e ON c.CourseID = e.CourseID
GROUP BY c.CourseName
ORDER BY StudentCount DESC;
--6. Find students who are not enrolled in any course
SELECT s.StudentName
FROM Student2 s
LEFT JOIN Enrollment2 e ON s.StudentID = e.StudentID
WHERE e.StudentID IS NULL;
--7. List courses along with their instructor names
SELECT c.CourseName, i.InstructorName
FROM Course2 c
JOIN Course_Instructor2 ci ON c.CourseID = ci.CourseID
JOIN Instructor2 i ON ci.InstructorID = i.InstructorID
ORDER BY c.CourseName;
--8. Get the number of courses taught by each instructor
SELECT i.InstructorName, COUNT(ci.CourseID) AS CoursesTaught
FROM Instructor2 i
LEFT JOIN Course_Instructor2 ci ON i.InstructorID = ci.InstructorID
GROUP BY i.InstructorName
ORDER BY CoursesTaught DESC;
