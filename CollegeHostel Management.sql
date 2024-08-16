CREATE DATABASE HostelManagement;
USE HostelManagement;
CREATE TABLE Students (
    StudentID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE,
    Gender VARCHAR(10),
    ContactNumber VARCHAR(15),
    Email VARCHAR(100),
    Address VARCHAR(255),
    MedicalDetails TEXT
);
INSERT INTO Students (FirstName, LastName, DateOfBirth, Gender, ContactNumber, Email, Address, MedicalDetails)
VALUES ('Arun', 'vijay', '2003-09-14', 'Male', '1234567890', 'arunvijay@gmail.com', '123 Main St', 'Asthma');
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY AUTO_INCREMENT,
    DepartmentName VARCHAR(100)
);
INSERT INTO Departments (DepartmentName)
VALUES ('Computer Science Engineering'),
       ('Mechanical Engineering'),
       ('Information Technology Engineering'),
       ('Electrical Communication Engineering');


CREATE TABLE Professors (
    ProfessorID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    ContactNumber VARCHAR(15),
    Email VARCHAR(100),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);
INSERT INTO Professors (FirstName, LastName, ContactNumber, Email, DepartmentID)
VALUES ('Jaseenash', 'R', '1234567891', 'jasee.r@gmail.com', 1),
       ('Sathya', 'P', '1234567892', 'sathya.p@gmail.com', 2);


CREATE TABLE Courses (
    CourseID INT PRIMARY KEY AUTO_INCREMENT,
    CourseName VARCHAR(100),
    Credits INT,
    DepartmentID INT,
    ProfessorID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID),
    FOREIGN KEY (ProfessorID) REFERENCES Professors(ProfessorID)
);
INSERT INTO Courses (CourseName, Credits, DepartmentID, ProfessorID)
VALUES ('Data Structures', 3, 1, 1),
       ('Thermodynamics', 3, 2, 2);



CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

INSERT INTO Enrollments (StudentID, CourseID, EnrollmentDate)
VALUES (1, 1, '2021-08-01');


CREATE TABLE Rooms (
    RoomID INT PRIMARY KEY AUTO_INCREMENT,
    RoomNumber VARCHAR(10) UNIQUE,
    RoomType VARCHAR(50),
    Capacity INT,
    Occupied INT DEFAULT 0
);
INSERT INTO Rooms (RoomNumber, RoomType, Capacity)
VALUES ('101G', 'Single', 1),
       ('102G', 'Double', 2);


CREATE TABLE Bookings (
    BookingID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    RoomID INT,
    BookingDate DATE,
    CheckInDate DATE,
    CheckOutDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (RoomID) REFERENCES Rooms(RoomID)
);
INSERT INTO Bookings (StudentID, RoomID, BookingDate, CheckInDate, CheckOutDate)
VALUES (1, 1, '2021-08-01', '2021-08-15', NULL);


CREATE TABLE Complaints (
    ComplaintID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    ComplaintText TEXT,
    ComplaintDate DATE,
    Status VARCHAR(50),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);
INSERT INTO Complaints (StudentID, ComplaintText, ComplaintDate, Status)
VALUES (1, 'No hot water in the bathroom.', '2022-08-10', 'Pending');


CREATE TABLE Visitors (
    VisitorID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    VisitorName VARCHAR(100),
    Relationship VARCHAR(50),
    VisitDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);
INSERT INTO Visitors (StudentID, VisitorName, Relationship, VisitDate)
VALUES (1, 'Arun', 'Mother', '2023-08-12');

CREATE TABLE Inventory (
    ItemID INT PRIMARY KEY AUTO_INCREMENT,
    ItemName VARCHAR(100),
    Quantity INT,
    LastUpdated DATE
);
INSERT INTO Inventory (ItemName, Quantity, LastUpdated)
VALUES ('Mattress', 50, '2024-08-01');





