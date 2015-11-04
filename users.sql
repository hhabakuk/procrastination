CREATE TABLE users
(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(100), 
  activity VARCHAR(500)

);

CREATE TABLE questions
(
  id SERIAL4 PRIMARY KEY,
  question VARCHAR(500),
  answer VARCHAR(500)
);

CREATE TABLE results
(
user_id INTEGER,
question_id INTEGER,
result VARCHAR(100)
);


INSERT INTO users (name, activity) VALUES ('Jane', 'writing an essay');

INSERT INTO users (name, activity) VALUES ('John', 'going to the shop');

INSERT INTO users (name, activity) VALUES ('Mary', 'cleaning');

INSERT INTO questions (question, answer) VALUES ('what color is the sky', 'blue');

INSERT INTO questions (question, answer) VALUES ('what is your name', 'helen');

INSERT INTO questions (question, answer) VALUES ('how many corners has a square', 'four');

