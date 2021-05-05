use StudentAttendingSystem;

--USING CURSOR
declare @DepartmentName varchar(50)
declare cursor_yapisi cursor for select DepartmentName from sas.Department
open cursor_yapisi
fetch next from cursor_yapisi into @DepartmentName

while @@FETCH_STATUS=0

BEGIN
print @DepartmentName
fetch next from cursor_yapisi into @DepartmentName
END
close cursor_yapisi
deallocate cursor_yapisi