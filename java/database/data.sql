BEGIN TRANSACTION;

INSERT INTO users (username,password_hash,role) VALUES ('user','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_USER');
INSERT INTO users (username,password_hash,role) VALUES ('admin','$2a$08$UkVvwpULis18S19S5pZFn.YHPZt3oaqHZnDwqbCW9pft6uFtkXKDC','ROLE_ADMIN');


INSERT INTO categories (category_name) VALUES ('movies');

INSERT INTO quizzes (category_id, quiz_name, question, answer) VALUES
(1, 'Marvel Movie Quiz', 'In which Marvel film does Tony Stark say, ''I am Iron Man'' at the end?', 'Iron Man'),
(1, 'Marvel Movie Quiz', 'Who plays the character Thor in the Marvel Cinematic Universe?', 'Chris Hemsworth'),
(1, 'Marvel Movie Quiz', 'Which character is known as the ''God of Mischief'' in the Marvel universe?', 'Loki'),
(1, 'Marvel Movie Quiz', 'In which Marvel film does the Avengers fight against the Chitauri invasion of New York?', 'The Avengers'),
(1, 'Marvel Movie Quiz', 'Which Marvel movie features the character Natasha Romanoff, also known as Black Widow?', 'Black Widow');

INSERT INTO quizzes (category_id, quiz_name, question, answer) VALUES
(1, '80s Movie Quiz', 'Which actor played the character Marty McFly in the "Back to the Future" series?', 'Michael J. Fox'),
(1, '80s Movie Quiz', 'In which 1984 film did Arnold Schwarzenegger famously say, ''I''ll be back.''', 'The Terminator'),
(1, '80s Movie Quiz', 'Who directed the 1980 film ''The Shining'' based on Stephen King''s novel?', 'Stanley Kubrick'),
(1, '80s Movie Quiz', 'Which 1985 adventure-comedy film featured a group of kids searching for buried pirate treasure?', 'The Goonies'),
(1, '80s Movie Quiz', 'Which 1986 movie starred Tom Cruise as a fighter pilot named Maverick?', 'Top Gun');

INSERT INTO categories (category_name) VALUES ('science');

INSERT INTO quizzes (category_id, quiz_name, question, answer) VALUES
(2, 'Periodic Table Quiz', 'What is the chemical symbol for the element with atomic number 1?', 'H'),
(2, 'Periodic Table Quiz', 'Which element is the lightest noble gas?', 'Helium'),
(2, 'Periodic Table Quiz', 'What is the chemical symbol for the element commonly used in light bulbs?', 'Tungsten'),
(2, 'Periodic Table Quiz', 'Which element has the chemical symbol ''Na''?', 'Sodium'),
(2, 'Periodic Table Quiz', 'What is the atomic number of carbon?', '6');

INSERT INTO quizzes (category_id, quiz_name, question, answer) VALUES
(2, 'Space Quiz', 'Which planet in our solar system is known as the ''Red Planet''?', 'Mars'),
(2, 'Space Quiz', 'What is the largest planet in our solar system?', 'Jupiter'),
(2, 'Space Quiz', 'Which celestial body is Earth''s natural satellite?', 'Moon'),
(2, 'Space Quiz', 'What is the name of the galaxy that contains our solar system?', 'Milky Way'),
(2, 'Space Quiz', 'What is the process by which a star exhausts its nuclear fuel and collapses under gravity?', 'Supernova');


INSERT INTO categories (category_name) VALUES ('music');

INSERT INTO quizzes (category_id, quiz_name, question, answer) VALUES
(3, 'Classical Music Quiz', 'Who composed ''Symphony No. 9 in D minor, Op. 125,'' also known as the ''Choral Symphony''?', 'Ludwig van Beethoven'),
(3, 'Classical Music Quiz', 'Which composer is famous for ''The Four Seasons''?', 'Antonio Vivaldi'),
(3, 'Classical Music Quiz', 'What is the name of Wolfgang Amadeus Mozart''s most famous Requiem Mass?', 'Requiem in D minor, K. 626'),
(3, 'Classical Music Quiz', 'Which Russian composer wrote ''Swan Lake'' and ''The Nutcracker''?', 'Pyotr Ilyich Tchaikovsky'),
(3, 'Classical Music Quiz', 'Who composed ''The Magic Flute,'' an opera in two acts?', 'Wolfgang Amadeus Mozart');

INSERT INTO quizzes (category_id, quiz_name, question, answer) VALUES
(3, 'Power Metal Quiz', 'Which power metal band released the album "The Power Within" in 2012?', 'DragonForce'),
(3, 'Power Metal Quiz', 'What is the name of the lead vocalist for the band Helloween?', 'Andi Deris'),
(3, 'Power Metal Quiz', 'Which power metal band is known for songs like "Through the Fire and Flames" and "Fury of the Storm"?', 'DragonForce'),
(3, 'Power Metal Quiz', 'What is the name of the Finnish power metal band formed in 1996, known for their symphonic elements?', 'Sonata Arctica'),
(3, 'Power Metal Quiz', 'Which German power metal band released the album "Keeper of the Seven Keys: Part II" in 1988?', 'Helloween');

INSERT INTO categories (category_name) VALUES ('history');

INSERT INTO quizzes (category_id, quiz_name, question, answer) VALUES
(4, 'US History Quiz', 'Who was the first President of the United States?', 'George Washington'),
(4, 'US History Quiz', 'In which year did the United States declare its independence from Great Britain?', '1776'),
(4, 'US History Quiz', 'Who was the leader of the Soviet Union during the Cuban Missile Crisis?', 'Nikita Khrushchev'),
(4, 'US History Quiz', 'Which ancient civilization built the Great Wall of China?', 'Chinese'),
(4, 'US History Quiz', 'Who wrote the "I Have a Dream" speech delivered during the Civil Rights March on Washington?', 'Martin Luther King Jr.');

INSERT INTO quizzes (category_id, quiz_name, question, answer) VALUES
(4, 'Pirates Quiz', 'Who was one of the most famous pirates of the Golden Age of Piracy, known for his flag featuring a skull and crossbones?', 'Blackbeard'),
(4, 'Pirates Quiz', 'Which pirate was captured and executed in Charleston, South Carolina, in 1718?', 'Stede Bonnet'),
(4, 'Pirates Quiz', 'What is the term for the pirate code or a set of rules and regulations commonly used among pirate crews?', 'Pirate Code'),
(4, 'Pirates Quiz', 'Which female pirate terrorized the Caribbean in the early 18th century and was known for disguising herself as a man?', 'Anne Bonny'),
(4, 'Pirates Quiz', 'Which pirate, also known as "Calico Jack," was famous for having two female pirates, Anne Bonny and Mary Read, in his crew?', 'Jack Rackham');

INSERT INTO categories (category_name) VALUES ('art');

INSERT INTO quizzes (category_id, quiz_name, question, answer) VALUES
(5, 'Italian Renaissance Art Quiz', 'Who painted the famous fresco "The Last Supper" in the Convent of Santa Maria delle Grazie, Milan?', 'Leonardo da Vinci'),
(5, 'Italian Renaissance Art Quiz', 'Who is known for creating the sculpture of "David" and painting the Sistine Chapel ceiling?', 'Michelangelo'),
(5, 'Italian Renaissance Art Quiz', 'Which Italian painter is known for works like "The Birth of Venus" and "Primavera"?', 'Sandro Botticelli'),
(5, 'Italian Renaissance Art Quiz', 'Who is considered the "Father of the High Renaissance" and painted "The School of Athens" in the Vatican?', 'Raphael'),
(5, 'Italian Renaissance Art Quiz', 'Which Italian artist and inventor is famous for the "Vitruvian Man" and the "Mona Lisa"?', 'Leonardo da Vinci');

INSERT INTO quizzes (category_id, quiz_name, question, answer) VALUES
(5, 'Pop Culture Quiz', 'Which American singer is known as the "Queen of Pop" and has hits like "Like a Virgin" and "Material Girl"?', 'Madonna'),
(5, 'Pop Culture Quiz', 'What is the name of the fictional wizarding school attended by Harry Potter and his friends?', 'Hogwarts School of Witchcraft and Wizardry'),
(5, 'Pop Culture Quiz', 'Which actor played the character Tony Stark/Iron Man in the Marvel Cinematic Universe?', 'Robert Downey Jr.'),
(5, 'Pop Culture Quiz', 'In the TV series "Friends," what is the name of Ross and Monica''s dog?', 'Chi-Chi'),
(5, 'Pop Culture Quiz', 'Who is known for creating the animated TV series "The Simpsons"?', 'Matt Groening');

COMMIT TRANSACTION;
