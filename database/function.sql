use StudentAttendingSystem;
go
Create Function nameCutter(@ad nvarchar(50), @soyad nvarchar(50))
returns nvarchar(50)
as
begin
return Substring(@ad,1,1) +'.'+upper(@soyad)
end
go

Select dbo.nameCutter(StudentName,StudentSurname) From sas.STUDENT
--Select dbo.nameCutter(TeacherName,TeacherSurname) From sas.TEACHER


go
Create Function genderStudent(@gender nvarchar(6))
returns table
as
return (select StudentName from sas.Student where Gender=@gender)
go

--select * from dbo.genderStudent('Female')

go 
create function StudentFullName(@StudentID int)
returns nvarchar(100)
as
begin
declare @FullName nvarchar(100)
set @FullName=(select StudentName+' '+StudentSurname from sas.Student where StudentID=@StudentID )

return @FullName
end
go

select dbo.StudentFullName(2) from sas.Student