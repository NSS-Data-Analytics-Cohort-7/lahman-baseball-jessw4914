/*sanity check
select *
from appearances*/

1. What range of years for baseball games played does the provided database cover?

select max(yearid), min(yearid)
from appearances

answer 1871,2016

2.Find the name and height of the shortest player in the database. 
How many games did he play in? What is the name of the team for which he played?

select playerid, namefirst, namelast, min(height)
from people
group by playerid
order by height

answer Eddie Gaedel at 43 inches tall, gaedeed01
He only went to bat in 1 game, was walked and replaced by a runner on first base

https://en.wikipedia.org/wiki/Eddie_Gaedel

3. Find all players in the database who played at Vanderbilt University. 
Create a list showing each player’s first and last names as well as the total salary 
they earned in the major leagues. 
Sort this list in descending order by the total salary earned. 
Which Vanderbilt player earned the most money in the majors?

