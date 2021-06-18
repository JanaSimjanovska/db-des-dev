USE [SEDCHome]
GO

/*
Find all Students with FirstName = Antonio
Find all Students with DateOfBirth greater than ‘01.01.1999’
Find all Male students
Find all Students with LastName starting With ‘T’
Find all Students Enrolled in January/1998
Find all Students with LastName starting With ‘J’ enrolled in January/1998
*/

select * 
from [dbo].[Student]
where [FirstName] = 'Antonio'
go

select * 
from [dbo].[Student]
where [DateOfBirth] > '1999.01.01'
go

select * 
from [dbo].[Student]
where [Gender] = 'M'
go

select * 
from [dbo].[Student]
where [LastName] like 'T%'
go

select *,  year(EnrolledDate),  month(EnrolledDate) 
from [dbo].[Student]
--where [EnrolledDate] >='1998.01.01' and [EnrolledDate] < '1998.02.01'
where year(EnrolledDate) = 1998 and  month(EnrolledDate) = 1
go

select * 
from [dbo].[Student]
where [EnrolledDate] >='1998.01.01' and [EnrolledDate] < '1998.02.01' 
and [LastName] like 'J%'
go