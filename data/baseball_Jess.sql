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

answer David Price 

select p.playerid, namefirst, namelast, schoolid, sum(salary)as total_salary
from people as p
left join collegeplaying as cp
on p.playerid = cp.playerid
left join salaries as s
on p.playerid = s.playerid
where schoolid ='vandy' 
group by p.playerid,schoolid
order by total_salary desc NULLS LAST;

match on primary key playerid
primary:people
collegeplaying
salaries

select *
from schools
where schoolname like'Van%'

select *
from collegeplaying
where schoolid = 'vandy'

select*
from salaries

4. Using the fielding table, group players into three groups based on their position: 
label players with position OF as "Outfield", 
those with position "SS", "1B", "2B", and "3B" as "Infield", 
and those with position "P" or "C" as "Battery". 
Determine the number of putouts made by each of these three groups in 2016. --> po is putouts


select yearid,
from fielding

select *
from people





