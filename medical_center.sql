DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE doctors
(
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL
);

CREATE TABLE patients
(
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL DEFAULT 'J.',
    last_name VARCHAR(100) NOT NULL DEFAULT 'Doe'
);

CREATE TABLE diseases
(
    id SERIAL PRIMARY KEY,
    name VARCHAR(200) DEFAULT 'Unknown',
    is_emergency BOOLEAN NOT NULL DEFAULT FALSE,
    common_symptoms TEXT NOT NULL DEFAULT 'Unknown',
    recommended_treatments TEXT
);

CREATE TABLE assignments
(
    id SERIAL PRIMARY KEY,
    dr_id INTEGER NOT NULL REFERENCES doctors ON DELETE CASCADE,
    patient_id INTEGER NOT NULL REFERENCES patients ON DELETE CASCADE
);

CREATE TABLE diagnoses
(
    id SERIAL PRIMARY KEY,
    dr_id INTEGER REFERENCES doctors ON DELETE SET NULL,
    patient_id INTEGER REFERENCES patients ON DELETE SET NULL,
    symptoms TEXT NOT NULL,
    disease_id INTEGER REFERENCES diseases ON DELETE SET NULL 
);

INSERT INTO doctors (first_name, last_name)
VALUES ('Miranda', 'Bailey'),
('Michaela', 'Quinn'),
('Frasier', 'Crane'),
('Leonard', 'McCoy'),
('Doogie', 'Howser');

INSERT INTO patients (first_name, last_name)
VALUES ('Anita', 'Heller'),
('Sam', 'Sickowski'),
('Justin', 'Thyme'),
(DEFAULT, DEFAULT),
('Leonard', 'McCoy');

INSERT INTO diseases (name, is_emergency, common_symptoms, recommended_treatments)
VALUES ('Homesickness', FALSE, 'Nostalgia and a longing for familiar comforts', 'Call mom.'),
('Xenopolycythemia', FALSE ,'Headaches, blurred vission, red skin, tiredness, high blood pressure and confusion.', 'Xenophlebotomy'),
('Ebola', TRUE, 'Fever, aches and pains, weakness, fatigue, unexplained hemorrhaging, bleeding or bruising.', 'Immediate quarantine required.'),
('Influenza', FALSE, 'Fever, aches and pains, weakness, fatigue, sore throat, dry cough, runny or stuffy nose.', 'Rest and hydration.'),
('Alice In Wonderland Syndrome', FALSE, 'Altered body image. Patient observes sizes of parts of the body wrongly, most often the head and hands.', NULL);

INSERT INTO assignments (dr_id, patient_id)
VALUES (1, 1),
(3, 5),
(4, 2),
(5, 3),
(2, 4),
(3, 2);

INSERT INTO diagnoses (dr_id, patient_id, symptoms, disease_id)
VALUES (1, 1, 'Fever, muscle aches, stuffy nose.', 4),
(3, 5, 'Headaches, blurred vission, tiredness, high blood pressure and confusion, irrational fear of tribbles.', 2),
(2, 4, 'Pain, bleeding from eyes, ears and nose.', 3),
(4, 2, 'Depression and a faraway look in his eyes.', 1),
(5, 3, 'Patient keeps telling me my head is the size of a large watermelon.', 5),
(3, 2, 'Headaches, fever, fatigue.', 4)