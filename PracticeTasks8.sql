create database New
use New
go
create table Students
(RollNo varchar(7) primary key
,Name varchar(30)
,WarningCount int
,Department varchar(15)
)
GO
INSERT [dbo].[Students] ([RollNo], [Name], [WarningCount], [Department]) VALUES (N'1', N'Ali', 0, N'CS')
INSERT [dbo].[Students] ([RollNo], [Name], [WarningCount], [Department]) VALUES (N'2', N'Bilal', 0, N'CS')
INSERT [dbo].[Students] ([RollNo], [Name], [WarningCount], [Department]) VALUES (N'3', N'Ayesha', 0, N'CS')
INSERT [dbo].[Students] ([RollNo], [Name], [WarningCount], [Department]) VALUES (N'4', N'Ahmed', 0, N'CS')
INSERT [dbo].[Students] ([RollNo], [Name], [WarningCount], [Department]) VALUES (N'5', N'Sara', 0, N'EE')
INSERT [dbo].[Students] ([RollNo], [Name], [WarningCount], [Department]) VALUES (N'6', N'Salman', 1, N'EE')
INSERT [dbo].[Students] ([RollNo], [Name], [WarningCount], [Department]) VALUES (N'7', N'Zainab', 2, N'CS')
INSERT [dbo].[Students] ([RollNo], [Name], [WarningCount], [Department]) VALUES (N'8', N'Danial', 1, N'CS')

go
create table Courses
(
CourseID int primary key,
CourseName varchar(40),
PrerequiteCourseID int,
CreditHours int
) 
GO
INSERT [dbo].[Courses] ([CourseID], [CourseName], [PrerequiteCourseID],CreditHours) VALUES (10, N'Database Systems', 20, 3)
INSERT [dbo].[Courses] ([CourseID], [CourseName], [PrerequiteCourseID],CreditHours) VALUES (20, N'Data Structures', 30,3)
INSERT [dbo].[Courses] ([CourseID], [CourseName], [PrerequiteCourseID],CreditHours) VALUES (30, N'Programing', NULL,3)
INSERT [dbo].[Courses] ([CourseID], [CourseName], [PrerequiteCourseID],CreditHours) VALUES (40, N'Basic Electronics', NULL,3)
go

go
Create table Instructors 
(
InstructorID int Primary key,
Name varchar(30),
Department varchar(7) ,
)
GO
INSERT [dbo].[Instructors] ([InstructorID], [Name], [Department]) VALUES (100, N'Ishaq Raza', N'CS')
INSERT [dbo].[Instructors] ([InstructorID], [Name], [Department]) VALUES (200, N'Zareen Alamgir', N'CS')
INSERT [dbo].[Instructors] ([InstructorID], [Name], [Department]) VALUES (300, N'Saima Zafar', N'EE')
go
Create table Semester
(
Semester varchar(15) Primary key,
[Status] varchar(10),
)
GO
INSERT [dbo].[Semester] ([Semester], [Status]) VALUES (N'Fall2016', N'Complete')
INSERT [dbo].[Semester] ([Semester], [Status]) VALUES (N'Spring2016', N'Complete')
INSERT [dbo].[Semester] ([Semester], [Status]) VALUES (N'Spring2017', N'InProgress')
INSERT [dbo].[Semester] ([Semester], [Status]) VALUES (N'Summer2016', N'Cancelled')
go
Create table Courses_Semester
(
InstructorID int Foreign key References Instructors(InstructorID),
CourseID int Foreign key References Courses(CourseID),
Semester varchar(15) Foreign key References Semester(Semester), 
Section varchar(1) ,
AvailableSeats int,
Department varchar(2)
)
GO
INSERT [dbo].[Courses_Semester] ([InstructorID], [CourseID], [Semester], [Section], [AvailableSeats], [Department]) VALUES (200, 10, N'Spring2017', N'D', 45, N'CS')
INSERT [dbo].[Courses_Semester] ([InstructorID], [CourseID], [Semester], [Section], [AvailableSeats], [Department]) VALUES (200, 10, N'Spring2017', N'C', 0, N'CS')
INSERT [dbo].[Courses_Semester] ([InstructorID], [CourseID], [Semester], [Section], [AvailableSeats], [Department]) VALUES (100, 10, N'Spring2017', N'A', 6, N'CS')
INSERT [dbo].[Courses_Semester] ([InstructorID], [CourseID], [Semester], [Section], [AvailableSeats], [Department]) VALUES (300, 40, N'Spring2017', N'A', 6, N'CS')
INSERT [dbo].[Courses_Semester] ([InstructorID], [CourseID], [Semester], [Section], [AvailableSeats], [Department]) VALUES (300, 40, N'Spring2016', N'A', 6, N'CS')
INSERT [dbo].[Courses_Semester] ([InstructorID], [CourseID], [Semester], [Section], [AvailableSeats], [Department]) VALUES (200, 10, N'Spring2016', N'A', 0, N'CS')

go



create table Registration
(
Semester varchar(15) Foreign key References Semester(Semester),
RollNumber  varchar(7) Foreign key References Students(RollNo),
CourseID int Foreign key References Courses(CourseID), 
Section varchar(1),
GPA float
)
INSERT [dbo].[Registration] ([Semester], [RollNumber], [CourseID], [Section],GPA) VALUES (N'Fall2016', N'1', 20, N'A', 3.3)
INSERT [dbo].[Registration] ([Semester], [RollNumber], [CourseID], [Section],GPA) VALUES (N'Fall2016', N'2', 20, N'B', 4)
INSERT [dbo].[Registration] ([Semester], [RollNumber], [CourseID], [Section],GPA) VALUES (N'Spring2016', N'1', 30, N'A', 1.0)
INSERT [dbo].[Registration] ([Semester], [RollNumber], [CourseID], [Section],GPA) VALUES (N'Fall2016', N'6', 40, N'D',0.0)
INSERT [dbo].[Registration] ([Semester], [RollNumber], [CourseID], [Section],GPA) VALUES (N'Spring2017', N'6', 40, N'D',1)


go

Create table ChallanForm
(Semester varchar(15) Foreign key References Semester(Semester),
RollNumber  varchar(7) Foreign key References Students(RollNo),
TotalDues int,
[Status] varchar(10)
)
GO
INSERT [dbo].[ChallanForm] ([Semester], [RollNumber], [TotalDues], [Status]) VALUES (N'Fall2016', N'1', 100000, N'Paid')
INSERT [dbo].[ChallanForm] ([Semester], [RollNumber], [TotalDues], [Status]) VALUES (N'Fall2016', N'2', 13333, N'Paid')
INSERT [dbo].[ChallanForm] ([Semester], [RollNumber], [TotalDues], [Status]) VALUES (N'Fall2016', N'3', 5000, N'Paid')
INSERT [dbo].[ChallanForm] ([Semester], [RollNumber], [TotalDues], [Status]) VALUES (N'Fall2016', N'4', 20000, N'Pending')


select * from Students
select * from Courses
select * from Instructors
select * from Registration
select * from Semester
select * from Courses_Semester
select * from ChallanForm





-- Functionality 1: Prevent Deleting Students
CREATE TRIGGER Part1
ON Students
INSTEAD OF DELETE
AS
BEGIN
    PRINT 'You are not allowed to delete students.'
    ROLLBACK TRANSACTION
END

-- Functionality 2: Prevent Inserting New Courses
CREATE TRIGGER Part2
ON Courses
INSTEAD OF INSERT
AS
BEGIN
    PRINT 'You are not allowed to add new courses.'
    ROLLBACK TRANSACTION
END

-- Functionality 3: Notify Students about Course Registration
CREATE TABLE Notify (
    NotificationID INT IDENTITY(1,1) PRIMARY KEY,
    StudentID VARCHAR(7) FOREIGN KEY REFERENCES Students(RollNo),
    Notification VARCHAR(200)
)

CREATE TRIGGER Part3
ON Registration
AFTER INSERT
AS
BEGIN
    DECLARE @RollNumber VARCHAR(7), @CourseID INT, @Semester VARCHAR(15), @Section VARCHAR(1)
    SELECT @RollNumber = RollNumber, @CourseID = CourseID, @Semester = Semester, @Section = Section
    FROM inserted

    DECLARE @PrerequisiteCourseID INT, @AvailableSeats INT
    SELECT @PrerequisiteCourseID = PrerequiteCourseID, @AvailableSeats = AvailableSeats
    FROM Courses_Semester
    WHERE CourseID = @CourseID AND Semester = @Semester AND Section = @Section

    IF EXISTS (SELECT 1 FROM Registration WHERE RollNumber = @RollNumber AND CourseID = @PrerequisiteCourseID AND Semester = @Semester)
        AND @AvailableSeats > 0
    BEGIN
        INSERT INTO Notify (StudentID, Notification)
        VALUES (@RollNumber, 'Your registration was successful.')
    END
    ELSE
    BEGIN
        INSERT INTO Notify (StudentID, Notification)
        VALUES (@RollNumber, 'Your registration was unsuccessful. Please check the prerequisites and available seats.')
    END
END

-- Functionality 4: Prevent Enrollment with Outstanding Fees
CREATE TRIGGER Part4
ON Registration
INSTEAD OF INSERT
AS
BEGIN
    DECLARE @RollNumber VARCHAR(7), @CourseID INT, @Semester VARCHAR(15)
    SELECT @RollNumber = RollNumber, @CourseID = CourseID, @Semester = Semester
    FROM inserted

    DECLARE @TotalDues INT
    SELECT @TotalDues = TotalDues
    FROM ChallanForm
    WHERE RollNumber = @RollNumber AND Semester = @Semester

    IF @TotalDues > 20000
    BEGIN
        PRINT 'Student cannot be enrolled due to outstanding fees.'
        ROLLBACK TRANSACTION
    END
    ELSE
    BEGIN
        INSERT INTO Registration (Semester, RollNumber, CourseID, Section, GPA)
        SELECT Semester, RollNumber, CourseID, Section, GPA
        FROM inserted
    END
END

-- Functionality 5: Prevent Deleting Courses with Low Seats
CREATE TRIGGER Part5
ON Courses_Semester
INSTEAD OF DELETE
AS
BEGIN
    DECLARE @InstructorID INT, @CourseID INT, @Semester VARCHAR(15), @Section VARCHAR(1), @AvailableSeats INT
    SELECT @InstructorID = InstructorID, @CourseID = CourseID, @Semester = Semester, @Section = Section, @AvailableSeats = AvailableSeats
    FROM deleted

    IF @AvailableSeats < 10
    BEGIN
        PRINT 'Cannot delete this course semester as the available seats are less than 10.'
        ROLLBACK TRANSACTION
    END
    ELSE
    BEGIN
        DELETE FROM Courses_Semester
        WHERE InstructorID = @InstructorID AND CourseID = @CourseID AND Semester = @Semester AND Section = @Section
        PRINT 'Course semester deleted successfully.'
    END
END

-- Functionality 6: Prevent Modifying the Instructors Table
CREATE TRIGGER Part6
ON Instructors
INSTEAD OF INSERT, UPDATE, DELETE
AS
BEGIN
    PRINT 'You are not allowed to modify the Instructors table.'
    ROLLBACK TRANSACTION
END

-- Testing the Functionalities
-- Functionality 1: Prevent Deleting Students
DELETE FROM Students WHERE RollNo = '1';

-- Functionality 2: Prevent Inserting New Courses
INSERT INTO Courses (CourseID, CourseName, PrerequiteCourseID, CreditHours)
VALUES (50, 'Machine Learning', 20, 3);

-- Functionality 3: Notify Students about Course Registration
INSERT INTO Registration (Semester, RollNumber, CourseID, Section, GPA)
VALUES ('Spring2017', '1', 10, 'A', 3.5);
SELECT * FROM Notify;

-- Functionality 4: Prevent Enrollment with Outstanding Fees
INSERT INTO Registration (Semester, RollNumber, CourseID, Section, GPA)
VALUES ('Spring2017', '4', 10, 'A', 3.5);

-- Functionality 5: Prevent Deleting Courses with Low Seats
DELETE FROM Courses_Semester
WHERE InstructorID = 100 AND CourseID = 10 AND Semester = 'Spring2017' AND Section = 'A';

DELETE FROM Courses_Semester
WHERE InstructorID = 200 AND CourseID = 10 AND Semester = 'Spring2017' AND Section = 'D';

-- Functionality 6: Prevent Modifying the Instructors Table
INSERT INTO Instructors (InstructorID, Name, Department)
VALUES (400, 'John Doe', 'CS');

UPDATE Instructors
SET Name = 'Jane Doe'
WHERE InstructorID = 100;

DELETE FROM Instructors
WHERE InstructorID = 100;