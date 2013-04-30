SELECT T.name, L.name
FROM teams T, leagues L, registrations R 
WHERE T.id = R.team_id AND R.league_id = L.id AND R.rating = 
	(SELECT MAX(R1.rating)
	FROM registrations R, leagues L, teams T
	WHERE T.id = R1.team_id AND R1.league_id = L.id
	GROUP BY T.id)



	#Leaderboard for all leagues
	SELECT L.name, T.name, MAX(R1.rating)
	FROM registrations R1, leagues L, teams T
	WHERE T.id = R1.team_id AND R1.league_id = L.id
	GROUP BY T.id

	#Best team in a league
	SELECT L.name, MAX(R1.rating)
	FROM registrations R1, teams T
	WHERE T.id = R1.team_id AND R1.league_id = "League_id"
	GROUP BY T.id

	#ACHILLES HEEL
	SELECT wins.id, wins.name, MAX(wins.cnt)
	FROM (SELECT T.id, T.name, count(*) as cnt
	FROM teams T, matches M
	WHERE M.winner_id = T.id AND M.loser_id = "current team id"
	GROUP BY T.id ,T.name) as wins

	#PUNCHING BAG
	SELECT wins.id, wins.name, MAX(wins.cnt)
	FROM (SELECT T.id, T.name, count(*) as cnt
	FROM teams T, matches M
	WHERE M.winner_id = "current_user_id" AND M.loser_id = T.id
	GROUP BY T.id ,T.name) as wins


#TEAMS WITH WINNING RECORD ACROSS ALL LEAGUES
select t.id
from teams t, (select count(*) as cnt, m.winner_id
							from matches m, teams t1
							where m.winner_id=t1.id
							group by m.winner_id) as r
where t.id=r.winner_id 
and r.cnt > (select avg(r1.cnt)
							from (select count(winner_id) as cnt
										from teams t1
										left outer join (select *
																		 from teams t2, matches m
																		 where m.winner_id=t2.id)
										on t1.id = winner_id
										group by winner_id, t1.id) as r1)


#TEAMS WITH A WINNING RECORD IN A GIVEN LEAGUE (IN THIS EXAMPLE 9)
select t.id
from teams t, (select count(m.winner_id) as cnt, m.winner_id
							from matches m, teams t1, hangouts h
							where m.winner_id=t1.id and m.hangout_id = h.id and h.league_id = 9
							group by m.winner_id) as r
where t.id=r.winner_id 
and r.cnt > (select avg(r1.cnt)
							from (select count(winner_id) as cnt
										from teams t, registrations r
										left outer join (select m.winner_id
																		from matches m, teams t1, hangouts h
																		where m.winner_id=t1.id and m.hangout_id = h.id and h.league_id = 9)
										on t.id = winner_id
										where t.id = r.team_id and r.league_id = 9
										group by winner_id, t.id) as r1)


#SELECT NUMBER OF WINS FOR EVERY TEAM IN A LEAGUE INCLUDING 0
select count(winner_id), winner_id, t.id
from teams t, registrations r
left outer join (select m.winner_id
								from matches m, teams t1, hangouts h
								where m.winner_id=t1.id and m.hangout_id = h.id and h.league_id = 9)
on t.id = winner_id
where t.id = r.team_id and r.league_id = 9
group by winner_id, t.id

#AVG RATING OF TEAM (in this case 2) ACROSS ALL LEAGUES
SELECT avg(r.rating)
from registrations r
where r.team_id = 2
group by r.team_id

#AVG RATING OF PLAYER'S (IN THIS CASE 2) TEAMS ACROSS ALL LEAGUES
SELECT avg(r.rating)
from players_teams pt, teams t, registrations r
where pt.player_id = 2 and pt.team_id = t.id and t.id = r.team_id
group by pt.player_id

