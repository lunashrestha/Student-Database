/* Creating schema named student */
CREATE SCHEMA student;

/* Creating tables in Student Database */
CREATE TABLE Student (
    TechID INT UNSIGNED NOT NULL,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    AdvisorID INT NOT NULL,
    EnrollmentStatus VARCHAR(50) NOT NULL,
    Semester VARCHAR(50) NOT NULL
);

CREATE TABLE Employer (
    EmployerID INT UNSIGNED NOT NULL,
    Name VARCHAR(50) NOT NULL,
    Department VARCHAR(50) NOT NULL
);
  
CREATE TABLE Position (
    PositionID INT UNSIGNED NOT NULL,
    TechID INT UNSIGNED NOT NULL,
    EmployerID INT UNSIGNED NOT NULL,
    Title VARCHAR(50) NOT NULL,
    Description VARCHAR(100) NOT NULL,
    BaseSalary DECIMAL(5 , 2 ) NOT NULL
);

CREATE TABLE Advisor (
    AdvisorID INT NOT NULL,
    Name VARCHAR(50) NOT NULL,
    Department VARCHAR(50) NOT NULL,
    Salary DECIMAL(5 , 2 ) NOT NULL
);
    
CREATE TABLE Registration (
    RegistrationID INT UNSIGNED NOT NULL,
    ScheduleID INT UNSIGNED NOT NULL,
    TechID INT UNSIGNED NOT NULL
);
    
CREATE TABLE Payment (
    PaymentID INT UNSIGNED NOT NULL,
    AccountType VARCHAR(50) NOT NULL,
    RoutingNumber BIGINT UNSIGNED NOT NULL,
    TechID INT UNSIGNED NOT NULL
);
    
CREATE TABLE Instructor (
    InstructorID INT UNSIGNED NOT NULL,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Department VARCHAR(50) NOT NULL,
    EnrollmentType VARCHAR(50) NOT NULL
);
    
CREATE TABLE CourseSignUp (
    SignUpID INT UNSIGNED NOT NULL,
    CourseID INT UNSIGNED NOT NULL,
    InstructorID INT UNSIGNED NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL
);

CREATE TABLE Schedule (
    ScheduleID INT UNSIGNED NOT NULL,
    CourseID INT UNSIGNED NOT NULL,
    DayofWeek VARCHAR(50) NOT NULL,
    StartTime TIME NOT NULL,
    EndTime TIME NOT NULL
);
    
CREATE TABLE Course (
    CourseID INT UNSIGNED NOT NULL,
    Name VARCHAR(50) NOT NULL,
    Description VARCHAR(100) NULL
);

/* Creating primary key constraints*/

ALTER TABLE Student
ADD PRIMARY KEY (TechID);
ALTER TABLE Employer
ADD PRIMARY KEY (EmployerID);
ALTER TABLE Position
ADD PRIMARY KEY (PositionID);
ALTER TABLE Payment
ADD PRIMARY KEY (PaymentID);
ALTER TABLE Advisor
ADD PRIMARY KEY (AdvisorID);
ALTER TABLE Registration
ADD PRIMARY KEY (RegistrationID);
ALTER TABLE Schedule
ADD PRIMARY KEY (ScheduleID);
ALTER TABLE Instructor
ADD PRIMARY KEY (InstructorID);
ALTER TABLE CourseSignUp
ADD PRIMARY KEY (SignupID);
ALTER TABLE Course
ADD PRIMARY KEY (CourseID);

/* Creating primary key constraints*/

ALTER TABLE Student
ADD FOREIGN KEY (AdvisorID) REFERENCES Advisor(AdvisorID);
ALTER TABLE Position
ADD FOREIGN KEY (TechID) REFERENCES Student(TechID);
ALTER TABLE Position
ADD FOREIGN KEY (EmployerID) REFERENCES Employer(EmployerID);
ALTER TABLE Payment
ADD FOREIGN KEY (TechID) REFERENCES Student(TechID);
ALTER TABLE Registration
ADD FOREIGN KEY (ScheduleID) REFERENCES Schedule(ScheduleID),
ADD FOREIGN KEY (TechID) REFERENCES Student(TechID);
ALTER TABLE Schedule
ADD FOREIGN KEY (CourseID) REFERENCES Course(CourseID);
ALTER TABLE CourseSignUp
ADD FOREIGN KEY (CourseID) REFERENCES Course(CourseID);


