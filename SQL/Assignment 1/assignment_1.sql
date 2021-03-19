DROP DATABASE IF EXISTS testing_System_Assignment_1;
CREATE DATABASE Testing_System_Assignment_1;
USE Testing_System_Assignment_1;

CREATE TABLE Department(
	DepartmentID int,
    DepartmentName varchar(50));
    
CREATE TABLE `Position`(
	PositionID int,
    PositionName varchar(50));
    
CREATE TABLE Account(
	AccountID int,
    Email varchar(50),
    Username varchar(50),
    DepartmentID int,
    PositionID int,
    CreateDate date);
    
CREATE TABLE `Group`(
	GroupID int,
    GroupName varchar(50),
    CreatorID int,
    CreateDate date);
    
CREATE TABLE GroupAccount(
	GroupID int,
    AccountID int,
    JoinDate date);
    
CREATE TABLE TypeQuestion(
	TypeID int,
    TypeName varchar(50));
    
CREATE TABLE CategoryQuestion(
	CategoryID int,
    CategoryName varchar(50));
    
CREATE TABLE Question(
    QuestionID int,
    Content varchar(50),
    CategoryID int,
    TypeID int,
    CreatorID int,
    CreateDate date);
    
CREATE TABLE Answer(
	AnswerID int,
    Content varchar(50),
    QuestionID int,
    isCorrect bit);
    
CREATE TABLE Exam(
	ExamID int,
	`Code` varchar(50),
    Title varchar(50),
    CategoryID int,
    Duration int,
    CreatorID int,
    CreateDate date);
    
CREATE TABLE ExamQuestion(
	ExamID int,
    Question int);
	