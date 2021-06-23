use SEDCHome

/*
Declare scalar variable for storing FirstName values
	Assign value ‘Antonio’ to the FirstName variable
	Find all Students having FirstName same as the variable

Declare table variable that will contain StudentId, Student Name and DateOfBirth
	Fill the table variable with all Female students

Declare temp table that will contain LastName and EnrolledDate columns
	Fill the temp table with all Male students having First Name starting with ‘A’
	Retrieve the students from the table which last name is with 7 characters

Find all teachers whose FirstName length is less than 5
	, and the first 3 characters of their FirstName and LastName are the same
*/



-- Task 01

declare
	@FirstName nvarchar(100)
	set @FirstName = 'Antonio'

	select * from [dbo].[Student]
	where FirstName = @FirstName



-- Task 02

declare
	@FemaleStudentsList table
	(StudentID int not null, [Name] nvarchar(100) null, DateOfBirth date)

	insert into @FemaleStudentsList (StudentID, [Name], DateOfBirth)
	select s.ID, s.FirstName + ' ' + s.LastName, s.DateOfBirth
	from [dbo].[Student] s
	where Gender = 'F'

	select * from @FemaleStudentsList



-- Task 03

create table #LastNameEnrolledDateList 
(LastName nvarchar(100), EnrolledDate date)

insert into #LastNameEnrolledDateList (LastName, EnrolledDate)
select s.LastName, s.EnrolledDate
from [dbo].[Student] s
where Gender = 'M' and FirstName like 'A%'

select * from #LastNameEnrolledDateList where Len(LastName) = 7



-- Task 04

select * 
from [dbo].Teacher
where Len(FirstName) < 5 and Left(FirstName, 3) = Left(LastName, 3)