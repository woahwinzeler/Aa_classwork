PRAGMA foreign_keys = ON;

CREATE TABLE users(
  id INTEGER PRIMARY KEY,
  fname TEXT NOT NULL,
  lname TEXT NOT NULL
);

CREATE TABLE questions(
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  body TEXT,
  users_id INTEGER NOT NULL,
  FOREIGN KEY (users_id) REFERENCES users(id)
);

CREATE TABLE question_follows(
  relationships INTEGER PRIMARY KEY,
  users_id INTEGER,
  questions_id INTEGER,
  FOREIGN KEY (users_id) REFERENCES users(id),
  FOREIGN KEY (questions_id) REFERENCES questions(id)
);

CREATE TABLE replies(
  id INTEGER PRIMARY KEY,
  body TEXT NOT NULL,
  questions_id INTEGER,
  parent_id INTEGER,
  users_id INTEGER,
  FOREIGN KEY (questions_id) REFERENCES questions(id),
  FOREIGN KEY (parent_id) REFERENCES replies(id),
  FOREIGN KEY (users_id) REFERENCES users(id)
);

CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  users_id INTEGER NOT NULL, 
  questions_id INTEGER NOT NULL,

  FOREIGN KEY (users_id) REFERENCES users(id),
  FOREIGN KEY (questions_id) REFERENCES questions(id)
); 

INSERT INTO users(id, fname, lname)
values (1, 'George', 'Washington'), 
(2, 'Britney', 'Spears'); 

INSERT INTO questions(id, title, body, users_id)
values (1, 'phone?', 'What is a phone?', 1), 
(2, 'vacation', 'When can we go to Hawaii?', 2),
(3, 'bike','How do I ride a bike?', 1);

INSERT INTO question_follows(relationships, users_id, questions_id)
values (1, 1, 2),
(2, 1, 1),
(3, 2, 1);

INSERT INTO replies(id, body, questions_id, parent_id, users_id)
values (1, 'a phone helps you talk to people', 1 ,NULL , 2),
(2, 'Thanks', 1, 1, 1); 

INSERT INTO question_likes(id, users_id, questions_id)
values (1, 1, 2),
(2, 2, 2),
(3, 1, 3);




