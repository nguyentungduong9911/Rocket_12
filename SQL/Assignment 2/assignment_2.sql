/*============================== CREATE DATABASE =======================================*/
/*======================================================================================*/
DROP DATABASE IF EXISTS TestingSystem;
CREATE DATABASE TestingSystem;
USE TestingSystem;

/*============================== CREATE TABLE=== =======================================*/
/*======================================================================================*/

-- create table 1: Department
DROP TABLE IF EXISTS Department;
CREATE TABLE Department(
	DepartmentID 			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    DepartmentName 			NVARCHAR(30) NOT NULL UNIQUE KEY
);

-- create table 2: Posittion
DROP TABLE IF EXISTS Position;
CREATE TABLE `Position` (
	PositionID				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    PositionName			ENUM('Dev','Test','Scrum Master','PM') NOT NULL UNIQUE KEY
);

-- create table 3: Account
DROP TABLE IF EXISTS `Account`;
CREATE TABLE `Account`(
	AccountID				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Email					VARCHAR(50) NOT NULL UNIQUE KEY,
    Username				VARCHAR(50) NOT NULL UNIQUE KEY,
    FullName				NVARCHAR(50) NOT NULL,
    DepartmentID 			TINYINT UNSIGNED NOT NULL,
    PositionID				TINYINT UNSIGNED NOT NULL,
    CreateDate				DATETIME DEFAULT NOW(),
    FOREIGN KEY(DepartmentID) REFERENCES Department(DepartmentID),
    FOREIGN KEY(PositionID) REFERENCES `Position`(PositionID)
);

-- create table 4: Group
DROP TABLE IF EXISTS `Group`;
CREATE TABLE `Group`(
	GroupID					TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    GroupName				NVARCHAR(50) NOT NULL UNIQUE KEY,
    CreatorID				TINYINT UNSIGNED,
    CreateDate				DATETIME DEFAULT NOW(),
    FOREIGN KEY(CreatorID) 	REFERENCES `Account`(AccountId)
);

-- create table 5: GroupAccount
DROP TABLE IF EXISTS GroupAccount;
CREATE TABLE GroupAccount(
	GroupID					TINYINT UNSIGNED NOT NULL,
    AccountID				TINYINT UNSIGNED NOT NULL,
    JoinDate				DATETIME DEFAULT NOW(),
    PRIMARY KEY (GroupID,AccountID),
    FOREIGN KEY(GroupID) 		REFERENCES `Group`(GroupID) 
);

-- create table 6: TypeQuestion
DROP TABLE IF EXISTS TypeQuestion;
CREATE TABLE TypeQuestion (
    TypeID 			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    TypeName 		ENUM('Essay','Multiple-Choice') NOT NULL UNIQUE KEY
);

-- create table 7: CategoryQuestion
DROP TABLE IF EXISTS CategoryQuestion;
CREATE TABLE CategoryQuestion(
    CategoryID				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    CategoryName			NVARCHAR(50) NOT NULL UNIQUE KEY
);

-- create table 8: Question
DROP TABLE IF EXISTS Question;
CREATE TABLE Question(
    QuestionID				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Content					NVARCHAR(100) NOT NULL,
    CategoryID				TINYINT UNSIGNED NOT NULL,
    TypeID					TINYINT UNSIGNED NOT NULL,
    CreatorID				TINYINT UNSIGNED NOT NULL,
    CreateDate				DATETIME DEFAULT NOW(),
    FOREIGN KEY(CategoryID) 	REFERENCES CategoryQuestion(CategoryID),
    FOREIGN KEY(TypeID) 		REFERENCES TypeQuestion(TypeID),
    FOREIGN KEY(CreatorID) 		REFERENCES `Account`(AccountId) 
);

-- create table 9: Answer
DROP TABLE IF EXISTS Answer;
CREATE TABLE Answer(
    AnswerID				TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    Content					NVARCHAR(100) NOT NULL,
    QuestionID				TINYINT UNSIGNED NOT NULL,
    isCorrect				BIT DEFAULT 1,
    FOREIGN KEY(QuestionID) REFERENCES Question(QuestionID)
);

-- create table 10: Exam
DROP TABLE IF EXISTS Exam;
CREATE TABLE Exam(
    ExamID					TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `Code`					CHAR(10) NOT NULL,
    Title					NVARCHAR(50) NOT NULL,
    CategoryID				TINYINT UNSIGNED NOT NULL,
    Duration				TINYINT UNSIGNED NOT NULL,
    CreatorID				TINYINT UNSIGNED NOT NULL,
    CreateDate				DATETIME DEFAULT NOW(),
    FOREIGN KEY(CategoryID) REFERENCES CategoryQuestion(CategoryID),
    FOREIGN KEY(CreatorID) 	REFERENCES `Account`(AccountId)
);

-- create table 11: ExamQuestion
DROP TABLE IF EXISTS ExamQuestion;
CREATE TABLE ExamQuestion(
    ExamID				TINYINT UNSIGNED NOT NULL,
	QuestionID			TINYINT UNSIGNED NOT NULL,
    FOREIGN KEY(QuestionID) REFERENCES Question(QuestionID),
    FOREIGN KEY(ExamID) REFERENCES Exam(ExamID) ,
    PRIMARY KEY (ExamID,QuestionID)
);

/*============================== INSERT DATABASE =======================================*/
/*======================================================================================*/
-- Add data Department
INSERT INTO Department	(DepartmentName) 
VALUES
						('Marketing'	),
						('Sale'		),
						('B???o v???'		),
						('Nh??n s???'		),
						('K??? thu???t'	),
						('T??i ch??nh'	),
						('Ph?? gi??m ?????c'),
						('Gi??m ?????c'	),
						('Th?? k??'		),
						('B??n h??ng'	);
    
-- Add data position
INSERT INTO Position	(PositionName	) 
VALUES 					('Dev'			),
						('Test'			),
						('Scrum Master'	),
						('PM'			); 


-- Add data Account
INSERT INTO `Account`(Email								, Username			, FullName				, DepartmentID	, PositionID, CreateDate)
VALUES 				('haidang29productions@gmail.com'	, 'dangblack'		,'Nguy???n h???i ????ng'		,   '5'			,   '1'		,'2020-03-05'),
					('account1@gmail.com'				, 'quanganh'		,'Nguyen Chien Thang2'	,   '1'			,   '2'		,'2020-03-05'),
                    ('account2@gmail.com'				, 'vanchien'		,'Nguyen Van Chien'		,   '2'			,   '3'		,'2020-03-07'),
                    ('account3@gmail.com'				, 'cocoduongqua'	,'Duong Do'				,   '3'			,   '4'		,'2020-03-08'),
                    ('account4@gmail.com'				, 'doccocaubai'		,'Nguyen Chien Thang1'	,   '4'			,   '4'		,'2020-03-10'),
                    ('dapphatchetngay@gmail.com'		, 'khabanh'			,'Ngo Ba Kha'			,   '6'			,   '3'		,'2020-04-05'),
                    ('songcodaoly@gmail.com'			, 'huanhoahong'		,'Bui Xuan Huan'		,   '7'			,   '2'		, NULL		),
                    ('sontungmtp@gmail.com'				, 'tungnui'			,'Nguyen Thanh Tung'	,   '8'			,   '1'		,'2020-04-07'),
                    ('duongghuu@gmail.com'				, 'duongghuu'		,'Duong Van Huu'		,   '9'			,   '2'		,'2020-04-07'),
                    ('vtiaccademy@gmail.com'			, 'vtiaccademy'		,'Vi Ti Ai'				,   '10'		,   '1'		,'2020-04-09');

-- Add data Group
INSERT INTO `Group`	(  GroupName			, CreatorID		, CreateDate)
VALUES 				(N'Testing System'		,   5			,'2019-03-05'),
					(N'Development'			,   1			,'2020-03-07'),
                    (N'VTI Sale 01'			,   2			,'2020-03-09'),
                    (N'VTI Sale 02'			,   3			,'2020-03-10'),
                    (N'VTI Sale 03'			,   4			,'2020-03-28'),
                    (N'VTI Creator'			,   6			,'2020-04-06'),
                    (N'VTI Marketing 01'	,   7			,'2020-04-07'),
                    (N'Management'			,   8			,'2020-04-08'),
                    (N'Chat with love'		,   9			,'2020-04-09'),
                    (N'Vi Ti Ai'			,   10			,'2020-04-10');

-- Add data GroupAccount
INSERT INTO `GroupAccount`	(  GroupID	, AccountID	, JoinDate	 )
VALUES 						(	1		,    1		,'2019-03-05'),
							(	1		,    2		,'2020-03-07'),
							(	3		,    3		,'2020-03-09'),
							(	3		,    4		,'2020-03-10'),
							(	5		,    5		,'2020-03-28'),
							(	1		,    3		,'2020-04-06'),
							(	1		,    7		,'2020-04-07'),
							(	8		,    3		,'2020-04-08'),
							(	1		,    9		,'2020-04-09'),
							(	10		,    10		,'2020-04-10');


-- Add data TypeQuestion
INSERT INTO TypeQuestion	(TypeName			) 
VALUES 						('Essay'			), 
							('Multiple-Choice'	); 


-- Add data CategoryQuestion
INSERT INTO CategoryQuestion		(CategoryName	)
VALUES 								('Java'			),
									('ASP.NET'		),
									('ADO.NET'		),
									('SQL'			),
									('Postman'		),
									('Ruby'			),
									('Python'		),
									('C++'			),
									('C Sharp'		),
									('PHP'			);
													
-- Add data Question
INSERT INTO Question	(Content			, CategoryID, TypeID		, CreatorID	, CreateDate )
VALUES 					(N'C??u h???i v??? Java C??u h???i v??? Java C??u h???i v??? Java C??u h???i v??? Java'	,	1		,   '1'			,   '2'		,'2020-04-05'),
						(N'C??u H???i v??? PHP'	,	10		,   '2'			,   '2'		,'2020-04-05'),
						(N'H???i v??? C#'		,	9		,   '2'			,   '3'		,'2020-04-06'),
						(N'H???i v??? Ruby'		,	6		,   '1'			,   '4'		,'2020-04-06'),
						(N'H???i v??? Postman'	,	5		,   '1'			,   '5'		,'2020-04-06'),
						(N'H???i v??? ADO.NET'	,	3		,   '2'			,   '6'		,'2020-04-06'),
						(N'H???i v??? ASP.NET'	,	2		,   '1'			,   '7'		,'2020-04-06'),
						(N'H???i v??? C++'		,	8		,   '1'			,   '8'		,'2020-04-07'),
						(N'H???i v??? SQL'		,	4		,   '2'			,   '9'		,'2020-04-07'),
						(N'H???i v??? Python'	,	7		,   '1'			,   '10'	,'2020-04-07');

-- Add data Answers
INSERT INTO Answer	(  Content		, QuestionID	, isCorrect	)
VALUES 				(N'Tr??? l???i 01'	,   1			,	0		),
					(N'Tr??? l???i 02'	,   1			,	1		),
                    (N'Tr??? l???i 03'	,   1			,	0		),
                    (N'Tr??? l???i 04'	,   1			,	1		),
                    (N'Tr??? l???i 05'	,   2			,	1		),
                    (N'Tr??? l???i 06'	,   3			,	1		),
                    (N'Tr??? l???i 07'	,   4			,	0		),
                    (N'Tr??? l???i 08'	,   8			,	0		),
                    (N'Tr??? l???i 09'	,   9			,	1		),
                    (N'Tr??? l???i 10'	,   10			,	1		);
	
-- Add data Exam
INSERT INTO Exam	(`Code`			, Title					, CategoryID	, Duration	, CreatorID		, CreateDate )
VALUES 				('VTIQ001'		, N'????? thi C#'			,	1			,	60		,   '5'			,'2019-04-05'),
					('VTIQ002'		, N'????? thi PHP'			,	10			,	60		,   '2'			,'2019-04-05'),
                    ('VTIQ003'		, N'????? thi C++'			,	9			,	120		,   '2'			,'2019-04-07'),
                    ('VTIQ004'		, N'????? thi Java'		,	6			,	60		,   '3'			,'2020-04-08'),
                    ('VTIQ005'		, N'????? thi Ruby'		,	5			,	120		,   '4'			,'2020-04-10'),
                    ('VTIQ006'		, N'????? thi Postman'		,	3			,	60		,   '6'			,'2020-04-05'),
                    ('VTIQ007'		, N'????? thi SQL'			,	2			,	60		,   '7'			,'2020-04-05'),
                    ('VTIQ008'		, N'????? thi Python'		,	8			,	60		,   '8'			,'2020-04-07'),
                    ('VTIQ009'		, N'????? thi ADO.NET'		,	4			,	90		,   '9'			,'2020-04-07'),
                    ('VTIQ010'		, N'????? thi ASP.NET'		,	7			,	90		,   '10'		,'2020-04-08');
                    
                    
-- Add data ExamQuestion
INSERT INTO ExamQuestion(ExamID	, QuestionID	) 
VALUES 					(	1	,		5		),
						(	2	,		10		), 
						(	3	,		4		), 
						(	4	,		3		), 
						(	5	,		7		), 
						(	6	,		10		), 
						(	7	,		2		), 
						(	8	,		10		), 
						(	9	,		9		), 
						(	10	,		8		); 



-- Question1: l???y ra t???t c??? ph??ng ban
SELECT * FROM Department;

-- Question2: l???y ra id c???a ph??ng ban c?? t??n l?? "Sale"
SELECT DepartmentID FROM Department WHERE DepartmentName ="Sale";

-- Question3: l???y ra th??ng tin account c?? full name d??i nh???t
SELECT * FROM `Account` WHERE LENGTH(Fullname) = (SELECT MAX(LENGTH(FullName)) FROM `Account`);

-- Question 4: L???y ra t??n group ???? tham gia tr?????c ng??y 20/12/2019
SELECT GroupName FROM `Group` WHERE CreateDate < "2019/12/20";

-- Question 5: L???y ra ID c???a question c?? >= 4 c??u tr??? l???i
SELECT QuestionID,count(questionID) as 'soluong'  FROM Answer GROUP BY QuestionID HAVING COUNT(QuestionID) >=4;

-- Question 6: L???y ra 5 group ???????c t???o g???n ????y nh???t
SELECT * FROM `Group` ORDER BY CreateDate DESC LIMIT 5;

-- Question 8: X??a t???t c??? c??c exam ???????c t???o tr?????c ng??y 20/12/2019 
DELETE FROM Exam WHERE CreateDate < "2019/12/20";

-- Question 9: Update th??ng tin c???a account c?? id = 5 th??nh t??n "Nguy???n B?? L???c" v??
-- email th??nh loc.nguyenba@vti.com.vn
UPDATE `Account`  SET Fullname = "Nguy???n B?? L???c", Email = "loc.nguyenba@vti.com.vn"  WHERE AccountID = "5";

-- Question 10: Vi???t l???nh ????? l???y ra danh s??ch nh??n vi??n v?? th??ng tin ph??ng ban c???a h???
SELECT A.Email, A.UserName, A.Fullname, A.DepartmentID, A.PositionID, A.CreateDate, D.DepartmentID, D.DepartmentName
FROM `Account` A
INNER JOIN Department D ON A.DepartmentID = D.DepartmentID;

-- Question 11: Vi???t l???nh ????? l???y ra t???t c??? c??c Develop
SELECT * FROM `Account` A 
INNER JOIN Position P ON A.PositionID = P.PositionID
WHERE P.PositionName = "Dev";

-- Question 12: Vi???t l???nh ????? l???y ra danh s??ch c??c ph??ng ban c?? >3 nh??n vi??n
SELECT 		D.DepartmentID, D.DepartmentName, COUNT(A.DepartmentID) AS 'SO LUONG' 
FROM 		`Account`  A
INNER JOIN 	Department D ON D.DepartmentID = A.DepartmentID
GROUP BY 	A.DepartmentID
HAVING 		COUNT(A.DepartmentID) > 3;

-- Question 14: Vi???t l???nh ????? l???y ra danh s??ch c??u h???i ???????c s??? d???ng trong ????? thi nhi???u nh???t
SELECT Q.QuestionID, Q.Content, Q.CategoryID, Q.TypeID, CreatorID, Q.CreateDate, count(E.QuestionID) AS "SO LUONG"
FROM Question Q
INNER JOIN Examquestion E ON Q.QuestionID = E.QuestionID
GROUP BY E.QuestionID
HAVING COUNT(E.QuestionID) = (SELECT MAX(A) AS  'MaxQuestion'
FROM (SELECT COUNT(QuestionID) AS A
FROM 		examquestion   
GROUP BY	QuestionID) AS Soluong );

-- Th???ng k?? m???i category Question ???????c s??? d???ng trong bao nhi??u Question

SELECT  C.CategoryID,  C.CategoryName, COUNT(Q.CategoryID) AS 'SO LUONG'
FROM CategoryQuestion C
INNER JOIN Question Q ON C.CategoryID = Q.CategoryID 
GROUP BY CategoryID ;


-- Question 15: L???y ra Question c?? nhi???u c??u tr??? l???i nh???t
SELECT 		Q.QuestionID, Q.Content, COUNT(A.QuestionID) AS 'SO LUONG'
FROM		Question Q INNER JOIN Answer A ON	Q.QuestionID = A.QuestionID
GROUP BY	A.QuestionID
HAVING		COUNT(A.QuestionID) =(SELECT MAX(abc)
FROM		(SELECT COUNT(A.QuestionID) AS abc 
FROM		Answer A 
INNER JOIN  Question Q ON A.QuestionID = Q.QuestionID 
GROUP BY	A.QuestionID) AS abcd);

-- Question 16: T??m ch???c v??? c?? ??t ng?????i nh???t
SELECT 		P.PositionID, P.PositionName,  COUNT(A.PositionID) AS 'SO LUONG'
FROM		Position P 
INNER JOIN `Account` A ON	P.PositionID = A.PositionID
GROUP BY	P.PositionID
HAVING		COUNT(A.PositionID) =(SELECT MIN(abc)
FROM		(SELECT COUNT(P.PositionID) AS abc 
FROM		Position P
INNER JOIN  `Account` A  ON A.PositionID = P.PositionID 
GROUP BY	P.PositionID) AS abcd);


-- Question 18: L???y th??ng tin chi ti???t c???a c??u h???i bao g???m: th??ng tin c?? b???n c???a question, lo???i c??u h???i, ai l?? ng?????i t???o ra c??u h???i, c??u tr??? l???i l?? g??, ...
SELECT 		T.TypeName AS 'LOAI CAU HOI', Q.CreatorID AS 'ID NGUOI TAO', Q.Content AS 'CAU HOI', A.Content AS 'CAU TRA LOI', Q.CreateDate AS 'NGAY TAO'
FROM		Question Q 
INNER JOIN 	Answer A ON	Q.QuestionID = A.QuestionID
INNER JOIN	TypeQuestion T ON Q.TypeID = T.TypeID ;


-- Question 19: L???y ra s??? l?????ng c??u h???i c???a m???i lo???i t??? lu???n hay tr???c nghi???m
SELECT		T.TypeName AS 'LOAI CAU HOI', COUNT(Q.TypeID) AS 'SO LUONG'
FROM		Question Q 
INNER JOIN 	TypeQuestion T ON Q.TypeID = T.TypeID
GROUP BY	Q.TypeID;









                        
                        
                        
	