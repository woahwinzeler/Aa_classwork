CREATE TABLE users(
  id INTEGER PRIMARY KEY,
  fname TEXT NOT NULL,
  lastname TEXT NOT NULL
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
  FOREIGN KEY (parent_id) REFERENCES replies(id)
  FOREIGN KEY (users_id) REFERENCES users(id)
);

