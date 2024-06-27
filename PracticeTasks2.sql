CREATE DATABASE University

--Task 1
CREATE TABLE Student (
    RollNum char(7) Check (RollNum LIKE '__L____' ESCAPE '_' ) NOT NULL UNIQUE,
	Name varchar(255) NOT NULL,
	Gender char(255) CHECK (Gender IN ('Male','MALE','male','female','Female','FEMALE','Transgender','TRANSGENDER','transgender')),
	Phone# char(12) Check (Phone# LIKE '____-_______' ESCAPE '_')
);

CREATE TABLE Attendance (
    RollNum char(7) Check (RollNum LIKE '__L____' ESCAPE '_' ) NOT NULL UNIQUE,
    Date_ char(10) Check (Date_ LIKE '__-__-____' ESCAPE '_') NOT NULL,
	Status char(1) Check (Status IN ('P','A','L')) NOT NULL,
	ClassVenue int 
);

CREATE TABLE ClassVenue (
    ID int NOT NULL UNIQUE,
	Building varchar(255) NOT NULL,
	RoomNum int NOT NULL,
	Teacher varchar(255),
	TeacherID int 
);

CREATE TABLE Teacher(
    ID int NOT NULL UNIQUE,
	Name varchar(255) NOT NULL ,
	Designation varchar(255) NOT NULL,
	Department varchar(255) NOT NULL

);



--Task 2
ALTER TABLE Student
ADD CONSTRAINT PK_Student PRIMARY KEY (RollNum);

ALTER TABLE Attendance
ADD CONSTRAINT PK_Attendance PRIMARY KEY (RollNum);

ALTER TABLE ClassVenue
ADD CONSTRAINT PK_ClassVenue PRIMARY KEY (ID);

ALTER TABLE Teacher
ADD CONSTRAINT PK_Teacher PRIMARY KEY (ID,Name);

--Task 3
ALTER TABLE Attendance
ADD CONSTRAINT FK_Attendance_Student FOREIGN KEY (RollNum) REFERENCES Student(RollNum) ON UPDATE CASCADE ON DELETE NO ACTION;

ALTER TABLE Attendance
ADD CONSTRAINT FK_Attendance_ClassVenue FOREIGN KEY (ClassVenue) REFERENCES ClassVenue(ID) ON UPDATE CASCADE ON DELETE NO ACTION;

ALTER TABLE ClassVenue
ADD CONSTRAINT FK_ClassVenue_Teacher FOREIGN KEY (TeacherID,Teacher) REFERENCES Teacher(ID,Name) ON UPDATE CASCADE ON DELETE NO ACTION;


--Task 5
--Inserting Values in Tables
INSERT INTO Student VALUES ('19L1162','Abdullah Nazir','Male','0333-3333333');
INSERT INTO Student VALUES ('19L4124','Rafia Ahmed','Female','0333-3456789');
INSERT INTO Student VALUES ('19L4125','Basit Junaid','Male','0345-3243567');

INSERT INTO Attendance VALUES ('19L1162','2-22-2023','P','2');
INSERT INTO Attendance VALUES ('19L4124','2-23-2023','A','1');
INSERT INTO Attendance VALUES ('19L4125','3-4-2023','P','2');

INSERT INTO ClassVenue VALUES ('1','CS','2','Haris Bin Rehan','2');
INSERT INTO ClassVenue VALUES ('2','Civil','7','Raida Munir','1');

INSERT INTO Teacher VALUES ('1','Raida Munir','Lab Instructor','Computer Science');
INSERT INTO Teacher VALUES ('2','Haris Bin Rehan','Lecturer','Civil Eng.');
INSERT INTO Teacher VALUES ('3','Sana Fatima','Professor','Electrical Eng.');

--Task 6
ALTER TABLE Teacher
ADD CONSTRAINT UK_Teacher_Name UNIQUE (Name);

ALTER TABLE Student
ADD CONSTRAINT CHK_Student_Gender CHECK (Gender IN ('Female', 'Male'));

ALTER TABLE Attendance
ADD CONSTRAINT CHK_Attendance_Status CHECK (Status IN ('A', 'P'));

--Task 7

-- 1. Add new row into Student table, values <L192334, Shahid Iqbal, Male, 3.2>
-- This query is not valid because the value "3.2" is not appropriate for the "Phone" column, which expects 12 characters .
-- To make it valid, we need to provide a valid gender value such as "Male" or "Female".
INSERT INTO Student (RollNum, Name, Gender, Phone)
VALUES ('19L2334', 'Shahid Iqbal', 'Male', '3.2');

-- 2. Add new row into ClassVenue table, values <3, CS, 5, Ali,4>
INSERT INTO ClassVenue (ID, Building, RoomNum, Teacher, TeacherID)
VALUES (3, 'CS', 5, 'Ali', 4);

-- 3. Update Teacher table Change “Sana Fatima” name to “Dr. Sana Fatima”.
-- This query is valid.
UPDATE Teacher
SET Name = 'Dr. Sana Fatima'
WHERE Name = 'Sana Fatima';

-- 4. Delete Student with rollnum “L192334”
DELETE FROM Student
WHERE RollNum = '19L2334';

-- 5. Delete Student with rollnum “L194125”
-- This query is valid.
DELETE FROM Student
WHERE RollNum = '19L4125';

-- 6. Delete Attendance with rollnum “L194124”, if his status is absent.
DELETE FROM Attendance
WHERE RollNum = '19L4124' AND Status = 'A';


