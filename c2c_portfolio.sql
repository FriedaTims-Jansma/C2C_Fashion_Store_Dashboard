-- Total number of users 
--Select COUNT(*) as total_users
-- FROM users;

-- Rate of active users vs. total users 
With ActVSInact (total_users, inactive_users)
as
(
Select
(Select Count(*) from users) as total_users,
COUNT(identifierHash) as inactive_users
FROM users
where productsSold = 0 and productsBought = 0
)
Select *, ROUND(inactive_users * 100.0 / total_users, 1) AS PercentInactiveUsers
From ActVSInact;
 
-- Average number of followers and follows overall 
SELECT COUNT(identifierHash), ROUND(AVG(socialNbFollowers),2) AS avg_num_followers, ROUND(AVG(socialNbFollows),2) AS avg_num_follows
FROM users;

-- Average number of followers and follows for active users 
SELECT COUNT(identifierHash), ROUND(AVG(socialNbFollowers),2) AS avg_num_followers, ROUND(AVG(socialNbFollows),2) AS avg_num_follows
FROM users
where productsSold != 0 and productsBought != 0;

-- Which country are users  located 
Select country, COUNT(identifierHash) as num_users
FROM users
GROUP BY country 
ORDER BY num_users DESC;


SELECT identifierHash ,seniority, daysSinceLastLogin, productsSold,productsBought
FROM users
ORDER BY daysSinceLastLogin DESC
    


SELECT hasProfilePicture, COUNT(hasProfilePicture) AS PictureCount
FROM users
GROUP BY hasProfilePicture 


    

 