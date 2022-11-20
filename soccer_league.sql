DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league

CREATE TABLE teams
(
    id SERIAL PRIMARY KEY,
    hometown VARCHAR(50) NOT NULL,
    team_name VARCHAR(50) UNIQUE
);

CREATE TABLE players
(
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    team_id INTEGER REFERENCES teams ON DELETE SET NULL
);

CREATE TABLE referees
(
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL
);

CREATE TABLE seasons
(
    id SERIAL PRIMARY KEY,
    type VARCHAR(30) NOT NULL DEFAULT 'Regular',
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);

CREATE TABLE matches
(
    id SERIAL PRIMARY KEY,
    match_date DATE NOT NULL,
    location VARCHAR(50) NOT NULL,
    winner_id INTEGER REFERENCES teams ON DELETE SET NULL
);

CREATE TABLE match_teams
(
    id SERIAL PRIMARY KEY,
    match_id INTEGER REFERENCES matches ON DELETE CASCADE,
    team_id INTEGER REFERENCES teams ON DELETE CASCADE
);

CREATE TABLE match_referees
(
    id SERIAL PRIMARY KEY,
    match_id INTEGER REFERENCES matches ON DELETE CASCADE,
    referee_id INTEGER REFERENCES referees ON DELETE CASCADE
);

CREATE TABLE goals
(
    id SERIAL PRIMARY KEY,
    match_id INTEGER REFERENCES matches ON DELETE SET NULL,
    team_id INTEGER REFERENCES teams ON DELETE SET NULL,
    player_id INTEGER REFERENCES players ON DELETE SET NULL
);

INSERT INTO teams (hometown, team_name)
VALUES ('Ann Arbor', 'Trees'),
('Detroit', 'Wheels'),
('Lansing', 'Capitals'),
('Grand Rapids', 'Salmon');

INSERT INTO players (first_name, last_name, team_id)
VALUES ('Lionel', 'Ronaldo', 1),
('Cristiano', 'Messi', 2),
('Andres', 'Falcao', 3),
('Radamel', 'Iniesta', 4),
('Yaya', 'Cavani', 1),
('Edinson', 'Toure', 2),
('Sergio', 'Alonso', 3),
('Iker', 'Aguero', 4),
('Thiago', 'Ozil', 1),
('Mesut', 'Silva', 2),
('Gerard', 'Lahm', 3),
('Phillip', 'Pique', 4);

INSERT INTO referees (first_name, last_name)
VALUES ('Wayne', 'Mata'),
('Juan', 'Rooney'),
('Thomas', 'Suarez'),
('Ashley', 'Reus'),
('Marcelo', 'Fabregas'),
('Sarah', 'Villa'),
('Victor', 'Martinez'),
('Diego', 'Puyol');

INSERT INTO seasons (start_date, end_date)
VALUES ('2020-05-01', '2020-07-31'),
('2021-05-01', '2021-07-31'),
('2022-05-01', '2022-07-31');

INSERT INTO seasons (type, start_date, end_date)
VALUES ('Post', '2020-08-01', '2020-08-31'),
('Post', '2021-08-01', '2021-08-31'),
('Post', '2022-08-01', '2022-08-31');


-- 2020 Regular Season matches

INSERT INTO matches (match_date, location, winner_id)
VALUES ('2020-05-02', 'Lansing', 1),
('2020-05-02', 'Grand Rapids', 4),
('2020-05-16', 'Detroit', 4),
('2020-05-16', 'Ann Arbor', 3),
('2020-05-30', 'Kalamazoo', 1),
('2020-05-30', 'Flint', 3),
('2020-06-13', 'Detroit', 1),
('2020-06-13', 'Grand Rapids', 4),
('2020-06-27', 'Lansing', 2),
('2020-06-27', 'Ann Arbor', 1);

INSERT INTO match_teams (match_id, team_id)
VALUES (1, 2),
(1, 1),
(2, 4),
(2, 3),
(3, 1),
(3, 4),
(4, 3),
(4, 2),
(5, 1),
(5, 2),
(6, 3),
(6, 4),
(7, 1),
(7, 3),
(8, 4),
(8, 2),
(9, 2),
(9, 3),
(10, 1),
(10, 4);

INSERT INTO match_referees (match_id, referee_id)
VALUES (1, 1),
(1, 2),
(2, 3),
(2, 4),
(3, 5),
(3, 6),
(4, 7),
(4, 8),
(5, 1),
(5, 3),
(6, 2),
(6, 4),
(7, 5),
(7, 7),
(8, 6),
(8, 8),
(9, 1),
(9, 4),
(10, 2),
(10, 3);

-- 2020 Regular Season goals
INSERT INTO goals (match_id, team_id, player_id)
VALUES (1, 2, 2),
(1, 1, 5),
(1, 1, 1),
(1, 2, 2),
(1, 1, 5),
(2, 4, 8),
(2, 4, 4),
(3, 1, 9),
(3, 4, 4),
(3, 1, 5),
(3, 4, 12),
(3, 4, 4),
(4, 3, 7),
(4, 3, 11),
(4, 2, 6),
(5, 1, 5),
(5, 1, 1),
(5, 2, 2),
(5, 1, 9),
(6, 4, 8),
(6, 3, 11),
(6, 3, 7),
(6, 3, 11),
(6, 4, 12),
(6, 3, 3),
(7, 3, 3),
(7, 1, 1),
(7, 1, 9),
(8, 2, 10),
(8, 4, 12),
(8, 4, 4),
(8, 2, 2),
(8, 4, 8),
(9, 3, 11),
(9, 2, 6),
(9, 2, 2),
(9, 2, 10),
(9, 3, 11),
(9, 2, 2),
(10, 1, 5),
(10, 4, 8),
(10, 1, 5);
