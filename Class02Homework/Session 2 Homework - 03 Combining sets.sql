USE [SEDCHome]
GO


/*
List all Teacher First Names and Student First Names in single result set with duplicates
List all Teacher Last Names and Student Last Names in single result set. Remove duplicates
List all common First Names for Teachers and Students
*/


select [FirstName]
from [dbo].[Teacher]
union all
select [FirstName]
from [dbo].[Student] 
order by [FirstName]
go

select [LastName]
from [dbo].[Teacher]
union
select [LastName]
from [dbo].[Student] 
order by [LastName]
go

select [FirstName]
from [dbo].[Teacher]
intersect
select [FirstName]
from [dbo].[Student] 
order by [FirstName]
go