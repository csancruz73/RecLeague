-- Baseball Rec League Database — MariaDB

CREATE TABLE division (
    division_id INT AUTO_INCREMENT PRIMARY KEY,
    division_name VARCHAR(100) NOT NULL UNIQUE,
    age_group VARCHAR(40) NOT NULL,
    description TEXT
);

CREATE TABLE season (
    season_id INT AUTO_INCREMENT PRIMARY KEY,
    season_name VARCHAR(100) NOT NULL UNIQUE,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    CHECK (end_date >= start_date)
);

CREATE TABLE field (
    field_id INT AUTO_INCREMENT PRIMARY KEY,
    field_name VARCHAR(100) NOT NULL UNIQUE,
    address VARCHAR(200) NOT NULL,
    city VARCHAR(100) NOT NULL,
    state CHAR(2) NOT NULL,
    field_type VARCHAR(60) NOT NULL
);

CREATE TABLE team (
    team_id INT AUTO_INCREMENT PRIMARY KEY,
    team_name VARCHAR(100) NOT NULL UNIQUE,
    captain_name VARCHAR(120) NOT NULL,
    co_captain_name VARCHAR(120) NOT NULL,
    division_id INT NOT NULL,
    season_id INT NOT NULL,
    FOREIGN KEY (division_id) REFERENCES division(division_id),
    FOREIGN KEY (season_id) REFERENCES season(season_id)
);

CREATE TABLE coach (
    coach_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(60) NOT NULL,
    last_name VARCHAR(60) NOT NULL,
    phone VARCHAR(25),
    email VARCHAR(255),
    team_id INT NOT NULL,
    FOREIGN KEY (team_id) REFERENCES team(team_id)
);

CREATE TABLE player (
    player_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(60) NOT NULL,
    last_name VARCHAR(60) NOT NULL,
    phone VARCHAR(25),
    email VARCHAR(255),
    position VARCHAR(40),
    team_id INT,
    FOREIGN KEY (team_id) REFERENCES team(team_id)
);

CREATE TABLE game (
    game_id INT AUTO_INCREMENT PRIMARY KEY,
    game_date DATE NOT NULL,
    game_time TIME NOT NULL,
    home_team_id INT NOT NULL,
    away_team_id INT NOT NULL,
    field_id INT NOT NULL,
    home_score INT CHECK (home_score >= 0),
    away_score INT CHECK (away_score >= 0),
    winner_team_id INT,
    FOREIGN KEY (home_team_id) REFERENCES team(team_id),
    FOREIGN KEY (away_team_id) REFERENCES team(team_id),
    FOREIGN KEY (field_id) REFERENCES field(field_id),
    FOREIGN KEY (winner_team_id) REFERENCES team(team_id),
    CHECK (home_team_id <> away_team_id),
    CHECK (
        winner_team_id IS NULL
        OR winner_team_id IN (home_team_id, away_team_id)
    )
);

INSERT INTO division (division_name, age_group, description)
VALUES ('Adult Recreation', '18+', 'Community baseball division');

INSERT INTO season (season_name, start_date, end_date)
VALUES ('Fall 2026', '2026-09-01', '2026-11-30');

INSERT INTO field (field_name, address, city, state, field_type)
VALUES
    ('Oak Park Diamond', '100 Oak Street', 'Lancaster', 'PA', 'Grass'),
    ('Riverside Field', '250 River Road', 'Lancaster', 'PA', 'Grass');

INSERT INTO team
    (team_name, captain_name, co_captain_name, division_id, season_id)
VALUES
    ('Lancaster Lions', 'Alex Rivera', 'Jordan Lee', 1, 1),
    ('York Yankees', 'Taylor Brooks', 'Morgan Davis', 1, 1),
    ('Reading Rockets', 'Casey Miller', 'Riley Smith', 1, 1),
    ('Harrisburg Hawks', 'Jamie Wilson', 'Avery Brown', 1, 1),
    ('Allentown Aces', 'Adrian Morales', 'Marcus Bennett', 1, 1),
    ('Bethlehem Bears', 'Ethan Park', 'Darius Coleman', 1, 1),
    ('Scranton Storm', 'Caleb Foster', 'Julian Navarro', 1, 1),
    ('Wilkes-Barre Wolves', 'Noah Ibrahim', 'Andre Wallace', 1, 1),
    ('Easton Eagles', 'Lucas Chen', 'Miles Okafor', 1, 1),
    ('Erie Express', 'Gabriel Torres', 'Elijah Brooks', 1, 1),
    ('Altoona Admirals', 'Nathan Silva', 'Isaiah Kim', 1, 1),
    ('Johnstown Jets', 'Owen Gallagher', 'Dominic Reyes', 1, 1),
    ('State College Stars', 'Xavier Mitchell', 'Liam Patel', 1, 1),
    ('Williamsport Wildcats', 'Cameron Hughes', 'Aaron Vasquez', 1, 1),
    ('Chambersburg Chargers', 'Mateo Rivera', 'Ryan Nakamura', 1, 1),
    ('Gettysburg Generals', 'Tyler Mensah', 'Malik Anderson', 1, 1),
    ('Carlisle Cardinals', 'Connor Walsh', 'Benjamin Duarte', 1, 1),
    ('Lebanon Lightning', 'Dylan Shah', 'Victor Alvarez', 1, 1),
    ('Pittsburgh Pioneers', 'Sebastian Novak', 'Amir Hassan', 1, 1),
    ('Butler Bisons', 'Finn O Sullivan', 'Jamal Price', 1, 1),
    ('New Castle Knights', 'Hugo Martins', 'Kai Robinson', 1, 1),
    ('Meadville Mustangs', 'Rafael Costa', 'Theo Nguyen', 1, 1),
    ('Sharon Sharks', 'Emmanuel Adeyemi', 'Oscar Jensen', 1, 1),
    ('Washington Warriors', 'Nikhil Mehta', 'Felix Schneider', 1, 1),
    ('Uniontown United', 'Zachary Reed', 'Leon Ibrahim', 1, 1),
    ('Greensburg Giants', 'Arjun Desai', 'Micah Thompson', 1, 1),
    ('West Chester Waves', 'Diego Flores', 'Tobias Eriksen', 1, 1),
    ('Norristown Navigators', 'Santiago Perez', 'Kieran Murphy', 1, 1),
    ('Doylestown Dragons', 'Yusuf Ali', 'Maxim Petrov', 1, 1),
    ('Media Monarchs', 'Bennett Clarke', 'Ibrahim Diallo', 1, 1);

INSERT INTO player
    (first_name, last_name, phone, email, position, team_id)
VALUES
    ('Alex', 'Rivera', '717-555-0101', 'alex@example.com', 'Pitcher', 1),
    ('Jordan', 'Lee', '717-555-0102', 'jordan@example.com', 'Catcher', 1),
    ('Taylor', 'Brooks', '717-555-0103', 'taylor@example.com', 'Pitcher', 2),
    ('Morgan', 'Davis', '717-555-0104', 'morgan@example.com', 'First Base', 2),
    ('Casey', 'Miller', '717-555-0105', 'casey@example.com', 'Pitcher', 3),
    ('Riley', 'Smith', '717-555-0106', 'riley@example.com', 'Shortstop', 3),
    ('Jamie', 'Wilson', '717-555-0107', 'jamie@example.com', 'Pitcher', 4),
    ('Avery', 'Brown', '717-555-0108', 'avery@example.com', 'Center Field', 4);

INSERT INTO player
    (first_name, last_name, phone, email, position, team_id)
SELECT
    SUBSTRING_INDEX(captain_name, ' ', 1),
    SUBSTRING(captain_name, LOCATE(' ', captain_name) + 1),
    NULL,
    NULL,
    'Pitcher',
    team_id
FROM team
WHERE team_id BETWEEN 5 AND 30;

INSERT INTO player
    (first_name, last_name, phone, email, position, team_id)
SELECT
    SUBSTRING_INDEX(co_captain_name, ' ', 1),
    SUBSTRING(co_captain_name, LOCATE(' ', co_captain_name) + 1),
    NULL,
    NULL,
    'Catcher',
    team_id
FROM team
WHERE team_id BETWEEN 5 AND 30;

INSERT INTO player
    (first_name, last_name, phone, email, position, team_id)
SELECT
    names.first_name,
    surnames.last_name,
    NULL,
    NULL,
    names.position,
    t.team_id
FROM team AS t
JOIN (
    SELECT 1 AS team_id, 'Whitcomb' AS last_name
    UNION ALL SELECT 2, 'Bellamy'
    UNION ALL SELECT 3, 'Kessler'
    UNION ALL SELECT 4, 'Paredes'
    UNION ALL SELECT 5, 'Sato'
    UNION ALL SELECT 6, 'Khatri'
    UNION ALL SELECT 7, 'Adebayo'
    UNION ALL SELECT 8, 'Rosenfeld'
    UNION ALL SELECT 9, 'Varela'
    UNION ALL SELECT 10, 'Hollander'
    UNION ALL SELECT 11, 'Tremblay'
    UNION ALL SELECT 12, 'Mendoza'
    UNION ALL SELECT 13, 'Radcliffe'
    UNION ALL SELECT 14, 'Choudhury'
    UNION ALL SELECT 15, 'Mori'
    UNION ALL SELECT 16, 'Kowalski'
    UNION ALL SELECT 17, 'Baptiste'
    UNION ALL SELECT 18, 'Dimitrov'
    UNION ALL SELECT 19, 'Villanueva'
    UNION ALL SELECT 20, 'Echeverria'
    UNION ALL SELECT 21, 'Lindqvist'
    UNION ALL SELECT 22, 'Suleiman'
    UNION ALL SELECT 23, 'Montgomery'
    UNION ALL SELECT 24, 'Zambrano'
    UNION ALL SELECT 25, 'Fujimoto'
    UNION ALL SELECT 26, 'Ndlovu'
    UNION ALL SELECT 27, 'Bouchard'
    UNION ALL SELECT 28, 'Almeida'
    UNION ALL SELECT 29, 'Chakraborty'
    UNION ALL SELECT 30, 'Rinaldi'
) AS surnames
    ON surnames.team_id = t.team_id
CROSS JOIN (
    SELECT 'Oliver' AS first_name, 'First Base' AS position
    UNION ALL SELECT 'Jasper', 'Second Base'
    UNION ALL SELECT 'Tristan', 'Third Base'
    UNION ALL SELECT 'Emilio', 'Shortstop'
    UNION ALL SELECT 'Quentin', 'Left Field'
    UNION ALL SELECT 'Rowan', 'Center Field'
    UNION ALL SELECT 'Desmond', 'Right Field'
    UNION ALL SELECT 'Cedric', 'Utility'
    UNION ALL SELECT 'Hamza', 'Utility'
    UNION ALL SELECT 'Pavel', 'Utility'
) AS names;

UPDATE player
SET
    phone = CONCAT('717-555-', LPAD(1000 + player_id, 4, '0')),
    email = LOWER(
        CONCAT(first_name, '.', last_name, '.', player_id, '@recleague.example')
    )
WHERE phone IS NULL
  AND email IS NULL;

INSERT INTO coach (first_name, last_name, phone, email, team_id)
VALUES
    ('Sam', 'Carter', '717-555-0201', 'sam@example.com', 1),
    ('Pat', 'Reed', '717-555-0202', 'pat@example.com', 2),
    ('Robin', 'Clark', '717-555-0203', 'robin@example.com', 3),
    ('Drew', 'Parker', '717-555-0204', 'drew@example.com', 4),
    ('Priya', 'Kapoor', '717-555-2005', 'priya.kapoor@example.com', 5),
    ('Martin', 'Velez', '717-555-2006', 'martin.velez@example.com', 6),
    ('Helena', 'Fischer', '717-555-2007', 'helena.fischer@example.com', 7),
    ('Tariq', 'Rahman', '717-555-2008', 'tariq.rahman@example.com', 8),
    ('Sofia', 'Marquez', '717-555-2009', 'sofia.marquez@example.com', 9),
    ('Kenji', 'Tanaka', '717-555-2010', 'kenji.tanaka@example.com', 10),
    ('Amara', 'Johnson', '717-555-2011', 'amara.johnson@example.com', 11),
    ('Pavel', 'Orlov', '717-555-2012', 'pavel.orlov@example.com', 12),
    ('Lucia', 'Romano', '717-555-2013', 'lucia.romano@example.com', 13),
    ('Omar', 'Farouk', '717-555-2014', 'omar.farouk@example.com', 14),
    ('Ingrid', 'Larsson', '717-555-2015', 'ingrid.larsson@example.com', 15),
    ('Devon', 'Mercer', '717-555-2016', 'devon.mercer@example.com', 16),
    ('Nadia', 'Petrova', '717-555-2017', 'nadia.petrova@example.com', 17),
    ('Luis', 'Cardenas', '717-555-2018', 'luis.cardenas@example.com', 18),
    ('Fatima', 'Saleh', '717-555-2019', 'fatima.saleh@example.com', 19),
    ('Brendan', 'Hayes', '717-555-2020', 'brendan.hayes@example.com', 20),
    ('Mei', 'Zhang', '717-555-2021', 'mei.zhang@example.com', 21),
    ('Antonio', 'Moretti', '717-555-2022', 'antonio.moretti@example.com', 22),
    ('Leila', 'Haddad', '717-555-2023', 'leila.haddad@example.com', 23),
    ('Patrick', 'Donovan', '717-555-2024', 'patrick.donovan@example.com', 24),
    ('Yara', 'Nasser', '717-555-2025', 'yara.nasser@example.com', 25),
    ('Hector', 'Salazar', '717-555-2026', 'hector.salazar@example.com', 26),
    ('Anika', 'Bose', '717-555-2027', 'anika.bose@example.com', 27),
    ('Ronan', 'McBride', '717-555-2028', 'ronan.mcbride@example.com', 28),
    ('Camila', 'Rojas', '717-555-2029', 'camila.rojas@example.com', 29),
    ('Kwame', 'Boateng', '717-555-2030', 'kwame.boateng@example.com', 30);

INSERT INTO game
    (game_date, game_time, home_team_id, away_team_id, field_id,
     home_score, away_score, winner_team_id)
VALUES
    ('2026-10-03', '13:00:00', 1, 2, 1, 5, 3, 1),
    ('2026-10-04', '14:00:00', 3, 4, 2, 2, 4, 4),
    ('2026-10-05', '13:00:00', 5, 6, 1, 6, 2, 5),
    ('2026-10-06', '13:00:00', 7, 8, 2, 3, 5, 8),
    ('2026-10-07', '13:00:00', 9, 10, 1, 4, 1, 9),
    ('2026-10-08', '13:00:00', 11, 12, 2, 2, 7, 12),
    ('2026-10-09', '13:00:00', 13, 14, 1, 8, 6, 13),
    ('2026-10-10', '13:00:00', 15, 16, 2, 1, 3, 16),
    ('2026-10-11', '13:00:00', 17, 18, 1, 5, 4, 17),
    ('2026-10-12', '13:00:00', 19, 20, 2, 2, 6, 20),
    ('2026-10-13', '13:00:00', 21, 22, 1, 7, 3, 21),
    ('2026-10-14', '13:00:00', 23, 24, 2, 4, 9, 24),
    ('2026-10-15', '13:00:00', 25, 26, 1, 6, 5, 25),
    ('2026-10-16', '13:00:00', 27, 28, 2, 0, 2, 28),
    ('2026-10-17', '13:00:00', 29, 30, 1, 10, 7, 29),
    ('2026-10-18', '13:00:00', 1, 3, 2, 3, 6, 3),
    ('2026-10-19', '13:00:00', 2, 4, 1, 5, 1, 2),
    ('2026-10-20', '13:00:00', 5, 7, 2, 4, 8, 7),
    ('2026-10-21', '13:00:00', 6, 8, 1, 7, 2, 6),
    ('2026-10-22', '13:00:00', 9, 11, 2, 3, 4, 11);

SELECT
    (SELECT COUNT(*) FROM team) AS teams,
    (SELECT COUNT(*) FROM player) AS players,
    (SELECT COUNT(*) FROM game) AS games,
    (SELECT COUNT(*) FROM coach) AS coaches;