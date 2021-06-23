/*
Declare scalar function (fn_FormatStudentName) for retrieving the Student description for specific StudentId in the following format:
	- StudentCardNumber without “sc-”
	- “ – “
	- First character of student FirstName
	- “.”
	- Student LastName
	
	example:
	sc-77712 => 77712-P.Manaskov

*/

select * from [dbo].[Student]

drop function if exists dbo.fn_FormatStudentName;
go

create function dbo.fn_FormatStudentName (@StudentID int)
returns nvarchar(100)
as 
begin

declare @Output nvarchar(100)

select @Output = substring(StudentCardNumber, 4, Len(StudentCardNumber)) + '-' + left(FirstName, 1) + '.' + LastName
from [dbo].[Student]
where ID = @StudentID

return @Output

end
go


select *,dbo.fn_FormatStudentName (id)
from [dbo].[Student]