CREATE DATABASE Trivial;
CREATE TABLE Trivial.Topics
(
    TopicID MEDIUMINT UNSIGNED NOT NULL AUTO_INCREMENT,
    Name VARCHAR(50) NOT NULL,
    Image VARCHAR(50) NULL,
    PRIMARY KEY (TopicID)
);
CREATE TABLE Trivial.Users
( 
    UserID MEDIUMINT UNSIGNED NOT NULL AUTO_INCREMENT, 
    Name VARCHAR(50) NOT NULL, 
    Password VARCHAR(50) NOT NULL,  
    Category MEDIUMINT NOT NULL, 
    PRIMARY KEY (UserID)
);
CREATE TABLE Trivial.Games
(
	GameID MEDIUMINT UNSIGNED NOT NULL AUTO_INCREMENT,
	UserID MEDIUMINT UNSIGNED NOT NULL,
	PRIMARY KEY (GameID),
	FOREIGN KEY (UserID) REFERENCES Users (UserID)
	ON DELETE CASCADE
);
CREATE TABLE Trivial.Ranks(
    RankID MEDIUMINT UNSIGNED NOT NULL,
    GameID MEDIUMINT UNSIGNED NOT NULL,
    Correct MEDIUMINT  NULL,
    Points MEDIUMINT NULL,
    FOREIGN KEY (RankID) REFERENCES Trivial.Users (UserID),
    FOREIGN KEY (GameID) REFERENCES Trivial.Games (GameID)
    ON DELETE CASCADE
);
CREATE TABLE Trivial.Questions
(
    QuestionID MEDIUMINT UNSIGNED NOT NULL AUTO_INCREMENT,
    TopicQuestion MEDIUMINT NOT NULL,
    Topic MEDIUMINT UNSIGNED NOT NULL,
    Question VARCHAR(100) NOT NULL,
    AnsCorrect VARCHAR(100) NOT NULL,
    AnsA VARCHAR(100) NOT NULL,
    AnsB VARCHAR(100) NOT NULL,
    AnsC VARCHAR(100) NOT NULL,
    CountCorrect MEDIUMINT NULL,
    CountIncorrect MEDIUMINT NULL,
    PRIMARY KEY (QuestionID),
    FOREIGN KEY (Topic) REFERENCES Trivial.Topics(TopicID)
);
