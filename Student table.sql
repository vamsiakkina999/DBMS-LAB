CREATE TABLE Student (
    RegNo INT PRIMARY KEY,
    Name VARCHAR(30),
    Dept VARCHAR(10),
    Mark INT
);
INSERT INTO Student VALUES (101, 'Arun', 'CSE', 85);
INSERT INTO Student VALUES (102, 'Meera', 'ECE', 90);
INSERT INTO Student VALUES (103, 'John', 'CSE', 75);
INSERT INTO Student VALUES (104, 'Sara', 'IT', 88);

SELECT * FROM Student;  
                      
SELECT Name, Mark FROM Student;  
   
SELECT * FROM Student WHERE Dept = 'CSE';  
 
SELECT * FROM Student WHERE Mark > 80;     

SELECT * FROM Student WHERE Mark BETWEEN 70 AND 90;
SELECT * FROM Student WHERE Name LIKE 'S%';
SELECT * FROM Student WHERE Dept IN ('CSE','IT');

SELECT COUNT(*) FROM Student;
SELECT SUM(Mark) FROM Student;
SELECT AVG(Mark) FROM Student;
SELECT MAX(Mark) FROM Student;
SELECT MIN(Mark) FROM Student;

SELECT Dept, COUNT(*) FROM Student GROUP BY Dept;
SELECT Gender, AVG(Mark) FROM Student GROUP BY Gender;

SELECT Dept, AVG(Mark) FROM Student GROUP BY Dept HAVING AVG(Mark) > 80; 

UPDATE Student SET Mark = 95 WHERE RegNo = 102;
UPDATE Student SET Dept = 'ECE' WHERE RegNo = 105;

DELETE FROM Student WHERE RegNo = 105;

ALTER TABLE Student ADD City VARCHAR(20);
ALTER TABLE Student MODIFY Mark INT NOT NULL;
ALTER TABLE Student DROP COLUMN City;


//courses table
CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(20),
    RegNo INT REFERENCES Student(RegNo)
);

INSERT INTO Course VALUES (1,'DBMS',101);
INSERT INTO Course VALUES (2,'CN',103);
INSERT INTO Course VALUES (3,'DBMS',104);


SELECT Student.Name, Course.CourseName
FROM Student
JOIN Course ON Student.RegNo = Course.RegNo;

SELECT Student.Name, Course.CourseName
FROM Student
LEFT JOIN Course ON Student.RegNo = Course.RegNo;

SELECT Name, Mark FROM Student
WHERE Mark > (SELECT AVG(Mark) FROM Student);
SELECT Name FROM Student
WHERE Mark = (SELECT MAX(Mark) FROM Student);
SELECT Name FROM Student
WHERE Dept = (SELECT Dept FROM Student WHERE RegNo = 101);





