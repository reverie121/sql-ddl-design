DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE regions
(
    id SERIAL PRIMARY KEY,
    name VARCHAR(30) NOT NULL
);

CREATE TABLE users
(
    id SERIAL PRIMARY KEY,
    preferred_region INTEGER REFERENCES regions ON DELETE SET NULL,
    username VARCHAR(15) UNIQUE
);

CREATE TABLE posts
(
    id SERIAL PRIMARY KEY,
    region_id INTEGER NOT NULL REFERENCES regions ON DELETE CASCADE,
    user_id INTEGER NOT NULL REFERENCES users ON DELETE CASCADE,
    headline TEXT NOT NULL, 
    content TEXT NOT NULL
);

CREATE TABLE categories
(
    id SERIAL PRIMARY KEY,
    name VARCHAR(30) UNIQUE
);

CREATE TABLE post_categories
(
    id SERIAL PRIMARY KEY,
    post_id INTEGER NOT NULL REFERENCES posts ON DELETE CASCADE,
    category_id INTEGER NOT NULL REFERENCES categories ON DELETE CASCADE
);

INSERT INTO regions (name)
VALUES ('Ann Arbor'), 
('Atlanta'), 
('Houston'), 
('Miami'), 
('San Francisco');

INSERT INTO users (preferred_region, username)
VALUES (2, 'earnest_m'),
(4, 'd_wade'),
(1, 'lily'),
(3, 'nasa_surplus'),
(5, 'rhithm_school'),
(1, 'jimmy'),
(2, 'darius'),
(1, 'a2_garlic');

INSERT INTO posts (region_id, user_id, headline, content)
VALUES (5, 5, 'Software Engineering Instructors and Assistants Wanted', 'We are hiring software engineers for both instructor and assistant positions. If you''re qualified you can use Google to find instructions for how to apply and a list of skills we are looking for.'),
(5, 5, 'Data Science Instructors and Assistants Wanted', 'We are hiring both instructor and assistant positions for our Data Science program. Please download the attached file and interpret the data to find instructions for how to apply and a list of skills we are looking for.'),
(2, 1, 'Successful Manager Accepting Demo Tapes', 'I am a very experienced manager in the Atlanta music scene and I want to make YOU the next KING (or queen) of Atlanta. Call me - (404)555-5555'),
(4, 2, 'For Sale: Mansion Owned by Dwyane Wade!', 'You''ve got to see it! A steal for just 30 million dollars.'),
(1, 3, 'Free Little Brother', 'He is noisy and wants to play with all my stuff. Please come and get him.'),
(3, 4, 'BUYING and SELLING SOLUTIONS', 'We know you have a problem. How about coming with a solution for once? We offer best prices. Still have a problem? Well you''re gonna have to pay.'),
(1, 6, 'Will Write Scripts for Food', 'I am really good at coding. Will write any script you want for a large pizza and 2 liter. email - haxorjimmy@gmail.com'),
(2, 7, 'Nice Piano For Sale', 'Yo Benny Hope used to own this thing man it''s nice and yours for $1000'),
(1, 8, 'Hardneck Garlic For Sale', 'Locally Grown! Perfect for table or garden. email - a2_garlic@gmail.com'),
(2, 8, 'Hardneck Garlic For Sale', 'Grown in Michigan. Perfect for table or garden. email - a2_garlic@gmail.com'),
(3, 8, 'Hardneck Garlic For Sale', 'Grown in Michigan. Perfect for table or garden. email - a2_garlic@gmail.com'),
(4, 8, 'Hardneck Garlic For Sale', 'Grown in Michigan. Perfect for table or garden. email - a2_garlic@gmail.com'),
(5, 8, 'Hardneck Garlic For Sale', 'Grown in Michigan. Perfect for table or garden. email - a2_garlic@gmail.com');

INSERT INTO categories (name)
VALUES ('Jobs - Hiring'),
('Jobs - Wanted'),
('Things - For Sale'),
('Things - Wanted');

INSERT INTO post_categories (post_id, category_id)
VALUES (1, 1),
(2, 1),
(3, 1),
(3, 2),
(3, 4),
(4, 3),
(5, 3),
(6, 3),
(6, 4),
(7, 2),
(8, 3),
(9, 3),
(10, 3),
(11, 3),
(12, 3),
(13, 3);