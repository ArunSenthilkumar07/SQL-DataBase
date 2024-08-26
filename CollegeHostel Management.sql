CREATE DATABASE HostelManagement;
USE HostelManagement;
drop database HostelManagement;
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
VALUES 
('Karthik', 'Raja', '2002-03-12', 'Male', '9876543210', 'karthik.raja@example.com', '456 Elm St', 'Diabetes'),
('Nisha', 'Ravi', '2003-06-23', 'Female', '9876543211', 'nisha.ravi@example.com', '789 Pine St', 'Hypertension'),
('Arjun', 'M', '2001-02-18', 'Male', '9876543212', 'arjun.m@example.com', '101 Oak St', 'None'),
('Priya', 'Natarajan', '2004-11-25', 'Female', '9876543213', 'priya.n@example.com', '202 Birch St', 'Asthma'),
('Vijay', 'Anand', '2000-07-07', 'Male', '9876543214', 'vijay.anand@example.com', '303 Cedar St', 'Allergy'),
('Anjali', 'Krishnan', '2003-09-14', 'Female', '9876543215', 'anjali.krishnan@example.com', '404 Maple St', 'None'),
('Rajesh', 'Kumar', '2002-12-20', 'Male', '9876543216', 'rajesh.kumar@example.com', '505 Spruce St', 'Epilepsy'),
('Divya', 'S', '2001-10-10', 'Female', '9876543217', 'divya.s@example.com', '606 Willow St', 'Migraine'),
('Suresh', 'Babu', '2003-05-05', 'Male', '9876543218', 'suresh.babu@example.com', '707 Fir St', 'None'),
('Meera', 'J', '2002-08-08', 'Female', '9876543219', 'meera.j@example.com', '808 Ash St', 'Anemia');

SELECT * FROM Students;

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY AUTO_INCREMENT,
    DepartmentName VARCHAR(100)
);
INSERT INTO Departments (DepartmentName)
VALUES ('Computer Science Engineering'),
('Mechanical Engineering'),
('Information Technology Engineering'),
('Electrical Communication Engineering'),
('Civil Engineering'),
('Chemical Engineering'),
('Aeronautical Engineering'),
('Biotechnology'),
('Electronics Engineering'),
('Biomedical Engineering');

SELECT * FROM Departments;

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
VALUES 
('Jaseenash', 'R', '1234567891', 'jasee.r@gmail.com', 1),
('Sathya', 'P', '1234567892', 'sathya.p@gmail.com', 2),
('Madhavi', 'N', '1234567893', 'madhavi.n@gmail.com', 3),
('Venkatesh', 'K', '1234567894', 'venkatesh.k@gmail.com', 4),
('Radhika', 'S', '1234567895', 'radhika.s@gmail.com', 5),
('Girish', 'M', '1234567896', 'girish.m@gmail.com', 6),
('Anita', 'L', '1234567897', 'anita.l@gmail.com', 7),
('Karthikeyan', 'R', '1234567898', 'karthikeyan.r@gmail.com', 8),
('Shalini', 'V', '1234567899', 'shalini.v@gmail.com', 9),
('Rajesh', 'N', '1234567800', 'rajesh.n@gmail.com', 10);

SELECT * FROM Professors;

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
('Thermodynamics', 3, 2, 2),
('Operating Systems', 4, 1, 1),
('Digital Electronics', 3, 4, 4),
('Structural Analysis', 3, 5, 5),
('Organic Chemistry', 3, 6, 6),
('Flight Mechanics', 4, 7, 7),
('Genetic Engineering', 3, 8, 8),
('Signal Processing', 3, 9, 9),
('Medical Imaging', 4, 10, 10);

SELECT * FROM Courses;

CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

INSERT INTO Enrollments (StudentID, CourseID, EnrollmentDate)
VALUES (1, 1, '2021-08-01'),
(2, 2, '2021-08-05'),
(3, 3, '2021-08-10'),
(4, 4, '2021-08-15'),
(5, 5, '2021-08-20'),
(6, 6, '2021-08-25'),
(7, 7, '2021-09-01'),
(8, 8, '2021-09-05'),
(9, 9, '2021-09-10'),
(10, 10, '2021-09-15');
SELECT * FROM Enrollments;

CREATE TABLE Rooms (
    RoomID INT PRIMARY KEY AUTO_INCREMENT,
    RoomNumber VARCHAR(10) UNIQUE,
    RoomType VARCHAR(50),
    Capacity INT,
    Occupied INT DEFAULT 0
);
INSERT INTO Rooms (RoomNumber, RoomType, Capacity)
VALUES ('101G', 'Single', 1),
('102G', 'Double', 2),
('103G', 'Triple', 3),
('104G', 'Quad', 4),
('201G', 'Single', 1),
('202G', 'Double', 2),
('203G', 'Triple', 3),
('204G', 'Quad', 4),
('301G', 'Single', 1),
('302G', 'Double', 2);

SELECT * FROM Rooms;



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
VALUES (1, 1, '2021-08-01', '2021-08-15', NULL),
(2, 2, '2021-08-05', '2021-08-20', NULL),
(3, 3, '2021-08-10', '2021-08-25', NULL),
(4, 4, '2021-08-15', '2021-09-01', NULL),
(5, 5, '2021-08-20', '2021-09-05', NULL),
(6, 6, '2021-08-25', '2021-09-10', NULL),
(7, 7, '2021-09-01', '2021-09-15', NULL),
(8, 8, '2021-09-05', '2021-09-20', NULL),
(9, 9, '2021-09-10', '2021-09-25', NULL),
(10, 10, '2021-09-15', '2021-09-30', NULL);

SELECT * FROM Bookings;


CREATE TABLE Complaints (
    ComplaintID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    ComplaintText TEXT,
    ComplaintDate DATE,
    Status VARCHAR(50),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);
INSERT INTO Complaints (StudentID, ComplaintText, ComplaintDate, Status)
VALUES (1, 'No hot water in the bathroom.', '2022-08-10', 'Pending'),
(2, 'AC not working properly.', '2022-08-15', 'Resolved'),
(3, 'Internet connectivity issues.', '2022-08-20', 'In Progress'),
(4, 'Leaking ceiling in the room.', '2022-08-25', 'Pending'),
(5, 'Noisy environment at night.', '2022-08-30', 'Resolved'),
(6, 'Room not cleaned regularly.', '2022-09-05', 'Pending'),
(7, 'Broken window in the room.', '2022-09-10', 'In Progress'),
(8, 'Frequent power cuts.', '2022-09-15', 'Pending'),
(9, 'Bed bug infestation.', '2022-09-20', 'Resolved'),
(10, 'Room lock not functioning.', '2022-09-25', 'Pending');

SELECT * FROM Complaints;

CREATE TABLE Visitors (
    VisitorID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    VisitorName VARCHAR(100),
    Relationship VARCHAR(50),
    VisitDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);
INSERT INTO Visitors (StudentID, VisitorName, Relationship, VisitDate)
VALUES (1, 'Lalitha', 'Mother', '2023-08-12'),
(2, 'Ramesh', 'Father', '2023-08-15'),
(3, 'Anitha', 'Sister', '2023-08-18'),
(4, 'Kumar', 'Brother', '2023-08-20'),
(5, 'Sita', 'Aunt', '2023-08-22'),
(6, 'Mohan', 'Uncle', '2023-08-25'),
(7, 'Geetha', 'Mother', '2023-08-27'),
(8, 'Raj', 'Father', '2023-08-30'),
(9, 'Rekha', 'Sister', '2023-09-02'),
(10, 'Vijay', 'Brother', '2023-09-05');

SELECT * FROM Visitors;

CREATE TABLE Inventory (
    ItemID INT PRIMARY KEY AUTO_INCREMENT,
    ItemName VARCHAR(100),
    Quantity INT,
    LastUpdated DATE
);
INSERT INTO Inventory (ItemName, Quantity, LastUpdated)
VALUES ('Mattress', 50, '2024-08-01'),
('Pillow', 100, '2024-08-02'),
('Chair', 75, '2024-08-03'),
('Table', 50, '2024-08-04'),
('Fan', 30, '2024-08-05'),
('Lamp', 60, '2024-08-06'),
('Blanket', 40, '2024-08-07'),
('Curtain', 20, '2024-08-08'),
('Cupboard', 15, '2024-08-09'),
('Rug', 10, '2024-08-10');

SELECT * FROM Inventory;




