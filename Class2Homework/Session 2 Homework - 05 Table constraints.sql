USE [SEDCHome]
GO


/*
Create Foreign key constraints from diagram or with script
*/

--ALTER TABLE [dbo].[Grade] DROP CONSTRAINT [FK_Grade_Course];
--ALTER TABLE [dbo].[Grade] DROP CONSTRAINT [FK_Grade_Student];
--ALTER TABLE [dbo].[Grade] DROP CONSTRAINT [FK_Grade_Teacher];
--ALTER TABLE [dbo].[GradeDetails] DROP CONSTRAINT [FK_GradeDetails_AchievementType];
--ALTER TABLE [dbo].[GradeDetails] DROP CONSTRAINT [FK_GradeDetails_Grade];

alter table [dbo].[Grade] with check
add constraint [FK_Grade_Course] foreign key ([CourseID]) references [dbo].[Course]([Id]);

alter table [dbo].[Grade] with check
add constraint [FK_Grade_Student] foreign key ([StudentID]) references [dbo].[Student]([Id]);

alter table [dbo].[Grade] with check
add constraint [FK_Grade_Teacher] foreign key ([TeacherID]) references [dbo].[Teacher]([Id]);

alter table [dbo].[GradeDetails] with check
add constraint [FK_GradeDetails_AchievementType] foreign key ([AchievementTypeID]) references [dbo].[AchievementType]([ID]);

alter table [dbo].[GradeDetails] with check
add constraint [FK_GradeDetails_Grade] foreign key ([GradeID]) references [dbo].[Grade]([ID]);



