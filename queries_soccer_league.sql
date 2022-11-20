-- List players alphabetically organized by current team
SELECT CONCAT(t.hometown, ' ', t.team_name) as team, CONCAT(p.first_name, ' ',p.last_name) AS player FROM teams t
JOIN players p ON t.id = p.team_id
ORDER BY team ASC, player ASC;

-- Get complete season schedule from 2020 Regular Season
SELECT m.match_date, 
	m.location, 
	ARRAY_AGG(DISTINCT t.team_name) AS teams, 
	ARRAY_AGG(DISTINCT CONCAT(r.first_name, ' ', r.last_name)) AS referees 
FROM matches m
JOIN match_teams mt ON m.id = mt.match_id
JOIN teams t ON t.id = mt.team_id
JOIN match_referees mr ON m.id = mr.match_id
JOIN referees r ON r.id = mr.referee_id
WHERE m.match_date BETWEEN (SELECT start_date FROM seasons WHERE id = 1) and (SELECT end_date FROM seasons WHERE id = 1)
GROUP BY m.match_date, m.location
ORDER BY m.match_date, m.location;

-- Show each match with the winning team and the number of goals they scored from 2020 Regular Season
SELECT m.id, m.match_date, t.team_name AS winning_team, COUNT(g) AS num_goals FROM matches m
JOIN match_teams mt ON m.id = mt.match_id
JOIN teams t ON t.id = mt.team_id
JOIN goals g ON t.id = g.team_id
WHERE g.match_id = m.id
AND m.winner_id = t.id
GROUP BY m.id, m.match_date, winning_team
ORDER BY m.id;

-- Show team rankings with team name and number of wins for 2020 Regular Season
SELECT t.team_name, COUNT(*) AS wins FROM teams t
JOIN matches m ON t.id = m.winner_id
WHERE m.match_date BETWEEN (SELECT start_date FROM seasons WHERE id = 1) and (SELECT end_date FROM seasons WHERE id = 1)
GROUP BY team_name
ORDER BY COUNT(*) DESC, team_name ASC;