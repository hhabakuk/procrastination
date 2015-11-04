CREATE TABLE users
(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(100), 
  activity VARCHAR(500),
  question_id INTEGER,
  guess1 VARCHAR(500)

);

CREATE TABLE questions
(
  id SERIAL4 PRIMARY KEY,
  question VARCHAR(500),
  answer VARCHAR(500)
);

-- CREATE TABLE results
-- (
-- user_id INTEGER,
-- question_id INTEGER,
-- guess VARCHAR(100)
-- );


INSERT INTO users (name, activity, guess1) VALUES ('Jane', 'writing an essay', 'blue');

INSERT INTO users (name, activity, guess1) VALUES ('John', 'going to the shop', 'yellow');

INSERT INTO users (name, activity, guess1) VALUES ('Mary', 'cleaning', 'purple');

INSERT INTO questions (question, answer) VALUES ('what color is the sky', 'blue');

INSERT INTO questions (question, answer) VALUES ('what is your name', 'helen');

INSERT INTO questions (question, answer) VALUES ('how many corners has a square', 'four');

