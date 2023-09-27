BEGIN TRANSACTION;

INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');

BEGIN TRANSACTION;

-- Insert categories
INSERT INTO categories (category_name) VALUES ('movies');
INSERT INTO categories (category_name) VALUES ('science');
INSERT INTO categories (category_name) VALUES ('music');
INSERT INTO categories (category_name) VALUES ('history');
INSERT INTO categories (category_name) VALUES ('art');
INSERT INTO categories (category_name) VALUES ('Custom Quizzes');

-- Insert quizzes
-- Marvel Movie Quiz
INSERT INTO quizzes (category_id, quiz_name) VALUES (1, 'Marvel Movie Quiz') RETURNING quiz_id;
-- 80s Movie Quiz
INSERT INTO quizzes (category_id, quiz_name) VALUES (1, '80s Movie Quiz') RETURNING quiz_id;
-- Periodic Table Quiz
INSERT INTO quizzes (category_id, quiz_name) VALUES (2, 'Periodic Table Quiz') RETURNING quiz_id;
-- Space Quiz
INSERT INTO quizzes (category_id, quiz_name) VALUES (2, 'Space Quiz') RETURNING quiz_id;
-- Classical Music Quiz
INSERT INTO quizzes (category_id, quiz_name) VALUES (3, 'Classical Music Quiz') RETURNING quiz_id;
-- Power Metal Quiz
INSERT INTO quizzes (category_id, quiz_name) VALUES (3, 'Power Metal Quiz') RETURNING quiz_id;
-- US History Quiz
INSERT INTO quizzes (category_id, quiz_name) VALUES (4, 'US History Quiz') RETURNING quiz_id;
-- Pirates Quiz
INSERT INTO quizzes (category_id, quiz_name) VALUES (4, 'Pirates Quiz') RETURNING quiz_id;
-- Italian Renaissance Art Quiz
INSERT INTO quizzes (category_id, quiz_name) VALUES (5, 'Italian Renaissance Art Quiz') RETURNING quiz_id;
-- Pop Culture Quiz
INSERT INTO quizzes (category_id, quiz_name) VALUES (5, 'Pop Culture Quiz') RETURNING quiz_id;

-- Insert quiz questions and answers
-- Use the generated quiz_id for each set of questions and answers
-- Example:
INSERT INTO questions (quiz_id, question, answer) VALUES
    (1, 'In which Marvel film does Tony Stark say, ''I am Iron Man'' at the end?', 'Iron Man'),
    (1, 'Who plays the character Thor in the Marvel Cinematic Universe?', 'Chris Hemsworth'),
    (1, 'Which character is known as the ''God of Mischief'' in the Marvel universe?', 'Loki'),
    (1, 'In which Marvel film does the Avengers fight against the Chitauri invasion of New York?', 'The Avengers'),
    (1, 'Which Marvel movie features the character Natasha Romanoff, also known as Black Widow?', 'Black Widow');
    -- Add more questions and answers for Marvel Movie Quiz here

INSERT INTO questions (quiz_id, question, answer) VALUES
(2, 'Which actor played the character Marty McFly in the "Back to the Future" series?', 'Michael J. Fox'),
(2, 'In which 1984 film did Arnold Schwarzenegger famously say, ''I''ll be back.''', 'The Terminator'),
(2, 'Who directed the 1980 film ''The Shining'' based on Stephen King''s novel?', 'Stanley Kubrick'),
(2, 'Which 1985 adventure-comedy film featured a group of kids searching for buried pirate treasure?', 'The Goonies'),
(2, 'Which 1986 movie starred Tom Cruise as a fighter pilot named Maverick?', 'Top Gun');

INSERT INTO questions (quiz_id, question, answer) VALUES
(3, 'What is the chemical symbol for the element with atomic number 1?', 'H'),
(3, 'Which element is the lightest noble gas?', 'Helium'),
(3, 'What is the chemical symbol for the element commonly used in light bulbs?', 'Tungsten'),
(3, 'Which element has the chemical symbol ''Na''?', 'Sodium'),
(3, 'What is the atomic number of carbon?', '6');

INSERT INTO questions (quiz_id, question, answer) VALUES
(4, 'Which planet in our solar system is known as the ''Red Planet''?', 'Mars'),
(4, 'What is the largest planet in our solar system?', 'Jupiter'),
(4, 'Which celestial body is Earth''s natural satellite?', 'Moon'),
(4, 'What is the name of the galaxy that contains our solar system?', 'Milky Way'),
(4, 'What is the process by which a star exhausts its nuclear fuel and collapses under gravity?', 'Supernova');

INSERT INTO questions (quiz_id, question, answer) VALUES
(5, 'Who composed ''Symphony No. 9 in D minor, Op. 125,'' also known as the ''Choral Symphony''?', 'Ludwig van Beethoven'),
(5, 'Which composer is famous for ''The Four Seasons''?', 'Antonio Vivaldi'),
(5, 'What is the name of Wolfgang Amadeus Mozart''s most famous Requiem Mass?', 'Requiem in D minor, K. 626'),
(5, 'Which Russian composer wrote ''Swan Lake'' and ''The Nutcracker''?', 'Pyotr Ilyich Tchaikovsky'),
(5, 'Who composed ''The Magic Flute,'' an opera in two acts?', 'Wolfgang Amadeus Mozart');

INSERT INTO questions (quiz_id, question, answer) VALUES
(6, 'Which power metal band released the album "The Power Within" in 2012?', 'DragonForce'),
(6, 'What is the name of the lead vocalist for the band Helloween?', 'Andi Deris'),
(6, 'Which power metal band is known for songs like "Through the Fire and Flames" and "Fury of the Storm"?', 'DragonForce'),
(6, 'What is the name of the Finnish power metal band formed in 1996, known for their symphonic elements?', 'Sonata Arctica'),
(6, 'Which German power metal band released the album "Keeper of the Seven Keys: Part II" in 1988?', 'Helloween');

INSERT INTO questions (quiz_id, question, answer) VALUES
(7, 'Who was the first President of the United States?', 'George Washington'),
(7, 'In which year did the United States declare its independence from Great Britain?', '1776'),
(7, 'Who was the leader of the Soviet Union during the Cuban Missile Crisis?', 'Nikita Khrushchev'),
(7, 'Which ancient civilization built the Great Wall of China?', 'Chinese'),
(7, 'Who wrote the "I Have a Dream" speech delivered during the Civil Rights March on Washington?', 'Martin Luther King Jr.');

INSERT INTO questions (quiz_id, question, answer) VALUES
(8, 'Who was one of the most famous pirates of the Golden Age of Piracy, known for his flag featuring a skull and crossbones?', 'Blackbeard'),
(8, 'Which pirate was captured and executed in Charleston, South Carolina, in 1718?', 'Stede Bonnet'),
(8, 'What is the term for the pirate code or a set of rules and regulations commonly used among pirate crews?', 'Pirate Code'),
(8, 'Which female pirate terrorized the Caribbean in the early 18th century and was known for disguising herself as a man?', 'Anne Bonny'),
(8, 'Which pirate, also known as "Calico Jack," was famous for having two female pirates, Anne Bonny and Mary Read, in his crew?', 'Jack Rackham');

INSERT INTO questions (quiz_id, question, answer) VALUES
(9, 'Who painted the famous fresco "The Last Supper" in the Convent of Santa Maria delle Grazie, Milan?', 'Leonardo da Vinci'),
(9, 'Who is known for creating the sculpture of "David" and painting the Sistine Chapel ceiling?', 'Michelangelo'),
(9, 'Which Italian painter is known for works like "The Birth of Venus" and "Primavera"?', 'Sandro Botticelli'),
(9, 'Who is considered the "Father of the High Renaissance" and painted "The School of Athens" in the Vatican?', 'Raphael'),
(9, 'Which Italian artist and inventor is famous for the "Vitruvian Man" and the "Mona Lisa"?', 'Leonardo da Vinci');

INSERT INTO questions (quiz_id, question, answer) VALUES
(10, 'Which American singer is known as the "Queen of Pop" and has hits like "Like a Virgin" and "Material Girl"?', 'Madonna'),
(10, 'What is the name of the fictional wizarding school attended by Harry Potter and his friends?', 'Hogwarts School of Witchcraft and Wizardry'),
(10, 'Which actor played the character Tony Stark/Iron Man in the Marvel Cinematic Universe?', 'Robert Downey Jr.'),
(10, 'In the TV series "Friends," what is the name of Ross and Monica''s dog?', 'Chi-Chi'),
(10, 'Who is known for creating the animated TV series "The Simpsons"?', 'Matt Groening');
COMMIT TRANSACTION;



