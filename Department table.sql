CREATE TABLE Department (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(20)
);

CREATE TABLE Staff (
    StaffID INT PRIMARY KEY,
    StaffName VARCHAR(20),
    DeptID INT REFERENCES Department(DeptID)
);
INSERT INTO Department VALUES (1, 'CSE');
INSERT INTO Department VALUES (2, 'IT');

INSERT INTO Staff VALUES (10, 'Anu', 1);
INSERT INTO Staff VALUES (11, 'Rakesh', 1);
INSERT INTO Staff VALUES (12, 'Neha', 2);

SELECT * FROM Department;
SELECT DeptName, Location FROM Department;

SELECT Staff.StaffName, Department.DeptName FROM Staff JOIN Department ON Staff.DeptID = Department.DeptID;

SELECT Name, Mark FROM Student WHERE Mark > (SELECT AVG(Mark) FROM Student);

SELECT UPPER(DeptName) FROM Department;       -- Convert to uppercase
SELECT LOWER(Location) FROM Department;       -- Convert to lowercase
SELECT SUBSTR(DeptName, 1, 2) FROM Department;-- First 2 letters
SELECT LENGTH(DeptName) FROM Department;      -- Name length

CREATE TABLE Dept_Copy AS SELECT * FROM Department;
CREATE TABLE Dept_Empty AS SELECT * FROM Department WHERE 1=0;  -- Only structure

ALTER TABLE Dept ADD HOD VARCHAR(30);
ALTER TABLE Dept MODIFY HOD VARCHAR(50);
ALTER TABLE Dept DROP COLUMN HOD;

CREATE TABLE Dept_New (
    DeptName VARCHAR(30)
);

INSERT INTO Dept_New VALUES ('CSE');
INSERT INTO Dept_New VALUES ('Civil');
INSERT INTO Dept_New VALUES ('IT');
SELECT DeptName FROM Dept
INTERSECT
SELECT DeptName FROM Dept_New;
SELECT DeptName FROM Dept UNION SELECT DeptName FROM Dept_New;

SELECT DeptName FROM Dept
MINUS
SELECT DeptName FROM Dept_New;

ALTER TABLE Dept ADD SupervisorID INT;

-- Example Data:
UPDATE Dept SET SupervisorID = 1 WHERE DeptID IN (2,3,4);
UPDATE Dept SET SupervisorID = NULL WHERE DeptID = 1;

SELECT D.DeptName AS ChildDept, S.DeptName AS SupervisingDept
FROM Dept D
LEFT JOIN Dept S ON D.SupervisorID = S.DeptID;



