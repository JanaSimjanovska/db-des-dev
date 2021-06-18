/*
List all possible combinations of Courses names and AchievementType names that can be passed by student
List all Teachers that has any exam Grade
List all Teachers without exam Grade
List all Students without exam Grade (using Right Join)
*/


select c.Name as Course, a.Name as Achievement
from dbo.Course c
cross join dbo.AchievementType a

select * from dbo.Teacher
select * from dbo.Grade

select t.FirstName + ' ' + t.LastName as Teacher
from dbo.Teacher t
inner join dbo.Grade g on t.ID = TeacherID 

select t.FirstName + ' ' + t.LastName as Teacher
from dbo.Teacher t
left join dbo.Grade g on t.ID = g.TeacherID
where g.TeacherID is null

select t.FirstName + ' ' + t.LastName as Teacher
from dbo.Grade g
right join dbo.Teacher t on t.ID = g.TeacherID
where g.TeacherID is null
