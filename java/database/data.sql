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
INSERT INTO quizzes (category_id, quiz_name) VALUES (1, '80s Movies') RETURNING quiz_id;
-- Horror Movie Quiz
INSERT INTO quizzes (category_id, quiz_name) VALUES (1, 'Horror Movies') RETURNING quiz_id;
-- Classic Movie Quiz
INSERT INTO quizzes (category_id, quiz_name) VALUES (1, 'Classic Movies') RETURNING quiz_id;
-- Periodic Table Quiz
INSERT INTO quizzes (category_id, quiz_name) VALUES (2, 'Periodic Table') RETURNING quiz_id;
-- Space Quiz
INSERT INTO quizzes (category_id, quiz_name) VALUES (2, 'Space Quiz') RETURNING quiz_id;
-- Tech Quiz
INSERT INTO quizzes (category_id, quiz_name) VALUES (2, 'Tech Facts') RETURNING quiz_id;
-- Bio Quiz
INSERT INTO quizzes (category_id, quiz_name) VALUES (2, 'Biology Quiz') RETURNING quiz_id;
-- Classical Music Quiz
INSERT INTO quizzes (category_id, quiz_name) VALUES (3, 'Classical Music') RETURNING quiz_id;
-- Power Metal Quiz
INSERT INTO quizzes (category_id, quiz_name) VALUES (3, 'Power Metal') RETURNING quiz_id;
-- Guitar Quiz
INSERT INTO quizzes (category_id, quiz_name) VALUES (3, 'Guitar') RETURNING quiz_id;
-- US History Quiz
INSERT INTO quizzes (category_id, quiz_name) VALUES (4, 'US History') RETURNING quiz_id;
-- Pirates Quiz
INSERT INTO quizzes (category_id, quiz_name) VALUES (4, 'Pirates Quiz') RETURNING quiz_id;
-- Ancient Egypt Quiz
INSERT INTO quizzes (category_id, quiz_name) VALUES (4, 'Ancient Egypt') RETURNING quiz_id;
-- Ancient Greece Quiz
INSERT INTO quizzes (category_id, quiz_name) VALUES (4, 'Ancient Greece') RETURNING quiz_id;
-- Italian Renaissance Art Quiz
INSERT INTO quizzes (category_id, quiz_name) VALUES (5, 'Italian Renaissance Art') RETURNING quiz_id;
-- Pop Culture Quiz
INSERT INTO quizzes (category_id, quiz_name) VALUES (5, 'Pop Culture') RETURNING quiz_id;
-- Van Gogh Quiz
INSERT INTO quizzes (category_id, quiz_name) VALUES (5, 'Van Gogh Quiz') RETURNING quiz_id;
-- Dali Quiz
INSERT INTO quizzes (category_id, quiz_name) VALUES (5, 'Dali Quiz') RETURNING quiz_id;
-- Photography Quiz
INSERT INTO quizzes (category_id, quiz_name) VALUES (5, 'Photography Quiz') RETURNING quiz_id;


-- Insert quiz questions and answers
-- Use the generated quiz_id for each set of questions and answers
-- Example:
INSERT INTO questions (quiz_id, question, answer) VALUES
    (1, 'In which Marvel film does Tony Stark say, ''I am Iron Man'' at the end?', 'Iron Man'),
    (1, 'Who plays the character Thor in the Marvel Cinematic Universe?', 'Chris Hemsworth'),
    (1, 'Which character is known as the ''God of Mischief'' in the Marvel universe?', 'Loki'),
    (1, 'In which Marvel film does the Avengers fight against the Chitauri invasion of New York?', 'The Avengers'),
    (1, 'Which Marvel movie features the character Natasha Romanoff, also known as Black Widow?', 'Black Widow');

INSERT INTO questions (quiz_id, question, answer) VALUES
(2, 'Which actor played the character Marty McFly in the "Back to the Future" series?', 'Michael J. Fox'),
(2, 'In which 1984 film did Arnold Schwarzenegger famously say, ''I''ll be back.''', 'The Terminator'),
(2, 'Who directed the 1980 film ''The Shining'' based on Stephen King''s novel?', 'Stanley Kubrick'),
(2, 'Which 1985 adventure-comedy film featured a group of kids searching for buried pirate treasure?', 'The Goonies'),
(2, 'Which 1986 movie starred Tom Cruise as a fighter pilot named Maverick?', 'Top Gun');

INSERT INTO questions (quiz_id, question, answer) VALUES
    (3, 'Which horror film features a killer doll named Chucky?', 'Child''s Play'),
    (3, 'In what movie does a family encounter supernatural activity after moving into a haunted house in Long Island, New York?', 'The Amityville Horror'),
    (3, 'What classic horror film is set in the fictional town of Woodsboro and features a Ghostface killer?', 'Scream'),
    (3, 'Who directed the 1973 horror film "The Exorcist"?', 'William Friedkin'),
    (3, 'Which horror movie features a character named Hannibal Lecter?', 'The Silence of the Lambs'),
    (3, 'In what film does a group of friends face paranormal entities after using a Ouija board?', 'The Exorcism of Emily Rose'),
    (3, 'What is the name of the hotel in Stephen King''s novel "The Shining" and its film adaptation?', 'The Overlook Hotel'),
    (3, 'What horror film franchise centers around a cursed videotape that leads to the viewer''s death in seven days?', 'The Ring');

INSERT INTO questions (quiz_id, question, answer) VALUES
    (4, 'Who played the role of Rick Blaine in the classic movie "Casablanca" (1942)?', 'Humphrey Bogart'),
    (4, 'In which classic film does Marilyn Monroe perform the song "Diamonds Are a Girl''s Best Friend"?', 'Gentlemen Prefer Blondes'),
    (4, 'Who directed the 1954 classic film "On the Waterfront"?', 'Elia Kazan'),
    (4, 'In the movie "Gone with the Wind" (1939), what is the name of Scarlett O''Hara''s plantation?', 'Tara'),
    (4, 'Which classic film features the iconic shower scene and is directed by Alfred Hitchcock?', 'Psycho'),
    (4, 'Who played the leading role of George Bailey in the classic film "It''s a Wonderful Life" (1946)?', 'James Stewart'),
    (4, 'In "Citizen Kane" (1941), what is the last word spoken by Charles Foster Kane?', 'Rosebud'),
    (4, 'What classic movie features the line "Here''s looking at you, kid"?', 'Casablanca');

INSERT INTO questions (quiz_id, question, answer) VALUES
(5, 'What is the chemical symbol for the element with atomic number 1?', 'H'),
(5, 'Which element is the lightest noble gas?', 'Helium'),
(5, 'What is the chemical symbol for the element commonly used in light bulbs?', 'Tungsten'),
(5, 'Which element has the chemical symbol ''Na''?', 'Sodium'),
(5, 'What is the atomic number of carbon?', '6');

INSERT INTO questions (quiz_id, question, answer) VALUES
(6, 'Which planet in our solar system is known as the ''Red Planet''?', 'Mars'),
(6, 'What is the largest planet in our solar system?', 'Jupiter'),
(6, 'Which celestial body is Earth''s natural satellite?', 'Moon'),
(6, 'What is the name of the galaxy that contains our solar system?', 'Milky Way'),
(6, 'What is the process by which a star exhausts its nuclear fuel and collapses under gravity?', 'Supernova');


INSERT INTO questions (quiz_id, question, answer) VALUES
    (7, 'Who is considered the father of modern computer science and artificial intelligence?', 'Alan Turing'),
    (7, 'In computer programming, what does the acronym "HTML" stand for?', 'Hypertext Markup Language'),
    (7, 'Which programming language was created by James Gosling at Sun Microsystems in the mid-1990s?', 'Java'),
    (7, 'What is the primary purpose of the Python programming language?', 'General-purpose programming'),
    (7, 'Who co-founded Apple Inc. with Steve Jobs and Steve Wozniak?', 'Steve Wozniak'),
    (7, 'In networking, what does the acronym "LAN" stand for?', 'Local Area Network'),
    (7, 'What is the term for a type of attack where an attacker impersonates a legitimate website to obtain sensitive information?', 'Phishing'),
    (7, 'Which operating system is developed by the Linux community?', 'Linux');


INSERT INTO questions (quiz_id, question, answer) VALUES
    (8, 'What is the powerhouse of the cell?', 'Mitochondria'),
    (8, 'Which molecule carries genetic information in cells?', 'DNA (Deoxyribonucleic Acid)'),
    (8, 'In the classification of living organisms, what comes after Kingdom?', 'Phylum'),
    (8, 'Which gas is primarily responsible for the greenhouse effect on Earth?', 'Carbon dioxide (CO2)'),
    (8, 'What is the largest organ in the human body?', 'Skin'),
    (8, 'Which scientist is known for developing the theory of evolution by natural selection?', 'Charles Darwin'),
    (8, 'What is the process by which plants make their own food using sunlight?', 'Photosynthesis'),
    (8, 'In the human body, where is the smallest bone located?', 'Ear (Stapes bone)');


INSERT INTO questions (quiz_id, question, answer) VALUES
(9, 'Who composed ''Symphony No. 9 in D minor, Op. 125,'' also known as the ''Choral Symphony''?', 'Ludwig van Beethoven'),
(9, 'Which composer is famous for ''The Four Seasons''?', 'Antonio Vivaldi'),
(9, 'What is the name of Wolfgang Amadeus Mozart''s most famous Requiem Mass?', 'Requiem in D minor, K. 626'),
(9, 'Which Russian composer wrote ''Swan Lake'' and ''The Nutcracker''?', 'Pyotr Ilyich Tchaikovsky'),
(9, 'Who composed ''The Magic Flute,'' an opera in two acts?', 'Wolfgang Amadeus Mozart');

INSERT INTO questions (quiz_id, question, answer) VALUES
(10, 'What band wrote the song Armata Strigoi?', 'Power Wolf'),
(10, 'What is the name of the lead vocalist for the band Helloween?', 'Andi Deris'),
(10, 'Which power metal band is known for songs like "Through the Fire and Flames" and "Fury of the Storm"?', 'DragonForce'),
(10, 'What is the name of the Finnish power metal band formed in 1996, known for their symphonic elements?', 'Sonata Arctica'),
(10, 'Which German power metal band released the album "Keeper of the Seven Keys: Part II" in 1988?', 'Helloween');


INSERT INTO questions (quiz_id, question, answer) VALUES
    (11, 'Which famous guitarist is known for playing a Stratocaster named "Blackie"?', 'Eric Clapton'),
    (11, 'In the world of electric guitars, what company produces the iconic Les Paul model?', 'Gibson'),
    (11, 'What is the name of the technique where a guitarist taps the fretboard with their fingers to produce notes?', 'Tapping'),
    (11, 'Which type of acoustic guitar body shape is known for its hourglass figure?', 'Dreadnought'),
    (11, 'Who is often referred to as the "King of the Blues" and is known for playing the Lucille model guitar?', 'B.B. King'),
    (11, 'Which guitarist is famous for using a technique called "hammer-ons" and "pull-offs"?', 'Eddie Van Halen'),
    (11, 'What is the name of the device used to change the pitch of the strings on a guitar?', 'Whammy bar'),
    (11, 'Which rock band''s lead guitarist, often known for his top hat and Les Paul guitar, is nicknamed "Slash"?', 'Guns N'' Roses');

INSERT INTO questions (quiz_id, question, answer) VALUES
(12, 'Who was the first President of the United States?', 'George Washington'),
(12, 'Who were the founding fathers?', 'George Washington, John Adams, Thomas Jefferson, Benjamin Franklin, James Madison, Alexander Hamilton, John Jay, Thomas Paine, John Hancock, Patrick Henry'),
(12, 'Who was President during the Cuban Missile Crisis?', 'John F. Kennedy'),
(12, 'When was the Declaration Of Independence written?', 'July 4th, 1776'),
(12, 'Who wrote the "I Have a Dream" speech delivered during the Civil Rights March on Washington?', 'Martin Luther King Jr.');

INSERT INTO questions (quiz_id, question, answer) VALUES
(13, 'Who was one of the most famous pirates of the Golden Age of Piracy, known for his flag featuring a skull and crossbones?', 'Blackbeard'),
(13, 'Which pirate was captured and executed in Charleston, South Carolina, in 1718?', 'Stede Bonnet'),
(13, 'What is the term for the pirate code or a set of rules and regulations commonly used among pirate crews?', 'Articles Of Piracy'),
(13, 'Which female pirate terrorized the Caribbean in the early 18th century and was known for disguising herself as a man?', 'Anne Bonny'),
(13, 'Which pirate, also known as "Calico Jack," was famous for having two female pirates, Anne Bonny and Mary Read, in his crew?', 'Jack Rackham');


INSERT INTO questions (quiz_id, question, answer) VALUES
    (14, 'Who was the last pharaoh of Ancient Egypt?', 'Cleopatra VII'),
    (14, 'Which ancient Egyptian structure is known as the "Step Pyramid"?', 'Djoser''s Pyramid'),
    (14, 'In what year did the construction of the Great Sphinx of Giza likely take place?', 'Approximately 2500 BCE'),
    (14, 'What is the name of the ancient Egyptian writing system that used logographic and alphabetic elements?', 'Hieroglyphics'),
    (14, 'Who is considered the "Father of Medicine" in ancient Egypt?', 'Imhotep'),
    (14, 'Which pharaoh is famous for his military campaigns and the construction of monumental temples at Abu Simbel?', 'Ramesses II'),
    (14, 'In what period of ancient Egyptian history did the famous boy king Tutankhamun rule?', 'New Kingdom'),
    (14, 'What is the ancient Egyptian name for the capital city that includes the Great Pyramids of Giza?', 'Memphis');

INSERT INTO questions (quiz_id, question, answer) VALUES
    (15, 'Who is considered the "Father of Western Philosophy" in Ancient Greece?', 'Socrates'),
    (15, 'Which city-state in Ancient Greece is known for its emphasis on military discipline and the agoge?', 'Sparta'),
    (15, 'In which famous battle did a small Athenian force defeat the much larger Persian army in 490 BCE?', 'Battle of Marathon'),
    (15, 'Who wrote the epic poems "The Iliad" and "The Odyssey" in Ancient Greece?', 'Homer'),
    (15, 'Which Ancient Greek mathematician is known for the Pythagorean theorem?', 'Pythagoras'),
    (15, 'What type of government was practiced in Athens during the 5th century BCE?', 'Democracy'),
    (15, 'Who was the student of Socrates and the teacher of Aristotle in Ancient Greece?', 'Plato'),
    (15, 'Which Ancient Greek city-state is often regarded as the birthplace of democracy?', 'Athens');

INSERT INTO questions (quiz_id, question, answer) VALUES
(16, 'Donatello, a prominent Italian Renaissance artist, was particularly known for his contributions to which artistic medium?', 'Sculpture'),
(16, 'Who is known for creating the sculpture of "David" and painting the Sistine Chapel ceiling?', 'Michelangelo'),
(16, 'Which Italian painter is known for works like "The Birth of Venus" and "Primavera"?', 'Sandro Botticelli'),
(16, 'Who is considered the "Father of the High Renaissance" and painted "The School of Athens" in the Vatican?', 'Raphael'),
(16, 'Which Italian artist and inventor is famous for the "Vitruvian Man" and the "Mona Lisa"?', 'Leonardo da Vinci');

INSERT INTO questions (quiz_id, question, answer) VALUES
(17, 'Which American singer is known as the "Queen of Pop" and has hits like "Like a Virgin" and "Material Girl"?', 'Madonna'),
(17, 'What is the name of the fictional wizarding school attended by Harry Potter and his friends?', 'Hogwarts School of Witchcraft and Wizardry'),
(17, 'Which actor played the character Tony Stark/Iron Man in the Marvel Cinematic Universe?', 'Robert Downey Jr.'),
(17, 'In the TV series "Friends," what is the name of Ross and Monica''s dog?', 'Chi-Chi'),
(17, 'Who is known for creating the animated TV series "The Simpsons"?', 'Matt Groening');
COMMIT TRANSACTION;


INSERT INTO questions (quiz_id, question, answer) VALUES
    (18, 'In which country was Vincent van Gogh born?', 'Netherlands'),
    (18, 'What is the title of Van Gogh''s famous painting depicting a night sky with swirling stars?', 'Starry Night'),
    (18, 'Van Gogh spent a significant part of his life in which European country?', 'France'),
    (18, 'Who was Van Gogh''s brother and supporter throughout his life?', 'Theo van Gogh'),
    (18, 'In which town did Van Gogh create many of his masterpieces, including Sunflowers and Cafe Terrace at Night?', 'Arles'),
    (18, 'What is the name of the institution where Van Gogh lived and created some of his most famous works before his death?', 'Saint-Paul-de-Mausole');

INSERT INTO questions (quiz_id, question, answer) VALUES
    (19, 'Which country was Salvador Dali born in?', 'Spain'),
    (19, 'What art movement is Salvador Dali associated with?', 'Surrealism'),
    (19, 'Dali is known for his distinctive mustache. What inspired him to grow it?', 'Inspired by 17th-century Spanish painter Diego Velazquez'),
    (19, 'Which famous painting by Dali features a melting clock?', 'The Persistence of Memory'),
    (19, 'Dalí collaborated with which famous filmmaker on the surrealistic short film "Un Chien Andalou"?', 'Luis Buñuel'),
    (19, 'What is the name of Dali''s wife, who was also his muse and frequent subject in his paintings?', 'Gala Dali'),
    (19, 'In addition to painting, Dali was involved in other forms of art, including designing the dream sequence in which Hitchcock film?', 'Spellbound'),
    (19, 'Dali worked on a project with the Disney studio, creating a short animated film. What is the title of the film?', 'Destino');

INSERT INTO questions (quiz_id, question, answer) VALUES
    (20, 'Who is credited with inventing the first practical photographic process in 1839?', 'Louis Daguerre'),
    (20, 'What does the acronym "ISO" stand for in photography?', 'International Standards Organization'),
    (20, 'Which camera brand is known for its iconic Leica cameras?', 'Leica'),
    (20, 'In photography, what is the term for the opening in a lens that controls the amount of light entering the camera?', 'Aperture'),
    (20, 'What does the term "bokeh" refer to in photography?', 'The aesthetic quality of the out-of-focus areas in an image'),
    (20, 'Which famous American photographer is known for her documentary photography during the Great Depression?', 'Dorothea Lange'),
    (20, 'In digital photography, what is the purpose of the RGB color model?', 'To represent colors using combinations of red, green, and blue'),
    (20, 'What is the process of gradually transitioning from one image to another called, often used in filmmaking and photography?', 'Dissolve');
COMMIT TRANSACTION;