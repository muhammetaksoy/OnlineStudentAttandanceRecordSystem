use StudentAttendingSystem;

go
create trigger sas.DeleteDept
on sas.DEPARTMENT
instead of delete
as
print'you can not delete a department!!'
go



go
create trigger addingControlForStudent
on sas.Student
after insert
as
begin 
print 'Student is added succesfully.'
end
go

go
create trigger deletingControlForStudent
on sas.Student
after delete
as
begin 
print 'Student is deleted succesfully.'
end
go

go
create trigger addingControlForDepartment
on sas.Department
after insert
as
begin 
print 'Department is added succesfully.'
end
go


go
create trigger deletingControlForLogin
on sas.[Login]
after delete
as
begin 
print 'Login is deleted succesfully.'
end
go


go
create trigger addingControlForLogin
on sas.[Login]
after insert
as
begin 
print 'Login is added succesfully.'
end
go



