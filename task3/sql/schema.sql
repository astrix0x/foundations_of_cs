-- =============================================
-- ST4015CMD Foundation of Computer Science
-- College Club Membership Database Schema
-- =============================================

-- Create and use database
CREATE DATABASE IF NOT EXISTS college_club;
USE college_club;

-- =============================================
-- UNNORMALISED TABLE (UNF)
-- =============================================
CREATE TABLE IF NOT EXISTS ClubMembership (
    StudentID INT,
    StudentName VARCHAR(50),
    Email VARCHAR(50),
    ClubName VARCHAR(50),
    ClubRoom VARCHAR(10),
    ClubMentor VARCHAR(50),
    JoinDate DATE
);

INSERT INTO ClubMembership VALUES
(1, 'Asha', 'asha@email.com', 'Music Club', 'R101', 'Mr. Raman', '2024-01-10'),
(2, 'Bikash', 'bikash@email.com', 'Sports Club', 'R202', 'Ms. Sita', '2024-01-12'),
(1, 'Asha', 'asha@email.com', 'Sports Club', 'R202', 'Ms. Sita', '2024-01-15'),
(3, 'Nisha', 'nisha@email.com', 'Music Club', 'R101', 'Mr. Raman', '2024-01-20'),
(4, 'Rohan', 'rohan@email.com', 'Drama Club', 'R303', 'Mr. Kiran', '2024-01-18'),
(5, 'Suman', 'suman@email.com', 'Music Club', 'R101', 'Mr. Raman', '2024-01-22'),
(2, 'Bikash', 'bikash@email.com', 'Drama Club', 'R303', 'Mr. Kiran', '2024-01-25'),
(6, 'Pooja', 'pooja@email.com', 'Sports Club', 'R202', 'Ms. Sita', '2024-01-27'),
(3, 'Nisha', 'nisha@email.com', 'Coding Club', 'Lab1', 'Mr. Anil', '2024-01-28'),
(7, 'Aman', 'aman@email.com', 'Coding Club', 'Lab1', 'Mr. Anil', '2024-01-30');

-- =============================================
-- 1NF TABLE
-- =============================================
CREATE TABLE IF NOT EXISTS ClubMembership_1NF (
    StudentID INT,
    StudentName VARCHAR(50),
    Email VARCHAR(50),
    ClubName VARCHAR(50),
    ClubRoom VARCHAR(10),
    ClubMentor VARCHAR(50),
    JoinDate DATE,
    PRIMARY KEY (StudentID, ClubName)
);

INSERT INTO ClubMembership_1NF VALUES
(1, 'Asha', 'asha@email.com', 'Music Club', 'R101', 'Mr. Raman', '2024-01-10'),
(2, 'Bikash', 'bikash@email.com', 'Sports Club', 'R202', 'Ms. Sita', '2024-01-12'),
(1, 'Asha', 'asha@email.com', 'Sports Club', 'R202', 'Ms. Sita', '2024-01-15'),
(3, 'Nisha', 'nisha@email.com', 'Music Club', 'R101', 'Mr. Raman', '2024-01-20'),
(4, 'Rohan', 'rohan@email.com', 'Drama Club', 'R303', 'Mr. Kiran', '2024-01-18'),
(5, 'Suman', 'suman@email.com', 'Music Club', 'R101', 'Mr. Raman', '2024-01-22'),
(2, 'Bikash', 'bikash@email.com', 'Drama Club', 'R303', 'Mr. Kiran', '2024-01-25'),
(6, 'Pooja', 'pooja@email.com', 'Sports Club', 'R202', 'Ms. Sita', '2024-01-27'),
(3, 'Nisha', 'nisha@email.com', 'Coding Club', 'Lab1', 'Mr. Anil', '2024-01-28'),
(7, 'Aman', 'aman@email.com', 'Coding Club', 'Lab1', 'Mr. Anil', '2024-01-30');

-- =============================================
-- 2NF TABLES
-- =============================================
CREATE TABLE IF NOT EXISTS Student_2NF (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50),
    Email VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS Club_2NF (
    ClubName VARCHAR(50) PRIMARY KEY,
    ClubRoom VARCHAR(10),
    ClubMentor VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS Membership_2NF (
    StudentID INT,
    ClubName VARCHAR(50),
    JoinDate DATE,
    PRIMARY KEY (StudentID, ClubName)
);

INSERT INTO Student_2NF VALUES
(1, 'Asha', 'asha@email.com'),
(2, 'Bikash', 'bikash@email.com'),
(3, 'Nisha', 'nisha@email.com'),
(4, 'Rohan', 'rohan@email.com'),
(5, 'Suman', 'suman@email.com'),
(6, 'Pooja', 'pooja@email.com'),
(7, 'Aman', 'aman@email.com');

INSERT INTO Club_2NF VALUES
('Music Club', 'R101', 'Mr. Raman'),
('Sports Club', 'R202', 'Ms. Sita'),
('Drama Club', 'R303', 'Mr. Kiran'),
('Coding Club', 'Lab1', 'Mr. Anil');

INSERT INTO Membership_2NF VALUES
(1, 'Music Club', '2024-01-10'),
(2, 'Sports Club', '2024-01-12'),
(1, 'Sports Club', '2024-01-15'),
(3, 'Music Club', '2024-01-20'),
(4, 'Drama Club', '2024-01-18'),
(5, 'Music Club', '2024-01-22'),
(2, 'Drama Club', '2024-01-25'),
(6, 'Sports Club', '2024-01-27'),
(3, 'Coding Club', '2024-01-28'),
(7, 'Coding Club', '2024-01-30');

-- =============================================
-- 3NF TABLES
-- =============================================
CREATE TABLE IF NOT EXISTS Club_3NF (
    ClubID VARCHAR(5) PRIMARY KEY,
    ClubName VARCHAR(50),
    ClubRoom VARCHAR(10),
    ClubMentor VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS Membership_3NF (
    StudentID INT,
    ClubID VARCHAR(5),
    JoinDate DATE,
    PRIMARY KEY (StudentID, ClubID),
    FOREIGN KEY (StudentID) REFERENCES Student_2NF(StudentID),
    FOREIGN KEY (ClubID) REFERENCES Club_3NF(ClubID)
);

INSERT INTO Club_3NF VALUES
('C01', 'Music Club', 'R101', 'Mr. Raman'),
('C02', 'Sports Club', 'R202', 'Ms. Sita'),
('C03', 'Drama Club', 'R303', 'Mr. Kiran'),
('C04', 'Coding Club', 'Lab1', 'Mr. Anil');

INSERT INTO Membership_3NF VALUES
(1, 'C01', '2024-01-10'),
(2, 'C02', '2024-01-12'),
(1, 'C02', '2024-01-15'),
(3, 'C01', '2024-01-20'),
(4, 'C03', '2024-01-18'),
(5, 'C01', '2024-01-22'),
(2, 'C03', '2024-01-25'),
(6, 'C02', '2024-01-27'),
(3, 'C04', '2024-01-28'),
(7, 'C04', '2024-01-30');

-- =============================================
-- SQL OPERATIONS
-- =============================================
INSERT INTO Student_2NF VALUES (8, 'Priya', 'priya@email.com');
INSERT INTO Club_3NF VALUES ('C05', 'Art Club', 'R404', 'Ms. Lata');

-- =============================================
-- SELECT QUERIES
-- =============================================
SELECT * FROM ClubMembership;
SELECT * FROM ClubMembership_1NF;
SELECT * FROM Student_2NF;
SELECT * FROM Club_2NF;
SELECT * FROM Membership_2NF;
SELECT * FROM Club_3NF;
SELECT * FROM Membership_3NF;

-- =============================================
-- JOIN QUERY
-- =============================================
SELECT 
    Student_2NF.StudentName, 
    Club_3NF.ClubName, 
    Membership_3NF.JoinDate
FROM Membership_3NF
JOIN Student_2NF 
    ON Membership_3NF.StudentID = Student_2NF.StudentID
JOIN Club_3NF 
    ON Membership_3NF.ClubID = Club_3NF.ClubID;