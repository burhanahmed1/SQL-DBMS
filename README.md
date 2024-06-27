# SQL-DBMS

# Tasks Description 

## PracticeTasks 1 :
1. create all the tables and add all the rows. (format for date: mm-dd-yy e.g,‘02-22-2017’)
2. Identify one PK from each table and add the constraints using alter.
3. Identify all the FK constraints (there are composite fk too), and add those constraints, such that:
>  - If the Student table or ClassVenue Table or Teacher table is updated the referencing columns should also reflect the changes.
>  -  Students should not be deleted if the details of that order are present.
4. Alter table Student by adding new column “warning count” and deleting “Phone” Column

## PracticeTasks 2 :
+ Insert the data into the tables
+
  - Alter table teacher and add unique constraint on column “Name”.
  - Alter Student table and Check Female and Male gender.
  -  Alter Attendance table and check A and P status.
+ Perform the following DML actions on your database, identify whether these operations are valid or not, and also state how we can make the invalid queries valid?
(Your answers should be written in comments along with your queries).
  - Add new row into Student table, values <L192334, Shahid Iqbal, Male,3.2>
  - Add new row into ClassVenue table, values <3, CS, 5, Ali,4>
  - Update Teacher table Change “Sana Fatima” name to “Dr. Sana Fatima”.
  -  Delete Student with rollnum “L192334”
  - Delete Student with rollnum “L194125”
  - Delete Attendance with rollnum “L194124”, if his status is absent.

## PracticeTasks 3 :
1. List all names of the users from Lahore in Descending Order.
2. List all cards, who have card type “Credit” in ascending order.
3. List the name of all the users who are Gold type.
4. List the names of the user who’s Card number ends with 6. (HINT: USE LIKE)
5. List the Cities of the users who have a balance between 20000 and 35000.
6. List the Users who have never used the Card for transaction.
7. List the Card numbers that will expire in 2020.
8. List the names of the users who’s transaction had failed.
9. List all the card numbers with owner names and scheduled transactions, in case the user has never used scheduled transactions show null or zero in the transaction column. (Hint use ISNULL function)
10. List all usernames and phone numbers, who’s card number expiry date is less than 2-2-2019.
11. List all users IDs , Name and card numbers who have committed transactions today.
12. List all the users and their card name using union
13. List all the users and their card name using Intersection

## PracticeTasks 4 :
### Join
1. List the names of the users who are from the same city. (Use Self Join) Aggregation-Grouping
2. List the number of users in each city, sorted high to low.
3. List the Card numbers and number of transactions against each card number having more than two Transactions. 

### Like operators
4. List all the user having name at least 3 character long.
5. List all the user whose name start with H and end with z and user type gold
6. List all the user having character a in their name.

### Set Operations
7. List the userId and name of the users whose cards are not expired.
8. List the Users details who are gold type and common type. (Without using AND operator and join)

### Outer Join task
9. List the Users who have never used the Card for transaction.
10. List all users along with their corresponding card numbers and transaction amounts. If a user does not have a card or has never made a transaction, show NULL values for the card number and transaction amount.

## PracticeTasks 5 :
Practice Queries for sql.

## PracticeTasks 6 :
1. What is the maximum, minimum, average and standard deviation of the ages of the users? (Search Standard Dev function)
2. Give the name of the user who has the highest number of followers.
3. Give name of the user who has second highest followers.
4. List names of all the users who have never tweeted.
5. List all the hashtags and usernames and number of times that user used that hashtag.
6. Find the users who have never used the hashtag #Census.
7. List all the usernames that have never been followed. Using Set operation
8. List all the usernames that have never been followed. Using Exist Clause.
9. Find the most common interest of users. (The interest with the largest number of users). Also find the least common interest.
10. Show total tweets per country. The result should be in order of country name.
11. List names of all the users whose number of tweets is more than the average number of tweets per user.
12. Give the name of the users who have at least one follower from Pakistan.
13. Show the interest ID and description of interest with the most number of users.

## PracticeTasks 7 :
1. Find the name of the oldest student in each department who has not enrolled in any course.
2. List the names of students who have taken all courses offered in their department.
3. Find the courses where the average age of enrolled students is greater than the overall average age of all students.
4. List the names of students who have the same age as at least one other student in the same department, but different names.
5. Find the courses with the highest and lowest enrollment rate (number of enrolled students divided by the total number of students in the department).
6. Find the department(s) with the highest number of courses
   
## PracticeTasks 8 :
1. Create a trigger which don’t allow you to delete any student from student Table.  Print message “You don’t have the permission to delete the student”
2. Create a trigger which don’t allow you to insert any course in Courses Table.  Print message “You don’t have the permission to Insert a new Course” 
3. Create a new table, ‘Notify’ that should notify students about any important events. The table has three columns, NotifictionID, StudentID and Notification String. Create a Trigger to notify student if his registration in the course is successful. Also inform user if registration is not successful. For successful registration the student must have passed the prerequisite and number of seats are available. 
4. According to university rules, Students before enrolling in new course should have no fee charges due. Create a trigger to ensure that no student is enrolled in new course with more than 20,000 fee charges due. 
5. Create a trigger that do not let you delete any course semester whose available seats are less than 10. Print ‘not possible’.  Otherwise prints ‘Successfully deleted’, after you delete any course semester whose available seats are 10 or more. 
6. Create a trigger to stop Instructors table, from being modified or dropped.


## PracticeTasks 1 :

## PracticeTasks 1 :

## PracticeTasks 1 :

## PracticeTasks 1 :

## PracticeTasks 1 :

## PracticeTasks 1 :

## PracticeTasks 1 :

## PracticeTasks 1 :

## PracticeTasks 1 :

## PracticeTasks 1 :

## PracticeTasks 1 :

## PracticeTasks 1 :



