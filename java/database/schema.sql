

BEGIN TRANSACTION;

DROP TABLE IF EXISTS users CASCADE;
DROP TABLE IF EXISTS categories CASCADE;
DROP TABLE IF EXISTS quizzes CASCADE;
DROP TABLE IF EXISTS questions CASCADE;
DROP TABLE IF EXISTS users_quizzes CASCADE;

CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password_hash VARCHAR(200) NOT NULL,
    role VARCHAR(50) NOT NULL
);

CREATE TABLE categories (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL
);

CREATE TABLE quizzes (
    quiz_id SERIAL PRIMARY KEY,
    quiz_name VARCHAR(250),
    category_id INTEGER,
    CONSTRAINT fk_category FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

CREATE TABLE questions (
    question_id SERIAL PRIMARY KEY,
    quiz_id INTEGER,
    question VARCHAR(2000) NOT NULL,
    answer VARCHAR(2000) NOT NULL,
    CONSTRAINT fk_quiz FOREIGN KEY (quiz_id) REFERENCES quizzes(quiz_id)
);

CREATE TABLE users_quizzes (
    user_id INTEGER,
    quiz_id INTEGER,
    CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES users(user_id),
    CONSTRAINT fk_quiz FOREIGN KEY (quiz_id) REFERENCES quizzes(quiz_id)
);

COMMIT TRANSACTION;