CREATE TABLE Employee (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(30),
    Salary INT,
    Dept VARCHAR(20)
);
INSERT INTO Employee VALUES (1, 'Kiran', 30000, 'HR');
INSERT INTO Employee VALUES (2, 'Divya', 45000, 'CSE');
INSERT INTO Employee VALUES (3, 'Vijay', 50000, 'Finance');
INSERT INTO Employee VALUES (4, 'Riya', 55000, 'CSE');

CREATE TABLE Departments (
    DeptID INT PRIMARY KEY,
    DeptName VARCHAR(30),
    Location VARCHAR(20),
    HeadOfDept VARCHAR(30)
);

INSERT INTO Departments VALUES (1,'CSE','Block A','Dr. Kumar');
INSERT INTO Departments VALUES (2,'ECE','Block B','Dr. Sheela');
INSERT INTO Departments VALUES (3,'IT','Block C','Dr. Manoj');

SELECT * FROM Employee;
SELECT EmpName, Salary FROM Employee;
SELECT * FROM Employee WHERE Salary > 40000;
SELECT * FROM Employee ORDER BY Salary DESC;   
SELECT Dept, COUNT(*) FROM Employee GROUP BY Dept;  

-- Show employees with their department names
SELECT E.Ename, E.Salary, D.DeptName
FROM Employee E
JOIN Departments D ON E.DeptID = D.DeptID;

-- Count of employees per department
SELECT D.DeptName, COUNT(E.Eid) AS Total_Employees
FROM Departments D
LEFT JOIN Employee E ON D.DeptID = E.DeptID
GROUP BY D.DeptName;

-- Employees having salary above average
SELECT Ename, Salary
FROM Employee
WHERE Salary > (SELECT AVG(Salary) FROM Employee);

-- Highest salary employee
SELECT Ename, Salary
FROM Employee
WHERE Salary = (SELECT MAX(Salary) FROM Employee);

