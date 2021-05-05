use StudentAttendingSystem;

--DEPARTMENT INSERTING
INSERT INTO sas.Department(DepartmentName)
VALUES ('Computer Engineering');
INSERT INTO sas.Department(DepartmentName)
VALUES ('Civil Engineering');
INSERT INTO sas.Department(DepartmentName)
VALUES ('Industrial Engineering');
INSERT INTO sas.Department(DepartmentName)
VALUES ('Electrical & Electronic Engineering');


--ROLE INSERTING
INSERT INTO sas.Role (RoleName)
VALUES ('Admin');
INSERT INTO sas.Role (RoleName)
VALUES ('Teacher');
INSERT INTO sas.Role (RoleName)
VALUES ('Student');
-----------------------------------------------------------------------------------------------------------------------
--Login INSERTING
INSERT INTO sas.[Login](UserName,[Password],RoleID)
VALUES ('1700003949','12345',3);
INSERT INTO sas.[Login](UserName,[Password],RoleID)
VALUES ('1700005065','12345',3);
INSERT INTO sas.[Login](UserName,[Password],RoleID)
VALUES ('1700005050','12345',3);
INSERT INTO sas.[Login](UserName,[Password],RoleID)
VALUES ('1700005051','12345',3);
INSERT INTO sas.[Login](UserName,[Password],RoleID)
VALUES ('1700005052','12345',3);
INSERT INTO sas.[Login](UserName,[Password],RoleID)
VALUES ('1700005053','12345',3);
INSERT INTO sas.[Login](UserName,[Password],RoleID)
VALUES ('1700005054','12345',3);
INSERT INTO sas.[Login](UserName,[Password],RoleID)
VALUES ('1700005055','12345',3);
INSERT INTO sas.[Login](UserName,[Password],RoleID)
VALUES ('1800003949','12345',2);
INSERT INTO sas.[Login](UserName,[Password],RoleID)
VALUES ('1800003950','12345',2);
INSERT INTO sas.[Login](UserName,[Password],RoleID)
VALUES ('1800003951','12345',2);
INSERT INTO sas.[Login](UserName,[Password],RoleID)
VALUES ('1800003952','12345',2);
INSERT INTO sas.[Login](UserName,[Password],RoleID)
VALUES ('1900005051','12345',1);

--ADMIN INSERTING
INSERT INTO sas.[Admin](AdminName,AdminSurname,Email,MobileNumber,Gender,LoginID)
VALUES ('Bill','Gates','bill@gmail.com','077777','Male',13);



--Course INSERTING
INSERT INTO sas.Course(CourseCode,CourseName,CourseAkts,DepartmentID)
VALUES('CSE5041','Database Design and Development',6,1);
INSERT INTO sas.Course(CourseCode,CourseName,CourseAkts,DepartmentID)
VALUES('CSE5001','Web Programmıng',6,1);
INSERT INTO sas.Course(CourseCode,CourseName,CourseAkts,DepartmentID)
VALUES('CE1004','Introduction To Civil Engineering',4,2);
INSERT INTO sas.Course(CourseCode,CourseName,CourseAkts,DepartmentID)
VALUES('CE1006','Soil',4,2);
INSERT INTO sas.Course(CourseCode,CourseName,CourseAkts,DepartmentID)
VALUES('IE4201','Operations Research I',5,3);
INSERT INTO sas.Course(CourseCode,CourseName,CourseAkts,DepartmentID)
VALUES('IE5403','Facilities Design and Planning',4,3);
INSERT INTO sas.Course(CourseCode,CourseName,CourseAkts,DepartmentID)
VALUES('EE4201','Electronic Circuits I',6,4);
INSERT INTO sas.Course(CourseCode,CourseName,CourseAkts,DepartmentID)
VALUES('EE3301','Introduction to Electromagnetics',7,4);

--STUDENT INSERTING
INSERT INTO sas.Student(StudentName,StudentSurname,StudentNumber,Email,MobileNumber,Gender,City,DepartmentID,LoginID)
VALUES ('Muhammet','Aksoy','1700003949','muhammet@gmail.com','05330941263','Male','İstanbul',1,1);
INSERT INTO sas.Student(StudentName,StudentSurname,StudentNumber,Email,MobileNumber,Gender,City,DepartmentID,LoginID)
VALUES ('Abdullah','Oranqai','1700005065','Abdullah@gmail.com','05370256004','Male','Trabzon',1,2);
INSERT INTO sas.Student(StudentName,StudentSurname,StudentNumber,Email,MobileNumber,Gender,City,DepartmentID,LoginID)
VALUES ('Mustafa','Burunsuz','1700005050','Mustafa@gmail.com','0511111111','Male','Kayeri',2,3);
INSERT INTO sas.Student(StudentName,StudentSurname,StudentNumber,Email,MobileNumber,Gender,City,DepartmentID,LoginID)
VALUES ('Sevda','Yilmaz','1700005051','Sevda@gmail.com','0522222222','Female','İstanbul',2,4);
INSERT INTO sas.Student(StudentName,StudentSurname,StudentNumber,Email,MobileNumber,Gender,City,DepartmentID,LoginID)
VALUES ('Ali','Korkmaz','1700005052','Ali@gmail.com','05333333333','Male','Mardin',3,5);
INSERT INTO sas.Student(StudentName,StudentSurname,StudentNumber,Email,MobileNumber,Gender,City,DepartmentID,LoginID)
VALUES ('Murtaza','Kemal','1700005053','murtaza@gmail.com','0524442','male','İstanbul',3,6);
INSERT INTO sas.Student(StudentName,StudentSurname,StudentNumber,Email,MobileNumber,Gender,City,DepartmentID,LoginID)
VALUES ('Ayşe','Yıldırım','1700005054','Ayse@gmail.com','052444562','Female','Sakarya',4,7);
INSERT INTO sas.Student(StudentName,StudentSurname,StudentNumber,Email,MobileNumber,Gender,City,DepartmentID,LoginID)
VALUES ('Zeliha','Aydın','1700005055','Zeliha@gmail.com','05244453462','Female','Bursa',4,8);

--TEACHER INSERTING
INSERT INTO sas.Teacher(TeacherName,TeacherSurname,MobileNumber,Email,Gender,DepartmentID,LoginID)
VALUES ('Akhan','Akbulut','033333','a.akbulut@iku.edu.tr','Male',1,9);
INSERT INTO sas.Teacher(TeacherName,TeacherSurname,MobileNumber,Email,Gender,DepartmentID,LoginID)
VALUES ('Fatma','Uney','0666666','f.uney@iku.edu.tr','Female',2,10);
INSERT INTO sas.Teacher(TeacherName,TeacherSurname,MobileNumber,Email,Gender,DepartmentID,LoginID)
VALUES ('Faruk','Arslan','044444','b.mete@iku.edu.tr','Female',3,11);
INSERT INTO sas.Teacher(TeacherName,TeacherSurname,MobileNumber,Email,Gender,DepartmentID,LoginID)
VALUES ('Nihal','Sarier','0555555','N.sarier@iku.edu.tr','Female',4,12);



--Attandance INSERTING
INSERT INTO sas.Attendance(isPresent,[Date],StudentID,TeacherID,CourseID)
VALUES (1,'2020-12-20',1,1,1);
INSERT INTO sas.Attendance(isPresent,[Date],StudentID,TeacherID,CourseID)
VALUES (2,'2020-12-20',2,1,1);
INSERT INTO sas.Attendance(isPresent,[Date],StudentID,TeacherID,CourseID)
VALUES (1,'2020-12-21',1,1,2);
INSERT INTO sas.Attendance(isPresent,[Date],StudentID,TeacherID,CourseID)
VALUES (2,'2020-12-21',2,1,2);

INSERT INTO sas.Attendance(isPresent,[Date],StudentID,TeacherID,CourseID)
VALUES (2,'2020-12-22',3,2,3);
INSERT INTO sas.Attendance(isPresent,[Date],StudentID,TeacherID,CourseID)
VALUES (1,'2020-12-22',4,2,3);
INSERT INTO sas.Attendance(isPresent,[Date],StudentID,TeacherID,CourseID)
VALUES (2,'2020-12-23',3,2,4);
INSERT INTO sas.Attendance(isPresent,[Date],StudentID,TeacherID,CourseID)
VALUES (1,'2020-12-23',4,2,4);

INSERT INTO sas.Attendance(isPresent,[Date],StudentID,TeacherID,CourseID)
VALUES (1,'2020-12-24',5,3,5);
INSERT INTO sas.Attendance(isPresent,[Date],StudentID,TeacherID,CourseID)
VALUES (2,'2020-12-24',6,3,5);
INSERT INTO sas.Attendance(isPresent,[Date],StudentID,TeacherID,CourseID)
VALUES (1,'2020-12-25',5,3,6);
INSERT INTO sas.Attendance(isPresent,[Date],StudentID,TeacherID,CourseID)
VALUES (2,'2020-12-25',6,3,6);

INSERT INTO sas.Attendance(isPresent,[Date],StudentID,TeacherID,CourseID)
VALUES (1,'2020-12-26',7,4,7);
INSERT INTO sas.Attendance(isPresent,[Date],StudentID,TeacherID,CourseID)
VALUES (2,'2020-12-26',8,4,7);
INSERT INTO sas.Attendance(isPresent,[Date],StudentID,TeacherID,CourseID)
VALUES (2,'2020-12-27',7,4,8);
INSERT INTO sas.Attendance(isPresent,[Date],StudentID,TeacherID,CourseID)
VALUES (1,'2020-12-27',8,4,8);


--Student Studies Course INSERTING
INSERT INTO sas.Student_Studies_Course(StudentID,CourseID)
VALUES (1,1);
INSERT INTO sas.Student_Studies_Course(StudentID,CourseID)
VALUES (1,2);
INSERT INTO sas.Student_Studies_Course(StudentID,CourseID)
VALUES (2,1);
INSERT INTO sas.Student_Studies_Course(StudentID,CourseID)
VALUES (2,2);
INSERT INTO sas.Student_Studies_Course(StudentID,CourseID)
VALUES (3,3);
INSERT INTO sas.Student_Studies_Course(StudentID,CourseID)
VALUES (3,4);
INSERT INTO sas.Student_Studies_Course(StudentID,CourseID)
VALUES (4,3);
INSERT INTO sas.Student_Studies_Course(StudentID,CourseID)
VALUES (4,4);
INSERT INTO sas.Student_Studies_Course(StudentID,CourseID)
VALUES (5,5);
INSERT INTO sas.Student_Studies_Course(StudentID,CourseID)
VALUES (5,6);
INSERT INTO sas.Student_Studies_Course(StudentID,CourseID)
VALUES (6,5);
INSERT INTO sas.Student_Studies_Course(StudentID,CourseID)
VALUES (6,6);
INSERT INTO sas.Student_Studies_Course(StudentID,CourseID)
VALUES (7,7);
INSERT INTO sas.Student_Studies_Course(StudentID,CourseID)
VALUES (7,8);
INSERT INTO sas.Student_Studies_Course(StudentID,CourseID)
VALUES (8,7);
INSERT INTO sas.Student_Studies_Course(StudentID,CourseID)
VALUES (8,8);


--TEACHER TEACHES STUDENT INSERTING
INSERT INTO sas.TEACHER_TEACHES_STUDENT(TeacherID,CourseID,StudentID)
VALUES(1,1,1);
INSERT INTO sas.TEACHER_TEACHES_STUDENT(TeacherID,CourseID,StudentID)
VALUES(1,1,2);
INSERT INTO sas.TEACHER_TEACHES_STUDENT(TeacherID,CourseID,StudentID)
VALUES(1,2,1);
INSERT INTO sas.TEACHER_TEACHES_STUDENT(TeacherID,CourseID,StudentID)
VALUES(1,2,2);

INSERT INTO sas.TEACHER_TEACHES_STUDENT(TeacherID,CourseID,StudentID)
VALUES(2,3,3);
INSERT INTO sas.TEACHER_TEACHES_STUDENT(TeacherID,CourseID,StudentID)
VALUES(2,3,4);
INSERT INTO sas.TEACHER_TEACHES_STUDENT(TeacherID,CourseID,StudentID)
VALUES(2,4,3);
INSERT INTO sas.TEACHER_TEACHES_STUDENT(TeacherID,CourseID,StudentID)
VALUES(2,4,4);

INSERT INTO sas.TEACHER_TEACHES_STUDENT(TeacherID,CourseID,StudentID)
VALUES(3,5,5);
INSERT INTO sas.TEACHER_TEACHES_STUDENT(TeacherID,CourseID,StudentID)
VALUES(3,5,6);
INSERT INTO sas.TEACHER_TEACHES_STUDENT(TeacherID,CourseID,StudentID)
VALUES(3,6,5);
INSERT INTO sas.TEACHER_TEACHES_STUDENT(TeacherID,CourseID,StudentID)
VALUES(3,6,6);

INSERT INTO sas.TEACHER_TEACHES_STUDENT(TeacherID,CourseID,StudentID)
VALUES(4,7,7);
INSERT INTO sas.TEACHER_TEACHES_STUDENT(TeacherID,CourseID,StudentID)
VALUES(4,7,8);
INSERT INTO sas.TEACHER_TEACHES_STUDENT(TeacherID,CourseID,StudentID)
VALUES(4,8,7);
INSERT INTO sas.TEACHER_TEACHES_STUDENT(TeacherID,CourseID,StudentID)
VALUES(4,8,8);