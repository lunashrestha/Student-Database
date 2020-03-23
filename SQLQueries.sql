/* altering table to fix data insertion error */
ALTER TABLE Advisor
MODIFY COLUMN Salary DECIMAL(8,2);
    
ALTER TABLE Position
MODIFY COLUMN BaseSalary DECIMAL(8,2);
    
select * from student;
select * from advisor;
select * from position;
select * from employer;
select * from course;
select * from registration;
select * from schedule;
select * from payment;
select * from CourseSignUp;
select * from Instructor;


/* dropped column endtime from table schedule */
alter table schedule 
drop column endtime;


/* Query to find the name of their advisor of each student*/
SELECT 
    s.FirstName, s.LastName, a.name AS AdvisorName
FROM
    student AS s
        JOIN
    Advisor AS a ON s.AdvisorID = a.AdvisorID;



/* Query to find the course taken by student on certain days*/
SELECT s.TechID,s.FirstName,sc.DayofWeek,c.CourseID,c.Name as CourseName FROM Student as s
JOIN Registration as r ON r.TechID = s.TechID
JOIN Schedule as sc ON sc. ScheduleID = r.ScheduleID
JOIN Course as c ON c.CourseID = sc.CourseID



    