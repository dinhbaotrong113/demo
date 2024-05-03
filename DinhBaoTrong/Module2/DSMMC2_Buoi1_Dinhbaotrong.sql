CREATE DATABASE  Testing_System_Db;
USE Testing_System_Db;

CREATE TABLE Department(
    DepartmentID        INT AUTO_INCREMENT PRIMARY KEY,
    DepartmentName      VARCHAR(50)
);
CREATE TABLE Position_table(
    PositionID      INT AUTO_INCREMENT PRIMARY KEY,
    PositionName    VARCHAR(50)
);
CREATE TABLE Account_table(
    AccountID       INT AUTO_INCREMENT PRIMARY KEY,
    Email           VARCHAR(50),
    Username        VARCHAR(20),
    Fullname        VARCHAR(30),
    DepartmentID    INT,
    PositionID      INT,
    CreateDate      DATE
);
CREATE TABLE Group_table(
    GroupID         INT AUTO_INCREMENT PRIMARY KEY,
    GroupName       VARCHAR(50),
    CreatorID       INT,
    CreataDate      DATE
);
CREATE TABLE Group_Acount(
    GroupID         INT,
    AccountID       INT,
    JoinDate        DATE
);
CREATE TABLE TypeQuestion(
    TypeID          INT AUTO_INCREMENT PRIMARY KEY,
    TypeName        VARCHAR(100)
);
CREATE TABLE CategoryQuestion(
    CategoryID      INT,
    CategoryName    VARCHAR(10),
);
CREATE TABLE Question (
    QuestionID      INT AUTO_INCREMENT PRIMARY KEY,
    Content_qs      VARCHAR(1000),
    CategoryID      INT,
    TypeID          INT,
    CreateDate      DATE
);
CREATE TABLE Answer(
    AnswerID        INT AUTO_INCREMENT PRIMARY KEY,
    Content_as      VARCHAR(1000),
    QuestionID      INT,
    isCorrect       BOOLEAN
);
CREATE TABLE Exam(
    ExamID          INT AUTO_INCREMENT PRIMARY KEY,
    Code_ex         INT,
    Title           VARCHAR(100),
    CategoryID      INT,
    Duration        INT,
    CreatorID       INT,
    CreateDate      DATE
);
CREATE TABLE ExamQuestion(
    ExamID          INT,
    QuestionID      INT
);