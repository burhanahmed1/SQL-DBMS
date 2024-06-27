use master
go
drop  database ATM
go 
Create database ATM
go 
use ATM;
go
create Table UserType(
userTypeID int primary key,
[name] varchar(20) not null
)
go
create table [User](
[userId] int primary key,
[name] varchar(20) not null,
[userType] int foreign key references UserType(UserTypeID),
[phoneNum] varchar(15) not null,
[city] varchar(20) not null
)
go

create table CardType(
[cardTypeID] int primary key,
[name] varchar(15),
[description] varchar(40) null
)
go
create Table [Card](
cardNum Varchar(20) primary key,
cardTypeID int foreign key references  CardType([cardTypeID]),
PIN varchar(4) not null,
[expireDate] date not null,
balance float not null
)
go


Create table UserCard(
userID int foreign key references [User]([userId]),
cardNum varchar(20) foreign key references [Card](cardNum),
primary key(userID,cardNum)
)
go
create table TransactionType(
transTypeID int primary key,
typeName varchar(20) not null,
[description] varchar (40) null
)
go
create table [Transaction](
transId int primary key,
transDate date not null,
cardNum varchar(20) foreign key references [Card](cardNum),
amount int not null,
transType int foreign key references TransactionType(transTypeID)
)




GO
INSERT [dbo].[UserType] ([userTypeID], [name]) VALUES (1, N'Silver')
GO
INSERT [dbo].[UserType] ([userTypeID], [name]) VALUES (2, N'Gold')
GO
INSERT [dbo].[UserType] ([userTypeID], [name]) VALUES (3, N'Bronze')
GO
INSERT [dbo].[UserType] ([userTypeID], [name]) VALUES (4, N'Common')
GO
INSERT [dbo].[User] ([userId], [name], [userType], [phoneNum], [city]) VALUES (1, N'Ali', 2, N'03036067000', N'Narowal')
GO
INSERT [dbo].[User] ([userId], [name], [userType], [phoneNum], [city]) VALUES (2, N'Ahmed', 1, N'03036047000', N'Lahore')
GO
INSERT [dbo].[User] ([userId], [name], [userType], [phoneNum], [city]) VALUES (3, N'Aqeel', 3, N'03036063000', N'Karachi')
GO
INSERT [dbo].[User] ([userId], [name], [userType], [phoneNum], [city]) VALUES (4, N'Usman', 4, N'03036062000', N'Sialkot')
GO
INSERT [dbo].[User] ([userId], [name], [userType], [phoneNum], [city]) VALUES (5, N'Hafeez', 2, N'03036061000', N'Lahore')
GO
INSERT [dbo].[CardType] ([cardTypeID], [name], [description]) VALUES (1, N'Debit', N'Spend Now, Pay Now')
GO
INSERT [dbo].[CardType] ([cardTypeID], [name], [description]) VALUES (2, N'Credit', N'Spend Now, Pay later')
GO
INSERT [dbo].[CardType] ([cardTypeID], [name], [description]) VALUES (3, N'Gift', N'Enjoy')
GO
INSERT [dbo].[Card] ([cardNum], [cardTypeID], [PIN], [expireDate], [balance]) VALUES (N'1324327436569', 3, N'1770', CAST(N'2022-07-01' AS Date), 43025.31)
GO
INSERT [dbo].[Card] ([cardNum], [cardTypeID], [PIN], [expireDate], [balance]) VALUES (N'2324325423336', 3, N'0234', CAST(N'2020-03-02' AS Date), 14425.62)
GO
INSERT [dbo].[Card] ([cardNum], [cardTypeID], [PIN], [expireDate], [balance]) VALUES (N'2324325436566', 1, N'1234', CAST(N'2019-02-06' AS Date), 34325.52)
GO
INSERT [dbo].[Card] ([cardNum], [cardTypeID], [PIN], [expireDate], [balance]) VALUES (N'2324325666456', 2, N'1200', CAST(N'2021-02-05' AS Date), 24325.3)
GO
INSERT [dbo].[Card] ([cardNum], [cardTypeID], [PIN], [expireDate], [balance]) VALUES (N'2343243253436', 2, N'0034', CAST(N'2020-09-02' AS Date), 34025.12)
GO
INSERT [dbo].[UserCard] ([userID], [cardNum]) VALUES (1, N'1324327436569')
GO
INSERT [dbo].[UserCard] ([userID], [cardNum]) VALUES (1, N'2343243253436')
GO
INSERT [dbo].[UserCard] ([userID], [cardNum]) VALUES (2, N'2324325423336')
GO
INSERT [dbo].[UserCard] ([userID], [cardNum]) VALUES (2, N'2343243253436')
GO
INSERT [dbo].[UserCard] ([userID], [cardNum]) VALUES (3, N'2324325436566')
GO
INSERT [dbo].[UserCard] ([userID], [cardNum]) VALUES (5, N'2324325423336')
GO
INSERT [dbo].[TransactionType] ([transTypeID], [typeName], [description]) VALUES (1, N'Withdraw', NULL)
GO
INSERT [dbo].[TransactionType] ([transTypeID], [typeName], [description]) VALUES (2, N'Deposit', NULL)
GO
INSERT [dbo].[TransactionType] ([transTypeID], [typeName], [description]) VALUES (3, N'ScheduledDeposit', NULL)
GO
INSERT [dbo].[TransactionType] ([transTypeID], [typeName], [description]) VALUES (4, N'Failed', NULL)
GO
INSERT [dbo].[Transaction] ([transId], [transDate], [cardNum], [amount], [transType]) VALUES (1, CAST(N'2017-02-02' AS Date), N'1324327436569', 500, 1)
GO
INSERT [dbo].[Transaction] ([transId], [transDate], [cardNum], [amount], [transType]) VALUES (2, CAST(N'2018-02-03' AS Date), N'2343243253436', 3000, 3)
GO
INSERT [dbo].[Transaction] ([transId], [transDate], [cardNum], [amount], [transType]) VALUES (3, CAST(N'2017-05-06' AS Date), N'2324325436566', 2500, 2)
GO
INSERT [dbo].[Transaction] ([transId], [transDate], [cardNum], [amount], [transType]) VALUES (4, CAST(N'2016-09-09' AS Date), N'2324325436566', 2000, 1)
GO
INSERT [dbo].[Transaction] ([transId], [transDate], [cardNum], [amount], [transType]) VALUES (5, CAST(N'2015-02-10' AS Date), N'2324325423336', 6000, 4)
GO


Select * from UserType
Select * from [User]
Select * from UserCard
Select * from [Card]
Select * from CardType
Select * from [Transaction]
Select * from TransactionType
go


--Q1
SELECT name
FROM [User]
WHERE city = 'Lahore'
ORDER BY name DESC;

--Q2
SELECT * 
from [Card] c
INNER Join CardType ct on c.cardTypeID=ct.cardTypeID
where ct.[name]='Credit'
order by name;

--Q3
select u.* 
from [User] u
inner join UserType ut on u.userType=ut.userTypeID
where ut.[name]='Gold';

--Q4
select name
from [User] u
inner join UserCard uc on u.userId=uc.userID
where uc.cardNum like '%6';

--Q5
select city
from [User] u
inner join UserCard uc on u.userId=uc.userID
inner join [Card] c on uc.cardNum=c.cardNum
where c.balance between 20000 and 35000;

--Q6
select u.*
from [User] u
inner join UserCard uc on u.userId=uc.userID
inner join [Transaction] t on uc.cardNum=t.cardNum
where t.transId is null;

--Q7
select cardNum
from [Card]
where [expireDate] like '2020-__-__';

--Q8
select name
from [User] u
inner join UserCard uc on u.userId=uc.userID
inner join [Transaction] t on uc.cardNum=t.cardNum
inner join TransactionType tt on t.transType=tt.transTypeID
where tt.typeName='Failed';

--Q9
SELECT c.cardNum, u.name AS ownerName, ISNULL(t.amount, 0) AS [transaction]
FROM [Card] c
JOIN UserCard uc ON c.cardNum = uc.cardNum
JOIN [User] u ON uc.userId = u.userId
LEFT JOIN [Transaction] t ON c.cardNum = t.cardNum AND t.transType = 3;

--Q10
select u.name, u.phoneNum
from [User] u
inner join UserCard uc on u.userId=uc.userID
inner join [Card] c on uc.cardNum=c.cardNum
where c.expireDate > '2019-02-02';

--Q11
SELECT u.userId, u.name, c.cardNum
FROM [User] u
JOIN UserCard uc ON u.userId = uc.userId
JOIN [Card] c ON uc.cardNum = c.cardNum
JOIN [Transaction] t ON c.cardNum = t.cardNum
--WHERE t.transDate=CURRENT_DATE();

--Q12
SELECT u.name AS UserName, ct.name AS CardName
FROM [User] u
JOIN UserCard uc ON u.userId = uc.userId
JOIN [Card] c ON uc.cardNum = c.cardNum
Join CardType ct on c.cardTypeID=ct.cardTypeID
UNION
SELECT u.name AS UserName, 'No Card' AS CardName
FROM [User] u
LEFT JOIN UserCard uc ON u.userId = uc.userId
WHERE uc.userId IS NULL;

--Q13
SELECT u.name AS UserName, ct.name AS CardName
FROM [User] u
INNER JOIN UserCard uc ON u.userId = uc.userId
INNER JOIN [Card] c ON uc.cardNum = c.cardNum
Join CardType ct on c.cardTypeID=ct.cardTypeID

INTERSECT

SELECT u.name AS UserName, ct.name AS CardName
FROM [User] u
INNER JOIN UserCard uc ON u.userId = uc.userId
INNER JOIN [Card] c ON uc.cardNum = c.cardNum
Inner Join CardType ct on c.cardTypeID=ct.cardTypeID
