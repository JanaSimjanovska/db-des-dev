use SEDCHome


--Create multi-statement table value function that for specific Teacher and Course will return list of students (FirstName, LastName) who passed the exam, together with Grade and CreatedDate



select data_type from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME = 'Grade' and COLUMN_NAME = 'CreatedDate'


drop function if exists dbo.fn_CantThinkOfAGoodNameForThisFunction;

create or alter function dbo.fn_CantThinkOfAGoodNameForThisFunction (@TeacherId int, @CourseId int)
returns @output table (Student nvarchar(200), Grade int null, DateCreated datetime null)

as
begin

	insert into @output

	select s.FirstName + ' ' + s.LastName, g.Grade, g.CreatedDate
	from dbo.Grade g
	join dbo.Teacher t on g.TeacherID = t.ID
	join dbo.Student s on g.StudentID = s.ID
	join dbo.Course c on g.CourseID = c.ID
	where g.TeacherID = @TeacherId 
	and g.CourseID = @CourseId

	
	if @TeacherId is null and @CourseId is null begin
		insert into @output

		select s.FirstName + ' ' + s.LastName, g.Grade, g.CreatedDate
		from dbo.Grade g
		join dbo.Teacher t on g.TeacherID = t.ID
		join dbo.Student s on g.StudentID = s.ID
		join dbo.Course c on g.CourseID = c.ID

		return
		end

	if @TeacherId is null begin 
		insert into @output

		select s.FirstName + ' ' + s.LastName, g.Grade, g.CreatedDate
		from dbo.Grade g
		join dbo.Teacher t on g.TeacherID = t.ID
		join dbo.Student s on g.StudentID = s.ID
		join dbo.Course c on g.CourseID = c.ID
		where g.CourseID = @CourseId
		
		return
		end

		if @CourseId is null begin 
		insert into @output

		select s.FirstName + ' ' + s.LastName, g.Grade, g.CreatedDate
		from dbo.Grade g
		join dbo.Teacher t on g.TeacherID = t.ID
		join dbo.Student s on g.StudentID = s.ID
		join dbo.Course c on g.CourseID = c.ID
		where g.TeacherID = @TeacherId 
	
		return
		end

		if(select count(*) from @output) = 0 begin

		insert into @output select 'No records of students corresponding to specified teacher ID and/or Course ID', null, null

		return
		end

	return
end 

declare @CourseId int = 2		
declare @TeacherId int = 55

select * from dbo.fn_CantThinkOfAGoodNameForThisFunction(@TeacherId,  @CourseId)

