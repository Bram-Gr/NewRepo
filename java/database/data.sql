BEGIN TRANSACTION;

INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');


INSERT INTO categories (category_name) VALUES ('movies');

INSERT INTO quizzes (category_id, question, answer) VALUES
(1, 'Who directed the movie "Pulp Fiction"?', 'Quentin Tarantino'),
(1, 'In which movie did Tom Hanks play the character Forrest Gump?', 'Forrest Gump'),
(1, 'Which actor portrayed the character Tony Stark in the Marvel Cinematic Universe?', 'Robert Downey Jr.'),
(1, 'What is the highest-grossing film of all time (as of 2021)?', 'Avatar'),
(1, 'Which film won the Academy Award for Best Picture in 2020?', 'Parasite');


INSERT INTO categories (category_name) VALUES ('science');

INSERT INTO quizzes (category_id, question, answer) VALUES
(2, 'What is the chemical symbol for the element gold?', 'Au'),
(2, 'Who is known as the father of modern physics?', 'Albert Einstein'),
(2, 'What is the smallest planet in our solar system?', 'Mercury'),
(2, 'What gas do plants absorb from the atmosphere during photosynthesis?', 'Carbon dioxide'),
(2, 'What is the largest organ in the human body?', 'Skin');


INSERT INTO categories (category_name) VALUES ('music');

INSERT INTO quizzes (category_id, question, answer) VALUES
(3, 'Which British rock band released the album "The Dark Side of the Moon"?', 'Pink Floyd'),
(3, 'Who is often referred to as the "King of Pop"?', 'Michael Jackson'),
(3, 'What instrument did Jimi Hendrix famously play?', 'Electric guitar'),
(3, 'Which female artist released the album "1989"?', 'Taylor Swift'),
(3, 'What was the first music video ever played on MTV?', 'Video Killed the Radio Star');


INSERT INTO categories (category_name) VALUES ('history');

INSERT INTO quizzes (category_id, question, answer) VALUES
(4, 'Who was the first President of the United States?', 'George Washington'),
(4, 'In which year did Christopher Columbus first voyage to the Americas?', '1492'),
(4, 'Who was the leader of the Soviet Union during the Cuban Missile Crisis?', 'Nikita Khrushchev'),
(4, 'Which ancient civilization built the Great Wall of China?', 'Chinese'),
(4, 'Who wrote the "I Have a Dream" speech delivered during the Civil Rights March on Washington?', 'Martin Luther King Jr.');

INSERT INTO categories (category_name) VALUES ('art');

INSERT INTO quizzes (category_id, question, answer) VALUES
(5, 'Who painted the Mona Lisa?', 'Leonardo da Vinci'),
(5, 'Which art movement is characterized by melting clocks and distorted imagery?', 'Surrealism'),
(5, 'Which famous artist is known for his series of paintings of water lilies?', 'Claude Monet'),
(5, 'Who sculpted the statue of David?', 'Michelangelo'),
(5, 'Which artist is famous for his use of "starry night" and swirling, turbulent sky?', 'Vincent van Gogh');

COMMIT TRANSACTION;
