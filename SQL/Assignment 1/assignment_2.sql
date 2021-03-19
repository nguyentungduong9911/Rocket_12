DROP DATABASE IF EXISTS testing_System_Assignment_2;
CREATE DATABASE Testing_System_Assignment_2;
USE Testing_System_Assignment_2;

DROP TABLE IF EXISTS  Department ;
CREATE TABLE Department(
	DepartmentID int UNSIGNED AUTO_INCREMENT PRIMARY KEY , 
    DepartmentName varchar(50) UNIQUE KEY);
    
DROP TABLE IF EXISTS `Position`;
CREATE TABLE `Position`(
	PositionID INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    PositionName Enum('Dev','Test','Scrum Master','PM')); 
    
DROP TABLE IF EXISTS `Account`;
CREATE TABLE `Account`(
	AccountID INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    Email varchar(50) UNIQUE KEY,
    Username varchar(50) UNIQUE KEY NOT NULL,
    DepartmentID int NOT NULL,
    PositionID int NOT NULL,
    CreateDate date NOT NULL,
    FOREIGN KEY (DepartmentID)  REFERENCES Department (DepartmentID),
    FOREIGN KEY (PositionID)  REFERENCES `Position` (PositionID));
    
	
DROP TABLE IF EXISTS `Group`;
CREATE TABLE `Group`(
	GroupID int UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    GroupName varchar(50) UNIQUE KEY NOT NULL,
    CreatorID int UNIQUE KEY NOT NULL,
    CreateDate date NOT NULL,
	FOREIGN KEY (CeatorID) REFERENCES `Account`(AccountID));
    

DROP TABLE IF EXISTS GroupAccount;
CREATE TABLE GroupAccount(
	GroupID int UNSIGNED NOT NULL,
    AccountID int UNSIGNED NOT NULL,
    JoinDate date NOT NULL,
    PRIMARY KEY (GroupID,AccountID),
    FOREIGN KEY (GroupID)	REFERENCES `Group`(GroupID));
    
DROP TABLE IF EXISTS TypeQuestion;
CREATE TABLE TypeQuestion(
	TypeID int UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    TypeName ENUM("Essay","Multiple-Choice"));
    
    
DROP TABLE IF EXISTS CategoryQuestion;
CREATE TABLE CategoryQuestion(
	CategoryID int UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    CategoryName varchar(50) UNIQUE KEY NOT NULL);
    

DROP TABLE IF EXISTS Question;
CREATE TABLE Question(
    QuestionID int UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    Content varchar(50) NOT NULL,
    CategoryID int UNSIGNED NOT NULL,
    TypeID int UNSIGNED KEY NOT NULL,
    CreatorID int UNSIGNED NOT NULL,
    CreateDate date NOT NULL,
    FOREIGN KEY(CategoryID) REFERENCES CategoryQuestion (CategoryID),
    FOREIGN KEY(TypeID)		REFERENCES TypeQuestion(TypeID),
	FOREIGN KEY(CreatorID)	REFERENCES `Account`(AccountID)
    );
    

DROP TABLE IF EXISTS Answer;
CREATE TABLE Answer(
	AnswerID int UNSIGNED PRIMARY KEY AUTO_INCREMENT, 
    Content varchar(50) NOT NULL,
    QuestionID int UNSIGNED NOT NULL,
    isCorrect bit,
    FOREIGN KEY(AnswerID)	REFERENCES Question (QuestionID));
    
    
DROP TABLE IF EXISTS Exam;
CREATE TABLE Exam(
	ExamID int UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	`Code` varchar(50) NOT NULL,
    Title varchar(50) NOT NULL,
    CategoryID int UNSIGNED NOT NULL,
    Duration int UNSIGNED NOT NULL,
    CreatorID int UNSIGNED NOT NULL,
    CreateDate date NOT NULL,
    FOREIGN KEY(CategoryID) REFERENCES CategoryQuestion(CategoryID),
    FOREIGN KEY(CreatorID) REFERENCES `Account`(AccountID));
    
    
DROP TABLE IF EXISTS ExamQuestion;
CREATE TABLE ExamQuestion(
	ExamID int UNSIGNED NOT NULL,
    QuestionID int UNSIGNED NOT NULL,
    PRIMARY KEY(ExamID,QuestionID),
    FOREIGN KEY (ExamID) REFERENCES Exam(ExamID),
    FOREIGN KEY(QuestionID) REFERENCES Question(QuestionID)
    );
    

    
    

	