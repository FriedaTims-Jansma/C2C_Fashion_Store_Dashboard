-- Total number of users 
Select COUNT(*) as total_users
FROM users;

-- Rate of active users vs. total users 
With ActVSInact (total_users, inactive_users)
as
(
Select
(Select Count(*) from users) as total_users,
COUNT(identifierHash) as inactive_users
FROM users
where productsSold != 0 and productsBought != 0
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

-- Top 10 countries
Select country, COUNT(identifierHash) as num_users
FROM users
GROUP BY country 
ORDER BY num_users DESC
LIMIT 10; 


-- Has a profile picture
SELECT hasProfilePicture, COUNT(hasProfilePicture) AS PictureCount
FROM users
GROUP BY hasProfilePicture 


-- Rate of total users vs active sellers 
With TotalvsActSellers (total_users, active_sellers)
as
(
Select
(Select Count(*) from users) as total_users,
COUNT(identifierHash) as active_sellers
FROM users
where productsSold != 0
)
Select *, ROUND(active_sellers * 100.0 / total_users, 1) AS Percent_of_Total
From TotalvsActSellers;
    
-- Rate of total users vs active buyers 
With TotalvsActBuyers (total_users, active_buyers)
as
(
Select
(Select Count(*) from users) as total_users,
COUNT(identifierHash) as active_buyers
FROM users
where productsBought != 0
)
Select *, ROUND(active_buyers * 100.0 / total_users, 1) AS Percent_of_Total
From TotalvsActBuyers;

-- Rate of total users vs buyer & seller
With TotalvsActSellersBuyers (total_users, active_sellers_buyers)
as
(
Select
(Select Count(*) from users) as total_users,
COUNT(identifierHash) as active_sellers_buyers
FROM users
where productsSold != 0 and productsBought != 0
)
Select *, ROUND(active_sellers_buyers * 100.0 / total_users, 1) AS Percent_of_Total
From TotalvsActSellersBuyers;

Select *
from users

-- Average number of followers and follows for active buyers 
SELECT COUNT(identifierHash), ROUND(AVG(socialNbFollowers),2) AS avg_num_followers, ROUND(AVG(socialNbFollows),2) AS avg_num_follows
FROM users
where productsBought != 0;


-- Average number of followers and follows for active sellers 
SELECT COUNT(identifierHash), ROUND(AVG(socialNbFollowers),2) AS avg_num_followers, ROUND(AVG(socialNbFollows),2) AS avg_num_follows
FROM users
where productsSold != 0 



-- AVG PassRate if > 0 
SELECT AVG(productsPassRate) as avg_PassRate
From users
where productsPassRate > 0

-- avg_ProdListed, avg_ProdSold, avg_Prodwished, avg_ProdBought if > 0 
WITH avg_prod (avg_ProdListed, avg_ProdSold, avg_Prodwished, avg_ProdBought) as (Select
(SELECT AVG(productsListed)
from users 
where productsListed > 0) as avg_ProdListed, 
(SELECT AVG(productsSold)
from users 
where productsSold > 0) as avg_ProdSold,
(SELECT AVG(productsWished)
from users 
where productsWished > 0) as  avg_Prodwished,  
(SELECT AVG(productsBought)
from users 
where productsBought > 0) as avg_ProdBought)
SELECT * 
from avg_prod





 