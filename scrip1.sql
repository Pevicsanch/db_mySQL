CREATE DATABASE IF NOT EXISTS library;
USE library;
DROP TABLE IF EXISTS Loan;
DROP TABLE IF EXISTS Book;
DROP TABLE IF EXISTS Clients;
DROP TABLE IF EXISTS Topic;
DROP TABLE IF EXISTS Publishing_house;
DROP TABLE IF EXISTS Author;

CREATE TABLE Author (
	idauthor INT NOT NULL AUTO_INCREMENT,
	NameAuthor VARCHAR(60) NOT NULL,
	PRIMARY KEY (idauthor)
) ENGINE=InnoDB;

CREATE TABLE Publishing_house (
	idpublishing INT NOT NULL AUTO_INCREMENT,
	Namepublishing VARCHAR(30) NOT NULL,
	Address VARCHAR (100) NOT NULL,
	Telephone VARCHAR (15) NOT NULL, 
 	PRIMARY KEY (idpublishing)
) ENGINE=InnoDB;

CREATE TABLE Topic (
	idTopic INT NOT NULL AUTO_INCREMENT,
	NameTopic VARCHAR(30) NOT NULL,
	PRIMARY KEY (idTopic)
) ENGINE=InnoDB;

CREATE TABLE Clients (
	idClient INT NOT NULL AUTO_INCREMENT,
	NameClients VARCHAR(60) NOT NULL,
	Address VARCHAR(100) NOT NULL,
	Email VARCHAR(60) NULL DEFAULT 'non E-mail',
	Telephone VARCHAR(15) NOT NULL,
	PRIMARY KEY (idClient)
) ENGINE=InnoDB;

CREATE TABLE Book (
	idBook INT NOT NULL AUTO_INCREMENT,
	ISBN VARCHAR(20) NOT NULL UNIQUE,
	Title VARCHAR(100) NOT NULL,
	NumberExemplars TINYINT NOT NULL,
	idauthor INT NOT NULL,
	idpublishing INT NOT NULL,
	idTopic INT NOT NULL,
	PRIMARY KEY (idBook),
	FOREIGN KEY (idauthor) REFERENCES Author (idauthor) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (idpublishing) REFERENCES Publishing_house (idpublishing) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (idTopic) REFERENCES Topic (idTopic) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE Loan (
	idLoan INT NOT NULL AUTO_INCREMENT,
	DateLoan DATE NOT NULL,
	DateDeliver DATE NOT NULL,
	idClient INT NOT NULL,
	idBook INT NOT NULL,
	PRIMARY KEY (idLoan),
	FOREIGN KEY (idClient) REFERENCES Clients (idClient) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (idBook) REFERENCES Book (idBook) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

INSERT INTO `Clients` (`NameClients`,`Address`,`Email`,`Telephone`)
VALUES
  ("Ryder Steele","P.O. Box 158, 4634 A, Ave","tempor.lorem@outlook.edu","03 28 13 11 45"),
  ("Keaton Hyde","Ap #457-4440 Nec, Ave","augue.ut@outlook.net","07 74 65 60 63"),
  ("Marah Gallagher","7181 Sed Road","sed.pharetra@google.edu","09 37 78 81 29"),
  ("Tyrone Barker","P.O. Box 410, 178 Vel, Av.","luctus.lobortis@icloud.net","08 45 23 53 47"),
  ("Iliana Tillman","7289 A Ave","et.magna@aol.couk","01 56 81 84 57");
  
  INSERT INTO `Author` (`NameAuthor`)
VALUES
  ("Alea Simoes"),
  ("Demetrius Marques"),
  ("Plato Santiago"),
  ("Nehru Fonseca"),
  ("India Batista");
  
  INSERT INTO `Publishing_house` (`NamePublishing`,`Address`,`Telephone`)
VALUES
  ("Sed Diam Industries","Ap #342-8254 Erat Ave","(033022) 028761"),
  ("Enim Sit Amet Foundation","Ap #225-1004 Aliquam, Rd.","(051) 80819248"),
  ("In Consequat LLP","900 Vulputate St.","(08379) 5999232"),
  ("Semper Cursus LLP","159-736 Consectetuer, Rd.","(056) 72455721");

INSERT INTO `Topic` (`NameTopic`)
VALUES
  ("Graphic novel"),
  ("Philosophy"),
  ("Autobiography"),
  ("Classic"),
  ("Crime");
INSERT INTO Book (`ISBN`, `Title`, `NumberExemplars`, `idauthor`, `idpublishing`, `idTopic`) VALUES  
('944725406-3', 'R.S.V.P. ', 1, 3, 4, 5),
('486432848-X', 'Saint of Fort Washington', 0, 2, 3, 2),
('407309289-8', 'Prodigal Sons', 3, 1, 2, 1),
('293673365-0', 'Hustler White', 1, 3, 1, 1),
('137445174-6', 'Death of a Salesman', 5, 1, 2, 2),
('253848396-4', 'Better Off Dead.', 3, 1, 4, 3),
('399881251-2', 'Jekyll & Hyde', 1, 1, 1, 4),
('205833031-5', 'Play Dirty', 5, 2, 3, 4),
('089984664-5', 'After the Thin Man', 0, 1, 3, 4),
('742307038-6', 'Playing for Keeps', 0, 5, 4, 5);

INSERT INTO `Loan` (`DateLoan`,`DateDeliver`,`IdClient`,`idBook`)
VALUES
  ("14-01-21","02-02-21",4,5),
  ("24-01-21","03-02-21",2,6),
  ("01-01-21","14-02-21",2,4),
  ("02-01-21","02-02-21",2,3),
  ("31-01-21","01-02-21",3,7),
  ("09-01-21","02-02-21",2,3),
  ("01-02-21","15-02-21",5,7);


