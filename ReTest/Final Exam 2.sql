DROP DATABASE IF EXISTS ThucTap;
CREATE DATABASE ThucTap;
USE ThucTap;

DROP TABLE IF EXISTS GiangVien;
CREATE TABLE GiangVien (
	magv		INT PRIMARY KEY AUTO_INCREMENT,
    hoten		VARCHAR(50),
    luong		INT);

DROP TABLE IF EXISTS SinhVien;    
CREATE TABLE SinhVien (
	masv		INT PRIMARY KEY AUTO_INCREMENT,
    hoten		VARCHAR(50),
    namsinh		INT,
	quequan		VARCHAR(50));
 
DROP TABLE IF EXISTS DeTai;
CREATE TABLE  DeTai (
	madt		INT PRIMARY KEY AUTO_INCREMENT,
    tendt		VARCHAR (50),
    kinhphi		INT,
    NoiThucTap	VARCHAR (50));
    
DROP TABLE IF EXISTS HuongDan;
CREATE TABLE HuongDan (
	id		INT PRIMARY KEY AUTO_INCREMENT,
    masv	INT UNIQUE,
    madt	INT,
    magv	INT UNIQUE,
    ketqua	INT,
    FOREIGN KEY (masv) REFERENCES Sinhvien (masv),
	FOREIGN KEY (madt) REFERENCES DeTai (madt),
	FOREIGN KEY (magv) REFERENCES GiangVien (magv));
    
    
INSERT INTO GiangVien 	(	   hoten		,	 luong	)
VALUES				 	('Nguyễn Bá Duy'  	, 	7000000	),
						('Trần Ngọc Hiếu' 	,	8000000	),
                        ('Lương Thế Vinh'  	, 	9000000	),
                        ('Phạm Thanh Hùng'  , 	9500000	),
                        ('Trương Tuấn Minh' , 	7800000	);
                    
INSERT INTO SinhVien	(		hoten		,  namsinh	,	  quequan	)
VALUES 					('Ngô Quang Long' 	, 	1999 	,   'Thanh Hóa'	),
						('Nguyễn Thị Lan' 	, 	2001 	,   'Hà Nam'	),
                        ('Phan Quốc Khánh' 	, 	2000 	,   'Hà Nội'	),
                        ('Nguyễn Thị Hường' , 	1999 	,   'Vĩnh Phúc'	),
                        ('Quách Văn Ánh' 	, 	1998 	,   'Phú Thọ'	),
                        ('Lê Hồng Lam'  	, 	1999 	,   'Ninh Bình'	);
                        
INSERT INTO	DeTai		(		tendt				,	kinhphi		,		NoiThucTap		)
VALUES					(	'TOAN'					, 	1500000		, 		'Tuyên Quang'	),
						(	'CONG NGHE SINH HOC'	,	1800000		, 		'Yên Bái'		),
                        (	'HOA'					, 	1200000		, 		'Sơn La'		),
                        (	'LY'					, 	1300000		, 		'Hà Nội'		),
                        (	'CONG NGHE SINH HOC'	, 	1550000		, 		'Phú Thọ'		);
    
INSERT INTO	HuongDan	(		masv	,	madt,	magv , ketqua	)
VALUES					(		5		, 	1	, 	3	,	8		),
						(		1		,	2	, 	2	,	7.3		),
                        (		3		, 	3	, 	5 	,	9.1		),
                        (		2		, 	4	, 	1	,	5		),
                        (		4		, 	5	, 	4	,	6.5		);


-- Question 2:
-- a) Lấy tất cả các sinh viên chưa có đề tài hướng dẫn
SELECT hoten
FROM SinhVien SV
LEFT JOIN HuongDan HD ON SV.masv = HD.masv
WHERE HD.madt IS NULL;

-- b) Lấy ra số sinh viên làm đề tài ‘CONG NGHE SINH HOC’ 
SELECT COUNT(*) AS 'Số sinh viên'
FROM DeTai
WHERE tendt = 'CONG NGHE SINH HOC';

-- Question 3: Tạo view có tên là "SinhVienInfo" lấy các thông tin về học sinh bao gồm: 
-- mã số, họ tên và tên đề tài (Nếu sinh viên chưa có đề tài thì column tên đề tài sẽ in ra "Chưa có")
CREATE OR REPLACE VIEW SinhVienInFo AS
SELECT sv.masv, sv.hoten, IFNULL(dt.tendt, 'Chưa có') AS tendt
FROM sinhvien sv
LEFT JOIN huongdan hd ON sv.masv = hd.masv
LEFT JOIN detai dt ON hd.madt = dt.madt;
-- Chay thu View
SELECT * FROM SinhVienInFo;


-- Question 4: Tạo trigger cho table SinhVien khi insert sinh viên có năm sinh <= 1900 thì hiện ra thông báo "năm sinh phải > 1900"
DROP TRIGGER IF EXISTS check_year;
DELIMITER $$
CREATE TRIGGER check_year
BEFORE INSERT ON sinhvien
FOR EACH ROW
BEGIN
IF NEW.namsinh <= 1900 THEN
SIGNAL SQLSTATE '12345'
SET MESSAGE_TEXT = 'Nam sinh phai > 1900';
END IF;
END $$
DELIMITER ;

-- Check trigger bảng giá trị sai
INSERT INTO SinhVien	(		hoten		,  namsinh	,	  quequan	)
VALUES 					('Lê Thị Thúy' 	, 	1900 	,   'Thanh Hóa'	);


-- Question 5: Hãy cấu hình table sao cho khi xóa 1 sinh viên nào đó thì sẽ tất cả thông tin trong table HuongDan liên quan tới sinh viên đó sẽ bị xóa đi
ALTER TABLE HuongDan
DROP FOREIGN KEY huongdan_ibfk_1;

DROP TRIGGER IF EXISTS xoa_sinhvien;
DELIMITER $$
CREATE TRIGGER xoa_sinhvien
BEFORE DELETE ON sinhvien
FOR EACH ROW
BEGIN
DELETE FROM huongdan
WHERE huongdan.masv = OLD.masv;
END $$
DELIMITER ;
--  Test trigger 
DELETE FROM sinhvien
WHERE masv = 1;
ROLLBACK;


    
