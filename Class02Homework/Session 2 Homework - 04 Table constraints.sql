USE [SEDCHome]
GO


/*
Change GradeDetails table always to insert value 100 in AchievementMaxPoints column if no value is provided on insert
Change GradeDetails table to prevent inserting AchievementPoints that will more than AchievementMaxPoints
Change AchievementType table to guarantee unique names across the Achievement types
*/


alter table [dbo].[GradeDetails]
add constraint DF_GradeDetails_AchievementMaxPoints
default 100 for [AchievementMaxPoints]
go


alter table [dbo].[GradeDetails] with check
add constraint CHK_GradeDetails_AchievementPoints
check (AchievementPoints<=AchievementMaxPoints);
go

alter table [dbo].[AchievementType] with check
add constraint UC_AchievmentType_Name UNIQUE (Name)
GO