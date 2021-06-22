use SEDCHome


/*
--  List all student First Name that are duplicated more than 3 time

--  List the First Name for all the student's that their Last Name is duplicated and they are born in 1985  (Hint use View)

--  Find how many courses each student (using Name and Last Name) has attended

--  Find the students (using Name and Last Name) that have attended less than 20 courses and get their Min, Max and Average grade ordered by the Average Grade ascending

--  For all the students (using First Name and Last Name) get their Min, Max and Average grade (Create view vv_StudentSuccess)

--  Find all the students that have achieved less than 25% from the AchievementMaxPoints for the AchievementType  'Domasni'

--  For the Students from the above list check what is their Success (Min, Max and Average grade) and order them by the AVG grade
 */



-- Task 01

select s.FirstName as AppearsMoreThan3Times
from [dbo].[Student] s
group by FirstName
having count(FirstName) > 3
order by FirstName
go



-- Task 02

select FirstName
from [dbo].[Student]
where year(DateOfBirth) = 1985
group by FirstName
having count(LastName) > 1
go



-- Task 03

select s.FirstName + ' ' + s.LastName as Student, count(g.CourseID) as NumOfAttendedCourse
from [dbo].[Grade] g
join [dbo].[Student] s on s.ID = g.StudentID
group by s.FirstName + ' ' + s.LastName



-- Task 04

select s.FirstName + ' ' + s.LastName as Student, count(g.CourseID) as NumOfAttendedCourse, max(g.Grade) as MaxGrade, min(g.Grade) as MinGrade, avg(g.Grade) as AvgGrade
from [dbo].[Grade] g
join [dbo].[Student] s on s.ID = g.StudentID
group by s.FirstName + ' ' + s.LastName
having count(g.CourseID) < 20
order by avg(g.Grade)



-- Task 05

create or alter view vv_StudentSuccess
as
select s.FirstName + ' ' + s.LastName as Student, max(g.Grade) as MaxGrade, min(g.Grade) as MinGrade, avg(g.Grade) as AvgGrade
from [dbo].[Grade] g
join [dbo].[Student] s on s.ID = g.StudentID
group by s.FirstName + ' ' + s.LastName

select * from vv_StudentSuccess


-- Task 06

select s.FirstName + ' ' + s.LastName as Student, c.[Name] as Course, d.AchievementPoints as PointsFromHomework
from [dbo].[Grade] g
join [dbo].[GradeDetails] d on d.GradeID = g.ID
join [dbo].[Student] s on s.ID = g.StudentID
join [dbo].[AchievementType] a on a.ID = d.AchievementTypeID
join [dbo].[Course] c on c.ID = g.CourseID
where a.Name = 'Domasni'
group by s.FirstName + ' ' + s.LastName, d.AchievementPoints, c.[Name]
having d.AchievementPoints < 25



-- Task 07

select s.FirstName + ' ' + s.LastName as Student, max(g.Grade) as MaxGrade, min(g.Grade) as MinGrade, avg(g.Grade) as AvgGrade
from [dbo].[Grade] g
join [dbo].[GradeDetails] d on d.GradeID = g.ID
join [dbo].[Student] s on s.ID = g.StudentID
join [dbo].[AchievementType] a on a.ID = d.AchievementTypeID
join [dbo].[Course] c on c.ID = g.CourseID
where a.Name = 'Domasni'
group by s.FirstName + ' ' + s.LastName, d.AchievementPoints
having d.AchievementPoints < 25
order by avg(g.Grade)
