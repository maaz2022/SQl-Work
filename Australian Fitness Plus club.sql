create database Australian_Fitness_Plus_club;
use Australian_Fitness_Plus_club;
create table Member(
memberID int primary key,
Name varchar(50), email varchar(25),
DOB varchar(25),membership_type varchar(25),
joining_date int
);
ALTER TABLE Member
MODIFY COLUMN joining_date DATE;
INSERT INTO Member (memberID, Name, email, DOB, membership_type, joining_date)
VALUES
    (1, 'Ahad', 'ahad@yahoo.com', '2002-09-20', 'Premium', '2023-12-02'),
    (2, 'John', 'john@gmail.com', '1995-05-15', 'Basic', '2023-11-28'),
    (3, 'Sarah', 'sarah@hotmail.com', '1988-11-10', 'Gold', '2023-11-30'),
    (4, 'Alex', 'alex@gmail.com', '2000-03-25', 'Premium', '2023-12-01'),
    (5, 'Emily', 'emily@yahoo.com', '1993-07-18', 'Basic', '2023-11-29');
    delete from Member;
select * from Member;

create table Class(
classID int primary key,
Class_Name varchar(50), instructor varchar(25),
schedule varchar(25),
maximum_capacity int
);

INSERT INTO Class (classID, Class_Name, instructor, schedule, maximum_capacity)
VALUES
    (1, 'Yoga', 'John Doe', 'Monday 10:00 AM', 20),
    (2, 'Spin Class', 'Jane Smith', 'Wednesday 6:30 PM', 15),
    (3, 'Bootcamp', 'Mike Johnson', 'Friday 7:00 AM', 25),
    (4, 'Zumba', 'Alice Brown', 'Tuesday 5:45 PM', 18),
    (5, 'Pilates', 'Chris Wilson', 'Thursday 4:15 PM', 22);
    SET SQL_SAFE_UPDATES=0;
    delete from Class;
select * from Class;
create table Staff(
staffID int primary key,
Name varchar(50), position varchar(25),
contact_no int,
hire_date int
);
alter table Staff
modify column hire_date date;
alter table Staff
modify column contact_no bigint;
INSERT INTO Staff (staffID, Name, Position, contact_no, hire_date) VALUES
(501, 'John Doe', 'Fitness Trainer', 1234567890, '2022-01-05'),
(502, 'Jane Smith', 'Front Desk Receptionist', 9876543210, '2022-02-15'),
(503, 'Mike Johnson', 'Maintenance Staff', 5551234567, '2022-03-20'),
(504, 'Emily Davis', 'Nutritionist', 1112223344, '2022-04-10'),
(505, 'David Miller', 'Janitor', 9998887777, '2022-05-25');
select * from Staff;
create table Equipment(
EquipmentID int primary key,
EquipmentName varchar(50), EquipmentCondition varchar(25),
purchaseDate int,
QuantityAvailable int
);
INSERT INTO Equipment (EquipmentID, EquipmentName, EquipmentCondition, PurchaseDate, QuantityAvailable) VALUES
(101, 'Treadmill', 'Good', 20220110, 3),
(102, 'Dumbbells', 'Excellent', 20220220, 10),
(103, 'Elliptical Trainer', 'Fair', 20220310, 2),
(104, 'Weight Bench', 'Good', 20220405, 5),
(105, 'Stationary Bike', 'Excellent', 20220512, 4);
select * from Equipment;
CREATE TABLE Attendence_Tracking (
    TrackingID INT PRIMARY KEY,
    status VARCHAR(50),
    currentDate INT,
    memberID INT,
    classID INT,
    FOREIGN KEY (memberID) REFERENCES Member(memberID),
    FOREIGN KEY (classID) REFERENCES Class(classID)
);
alter table Attendence_Tracking
modify column currentDate date;
select * from Attendence_Tracking;
INSERT INTO Attendence_Tracking (TrackingID, status, currentDate, memberID, classID)
VALUES
    (1, 'Present', '2023-12-02', 1, 1),
    (2, 'Absent', '2023-12-02', 2, 3),
    (3, 'Present', '2023-12-02', 3, 5),
    (4, 'Late', '2023-12-02', 4, 2),
    (5, 'Present', '2023-12-02', 5, 4);
    select * from Attendence_Tracking;
CREATE TABLE payment (
    paymentID INT PRIMARY KEY,
    status VARCHAR(50),
    Amount INT,
    paymentDate int, paymentMethod varchar(25),
    memberID INT,
    FOREIGN KEY (memberID) REFERENCES Member(memberID)
);
INSERT INTO payment (paymentID, status, Amount, paymentDate, paymentMethod, memberID)
VALUES
    (101, 'Pending', 100, 20231202, 'Credit Card', 1),
    (102, 'Pending', 50, 20231128, 'PayPal', 2),
    (103, 'Pending', 75, 20231130, 'Debit Card', 3),
    (104, 'Pending', 120, 20231201, 'Bank Transfer', 4),
    (105, 'Pending', 200, 20231129, 'Cash', 5);
    select * from payment;
CREATE TABLE Membership (
    planID INT PRIMARY KEY,
    planName VARCHAR(50),
    cost INT,
    IncludedClasses varchar(25)
);
Alter table Membership
modify column  IncludedClasses varchar(50);

insert INTO Membership (planID, planName, cost, IncludedClasses)
VALUES
    (1, 'Basic Plan', 50, 'Limited Classes'),
    (2, 'Premium Plan', 100, 'Unlimited Classes'),
    (3, 'Gold Plan', 75, 'Premium Classes'),
    (4, 'Student Plan', 40, 'Limited Classes'),
    (5, 'Family Plan', 150, 'Classes for Family Members');
    select * from Membership;
CREATE TABLE locker (
    lockerID INT PRIMARY KEY,
    AccessCode VARCHAR(50),
    Date INT,
    memberID INT,
    FOREIGN KEY (memberID) REFERENCES Member(memberID)
);
INSERT INTO locker (lockerID, AccessCode, Date, memberID)
VALUES
    (1, '1234ABC', 20231202, 1), 
    (2, '5678DEF', 20231128, 2), 
    (3, '9GHIJKL', 20231130, 3),
    (4, 'MNOPQR', 20231201, 4),  
    (5, 'STUVWXYZ', 20231129, 5);
    select * from locker;
CREATE TABLE trainer (
    trainerID INT PRIMARY KEY,
    name VARCHAR(50),
    Amount INT,
    TrainerSchedule varchar(50), specialization varchar(25)
);
INSERT INTO trainer (trainerID, name, Amount, TrainerSchedule, specialization)
VALUES
    (1, 'Alice Johnson', 60, 'Monday, Wednesday, Friday - 8:00 AM to 12:00 PM', 'Cardio'),
    (2, 'Bob Smith', 75, 'Tuesday, Thursday - 4:00 PM to 8:00 PM', 'Weight Training'),
    (3, 'Catherine Davis', 70, 'Monday, Wednesday, Friday - 2:00 PM to 6:00 PM', 'Yoga'),
    (4, 'David Miller', 65, 'Tuesday, Thursday - 10:00 AM to 2:00 PM', 'CrossFit'),
    (5, 'Emma White', 80, 'Monday, Wednesday - 6:00 PM to 9:00 PM', 'Pilates');
    select * from trainer;
CREATE TABLE healthAssessment (
    assessmentID INT PRIMARY KEY,
    date INT,
    weight int, height int,
    fitnessLevel varchar(25),
    memberID INT,
    FOREIGN KEY (memberID) REFERENCES Member(memberID)
);
INSERT INTO healthAssessment (assessmentID, date, weight, height, fitnessLevel, memberID)
VALUES
    (1, 20230115, 70, 175, 'Intermediate', 1), 
    (2, 20230220, 65, 160, 'Beginner', 2),    
    (3, 20230325, 80, 180, 'Advanced', 3),     
    (4, 20230410, 75, 170, 'Intermediate', 4), 
    (5, 20230505, 68, 165, 'Beginner', 5); 
    select * from healthAssessment;
CREATE TABLE maintainenceRequest (
    requestID INT PRIMARY KEY,
    requestdate INT,
    status varchar(50),
    EquipmentID INT,
    FOREIGN KEY (EquipmentID) REFERENCES Equipment(EquipmentID)
);
alter table maintainenceRequest
modify column requestDate date;
INSERT INTO maintainenceRequest (requestID, requestDate, status, equipmentID) VALUES
(1, '2023-01-15', 'Pending', 101),
(2, '2023-02-20', 'In Progress', 102),
(3, '2023-03-10', 'Completed', 103),
(4, '2023-04-05', 'Pending', 104),
(5, '2023-05-12', 'In Progress', 105);
select * from maintainenceRequest;
CREATE TABLE feedback (
    feedbackID INT PRIMARY KEY,
    comments VARCHAR(50),
    SubmissionDate INT,
    memberID INT,
    classID INT,
    FOREIGN KEY (memberID) REFERENCES Member(memberID),
    FOREIGN KEY (classID) REFERENCES Class(classID)
);
alter table feedback
modify column SubmissionDate date;
alter table feedback
modify column comments varchar(150);
select * from feedback;
INSERT INTO feedback (feedbackID, comments, SubmissionDate, memberID, classID) VALUES
(1, 'Enjoyed the Yoga class. John Doe is a great instructor!', '2023-12-02', 1, 1),
(2, 'The Spin Class was intense but fun. Jane Smith is energetic!', '2023-11-28', 2, 2),
(3, 'Bootcamp was challenging, but I felt accomplished. Mike Johnson is motivating!', '2023-11-30', 3, 3),
(4, 'Zumba was a blast! Alice Brown knows how to keep the energy high.', '2023-12-01', 4, 4),
(5, 'Pilates helped me relax and improve flexibility. Chris Wilson is excellent!', '2023-11-29', 5, 5);

-- Check distinct trainer names in ConsolidatedData
SELECT DISTINCT TrainerName FROM ConsolidatedData;

-- Check distinct trainer names in the Trainer table
SELECT DISTINCT name FROM Trainer;

-- Create a report combining data for members, instructors, trainers, schedules, and payment methods
SELECT
    CD.memberID,
    CD.MemberName,
    CD.ClassName,
    CD.InstructorName,
    CD.ClassSchedule,
    P.Amount,
    P.paymentDate,
    P.paymentMethod
FROM
    ConsolidatedData CD
LEFT JOIN
    Payment P ON CD.memberID = P.memberID


