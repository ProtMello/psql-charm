
-- Drop existing tables if they exist (to ensure clean slate)
BEGIN;
    DROP TABLE IF EXISTS reserves;
    DROP TABLE IF EXISTS boats;
    DROP TABLE IF EXISTS sailors;


-- Create Sailors table

    CREATE TABLE sailors (
        id INTEGER PRIMARY KEY,
        name TEXT,
        rating INTEGER,
        age REAL
    );


-- Create Boats table

    CREATE TABLE boats (
        id INTEGER PRIMARY KEY,
        name TEXT,
        color TEXT
    );


-- Create Reserves table

    CREATE TABLE reserves (
        sid INTEGER,
        bid INTEGER,
        day DATE,
        PRIMARY KEY (sid, bid, day),
        FOREIGN KEY (sid) REFERENCES sailors(id),
        FOREIGN KEY (bid) REFERENCES boats(id)
    );


-- Insert into Sailors

    INSERT INTO sailors (id, name, rating, age) VALUES
    (22, 'Dustin', 7, 45.0),
    (31, 'Lubber', 8, 55.5),
    (58, 'Rusty', 10, 35.0),
    (28, 'yuppy', 9, 35.0),
    (44, 'guppy', 5, 35.0),
    (29, 'Brutus', 1, 33.0),
    (32, 'Andy', 8, 25.5),
    (64, 'Horatio', 7, 35.0),
    (71, 'Zorba', 10, 16.0),
    (74, 'Horatio', 9, 35.0),
    (85, 'Art', 3, 25.5),
    (95, 'Bob', 3, 63.5);


-- Insert into Boats 

    INSERT INTO boats (id, name, color) VALUES
    (101, 'Interlake', 'blue'),
    (102, 'Interlake', 'red'),
    (103, 'Clipper', 'green'),
    (104, 'Marine', 'red');


-- Insert into Reserves 

    INSERT INTO reserves (sid, bid, day) VALUES
    (22, 101, '1996-10-10'),
    (58, 103, '1996-11-12'),
    (22, 102, '1998-10-10'),
    (22, 103, '1998-10-08'),
    (22, 104, '1998-10-07'),
    (31, 102, '1998-11-10'),
    (31, 103, '1998-11-06'),
    (31, 104, '1998-11-12'),
    (64, 101, '1998-09-05'),
    (64, 102, '1998-09-08'),
    (74, 103, '1998-09-08');
COMMIT;
