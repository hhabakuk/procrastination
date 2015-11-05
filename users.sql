CREATE TABLE users
(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(100), 
  activity VARCHAR(500),
  characters VARCHAR(500)

);

CREATE TABLE questions
(
  id SERIAL4 PRIMARY KEY,
  question VARCHAR(500),
  answer VARCHAR(500),
  user_id INTEGER,
  guess VARCHAR(500)
);




-- CREATE TABLE results
-- (
-- user_id INTEGER,
-- question_id INTEGER,
-- guess VARCHAR(100)
-- );


INSERT INTO users (name, activity) VALUES ('Jane', 'writing an essay');

INSERT INTO users (name, activity) VALUES ('John', 'going to the shop');

INSERT INTO users (name, activity) VALUES ('Mary', 'cleaning');

INSERT INTO questions (question, answer) VALUES ('What is the beginning of eternity, the end of time and space. The beginning of every end and the end of every place.', 'e');

INSERT INTO questions (question, answer) VALUES ('what is your name', 'helen');

INSERT INTO questions (question, answer) VALUES ('how many corners has a square', 'four');

INSERT INTO disagreements (arguement) VALUES ('I strongly disagree with you.');
INSERT INTO disagreements (arguement) VALUES ('No.');
INSERT INTO disagreements (arguement) VALUES ('Why would you even think that.');
INSERT INTO disagreements (arguement) VALUES (':D seriously?');
INSERT INTO disagreements (arguement) VALUES ('I don’t think so.');
INSERT INTO disagreements (arguement) VALUES ('No way.');
INSERT INTO disagreements (arguement) VALUES ('I beg to differ.');
INSERT INTO disagreements (arguement) VALUES ('I’d say the exact opposite.');
INSERT INTO disagreements (arguement) VALUES ('Definitely disagree.');
INSERT INTO disagreements (arguement) VALUES ('There is more to it than that.');
INSERT INTO disagreements (arguement) VALUES ('Nope.');


