/*
Question: Teams that have coach Fernando Santos
URL: http://sqlzoo.net/wiki/The_JOIN_operation

Description:
Find the teams that have a coach named 'Fernando Santos' and list the matchid and player of each goal.

Tables: game (id, mdate, team1, team2), goal (matchid, teamid, player, gtime), eteam (id, teamname, coach)
*/

SELECT game.mdate, eteam.teamname
FROM game 
JOINeteam
ON (game.team1 = eteam.id)
WHERE eteam.coach like 'Fernando Santos'

/*
Explanation:
1. Joins goal with eteam on goal.teamid = eteam.id.
2. Filters where coach = 'Fernando Santos'.
3. Projects matchid, player.
*/