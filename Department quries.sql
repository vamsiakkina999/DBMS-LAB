SELECT Staff.StaffName, Department.DeptName FROM Staff JOIN Department ON Staff.DeptID = Department.DeptID;

SELECT Name, Mark FROM Student WHERE Mark > (SELECT AVG(Mark) FROM Student);
