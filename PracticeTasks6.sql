--22L-7520

create database Twitter;
use Twitter;

create table Users
(
User_ID int,
UserName varchar(20) primary key,
Age int,
Country varchar(20),
privacy int
)

go

INSERT [dbo].[users] (User_ID,[UserName], [Age], [Country],privacy) VALUES (1,N'Ali123', 18, N'Pakistan',1)
INSERT [dbo].[users] (User_ID,[UserName], [Age], [Country],privacy) VALUES (2,N'Aliza', 40, N'USA',1)
INSERT [dbo].[users] (User_ID,[UserName], [Age], [Country],privacy) VALUES (3,N'Aysha', 19, N'Iran',0)
INSERT [dbo].[users] (User_ID,[UserName], [Age], [Country],privacy) VALUES (4,N'DonaldTrump', 60, N'USA',0)
INSERT [dbo].[users] (User_ID,[UserName], [Age], [Country],privacy) VALUES (5,N'ImranKhan', 55, N'Pakistan',0)
INSERT [dbo].[users] (User_ID,[UserName], [Age], [Country],privacy) VALUES (6,N'Natasha', 28, N'USA',0)
INSERT [dbo].[users] (User_ID,[UserName], [Age], [Country],privacy) VALUES (7,N'Samuel', 37, N'Australia',0)
INSERT [dbo].[users] (User_ID,[UserName], [Age], [Country],privacy) VALUES (8,N'Sara', 30, N'Iran',1)



go

create table Following
(
FollowerUserName varchar(20) Foreign key References Users(UserName) ,
FollowedUserName varchar(20) Foreign key References Users(UserName),
primary key (FollowerUserName, FollowedUserName)
)

go

INSERT [dbo].[Following] ([FollowerUserName], [FollowedUserName]) VALUES (N'Ali123', N'DonaldTrump')
INSERT [dbo].[Following] ([FollowerUserName], [FollowedUserName]) VALUES (N'Aliza', N'Ali123')
INSERT [dbo].[Following] ([FollowerUserName], [FollowedUserName]) VALUES (N'Aliza', N'DonaldTrump')
INSERT [dbo].[Following] ([FollowerUserName], [FollowedUserName]) VALUES (N'Aliza', N'ImranKhan')
INSERT [dbo].[Following] ([FollowerUserName], [FollowedUserName]) VALUES (N'Aysha', N'ImranKhan')
INSERT [dbo].[Following] ([FollowerUserName], [FollowedUserName]) VALUES (N'DonaldTrump', N'ImranKhan')
INSERT [dbo].[Following] ([FollowerUserName], [FollowedUserName]) VALUES (N'ImranKhan', N'DonaldTrump')
INSERT [dbo].[Following] ([FollowerUserName], [FollowedUserName]) VALUES (N'Natasha', N'ImranKhan')
INSERT [dbo].[Following] ([FollowerUserName], [FollowedUserName]) VALUES (N'Samuel', N'DonaldTrump')
INSERT [dbo].[Following] ([FollowerUserName], [FollowedUserName]) VALUES (N'Samuel', N'ImranKhan')
INSERT [dbo].[Following] ([FollowerUserName], [FollowedUserName]) VALUES (N'Sara', N'DonaldTrump')

go

Create table Tweets
(
TweetID int primary key,
UserName varchar(20) Foreign key References Users(UserName),
[Text] varchar(140)
)

go

INSERT [dbo].[Tweets] ([TweetID], [UserName], [Text]) VALUES (1, N'Ali123', N'Pakistan’s largest-ever population #Census  starts today in 63 districts after 19 years. ')
INSERT [dbo].[Tweets] ([TweetID], [UserName], [Text]) VALUES (2, N'ImranKhan', N'Pakistan’s largest-ever population #Census  starts today in 63 districts after 19 years. ')
INSERT [dbo].[Tweets] ([TweetID], [UserName], [Text]) VALUES (3, N'Sara', N'Take the soldier who come to our door for #Census as A ThankYou from Pakistan Army for our devotion. #CensusWithSupportOfArmy')
INSERT [dbo].[Tweets] ([TweetID], [UserName], [Text]) VALUES (4, N'ImranKhan', N'Pakistan is going to experience 6th #Census 2017.')
INSERT [dbo].[Tweets] ([TweetID], [UserName], [Text]) VALUES (5, N'Sara', N'Only #census can reveal where this aunty lives ')
INSERT [dbo].[Tweets] ([TweetID], [UserName], [Text]) VALUES (6, N'ImranKhan', N'Quand tu te lèves 3h en avance (littéralement) pour la #massecritique ')
INSERT [dbo].[Tweets] ([TweetID], [UserName], [Text]) VALUES (7, N'Sara', N'Over 1 million decrypted Gmail and Yahoo accounts allegedly up for sale on the Dark Web https://geekz0ne.fr/shaarli/?wQRSoQ  #piratage')
INSERT [dbo].[Tweets] ([TweetID], [UserName], [Text]) VALUES (8, N'Sara', N'Harry pot-head and the Sorcerer''s stoned')
INSERT [dbo].[Tweets] ([TweetID], [UserName], [Text]) VALUES (9, N'DonaldTrump', N'LSDespicable Me  #DrugMovies')
INSERT [dbo].[Tweets] ([TweetID], [UserName], [Text]) VALUES (10, N'ImranKhan', N'Forrest Bump #DrugMovies @midnight')
INSERT [dbo].[Tweets] ([TweetID], [UserName], [Text]) VALUES (12, N'DonaldTrump', N'Quand tu te lèves 3h en avance (littéralement) pour la #massecritique ')
INSERT [dbo].[Tweets] ([TweetID], [UserName], [Text]) VALUES (13, N'Sara', N'#DrugMovies')
INSERT [dbo].[Tweets] ([TweetID], [UserName], [Text]) VALUES (14, N'DonaldTrump', N'Quand tu te lèves 3h en avance (littéralement) pour la #massecritique ')
INSERT [dbo].[Tweets] ([TweetID], [UserName], [Text]) VALUES (15, N'Aliza', N'Quand tu te lèves 3h en avance (littéralement) pour la #massecritique ')

go

Create table Likes
(
TweetID int Foreign key References Tweets(TweetID),
LikeByUserName varchar(20) Foreign key References Users(UserName),
LikeOnDate date
primary key (TweetID ,LikeByUserName)
)

GO
INSERT [dbo].[Likes] ([TweetID], [LikeByUserName], [LikeOnDate]) VALUES (1, N'Aliza', CAST(0x693C0B00 AS Date))
INSERT [dbo].[Likes] ([TweetID], [LikeByUserName], [LikeOnDate]) VALUES (2, N'Aliza', CAST(0x693C0B00 AS Date))
go

Create table Interests
(
InterestID int primary key,
[Description] varchar(30)
)

GO
INSERT [dbo].[Interests] ([InterestID], [Description]) VALUES (10, N'Politics')
INSERT [dbo].[Interests] ([InterestID], [Description]) VALUES (11, N'Sports')
INSERT [dbo].[Interests] ([InterestID], [Description]) VALUES (12, N'Movies')
INSERT [dbo].[Interests] ([InterestID], [Description]) VALUES (13, N'Education')
INSERT [dbo].[Interests] ([InterestID], [Description]) VALUES (14, N'Video Games')

go

create table UserInterests
(UserName varchar(20)  Foreign key References Users(UserName),
InterestID int Foreign key References Interests(InterestID)
primary key (UserName, InterestID)
 )
 
 GO
INSERT [dbo].[UserInterests] ([UserName], [InterestID]) VALUES (N'Ali123', 10)
INSERT [dbo].[UserInterests] ([UserName], [InterestID]) VALUES (N'Ali123', 11)
INSERT [dbo].[UserInterests] ([UserName], [InterestID]) VALUES (N'Ali123', 13)
INSERT [dbo].[UserInterests] ([UserName], [InterestID]) VALUES (N'Ali123', 14)
INSERT [dbo].[UserInterests] ([UserName], [InterestID]) VALUES (N'Aliza', 10)
INSERT [dbo].[UserInterests] ([UserName], [InterestID]) VALUES (N'Aliza', 11)
INSERT [dbo].[UserInterests] ([UserName], [InterestID]) VALUES (N'Aliza', 13)
INSERT [dbo].[UserInterests] ([UserName], [InterestID]) VALUES (N'Aliza', 14)
INSERT [dbo].[UserInterests] ([UserName], [InterestID]) VALUES (N'ImranKhan', 10)
 
 go

 Create table Hashtags
 (HashtagID int primary key,
 Hashtag varchar(30))
 
 GO
INSERT [dbo].[Hashtags] ([HashtagID], [Hashtag]) VALUES (1, N'#Census')
INSERT [dbo].[Hashtags] ([HashtagID], [Hashtag]) VALUES (2, N'#ClassiqueMatin')
INSERT [dbo].[Hashtags] ([HashtagID], [Hashtag]) VALUES (3, N'#MasseCritique')
INSERT [dbo].[Hashtags] ([HashtagID], [Hashtag]) VALUES (4, N'#piratage')
INSERT [dbo].[Hashtags] ([HashtagID], [Hashtag]) VALUES (5, N'#DrugMovies')

GO

Select * from Following
Select * from Hashtags
Select * from Interests
Select * from Tweets
Select * from UserInterests
Select * from Users

--Q1 the maximum, minimum, average and standard deviation of the ages of the users?
go
select MAX(Age) as MaxAge,Min(Age) as MinAge,STDEV(Age) as StdevAge
From Users

--Q2 Give the name of the user who has the highest number of followers.
go
SELECT FollowedUserName as UserName, COUNT(FollowerUserName) AS FollowersCount
FROM Following
GROUP BY FollowedUserName
Having COUNT(FollowerUserName) = (
  SELECT Max(Followers)
  FROM (
    SELECT COUNT(FollowerUserName) AS Followers
    FROM Following
    GROUP BY FollowedUserName
  ) AS TopFollowers
)

--Q3 Give name of the user who has second highest followers.
go
SELECT FollowedUserName as UserName, COUNT(FollowerUserName) AS FollowersCount
FROM Following
GROUP BY FollowedUserName
Having COUNT(FollowerUserName) = (
    SELECT Max(Followers2)
    FROM (
          SELECT COUNT(FollowerUserName) AS Followers2
          FROM Following
          GROUP BY FollowedUserName
	      Having COUNT(FollowerUserName) <> (
                                      SELECT Max(Followers)
                                      FROM (
                                            SELECT COUNT(FollowerUserName) AS Followers
                                            FROM Following
                                            GROUP BY FollowedUserName
                                       ) AS TopFollowers))
	As secTopFollowers)

--Q4 List names of all the users who have never tweeted.
go
Select Users.UserName
From Users
where Users.UserName not in (
                             select UserName
							 from Tweets
							 )

--Q5 List all the hashtags and usernames and number of times that user used that hashtag.
go
SELECT h.Hashtag, t.UserName, COUNT(*) AS UsageCount
FROM Tweets t
JOIN Hashtags h ON t.[Text] LIKE '%' + h.Hashtag + '%'
GROUP BY h.Hashtag, t.UserName;

--Q6 Find the users who have never used the hashtag #Census.
go
select t.UserName
from Tweets t
where t.UserName not in(SELECT UserName
                        FROM Tweets
                        where Text like '%#Census%')
group by t.UserName

--Q7 List all the usernames that have never been followed. Using Set operation
go
select U.UserName
from Users U
except
select FollowedUserName
from Following

--Q8 List all the usernames that have never been followed. Using Exist Clause.
go
select U.UserName
from Users U
where not exists (select FollowedUserName
              from Following F
			  where U.UserName = F.FollowedUserName
			  )

--Q9 Find the most common interest of users. (The interest with the largest number of users). Also find the least common interest.
go
select InterestID,Count(InterestID) as MaxCount
from UserInterests UI
group by UI.InterestID
Having count(InterestID) in (select Max(NumInterests)
							 from (select count(UserName) as NumInterests
								   from UserInterests
								   group by InterestID)
							 As Inters
							)
select InterestID,Count(InterestID) as MinCount
from UserInterests UI
group by UI.InterestID
Having count(InterestID) in (select Min(NumInterests)
							 from (select count(UserName) as NumInterests
								   from UserInterests
								   group by InterestID)
							 As Inters
							)

--Q10 Show total tweets per country. The result should be in order of country name.
go
SELECT u.Country, COUNT(*) AS TotalTweets
FROM Tweets t
JOIN Users u ON t.UserName = u.UserName
GROUP BY u.Country
ORDER BY u.Country

--Q11 List names of all the users whose number of tweets is more than the average number of tweets per user.
go
SELECT UserName, COUNT(*) AS TotalTweets
FROM Tweets
group by UserName
having Count(Username) > (select Avg(NumTweets)
							 from (select count(UserName) as NumTweets
								   from Tweets
								   group by UserName)
							 As TweetsCount)

--Q12 Give the name of the users who have at least one follower from Pakistan.
go
Select Distinct(F.FollowedUserName)
from Following F
where F.FollowerUserName in (select U.UserName
							 from Users U
							 where F.FollowerUserName=U.UserName and U.Country='Pakistan'
							)

--Q13 Show the interest ID and description of interest with the most number of users.
go
SELECT TOP 1 ui.InterestID, i.Description, COUNT(ui.UserName) AS NumberOfUsers
FROM UserInterests ui
JOIN Interests i ON ui.InterestID = i.InterestID
GROUP BY ui.InterestID, i.Description
ORDER BY NumberOfUsers DESC;