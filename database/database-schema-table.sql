--Database Oluþturma
Create database StudentAttendingSystem;
use StudentAttendingSystem;

--Schema Oluþturma
go 
create schema sas;
go

--Table Oluþturma
CREATE TABLE sas.Department(
	DepartmentID int PRIMARY KEY IDENTITY(1,1),
	DepartmentName nvarchar(50) NOT NULL,
);

CREATE TABLE sas.[Role](
	RoleID int PRIMARY KEY IDENTITY(1,1),
	RoleName nvarchar(50) NOT NULL,
);

CREATE TABLE sas.[Login](
	LoginID int PRIMARY KEY IDENTITY(1,1),
	UserName nvarchar(50) NOT NULL,
	[Password]nvarchar(50) NOT NULL,
	RoleID int FOREIGN KEY REFERENCES sas.[Role](RoleID)
);

CREATE TABLE sas.[Admin](
	AdminID int PRIMARY KEY IDENTITY(1,1),
    AdminName nvarchar(50) NULL,
	AdminSurname nvarchar(50)NOT NULL,
	Email nvarchar(50)NOT NULL,
	MobileNumber nvarchar(11)NOT NULL,
	Gender nvarchar(6) NOT NULL check(Gender in ('Male', 'Female')),
    LoginID int FOREIGN KEY REFERENCES sas.[Login]([LoginID])
);

CREATE TABLE sas.Course(
	CourseID int PRIMARY KEY IDENTITY(1,1),
	CourseCode nvarchar(50) NOT NULL,
	CourseName nvarchar(50) NOT NULL,
	CourseAkts int NOT NULL,
	DepartmentID int FOREIGN KEY REFERENCES sas.Department(DepartmentID)ON DELETE SET NULL
);

CREATE TABLE sas.Student(
	StudentID int PRIMARY KEY IDENTITY(1,1),
	StudentName nvarchar(50) NOT NULL,
	StudentSurname nvarchar(50)NOT NULL,
	StudentNumber nvarchar(50) NOT NULL,
	Email nvarchar(50) NOT NULL,
	MobileNumber nvarchar(11) NOT NULL,
	Gender nvarchar(6) NOT NULL check(Gender in ('Male', 'Female')),
	City nvarchar(13) NOT NULL,
	DepartmentID int FOREIGN KEY REFERENCES sas.Department(DepartmentID)ON DELETE CASCADE,
	LoginID int FOREIGN KEY REFERENCES sas.[Login]([LoginID])
);

CREATE TABLE sas.Teacher(
	TeacherID int PRIMARY KEY IDENTITY(1,1),
	TeacherName nvarchar(50) NOT NULL,
	TeacherSurname nvarchar(50)NOT NULL,
	MobileNumber nvarchar(11)NOT NULL,
	Email nvarchar(50)NOT NULL,
	Gender nvarchar(6) NOT NULL check(Gender in ('Male', 'Female')),
	DepartmentID int FOREIGN KEY REFERENCES sas.Department(DepartmentID)ON DELETE SET NULL,
	LoginID int FOREIGN KEY REFERENCES sas.[Login]([LoginID])
);

CREATE TABLE sas.Attendance(
	AttendanceID int PRIMARY KEY IDENTITY(1,1),
	isPresent bit NOT NULL,
	[Date] date NOT NULL,
	StudentID int FOREIGN KEY REFERENCES sas.Student(StudentID)ON DELETE CASCADE,
	TeacherID int FOREIGN KEY REFERENCES sas.Teacher(TeacherID)ON DELETE CASCADE,
	CourseID int FOREIGN KEY REFERENCES sas.Course(CourseID)ON DELETE CASCADE,
);

CREATE TABLE sas.Student_Studies_Course(
	Student_Studies_Course int PRIMARY KEY IDENTITY(1,1),
	StudentID int FOREIGN KEY REFERENCES sas.Student(StudentID)ON DELETE CASCADE,
	CourseID int FOREIGN KEY REFERENCES sas.Course(CourseID)ON DELETE CASCADE,
);

CREATE TABLE sas.Teacher_Teaches_Student(
	TeacherID int FOREIGN KEY REFERENCES sas.Teacher(TeacherID)ON DELETE CASCADE,
	StudentID int NOT NULL,
	CourseID int FOREIGN KEY REFERENCES sas.Course(CourseID)ON DELETE CASCADE,
	primary key(TeacherID,CourseID,StudentID),
);
