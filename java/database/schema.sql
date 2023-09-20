BEGIN TRANSACTION;

DROP TABLE IF EXISTS users;

CREATE TABLE users (
	user_id SERIAL,
	username varchar(50) NOT NULL UNIQUE,
	password_hash varchar(200) NOT NULL,
	role varchar(50) NOT NULL,
	CONSTRAINT PK_user PRIMARY KEY (user_id)
);

CREATE TABLE categories (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL
);

CREATE TABLE quizzes (
    quiz_id SERIAL PRIMARY KEY,
    category_id INTEGER,
    question varchar(250) NOT NULL,
    answer varchar(250) NOT NULL,
    CONSTRAINT fk_category FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

CREATE TABLE users_quizzes (
    user_id INTEGER,
    quiz_id INTEGER,
    PRIMARY KEY (user_id, quiz_id),
    CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES users(user_id),
    CONSTRAINT fk_quiz FOREIGN KEY (quiz_id) REFERENCES quizzes(quiz_id)
);

COMMIT TRANSACTION;
