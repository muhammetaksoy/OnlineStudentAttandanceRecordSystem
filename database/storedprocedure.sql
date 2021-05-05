use StudentAttendingSystem;

go
CREATE PROCEDURE sp_add_student
@StudentName nvarchar(50),
@StudentSurname nvarchar(50),
@StudentNumber nvarchar(50),
@Email nvarchar(50),
@MobileNumber nvarchar(11),
@Gender nvarchar(6),
@City nvarchar(13),
@DepartmentID int,
@LoginID int
AS
INSERT INTO sas.Student(StudentName,StudentSurname,StudentNumber,Email,MobileNumber,Gender,City,DepartmentID,LoginID)
values(@StudentName,@StudentSurname,@StudentNumber,@Email,@MobileNumber,@Gender,@City,@DepartmentID,@LoginID)


go
--exec sp_add_student ' ahmet','simsek','1700002389','ahmet@gmail.com','05330941263','Male','Ýstanbul',1,2


go
CREATE PROCEDURE sp_delete_student
@StudentID int
AS
DELETE FROM sas.Student WHERE Student.StudentID=@StudentID

go
--EXEC sp_delete_student 6

go
CREATE PROCEDURE sp_search_student
@StudentName nvarchar(50)
AS
SELECT * FROM sas.Student  WHERE StudentName LIKE '%'+@StudentName+'%'

go
--EXEC sp_search_student 'Muhammet'


go
CREATE PROCEDURE sp_add_course

@CourseCode nvarchar(50),
@CourseName nvarchar(50),
@CourseAkts int,
@DepartmentID int
AS
INSERT INTO sas.Course(CourseCode,CourseName,CourseAkts,DepartmentID)
values(@CourseCode,@CourseName,@CourseAkts,@DepartmentID)
go

--exec sp_add_course 'Microprocessor','CSE4024','2','5',1,1

go
CREATE PROCEDURE sp_delete_course
@CourseID int
AS
DELETE FROM sas.Course WHERE Course.CourseID=@CourseID
go
--EXEC sp_delete_course 5

go
CREATE PROCEDURE sp_search_course
@CourseName nvarchar(50)
AS
SELECT * FROM sas.Course  WHERE Course.CourseName LIKE '%'+@CourseName+'%'
go
--exec sp_search_course 'we'


go
CREATE PROCEDURE sp_add_teacher

@TeacherName nvarchar(50),
@TeacherSurname nvarchar(50),
@MobileNumber nvarchar(50),
@Email nvarchar(50),
@Gender nvarchar(6),
@DepartmentID int,
@LoginID int
AS
INSERT INTO sas.Teacher(TeacherName,TeacherSurname,MobileNumber,Email,Gender,DepartmentID,LoginID)
values(@TeacherName,@TeacherSurname,@MobileNumber,@Email,@Gender,@DepartmentID,@LoginID)
go


go
CREATE PROCEDURE sp_delete_teacher
@TeacherID int
AS
DELETE FROM sas.Teacher WHERE Teacher.TeacherID=@TeacherID
go


go
CREATE PROCEDURE sp_search_teacher
@TeacherName nvarchar(50)
AS
SELECT * FROM sas.Teacher  WHERE TeacherName  LIKE '%'+@TeacherName+'%'
go


go 
create procedure sp_add_department

@DepartmentName nvarchar(50)
as
insert into sas.Department(DepartmentName)
values(@DepartmentName)
go


go 
create procedure sp_delete_department

@DepartmentID int
as
delete from sas.Department where Department.DepartmentID=@DepartmentID
go

--exec sp_delete_department 3


go
CREATE PROCEDURE sp_search_department
@DepartmentName nvarchar(50)
AS
SELECT * FROM sas.Department  WHERE Department.DepartmentName LIKE '%'+@DepartmentName+'%'

go
--exec sp_search_department 'com'