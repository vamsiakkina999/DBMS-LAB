/* ------------------- CREATE TABLES ------------------- */
CREATE TABLE Sailors (
    Sid INT PRIMARY KEY,
    Sname VARCHAR(30),
    Rating INT,
    Age DECIMAL(4,1)
);

CREATE TABLE Boats (
    Bid INT PRIMARY KEY,
    Bname VARCHAR(30),
    Color VARCHAR(15)
);

CREATE TABLE Reserves (
    Sid INT REFERENCES Sailors(Sid),
    Bid INT REFERENCES Boats(Bid),
    Day DATE
);

/* ------------------- INSERT DATA ------------------- */
INSERT INTO Sailors VALUES (101, 'Ram', 7, 24.5);
INSERT INTO Sailors VALUES (102, 'John', 5, 20.0);
INSERT INTO Sailors VALUES (103, 'Ravi', 10, 35.0);
INSERT INTO Sailors VALUES (104, 'Anu', 6, 19.5);

INSERT INTO Boats VALUES (201, 'SeaHorse', 'Red');
INSERT INTO Boats VALUES (202, 'WaveRider', 'Blue');
INSERT INTO Boats VALUES (203, 'OceanStar', 'Red');

INSERT INTO Reserves VALUES (101, 201, '2025-01-10');
INSERT INTO Reserves VALUES (102, 202, '2025-01-15');
INSERT INTO Reserves VALUES (103, 201, '2025-01-18');
INSERT INTO Reserves VALUES (103, 203, '2025-01-21');

/* ------------------- VIEW 1: Sailors Who Reserved Boats ------------------- */
CREATE VIEW Reserved_Sailors AS
SELECT DISTINCT S.Sname, S.Rating, S.Age
FROM Sailors S
JOIN Reserves R ON S.Sid = R.Sid;

/* ------------------- VIEW 2: Sailors Who Reserved Red Boats ------------------- */
CREATE VIEW Red_Boat_Sailors AS
SELECT S.Sname, B.Bname, B.Color
FROM Sailors S
JOIN Reserves R ON S.Sid = R.Sid
JOIN Boats B ON R.Bid = B.Bid
WHERE B.Color = 'Red';

/* ------------------- VIEW 3: Reservation Count per Boat ------------------- */
CREATE VIEW Boat_Reservation_Count AS
SELECT B.Bname, COUNT(R.Bid) AS Total_Reservations
FROM Boats B
LEFT JOIN Reserves R ON B.Bid = R.Bid
GROUP BY B.Bname;



