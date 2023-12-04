create database Adult_education_department;
use Adult_education_department;
-- Create Student Table
CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    ContactNumber VARCHAR(15),
    Email VARCHAR(50)
);

-- Insert sample data into Student table
INSERT INTO Student (StudentID, Name, Age, ContactNumber, Email)
VALUES
    (1, 'Alice Johnson', 25, '555-1234', 'alice@example.com'),
    (2, 'Bob Smith', 30, '555-5678', 'bob@example.com'),
    (3, 'Catherine Davis', 28, '555-9012', 'catherine@example.com'),
    (4, 'David Miller', 35, '555-3456', 'david@example.com'),
    (5, 'Emma White', 22, '555-7890', 'emma@example.com');
select * from Student;
-- Create Course Table
CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50),
    Description VARCHAR(255),
    Duration VARCHAR(50),
    Cost DECIMAL(10, 2)
);

-- Insert sample data into Course table
INSERT INTO Course (CourseID, CourseName, Description, Duration, Cost)
VALUES
    (1, 'Introduction to Programming', 'Fundamentals of programming', '8 weeks', 199.99),
    (2, 'Data Science Basics', 'Introduction to data analysis', '10 weeks', 249.99),
    (3, 'Business Communication', 'Effective communication skills', '6 weeks', 149.99),
    (4, 'Web Development Fundamentals', 'Building basic websites', '12 weeks', 299.99),
    (5, 'Project Management Essentials', 'Fundamentals of project management', '8 weeks', 199.99);
select * from  Course;
-- Create Instructor Table
CREATE TABLE Instructor (
    InstructorID INT PRIMARY KEY,
    InstructorName VARCHAR(50),
    Expertise VARCHAR(50),
    Email VARCHAR(50),
    ContactNumber VARCHAR(15)
);

-- Insert sample data into Instructor table
INSERT INTO Instructor (InstructorID, InstructorName, Expertise, Email, ContactNumber)
VALUES
    (1, 'John Doe', 'Programming', 'john.doe@example.com', '555-1234'),
    (2, 'Jane Smith', 'Data Science', 'jane.smith@example.com', '555-5678'),
    (3, 'Mike Johnson', 'Communication', 'mike.johnson@example.com', '555-9012'),
    (4, 'Alice Brown', 'Web Development', 'alice.brown@example.com', '555-3456'),
    (5, 'Chris Wilson', 'Project Management', 'chris.wilson@example.com', '555-7890');
select * from Instructor;
-- Create Class Table
CREATE TABLE Class (
    ClassID INT PRIMARY KEY,
    ClassName VARCHAR(50),
    Schedule VARCHAR(50),
    RoomNumber VARCHAR(20),
    Capacity INT
);

-- Insert sample data into Class table
INSERT INTO Class (ClassID, ClassName, Schedule, RoomNumber, Capacity)
VALUES
    (1, 'Programming 101', 'Monday 6:00 PM', 'Room 101', 30),
    (2, 'Data Science Workshop', 'Wednesday 4:00 PM', 'Room 102', 25),
    (3, 'Business Writing Seminar', 'Thursday 2:00 PM', 'Room 103', 20),
    (4, 'Web Development Lab', 'Tuesday 7:30 PM', 'Room 104', 35),
    (5, 'Project Management Bootcamp', 'Friday 9:00 AM', 'Room 105', 28);
select * from Class;
-- Create Registration Table
CREATE TABLE Registration (
    RegistrationID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    RegistrationDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

-- Insert sample data into Registration table
INSERT INTO Registration (RegistrationID, StudentID, CourseID, RegistrationDate)
VALUES
    (1, 1, 1, '2023-01-15'),
    (2, 2, 3, '2023-01-20'),
    (3, 3, 2, '2023-02-01'),
    (4, 4, 4, '2023-02-10'),
    (5, 5, 5, '2023-02-15');
select * from Registration;
-- Create Payments Table
CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    StudentID INT,
    Amount DECIMAL(10, 2),
    PaymentDate DATE,
    PaymentMethod VARCHAR(50),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID)
);

-- Insert sample data into Payments table
INSERT INTO Payments (PaymentID, StudentID, Amount, PaymentDate, PaymentMethod)
VALUES
    (1, 1, 150.00, '2023-01-20', 'Credit Card'),
    (2, 2, 100.00, '2023-01-25', 'PayPal'),
    (3, 3, 200.00, '2023-02-05', 'Debit Card'),
    (4, 4, 250.00, '2023-02-12', 'Bank Transfer'),
    (5, 5, 180.00, '2023-02-18', 'Cash');
select * from Payments;
-- Create DepartmentStaff Table
CREATE TABLE DepartmentStaff (
    StaffID INT PRIMARY KEY,
    Name VARCHAR(50),
    Position VARCHAR(50),
    ContactNumber VARCHAR(15),
    Email VARCHAR(50)
);

-- Insert sample data into DepartmentStaff table
INSERT INTO DepartmentStaff (StaffID, Name, Position, ContactNumber, Email)
VALUES
    (1, 'Mark Johnson', 'Department Head', '555-1111', 'mark.johnson@example.com'),
    (2, 'Anna Smith', 'Administrative Assistant', '555-2222', 'anna.smith@example.com'),
    (3, 'Robert Davis', 'Registrar', '555-3333', 'robert.davis@example.com'),
    (4, 'Eva Wilson', 'Counselor', '555-4444', 'eva.wilson@example.com'),
    (5, 'Brian Miller', 'Admissions Officer', '555-5555', 'brian.miller@example.com');
select * from DepartmentStaff;
-- Create Library Table
CREATE TABLE Library (
    BookID INT PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(50),
    AvailableCopies INT
);

-- Insert sample data into Library table
INSERT INTO Library (BookID, Title, Author, AvailableCopies)
VALUES
    (1, 'Programming in Python', 'John Smith', 5),
    (2, 'Data Science for Beginners', 'Jane Doe', 8),
    (3, 'Effective Business Communication', 'Mike Johnson', 10),
    (4, 'HTML and CSS Basics', 'Alice Brown', 6),
    (5, 'Project Management Guide', 'Chris Wilson', 7);
select * from Library;
-- Create Attendance Table
CREATE TABLE Attendance (
    AttendanceID INT PRIMARY KEY,
    ClassID INT,
    StudentID INT,
    Date DATE,
    Status VARCHAR(20),
    FOREIGN KEY (ClassID) REFERENCES Class(ClassID),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID)
);

-- Insert sample data into Attendance table
INSERT INTO Attendance (AttendanceID, ClassID, StudentID, Date, Status)
VALUES
    (1, 1, 1, '2023-01-22', 'Present'),
    (2, 2, 2, '2023-01-24', 'Absent'),
    (3, 3, 3, '2023-01-26', 'Present'),
    (4, 4, 4, '2023-01-28', 'Late'),
    (5, 5, 5, '2023-01-30', 'Present');
select * from Attendance;
-- Create Events Table
CREATE TABLE Events (
    EventID INT PRIMARY KEY,
    EventName VARCHAR(50),
    Date DATE,
    Venue VARCHAR(50)
);

-- Insert sample data into Events table
INSERT INTO Events (EventID, EventName, Date, Venue)
VALUES
    (1, 'Career Workshop', '2023-02-05', 'Auditorium A'),
    (2, 'Networking Session', '2023-02-10', 'Conference Room'),
    (3, 'Guest Speaker Series', '2023-02-15', 'Lecture Hall'),
    (4, 'Student Meetup', '2023-02-20', 'Common Area'),
    (5, 'Educational Fair', '2023-02-25', 'Exhibition Hall');
select * from Events;

SELECT 
    Registration.RegistrationID,
    Student.StudentID,
    Student.Name AS StudentName,
    Course.CourseID,
    Course.CourseName,
    Registration.RegistrationDate
FROM 
    Registration
JOIN 
    Student ON Registration.StudentID = Student.StudentID
JOIN 
    Course ON Registration.CourseID = Course.CourseID;
    
SELECT 
    Instructor.InstructorID,
    Instructor.InstructorName,
    Course.CourseID,
    Course.CourseName,
    Course.Description
FROM 
    Course
JOIN 
    Instructor ON Course.CourseID = Instructor.InstructorID;
SELECT 
    Class.ClassID,
    Class.ClassName,
    Student.StudentID,
    Student.Name AS StudentName
FROM 
    Attendance
JOIN 
    Student ON Attendance.StudentID = Student.StudentID
JOIN 
    Class ON Attendance.ClassID = Class.ClassID
WHERE 
    Class.ClassName = 'Programming 101';
SELECT 
    Student.StudentID,
    Student.Name AS StudentName,
    Course.CourseID,
    Course.CourseName,
    Registration.RegistrationDate
FROM 
    Registration
JOIN 
    Student ON Registration.StudentID = Student.StudentID
JOIN 
    Course ON Registration.CourseID = Course.CourseID
WHERE 
    Student.Name = 'Alice Johnson';

SELECT 
    Student.StudentID,
    Student.Name AS StudentName,
    Payments.Amount,
    Payments.PaymentDate,
    Payments.PaymentMethod
FROM 
    Payments
JOIN 
    Student ON Payments.StudentID = Student.StudentID;

SELECT 
    Class.ClassID,
    Class.ClassName,
    Class.Capacity - COUNT(Attendance.StudentID) AS AvailableSpaces
FROM 
    Class
LEFT JOIN 
    Attendance ON Class.ClassID = Attendance.ClassID
GROUP BY 
    Class.ClassID, Class.ClassName, Class.Capacity;

SELECT 
    Student.StudentID,
    Student.Name AS StudentName,
    Course.CourseID,
    Course.CourseName,
    Registration.RegistrationDate,
    Payments.Amount,
    Payments.PaymentDate,
    Payments.PaymentMethod
FROM 
    Student
LEFT JOIN 
    Registration ON Student.StudentID = Registration.StudentID
LEFT JOIN 
    Course ON Registration.CourseID = Course.CourseID
    
LEFT JOIN 
    Payments ON Student.StudentID = Payments.StudentID;

SELECT 
    Student.StudentID,
    Student.Name AS StudentName,
    Course.CourseID,
    Course.CourseName,
    Registration.RegistrationDate,
    Payments.Amount,
    Payments.PaymentDate,
    Payments.PaymentMethod
FROM 
    Student
LEFT JOIN 
    Registration ON Student.StudentID = Registration.StudentID
LEFT JOIN 
    Course ON Registration.CourseID = Course.CourseID
LEFT JOIN 
    Payments ON Student.StudentID = Payments.StudentID;
SELECT 
    Student.StudentID,
    Student.Name AS StudentName,
    Course.CourseID,
    Course.CourseName,
    Registration.RegistrationDate,
    Payments.Amount,
    Payments.PaymentDate,
    Payments.PaymentMethod
FROM 
    Student
LEFT JOIN 
    Registration ON Student.StudentID = Registration.StudentID
LEFT JOIN 
    Course ON Registration.CourseID = Course.CourseID
LEFT JOIN 
    Payments ON Student.StudentID = Payments.StudentID;
SELECT 
    Student.StudentID,
    Student.Name AS StudentName,
    Course.CourseID,
    Course.CourseName,
    Registration.RegistrationDate,
    Payments.Amount,
    Payments.PaymentDate,
    Payments.PaymentMethod
FROM 
    Student
LEFT JOIN 
    Registration ON Student.StudentID = Registration.StudentID
LEFT JOIN 
    Course ON Registration.CourseID = Course.CourseID
LEFT JOIN 
    Payments ON Student.StudentID = Payments.StudentID;


SELECT 
    Student.StudentID,
    Student.Name AS StudentName,
    Course.CourseID,
    Course.CourseName,
    Class.ClassName,
    Registration.RegistrationDate,
    Payments.Amount,
    Payments.PaymentDate,
    Payments.PaymentMethod
FROM 
    Student
LEFT JOIN 
    Registration ON Student.StudentID = Registration.StudentID
LEFT JOIN 
    Course ON Registration.CourseID = Course.CourseID
LEFT JOIN 
    Class ON Registration.ClassID = Class.ClassID
LEFT JOIN 
    Payments ON Student.StudentID = Payments.StudentID;
