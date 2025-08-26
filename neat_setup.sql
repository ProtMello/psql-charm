
-- Drop existing tables if they exist (to ensure clean slate)
DROP TABLE IF EXISTS Reserves;
DROP TABLE IF EXISTS Boats;
DROP TABLE IF EXISTS Sailors;

-- Create Sailors table
CREATE TABLE Sailors (
    sid INTEGER PRIMARY KEY,
    sname VARCHAR,
    rating INTEGER,
    age REAL
);

-- Create Boats table
CREATE TABLE Boats (
    bid INTEGER PRIMARY KEY,
    bname VARCHAR,
    color VARCHAR
);

-- Create Reserves table
CREATE TABLE Reserves (
    sid INTEGER,
    bid INTEGER,
    day DATE,
    PRIMARY KEY (sid, bid, day),
    FOREIGN KEY (sid) REFERENCES Sailors(sid),
    FOREIGN KEY (bid) REFERENCES Boats(bid)
);

-- Insert into Sailors (S1)
INSERT INTO Sailors (sid, sname, rating, age) VALUES
(22, 'Dustin', 7, 45.0),
(31, 'Lubber', 8, 55.5),
(58, 'Rusty', 10, 35.0);

-- Insert into Sailors (S2 additional entries)
INSERT INTO Sailors (sid, sname, rating, age) VALUES
(28, 'yuppy', 9, 35.0),
(44, 'guppy', 5, 35.0);

-- Insert into Sailors (S3 additional entries)
INSERT INTO Sailors (sid, sname, rating, age) VALUES
(29, 'Brutus', 1, 33.0),
(32, 'Andy', 8, 25.5),
(64, 'Horatio', 7, 35.0),
(71, 'Zorba', 10, 16.0),
(74, 'Horatio', 9, 35.0),
(85, 'Art', 3, 25.5),
(95, 'Bob', 3, 63.5);

-- Insert into Boats (B1)
INSERT INTO Boats (bid, bname, color) VALUES
(101, 'Interlake', 'blue'),
(102, 'Interlake', 'red'),
(103, 'Clipper', 'green'),
(104, 'Marine', 'red');

-- Insert into Reserves (R1)
INSERT INTO Reserves (sid, bid, day) VALUES
(22, 101, '1996-10-10'),
(58, 103, '1996-11-12');

-- Insert into Reserves (R2 additional entries)
INSERT INTO Reserves (sid, bid, day) VALUES
(22, 102, '1998-10-10'),
(22, 103, '1998-10-08'),
(22, 104, '1998-10-07'),
(31, 102, '1998-11-10'),
(31, 103, '1998-11-06'),
(31, 104, '1998-11-12'),
(64, 101, '1998-09-05'),
(64, 102, '1998-09-08'),
(74, 103, '1998-09-08');
