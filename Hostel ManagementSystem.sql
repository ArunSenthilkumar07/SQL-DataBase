
CREATE DATABASE Hostelmanagementdb;

drop database hostelmanagementdb;
USE Hostelmanagementdb;


CREATE TABLE Students (
    StudentID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    PhoneNumber VARCHAR(15),
    Address TEXT,
    DateOfBirth DATE,
    Gender ENUM('Male', 'Female', 'Other'),
    MedicalDetails TEXT,
    EmergencyContact VARCHAR(15),
    EnrollmentDate DATE,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO Students (FirstName, LastName, Email, PhoneNumber, Address, DateOfBirth, Gender, MedicalDetails, EmergencyContact, EnrollmentDate)
VALUES ('Arun', 'vijay','arunvijay@gmail.com', '9807654842', '123 Main St', '2000-01-15', 'Male', 'Asthma', '0987654321', '2024-08-01'),
 ('Velu', 'Sundaram', 'arun.sundaram@example.com', '9876543210', 'No. 5, Anna Nagar, Chennai', '2000-05-15', 'Male', NULL, '1234567890', '2024-08-01'),
 ('Malathi', 'Velayutham', 'malathi.velayutham@example.com', '8765432109', 'No. 12, Kindi, Chennai', '1999-07-20', 'Female', 'Diabetes', '9876543210', '2024-08-02'),
 ('Murali', 'Saravanan', 'murali.saravanan@example.com', '7654321098', 'No. 7, Saidapet, Chennai', '2001-12-05', 'Male', NULL, '8765432109', '2024-08-03'),
 ('Kevina', 'Ramanathan', 'kevina.ramanathan@example.com', '6543210987', 'No. 15, Tondiarpet, Chennai', '2002-03-18', 'Female', NULL, '7654321098', '2024-08-04'),
 ('Kumar', 'Sivasubramaniam', 'kumar.sivasubramaniam@example.com', '5432109876', 'No. 9, Mylapore, Chennai', '1998-11-25', 'Male', 'Asthma', '6543210987', '2024-08-05'),
 ('Anbu', 'Natarajan', 'anbu.natarajan@example.com', '4321098765', 'No. 14, Adyar, Chennai', '1999-08-30', 'Male', NULL, '5432109876', '2024-08-06'),
 ('Vidhya', 'Subramaniam', 'vidhya.subramaniam@example.com', '3210987654', 'No. 21, Thiruvanmiyur, Chennai', '2000-01-22', 'Female', 'Hypertension', '4321098765', '2024-08-07'),
('Bala', 'Selvam', 'bala.selvam@example.com', '2109876543', 'No. 19, T. Nagar, Chennai', '2001-04-10', 'Male', NULL, '3210987654', '2024-08-08'),
 ('Shankar', 'Kannan', 'shankar.kannan@example.com', '1098765432', 'No. 8, Vellore, Chennai', '2002-06-12', 'Male', 'Allergy', '2109876543', '2024-08-8'),
 ('Lavanya', 'Krishnan', 'lavanya.krishnan@example.com', '0987654321', 'No. 10, Adyar, Chennai', '1999-10-02', 'Female', NULL, '1098765432', '2024-08-10');

	
SELECT * FROM Students;


CREATE TABLE Rooms (
    RoomID INT AUTO_INCREMENT PRIMARY KEY,
    RoomNumber VARCHAR(10) NOT NULL UNIQUE,
    RoomType ENUM('Single', 'Double', 'Triple', 'Quad') NOT NULL,
    Capacity INT NOT NULL,
    Occupied INT DEFAULT 0,
    Rent DECIMAL(10, 2) NOT NULL,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO Rooms (RoomNumber, RoomType, Capacity, Rent)
VALUES ('101', 'Single', 1, 5000.00),
 ('102', 'Single', 1, 5000.00),
('103', 'Double', 2, 8000.00),
 ('104', 'Triple', 3, 10000.00),
 ('105', 'Quad', 4, 12000.00),
('201', 'Single', 1, 5200.00),
('202', 'Double', 2, 8200.00),
 ('203', 'Triple', 3, 10500.00),
('204', 'Quad', 4, 12500.00),
 ('301', 'Single', 1, 5400.00),
 ('302', 'Double', 2, 8400.00);

SELECT * FROM Rooms;



CREATE TABLE Bookings (
    BookingID INT AUTO_INCREMENT PRIMARY KEY,
    StudentID INT,
    RoomID INT,
    BookingDate DATE NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE,
    Status ENUM('Active', 'Completed', 'Cancelled') DEFAULT 'Active',
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID) ON DELETE CASCADE,
    FOREIGN KEY (RoomID) REFERENCES Rooms(RoomID) ON DELETE CASCADE
);


INSERT INTO Bookings (StudentID, RoomID, BookingDate, StartDate, EndDate, Status)
VALUES (1, 101, '2024-07-01', '2024-07-01', '2024-12-31', 'Active'),
 (2, 102, '2024-07-05', '2024-07-05', '2024-12-31', 'Active'),
 (3, 103, '2024-07-10', '2024-07-10', '2024-12-31', 'Active'),
 (4, 104, '2024-07-15', '2024-07-15', '2024-12-31', 'Active'),
 (5, 105, '2024-07-20', '2024-07-20', '2024-12-31', 'Active'),
 (6, 106, '2024-07-25', '2024-07-25', '2024-12-31', 'Active'),
 (7, 107, '2024-08-01', '2024-08-01', '2024-12-31', 'Active'),
 (8, 108, '2024-08-05', '2024-08-05', '2024-12-31', 'Active'),
 (9, 109, '2024-08-10', '2024-08-10', '2024-12-31', 'Active'),
 (10, 110, '2024-08-15', '2024-08-15', '2024-12-31', 'Active'),
 (11, 111, '2024-08-20', '2024-08-20', '2024-12-31', 'Active');

SELECT * FROM Booking;

CREATE TABLE Complaints (
    ComplaintID INT AUTO_INCREMENT PRIMARY KEY,
    StudentID INT,
    ComplaintText TEXT NOT NULL,
    ComplaintDate DATE NOT NULL,
    Status ENUM('Pending', 'In Progress', 'Resolved') DEFAULT 'Pending',
    ResponseText TEXT,
    ResolvedDate DATE,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID) ON DELETE CASCADE
);


INSERT INTO Complaints (StudentID, ComplaintText, ComplaintDate, Status, ResponseText, ResolvedDate)
VALUES (1, 'Noise from neighboring room late at night.', '2024-08-01', 'Pending', NULL, NULL),
 (2, 'Air conditioner not cooling properly.', '2024-08-02', 'In Progress', 'Technician has been informed.', NULL),
 (3, 'Water leakage in the bathroom.', '2024-08-03', 'Resolved', 'Leakage fixed by plumber.', '2024-08-04'),
 (4, 'Wi-Fi connection is very slow.', '2024-08-04', 'Pending', NULL, NULL),
(5, 'Light bulb in the room is flickering.', '2024-08-05', 'In Progress', 'Electrician is scheduled to visit.', NULL),
 (6, 'Room door lock is not functioning properly.', '2024-08-06', 'Resolved', 'Lock has been replaced.', '2024-08-07'),
 (7, 'Unpleasant odor in the corridor.', '2024-08-07', 'Pending', NULL, NULL),
 (8, 'Rats seen in the kitchen area.', '2024-08-08', 'In Progress', 'Pest control service has been called.', NULL),
 (9, 'No hot water in the shower.', '2024-08-09', 'Resolved', 'Water heater repaired.', '2024-08-10'),
 (10, 'Room not cleaned on time.', '2024-08-10', 'Pending', NULL, NULL),
 (11, 'Elevator not working.', '2024-08-11', 'In Progress', 'Repair team has been notified.', NULL);

SELECT * FROM Complaints;

CREATE TABLE Staff (
    StaffID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    PhoneNumber VARCHAR(15),
    Address TEXT,
    Role VARCHAR(50) NOT NULL,
    Salary DECIMAL(10, 2) NOT NULL,
    HireDate DATE NOT NULL,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO Staff (FirstName, LastName, Email, PhoneNumber, Address, Role, Salary, HireDate)
VALUES ('Karthik', 'Rajan', 'karthik.rajan@example.com', '9876543210', '123 Park Street, Chennai', 'Warden', 45000.00, '2023-01-10'),
 ('Meena', 'Patel', 'meena.patel@example.com', '9823456789', '456 Market Lane, Mumbai', 'Housekeeping', 25000.00, '2023-02-15'),
 ('Suresh', 'Kumar', 'suresh.kumar@example.com', '9845671234', '789 Garden Avenue, Bangalore', 'Cook', 30000.00, '2023-03-20'),
 ('Latha', 'Menon', 'latha.menon@example.com', '9812345678', '321 Hill Road, Cochin', 'Security', 28000.00, '2023-04-05'),
 ('Arun', 'Sharma', 'arun.sharma@example.com', '9834567890', '654 Lake View, Delhi', 'Maintenance', 35000.00, '2023-05-12'),
 ('Priya', 'Nair', 'priya.nair@example.com', '9856781234', '987 River Side, Pune', 'Housekeeping', 26000.00, '2023-06-18'),
('Vijay', 'Reddy', 'vijay.reddy@example.com', '9876541230', '123 Green Valley, Hyderabad', 'Warden', 47000.00, '2023-07-25'),
('Deepa', 'Kapoor', 'deepa.kapoor@example.com', '9823456712', '456 Ocean Drive, Kolkata', 'Cook', 31000.00, '2023-08-01'),
 ('Rahul', 'Verma', 'rahul.verma@example.com', '9812345987', '789 Pine Street, Jaipur', 'Security', 29000.00, '2023-09-10'),
('Anita', 'Joshi', 'anita.joshi@example.com', '9845678901', '321 Forest Hills, Ahmedabad', 'Maintenance', 34000.00, '2023-10-15'),
('Siddharth', 'Rao', 'siddharth.rao@example.com', '9876501234', '654 Maple Road, Nagpur', 'Warden', 46000.00, '2023-11-20');

SELECT * FROM Staff;

CREATE TABLE MaintenanceRequests (
    RequestID INT AUTO_INCREMENT PRIMARY KEY,
    RoomID INT,
    RequestText TEXT NOT NULL,
    RequestDate DATE NOT NULL,
    Status ENUM('Pending', 'In Progress', 'Completed') DEFAULT 'Pending',
    ResponseText TEXT,
    CompletedDate DATE,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (RoomID) REFERENCES Rooms(RoomID) ON DELETE CASCADE
);

INSERT INTO MaintenanceRequests (RoomID, RequestText, RequestDate, Status, ResponseText, CompletedDate)
VALUES (1, 'Leaky faucet in bathroom', '2024-08-12', 'Pending', NULL, NULL),
 (2, 'Broken window', '2024-08-13', 'In Progress', 'Window ordered, will be replaced soon', NULL),
(3, 'AC not working', '2024-08-14', 'Completed', 'AC repaired successfully', '2024-08-16'),
(4, 'Light bulb flickering', '2024-08-15', 'Pending', NULL, NULL),
 (5, 'Door lock issue', '2024-08-16', 'In Progress', 'Lock replacement in progress', NULL),
 (6, 'Water heater not working', '2024-08-17', 'Completed', 'Water heater replaced', '2024-08-18'),
 (7, 'Fan not working', '2024-08-18', 'Pending', NULL, NULL),
 (8, 'Broken desk', '2024-08-19', 'In Progress', 'Desk being replaced', NULL),
(9, 'Clogged sink in bathroom', '2024-08-20', 'Completed', 'Sink unclogged successfully', '2024-08-21'),
(10, 'Window blinds need replacement', '2024-08-21', 'Pending', NULL, NULL),
 (11, 'Water leakage from ceiling', '2024-08-22', 'Pending', NULL, NULL);

SELECT * FROM MaintenanceRequests;



CREATE TABLE Payments (
    PaymentID INT AUTO_INCREMENT PRIMARY KEY,
    BookingID INT,
    Amount DECIMAL(10, 2) NOT NULL,
    PaymentDate DATE NOT NULL,
    PaymentMethod ENUM('Credit Card', 'Debit Card', 'Cash', 'Bank Transfer') NOT NULL,
    Status ENUM('Pending', 'Completed', 'Failed') DEFAULT 'Pending',
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (BookingID) REFERENCES Bookings(BookingID) ON DELETE CASCADE
);

INSERT INTO Payments (BookingID, Amount, PaymentDate, PaymentMethod, Status)
VALUES (1, 15000.00, '2024-07-15', 'Credit Card', 'Completed'),
 (2, 16000.00, '2024-07-20', 'Debit Card', 'Completed'),
 (3, 17000.00, '2024-07-25', 'Cash', 'Completed'),
 (4, 18000.00, '2024-07-30', 'Bank Transfer', 'Completed'),
 (5, 19000.00, '2024-08-01', 'Credit Card', 'Completed'),
 (6, 20000.00, '2024-08-05', 'Debit Card', 'Completed'),
(7, 21000.00, '2024-08-10', 'Cash', 'Completed'),
(8, 22000.00, '2024-08-15', 'Bank Transfer', 'Completed'),
(9, 23000.00, '2024-08-20', 'Credit Card', 'Completed'),
(10, 24000.00, '2024-08-25', 'Debit Card', 'Completed'),
(11, 25000.00, '2024-08-30', 'Cash', 'Completed');

SELECT * FROM Payments;



CREATE TABLE Visitors (
    VisitorID INT AUTO_INCREMENT PRIMARY KEY,
    StudentID INT,
    VisitorName VARCHAR(100) NOT NULL,
    Relationship VARCHAR(50),
    VisitDate DATE NOT NULL,
    VisitTime TIME NOT NULL,
    LeaveTime TIME,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID) ON DELETE CASCADE
);

INSERT INTO Visitors (StudentID, VisitorName, Relationship, VisitDate, VisitTime, LeaveTime)
VALUES (1, 'Ravi Kumar', 'Father', '2024-08-10', '10:30:00', '12:00:00'),
 (2, 'Latha Devi', 'Mother', '2024-08-11', '11:00:00', '13:00:00'),
(3, 'Arun Sharma', 'Brother', '2024-08-12', '14:30:00', '15:30:00'),
(4, 'Deepa Nair', 'Sister', '2024-08-13', '09:00:00', '10:30:00'),
(5, 'Vijay Reddy', 'Uncle', '2024-08-14', '15:00:00', '17:00:00'),
(6, 'Meena Patil', 'Aunt', '2024-08-15', '13:00:00', '14:00:00'),
 (7, 'Ramesh Gupta', 'Guardian', '2024-08-16', '10:00:00', '11:45:00'),
 (8, 'Sundar Rajan', 'Father', '2024-08-17', '12:00:00', '14:00:00'),
 (9, 'Priya Kumar', 'Mother', '2024-08-18', '09:30:00', '11:00:00'),
(10, 'Rahul Verma', 'Friend', '2024-08-19', '16:00:00', '17:30:00'),
(11, 'Anitha Suresh', 'Sister', '2024-08-20', '11:00:00', '12:15:00');

SELECT * FROM Visitors;




CREATE TABLE Inventory (
    InventoryID INT AUTO_INCREMENT PRIMARY KEY,
    ItemName VARCHAR(100) NOT NULL,
    Quantity INT NOT NULL,
    ItemCondition ENUM('New', 'Good', 'Fair', 'Poor') DEFAULT 'Good',
    PurchaseDate DATE,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO Inventory (ItemName, Quantity, ItemCondition, PurchaseDate)
VALUES ('Bed', 50, 'New', '2024-07-01'),
 ('Study Table', 30, 'Good', '2024-06-15'),
('Chair', 60, 'New', '2024-07-10'),
 ('Fan', 20, 'Fair', '2024-05-20'),
 ('Mattress', 40, 'Good', '2024-07-05'),
 ('Curtains', 25, 'Fair', '2024-06-25'),
 ('Lights', 80, 'Good', '2024-07-15'),
('Wardrobe', 35, 'Poor', '2024-05-30'),
('Pillows', 100, 'New', '2024-07-20'),
 ('Desks', 45, 'Good', '2024-06-10'),
('Bookshelf', 15, 'Good', '2024-06-05');

SELECT * FROM Inventory;


CREATE TABLE MedicalRecords (
    RecordID INT AUTO_INCREMENT PRIMARY KEY,
    StudentID INT,
    RecordDate DATE NOT NULL,
    MedicalCondition TEXT,
    Medication TEXT,
    Treatment TEXT,
	LastCheckupDate date,
    DoctorName VARCHAR(100),
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID) ON DELETE CASCADE
);
 
INSERT INTO MedicalRecords (StudentID, RecordDate, MedicalCondition, Medication, Treatment, LastCheckupDate, DoctorName)
VALUES (1, '2024-07-01', 'Asthma', 'Inhaler', 'Breathing exercises', '2024-06-28', 'Dr. Ramesh Kumar'),
 (2, '2024-07-10', 'Diabetes', 'Insulin', 'Dietary changes', '2024-06-20', 'Dr. Meera Patel'),
 (3, '2024-07-15', 'Hypertension', 'Beta-blockers', 'Lifestyle modification', '2024-07-01', 'Dr. Suresh Reddy'),
(4, '2024-07-20', 'Allergy', 'Antihistamines', 'Avoidance of allergens', '2024-06-30', 'Dr. Anitha Rao'),
(5, '2024-07-25', 'Migraine', 'Painkillers', 'Relaxation techniques', '2024-07-10', 'Dr. Priya Menon'),
 (6, '2024-07-30', 'Anemia', 'Iron supplements', 'Dietary changes', '2024-06-15', 'Dr. Vijay Nair'),
 (7, '2024-08-05', 'Epilepsy', 'Antiepileptic drugs', 'Regular monitoring', '2024-07-20', 'Dr. Deepa Kapoor'),
 (8, '2024-08-10', 'Arthritis', 'Anti-inflammatory', 'Physical therapy', '2024-07-15', 'Dr. Rajesh Sharma'),
 (9, '2024-08-15', 'Asthma', 'Inhaler', 'Allergy management', '2024-08-01', 'Dr. Kavita Singh'),
 (10, '2024-08-20', 'Hypertension', 'ACE inhibitors', 'Regular exercise', '2024-07-28', 'Dr. Mohan Verma'),
 (11, '2024-08-25', 'Asthma', 'Inhaler', 'Pulmonary rehabilitation', '2024-08-10', 'Dr. Lakshmi Iyer');
 SELECT * FROM MedicalRecords;
SELECT * FROM MedicalRecords WHERE StudentID = 1;



