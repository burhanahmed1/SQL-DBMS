CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    date_of_birth DATE
);

CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    instructor VARCHAR(100)
);

CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

INSERT INTO Students (student_id, first_name, last_name, date_of_birth)
VALUES
    (1, 'John', 'Doe', '1995-05-15'),
    (2, 'Jane', 'Smith', '1998-09-20'),
    (3, 'Alice', 'Johnson', '1997-03-13'),
    (4, 'Ella', 'Johnson', '1996-07-12'),
    (5, 'Liam', 'Brown', '1999-02-25'),
    (6, 'Ava', 'Miller', '1998-11-18'),
    (7, 'Noah', 'Garcia', '1997-09-03'),
    (8, 'Olivia', 'Martinez', '1996-04-29'),
    (9, 'Emma', 'Lopez', '1998-06-21'),
    (10, 'William', 'Davis', '1997-03-14'),
    (11, 'Sophia', 'Rodriguez', '1999-08-05'),
    (12, 'James', 'Hernandez', '1995-12-08'),
    (13, 'Charlotte', 'Young', '1996-10-17'),
    (14, 'Benjamin', 'Lee', '1998-05-20'),
    (15, 'Amelia', 'Walker', '1997-01-23');

INSERT INTO Courses (course_id, course_name, instructor)
VALUES
    (101, 'Introduction to Database', 'Professor Smith'),
    (102, 'Web Development Basics', 'Professor Johnson'),
    (103, 'Data Analysis Techniques', 'Professor Brown'),
    (104, 'Advanced Database Management', 'Professor Johnson'),
    (105, 'Data Mining Techniques', 'Professor Lee'),
    (106, 'Web Application Development', 'Professor Martinez'),
    (107, 'Software Engineering Principles', 'Professor Davis'),
    (108, 'Network Security Fundamentals', 'Professor Rodriguez'),
    (109, 'Artificial Intelligence Fundamentals', 'Professor Hernandez'),
    (110, 'Database Design and Optimization', 'Professor Young'),
    (111, 'Mobile App Development', 'Professor Walker'),
    (112, 'Cloud Computing Technologies', 'Professor Moore'),
    (113, 'Human-Computer Interaction', 'Professor Turner'),
    (114, 'Business Analytics', 'Professor Perez'),
    (115, 'Computer Graphics and Visualization', 'Professor Foster');


INSERT INTO Enrollments (enrollment_id, student_id, course_id, enrollment_date)
VALUES
    (1, 1, 101, '2023-01-15'),
    (2, 1, 102, '2023-02-20'),
    (3, 2, 101, '2023-01-15'),
    (4, 3, 103, '2023-03-05'),
    (5, 4, 104, '2023-02-10'),
    (6, 5, 105, '2023-03-15'),
    (7, 6, 106, '2023-01-22'),
    (8, 7, 107, '2023-04-05'),
    (9, 8, 108, '2023-02-28'),
    (10, 10, 109, '2023-01-10'),
    (11, 10, 110, '2023-03-18'),
    (12, 11, 112, '2023-02-08'),
    (13, 12, 112, '2023-03-02'),
    (14, 13, 113, '2023-04-12'),
    (15, 14, 114, '2023-01-29'),
    (16, 15, 115, '2023-03-21');

	select * from students;
	select * from Courses;
	select * from enrollments;


	--1
create view studentlist as
select 
    student_id,
    concat(first_name, ' ', last_name) as full_name,
    date_of_birth
from 
    students;

--2
select 
    student_id,
    full_name,
    date_of_birth
from 
    studentlist
order by 
    student_id
limit 5;

--3
create view studentlist2 as
select 
    student_id,
    concat(first_name, ' ', last_name) as full_name,
    date_of_birth,
    datediff(year, date_of_birth, getdate()) - 
        case 
            when dateadd(year, datediff(year, date_of_birth, getdate()), date_of_birth) > getdate() 
            then 1 
            else 0 
        end as age
from 
    students;

--4
create view courseenrollments as
select 
    c.course_id,
    c.course_name,
    c.instructor,
    count(e.student_id) as num_students_enrolled
from 
    courses c
left join 
    enrollments e on c.course_id = e.course_id
group by 
    c.course_id, c.course_name, c.instructor;

--5
select top 1 
    course_id,
    course_name,
    instructor,
    num_students_enrolled
from 
    courseenrollments
order by 
    num_students_enrolled desc;

--6
create or alter view courseenrollments as
select 
    c.course_id,
    c.course_name,
    c.instructor,
    count(e.student_id) as num_students_enrolled
from 
    courses c
left join 
    enrollments e on c.course_id = e.course_id
group by 
    c.course_id, c.course_name, c.instructor;

--7
with mostenrolledcourse as (
    select top 1
        ce.course_id,
        ce.course_name,
        ce.instructor
    from
        courseenrollments ce
    order by
        ce.num_students_enrolled desc
)
select
    mec.course_name as most_enrolled_course,
    mec.instructor as instructor,
    sl.full_name as student_name
from
    mostenrolledcourse mec
join
    enrollments e on mec.course_id = e.course_id
join
    studentlist sl on e.student_id = sl.student_id;

--8
drop view if exists studentlist;
drop view if exists courseenrollments;

--9
create view studentcoursecount as
select 
    concat(first_name, ' ', last_name) as full_name,
    count(*) as course_count
from 
    students s
join 
    enrollments e on s.student_id = e.student_id
group by 
    s.student_id, s.first_name, s.last_name;

--10
with rankedstudents as (
    select 
        full_name,
        course_count,
        rank() over (order by course_count desc) as rank
    from 
        studentcoursecount
)
select 
    full_name,
    course_count
from 
    rankedstudents
where 
    rank = 1;

--11
create view instructorcoursecount as
select 
    instructor,
    count(*) as course_count
from 
    courses
group by 
    instructor;

--12
select instructor, course_count
from instructorcoursecount
where course_count = (
    select max(course_count)
    from instructorcoursecount
);

--13
create view studentenrollments as
select 
    concat(s.first_name, ' ', s.last_name) as full_name,
    string_agg(c.course_name, ', ') as enrolled_courses
from 
    students s
join 
    enrollments e on s.student_id = e.student_id
join 
    courses c on e.course_id = c.course_id
group by 
    s.student_id, s.first_name, s.last_name;

--14
with mostenrolledstudent as (
    select top 1
        full_name
    from
        studentcoursecount
    order by
        course_count desc
),
instructorsformostenrolledcourses as (
    select 
        mec.full_name as most_enrolled_student,
        se.enrolled_courses,
        icc.instructor
    from 
        mostenrolledstudent mec
    join 
        studentenrollments se on mec.full_name = se.full_name
    join 
        courses c on se.enrolled_courses like '%' + c.course_name + '%'
    join 
        instructorcoursecount icc on c.instructor = icc.instructor
)
select 
    most_enrolled_student as student,
    instructor as instructor,
    enrolled_courses as courses_taught
from 
    instructorsformostenrolledcourses;

--15
create view studentcourseinfo as
select 
    concat(s.first_name, ' ', s.last_name) as full_name,
    c.course_name,
    c.instructor
from 
    students s
join 
    enrollments e on s.student_id = e.student_id
join 
    courses c on e.course_id = c.course_id;





