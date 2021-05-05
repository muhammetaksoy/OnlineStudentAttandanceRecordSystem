USE StudentAttendingSystem;

GO
CREATE VIEW getStudentCourse
AS
SELECT StudentName + ' ' +StudentSurname AS 'Student Name',CourseName FROM sas.Student_Studies_Course
INNER JOIN sas.Student
ON sas.Student.StudentID=sas.Student_Studies_Course.StudentID
INNER JOIN sas.Course
on sas.Course.CourseID=sas.Student_Studies_Course.CourseID
GO

GO
CREATE VIEW getStudentDepartment
AS
SELECT StudentName,StudentSurname,DepartmentName FROM sas.Student
INNER JOIN sas.Department
ON sas.Department.DepartmentID=sas.Student.DepartmentID
GO

GO
CREATE VIEW getStudentTeacher
AS
SELECT StudentName+ ' ' +StudentSurname AS 'Student Name',TeacherName + ' ' +TeacherSurname AS 'Teacher Name' from sas.Teacher_Teaches_Student
INNER JOIN sas.Teacher
ON sas.Teacher.TeacherID=sas.Teacher_Teaches_Student.TeacherID
INNER JOIN sas.Student
ON sas.Student.StudentID=sas.Teacher_Teaches_Student.StudentID
GO

GO
CREATE VIEW getStudentAttandance
AS
SELECT StudentName+ ' ' +StudentSurname AS 'Student Name',isPresent,[Date],CourseName,TeacherName + ' ' +TeacherSurname AS 'Teacher Name'
FROM sas.Attendance
INNER JOIN sas.Student
ON sas.Attendance.StudentID=sas.Student.StudentID
INNER JOIN sas.Course
ON sas.Course.CourseID=sas.Attendance.CourseID
INNER JOIN sas.Teacher
ON sas.Teacher.TeacherID=sas.Attendance.TeacherID
GO

CREATE VIEW getLoginRolde
AS
SELECT UserName,[Password],RoleName from sas.[Login]
INNER JOIN sas.[Role]
ON sas.[Role].RoleID=sas.[Login].RoleID
GO

--select * from getLoginRolde

CREATE VIEW GetStudentCourseNumber
AS
SELECT StudentName+' '+StudentSurname as 'Student Name',COUNT(Course.CourseID) AS 'Number Of Courses' FROM sas.Student_Studies_Course
INNER JOIN sas.Student
ON sas.Student.StudentID=sas.Student_Studies_Course.StudentID
INNER JOIN sas.Course
ON sas.Course.CourseID=sas.Student_Studies_Course.CourseID
GROUP BY StudentName,StudentSurname
GO

GO
CREATE VIEW getTeacherCourses
AS
SELECT TeacherName,TeacherSurname,CourseName FROM sas.Teacher_Teaches_Student
INNER JOIN sas.Course
ON sas.Course.CourseID=sas.Teacher_Teaches_Student.CourseID
INNER JOIN sas.Teacher
ON sas.Teacher.TeacherID=sas.Teacher_Teaches_Student.TeacherID

GO

go
CREATE VIEW GetTeacherCourseNumber
AS
SELECT TeacherName,COUNT(Course.CourseID) as 'Number Of Courses' from sas.Teacher_Teaches_Student
INNER JOIN sas.Teacher
ON sas.Teacher.TeacherID=sas.Teacher_Teaches_Student.TeacherID
INNER JOIN sas.Course
ON sas.Course.CourseID=sas.Teacher_Teaches_Student.CourseID
GROUP BY TeacherName
GO

GO
CREATE VIEW getStudentTeacherNumber
AS
SELECT StudentName,StudentSurname,COUNT(Teacher.TeacherID) as 'Number Of Teachers' FROM sas.Teacher_Teaches_Student
INNER JOIN sas.Teacher
ON sas.Teacher.TeacherID=sas.Teacher_Teaches_Student.TeacherID
INNER JOIN sas.Student
ON sas.Student.StudentID=sas.Teacher_Teaches_Student.StudentID
GROUP BY StudentName,StudentSurname
go

GO
CREATE VIEW getTeacherStudent
AS
SELECT TeacherName+' '+TeacherSurname as 'Taecher Name',StudentName+ ' '+StudentSurname as 'Student Name' From sas.Teacher_Teaches_Student
INNER JOIN sas.Teacher
ON sas.Teacher.TeacherID=sas.Teacher_Teaches_Student.TeacherID
INNER JOIN sas.Student
on sas.Student.StudentID=sas.Teacher_Teaches_Student.StudentID
GO

GO
CREATE VIEW getTeacherStudentNumber
AS
SELECT TeacherName+ ' ' +TeacherSurname as 'Teacher Name', COUNT(Student.StudentID) as 'Number Of Students' from sas.Teacher_Teaches_Student
INNER JOIN sas.Teacher
ON sas.Teacher.TeacherID=sas.Teacher_Teaches_Student.TeacherID
INNER JOIN sas.Student
ON sas.Student.StudentID=sas.Teacher_Teaches_Student.StudentID
group by TeacherName,TeacherSurname
GO