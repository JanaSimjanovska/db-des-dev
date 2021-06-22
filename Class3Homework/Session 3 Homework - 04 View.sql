use SEDCHome


/*
 Create new view (vv_StudentGrades) that will List all StudentIds and count of Grades per student
 Change the view to show Student First and Last Names instead of StudentID
 List all rows from view ordered by biggest Grade Count

 Create new view (vv_StudentGradeDetails) that will List all Students (FirstName and LastName) and Count the courses he passed through the exam(Ispit) 
 */



--Task 01

 drop view if exists vv_StudentGrades
 go

 create or alter view vv_StudentGrades
 as
 select s.ID as StudentId, count(Grade) as GradeCount
 from [dbo].[Grade] g
 join [dbo].[Student] s on s.ID = g.StudentID 
 group by s.ID
 go

 select * from vv_StudentGrades
 go



--Task 02

alter view vv_StudentGrades
as
select s.FirstName + ' ' + s.LastName as Student, count(Grade) as GradeCount
from [dbo].[Grade] g
join [dbo].[Student] s on s.ID = g.StudentID 
group by s.FirstName + ' ' + s.LastName
go

select * from vv_StudentGrades
go



--Task 03

select * from vv_StudentGrades
order by GradeCount desc
go



--Task 04

drop view if exists vv_StudentGradeDetails
go

create or alter view vv_StudentGradeDetails
as
select s.FirstName + ' ' + s.LastName as Student, count(CourseID) as TotalPassedThroughExam
from [dbo].[Grade] g
join [dbo].[Student] s on s.ID = g.StudentID 
join [dbo].[GradeDetails] d on d.GradeID = g.ID
join [dbo].[AchievementType] a on a.ID = d.AchievementTypeID
where a.Name = 'Ispit' and d.AchievementPoints >= 61
group by s.FirstName + ' ' + s.LastName
go

select * from vv_StudentGradeDetails
order by TotalPassedThroughExam desc, Student asc
go
