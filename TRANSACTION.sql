START TRANSACTION;

UPDATE Employee
SET Salary = Salary + 2000
WHERE Eid = 101;

SAVEPOINT S1;

UPDATE Employee
SET Salary = Salary - 3000
WHERE Eid = 103;

ROLLBACK TO S1;

COMMIT;
