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
-----------------------------------------------------------------------------------------------------------
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
--------------
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
------------------------------------------------------------
4. Using the fielding table, group players into three groups based on their position: --> pos = position column
label players with position OF as "Outfield", 
those with position "SS", "1B", "2B", and "3B" as "Infield", 
and those with position "P" or "C" as "Battery". 
Determine the number of putouts made by each of these three groups in 2016. --> po is putouts

answer

select Max(yearid) as year,pos,sum(po) as PO,
case when pos = 'OF' theN 'Outfield'
	when pos = 'SS' then 'Infield'
	when pos = '1B' then 'Infield'
	when pos = '2B' then 'Infield'
	when pos = '3B' then 'Infield'
	else 'Battery' end as position
from fielding
group by pos
order by PO desc

-----------------
select *
from fielding

select max(yearid)
from fielding

-----------------------------------------------------------------------------
5.Find the average number of strikeouts per game by decade since 1920. 
Round the numbers you report to 2 decimal places. 
Do the same for home runs per game. Do you see any trends?
notes:
SO - strike out by batter - is a column - use this one
SOA - strike out by pitcher - is a column
HR - home run by batter - this is a column
(avg/game) every 2016-1920/10

select (yearid/10)*10 as decade,count(g)as  total_games,sum(so) as strike_outs, sum(so)/count(g) as decade_so 
from teams
where yearid> 1920
group by decade
order by decade_so


select *
from teams


---------------------------------------------------------------------------------------------------------
6. find the player who had the most success stealing bases in 2016, 
where success is measured as the percentage of stolen base attempts which are successful. 
(A stolen base attempt results either in a stolen base or being caught stealing.) 
Consider only players who attempted at least 20 stolen bases.

notes:
sb - stolen bases --> THIS IS A COLUMN
cs - caught stealing -->this is a column

select *
from batting

select max(yearid) as year, b.playerid, p.namefirst, p.namelast, sum(sb)as attempt, 
sum(cs) as caught, sum(sb)-sum(cs) as success
from batting as b
left join people as p
on b.playerid = p.playerid
where yearid = '2016'
group by b.playerid, p.namefirst, p.namelast
order by success desc

--------------------------------------------------------------------------------------------------------------
7. From 1970 – 2016, what is the largest number of wins for a team that did not win the world series? 
What is the smallest number of wins for a team that did win the world series? 
Doing this will probably result in an unusually small number of wins for a world series champion – 
determine why this is the case. Then redo your query, excluding the problem year. How often from 1970 – 2016 
was it the case that a team with the most wins also won the world series? What percentage of the time?





