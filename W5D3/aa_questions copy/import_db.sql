PRAGMA foreign_keys = ON;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname TEXT NOT NULL,
  lname TEXT NOT NULL
);

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title TEXT,
  body TEXT,
  author_id INTEGER NOT NULL,

  FOREIGN KEY (author_id) REFERENCES users(id)
);

CREATE TABLE questions_follows (
  id INTEGER PRIMARY KEY,
  follower_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (follower_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  body TEXT,
  question_reference_id INTEGER NOT NULL,
  user_reference_id INTEGER NOT NULL,
  parent_reply_id INTEGER,

  FOREIGN KEY (question_reference_id) REFERENCES questions(id),
  FOREIGN KEY (user_reference_id) REFERENCES users(id),
  FOREIGN KEY (parent_reply_id) REFERENCES replies(id)
);

CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  user_reference_id INTEGER NOT NULL,
  question_reference_id INTEGER NOT NULL,

  FOREIGN KEY (user_reference_id) REFERENCES users(id),
  FOREIGN KEY (question_reference_id) REFERENCES questions(id)
);



INSERT INTO
  users (fname, lname)
VALUES
  ('Terry', 'Thind'),
  ('Andy', 'Huang');

INSERT INTO
  questions (title, body, author_id)
VALUES
  ('Why', 'my code don''t work', 1),
  ('Camera', 'my camera don''t work', 2);


INSERT INTO
  questions_follows (follower_id, question_id)
VALUES
  (1,1),
  (2,2),
  (1,2);

INSERT INTO
  replies (body, question_reference_id, user_reference_id, parent_reply_id)
VALUES
  ('you''re bad', 1, 2, NULL),
  ('That''s not a question?', 2, 1, NULL);

INSERT INTO
  question_likes (user_reference_id, question_reference_id)
VALUES
  (1, 1),
  (2, 1),
  (1, 2);



  
