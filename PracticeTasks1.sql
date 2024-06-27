CREATE DATABASE University

--Task 1
CREATE TABLE Student (
    RollNum char(6) Check (RollNum LIKE '__L____' ESCAPE '_' ) NOT NULL UNIQUE,
	Name varchar(255) NOT NULL,
	Gender char(255) CHECK (Gender IN ('Male','MALE','male','female','Female','FEMALE','Transgender','TRANSGENDER','transgender')),
	Phone# char(11) Check (Phone# LIKE '____-_______' ESCAPE '_')
);

CREATE TABLE Attendance (
    RollNum char(6) Check (RollNum LIKE '__L____' ESCAPE '_' ) NOT NULL UNIQUE,
    Date_ char(8) Check (Date_ LIKE '__-__-____' ESCAPE '_') NOT NULL,
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

--Task 4
ALTER TABLE Student 
ADD WarningCount INT;

ALTER TABLE Student 
DROP COLUMN Phone;



