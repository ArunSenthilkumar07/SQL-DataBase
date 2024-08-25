
CREATE DATABASE Hostel;


USE Hostel;


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
VALUES ('Arun', 'vijay','arunvijay@gmail.com', '9807654842', '123 Main St', '2000-01-15', 'Male', 'Asthma', '0987654321', '2024-08-01');

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
VALUES ('101', 'Single', 1, 5000.00);


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

INSERT INTO Bookings (StudentID, RoomID, BookingDate, StartDate, EndDate)
VALUES (1, 1, '2024-08-15', '2024-09-01', '2025-08-31');


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

INSERT INTO Complaints (StudentID, ComplaintText, ComplaintDate)
VALUES (1, 'The room is too hot.', '2024-08-20');


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
VALUES ('Alice', 'Smith', 'alice.smith@example.com', '2345678901', '456 Oak St', 'Warden', 35000.00, '2023-06-01');


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

INSERT INTO MaintenanceRequests (RoomID, RequestText, RequestDate)
VALUES (1, 'Air conditioner not working.', '2024-08-21');


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
VALUES (1, 5000.00, '2024-09-01', 'Credit Card', 'Completed');


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
VALUES (1, 'Vijay', 'Sister', '2024-08-22', '14:00', '16:00');


CREATE TABLE Inventory (
    InventoryID INT AUTO_INCREMENT PRIMARY KEY,
    ItemName VARCHAR(100) NOT NULL,
    Quantity INT NOT NULL,
    ItemCondition ENUM('New', 'Good', 'Fair', 'Poor') DEFAULT 'Good',
    PurchaseDate DATE,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO Inventory (ItemName, Quantity, ItemCondition, PurchaseDate)
VALUES ('Study Desk', 10, 'New', '2024-08-10');

CREATE TABLE MedicalRecords (
    RecordID INT AUTO_INCREMENT PRIMARY KEY,
    StudentID INT,
    RecordDate DATE NOT NULL,
    MedicalCondition TEXT,
    Treatment TEXT,
    DoctorName VARCHAR(100),
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID) ON DELETE CASCADE
);
INSERT INTO MedicalRecords (StudentID, RecordDate, MedicalCondition, Treatment, DoctorName)
VALUES (1, '2024-08-15', 'Asthma', 'Inhaler prescribed', 'Dr. Brown');