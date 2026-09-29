DROP DATABASE IF EXISTS Collegebca;
CREATE DATABASE Collegebca;
use Collegebca;
CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100)
);


CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100)
);

CREATE TABLE Enrollment (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

INSERT INTO Department VALUES
(1, 'Computer Science'),
(2, 'Information Technology'),
(3, 'Electronics');

INSERT INTO Student VALUES
(101, 'Arun', 1),
(102, 'Priya', 2),
(103, 'Karthik', 1);

INSERT INTO Course VALUES
(201, 'Database Management Systems'),
(202, 'Operating Systems'),
(203, 'Computer Networks');

INSERT INTO Enrollment VALUES
(301, 101, 201),
(302, 101, 202),
(303, 102, 203),
(304, 103, 201);

CREATE VIEW StudentDetails AS
SELECT
    S.StudentName,
    C.CourseName,
    D.DepartmentName
FROM Student S
JOIN Department D
    ON S.DepartmentID = D.DepartmentID
JOIN Enrollment E
    ON S.StudentID = E.StudentID
JOIN Course C
    ON E.CourseID = C.CourseID;

SELECT * FROM StudentDetails;

