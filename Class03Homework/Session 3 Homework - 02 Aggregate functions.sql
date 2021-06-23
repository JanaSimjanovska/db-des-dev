use [SEDCHome]


/*
Calculate the count of all grades in the system
Calculate the count of all grades per Teacher in the system
Calculate the count of all grades per Teacher in the system for first 100 Students (ID < 100)
Find the Maximal Grade, and the Average Grade per Student on all grades in the system
*/


-- Task 01

select count(*) as TotalGradesInSystem
from [dbo].[Grade]
go



-- Task 02

select t.FirstName + ' ' + t.LastName as Teacher, count(Grade) as TotalGrades
from [dbo].[Grade] g
join [dbo].[Teacher] t on g.TeacherID = t.ID
group by t.FirstName, t.LastName
go



-- Task 03

select t.FirstName + ' ' + t.LastName as Teacher, count(Grade) as TotalGradesForFirst100
from [dbo].[Grade] g
join [dbo].[Teacher] t on g.TeacherID = t.ID
join [dbo].[Student] s on g.StudentID = s.ID
where s.ID < 100
group by t.FirstName, t.LastName
order by t.LastName, t.FirstName
go



-- Task 04

select s.FirstName + ' ' + s.LastName as Student, max(Grade) as MaxGrade, avg(Grade) as AvgGrade
from [dbo].[Grade] g 
join [dbo].[Student] s on g.StudentID = s.ID
group by s.FirstName, s.LastName
order by AvgGrade desc, MaxGrade desc, s.LastName, s.FirstName
go