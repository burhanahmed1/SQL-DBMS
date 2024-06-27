Create database University;

use University

-- Creating tables
CREATE TABLE Students (
id INT PRIMARY KEY Identity(1,1),
name varchar(255)  NOT NULL,
department varchar(255) NOT NULL,
age INT NOT NULL
);
CREATE TABLE Courses (
id INT PRIMARY KEY Identity(1,1),
title varchar(255) NOT NULL,
department varchar(255) NOT NULL
);
CREATE TABLE Enrollments (
student_id INT,
course_id INT,
FOREIGN KEY(student_id) REFERENCES Students(id),
FOREIGN KEY(course_id) REFERENCES Courses(id)
);
-- Inserting records
INSERT INTO Students (name, department, age) VALUES
('Alice', 'Math', 25),
('Bob', 'Science', 28),
('Joye', 'Science', 28),
('Carol', 'English', 26),
('Dave', 'History', 30),
('Emily', 'Music', 29),
('Frank', 'Art', 27);
INSERT INTO Courses (title, department) VALUES
('Advanced Math', 'Math'),
('Science Lab', 'Science'),

('English Poetry', 'English'),
('World History', 'History'),
('Music Theory', 'Music'),
('Art Appreciation', 'Art'),
('Basic Math', 'Math');
INSERT INTO Enrollments (student_id, course_id) VALUES
(1, 1), (1, 2),
(2, 1), (2, 2), (2, 3),
(3, 3), (3, 4),
(4, 4), (4, 5),
(5, 5),
(6, 6);
SELECT * FROM Students;
SELECT * FROM Courses;
SELECT * FROM Enrollments;

--Q1 name of oldest student in each department who has not enrolled in any course.
select name,department,age
from Students
where age in 
          (select max(age)
           from Students
           where id not in (select student_id
                            from Enrollments));

--Q2 names of students who have taken all courses offered in their department.
select s.name
from Students s
where (select count(distinct c.id)
       from Courses c
	   where s.department=c.department)=(select count(distinct e.course_id)
	                                     from Enrollments e
										 where s.id=e.student_id);
--Q3 courses where the average age of enrolled students is greater than the overall average age of all students.
select title
from Courses c
join Enrollments e on c.id = e.course_id
join Students s on e.student_id =s.id
group by title
Having Avg(age) > (select avg(age)
				from Students)

--Q4 names of students who have the same age as at least one other student in the same department, but different names.
select s1.name,s1.age
from Students s1
join Students s2 on s1.age = s2.age And s1.department = s2.department
where s1.name<>s2.name

--Q5 courses with the highest and lowest enrollment rate (number of enrolled students divided by the total number of students in the department).
WITH EnrollmentCounts AS (
    SELECT c.id AS course_id,
           COUNT(e.student_id) AS num_enrolled,
           COUNT(s.id) AS total_students
    FROM Courses c
    LEFT JOIN Enrollments e ON c.id = e.course_id
    LEFT JOIN Students s ON e.student_id = s.id
    GROUP BY c.id
)
SELECT cr.title AS course_title,
       cr.department AS course_department,
       ec.num_enrolled AS num_enrolled_students,
       ec.total_students AS total_students_in_department,
       CAST(ec.num_enrolled AS FLOAT) / ec.total_students AS enrollment_rate
FROM EnrollmentCounts ec
JOIN Courses cr ON ec.course_id = cr.id
WHERE ec.num_enrolled = (
    SELECT MAX(num_enrolled)
    FROM EnrollmentCounts
);

WITH EnrollmentCounts AS (
    SELECT c.id AS course_id,
           COUNT(e.student_id) AS num_enrolled,
           COUNT(s.id) AS total_students
    FROM Courses c
    LEFT JOIN Enrollments e ON c.id = e.course_id
    LEFT JOIN Students s ON e.student_id = s.id
    GROUP BY c.id
)
SELECT cr.title AS course_title,
       cr.department AS course_department,
       ec.num_enrolled AS num_enrolled_students,
       ec.total_students AS total_students_in_department,
       CAST(ec.num_enrolled AS FLOAT) / ec.total_students AS enrollment_rate
FROM EnrollmentCounts ec
JOIN Courses cr ON ec.course_id = cr.id
WHERE ec.num_enrolled = (
    SELECT MIN(num_enrolled)
    FROM EnrollmentCounts
);



--Q6 Find the department(s) with the highest number of courses
WITH CourseCounts AS (
SELECT department, COUNT(*) AS num_courses
FROM Courses
GROUP BY department
)
SELECT department
FROM CourseCounts
WHERE num_courses = (SELECT MAX(num_courses) FROM CourseCounts);


