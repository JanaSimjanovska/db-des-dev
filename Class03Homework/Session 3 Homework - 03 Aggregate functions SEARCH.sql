use SEDCHome



/*

Calculate the count of all grades per Teacher in the system and filter only grade count greater then 200
Calculate the count of all grades per Teacher in the system for first 100 Students (ID < 100) and filter teachers with more than 50 Grade count
Find the Grade Count, Maximal Grade, and the Average Grade per Student on all grades in the system. Filter only records where Maximal Grade is equal to Average Grade
List Student First Name and Last Name next to the other details from previous query

*/



-- Task 01

select t.FirstName + ' ' + t.LastName as Teacher, count(Grade) as TotalGrades
from [dbo].[Grade] g
join [dbo].[Teacher] t on g.TeacherID = t.ID
group by t.FirstName, t.LastName
having count(Grade) > 200 
order by count(Grade)
go



-- Task 02

select t.FirstName + ' ' + t.LastName as Teacher, count(Grade) as TotalGradesFirst100MoreThan50
from [dbo].[Grade] g
join [dbo].[Teacher] t on g.TeacherID = t.ID
join [dbo].[Student] s on g.StudentID = s.ID
where s.ID < 100
group by t.FirstName, t.LastName
having count(Grade) > 50 
order by count(Grade)
go


-- Task 03

select s.FirstName + ' ' + s.LastName as Student, count(Grade) as GradeCount, max(Grade) as MaxGrade, avg(Grade) as AvgGrade
from [dbo].[Grade] g 
join [dbo].[Student] s on g.StudentID = s.ID
group by s.FirstName, s.LastName
having max(Grade) = avg(Grade)
order by GradeCount desc, AvgGrade desc, MaxGrade desc, s.LastName, s.FirstName
go



-- Task 04 - Ne ja pravam zasto i dosega im gi stavav iminjata i preziminjata, mene mi bese taka poubavo, popregledno, ete i gi redev po prezime, pa po ime
