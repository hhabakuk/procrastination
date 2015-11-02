CREATE TABLE users
(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(100), 
  activity VARCHAR(500),
  right_answers INTEGER
);

INSERT INTO users (name, activity, right_answers) VALUES ('Jane', 'writing an essay', 2);

INSERT INTO users (name, activity, right_answers) VALUES ('John', 'going to the shop', 1);

INSERT INTO users (name, activity, right_answers) VALUES ('Mary', 'cleaning', 3);

