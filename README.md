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

## PracticeTasks 1 :



