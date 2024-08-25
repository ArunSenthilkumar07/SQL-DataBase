
CREATE DATABASE FoodOrderingDB;


USE FoodOrderingDB;


CREATE TABLE Users (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    Username VARCHAR(50) NOT NULL UNIQUE,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Password VARCHAR(255) NOT NULL,
    FullName VARCHAR(100),
    Address TEXT,
    PhoneNumber VARCHAR(15),
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO Users (Username, Email, Password, FullName, Address, PhoneNumber)
VALUES ('Vijay', 'vijay@online.com', 'Random_password', 'Vijay Master', '123 Main St', '90256-78690');

SELECT * FROM Users;

CREATE TABLE Restaurants (
    RestaurantID INT AUTO_INCREMENT PRIMARY KEY,
    RestaurantName VARCHAR(100) NOT NULL,
    Address TEXT,
    PhoneNumber VARCHAR(15),
    Description TEXT,
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO Restaurants (RestaurantName, Address, PhoneNumber, Description)
VALUES ('Pizza Place', '456 Elm St', '987-654-3210', 'Best pizza in town.');

SELECT * FROM Restaurants;

DELETE FROM Restaurants WHERE RestaurantID = 1;

CREATE TABLE MenuItems (
    MenuItemID INT AUTO_INCREMENT PRIMARY KEY,
    RestaurantID INT,
    ItemName VARCHAR(100) NOT NULL,
    Description TEXT,
    Price DECIMAL(10, 2) NOT NULL,
    ImageURL VARCHAR(255),
    CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (RestaurantID) REFERENCES Restaurants(RestaurantID) ON DELETE CASCADE
);
INSERT INTO MenuItems (RestaurantID, ItemName, Description, Price, ImageURL)
VALUES (1, 'Margherita Pizza', 'Classic pizza with tomatoes and mozzarella.', 12.99, 'margherita.jpg');

CREATE TABLE Orders (
    OrderID INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    RestaurantID INT,
    OrderStatus ENUM('pending', 'preparing', 'out_for_delivery', 'delivered', 'cancelled') DEFAULT 'pending',
    OrderDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    DeliveryDate TIMESTAMP,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE CASCADE,
    FOREIGN KEY (RestaurantID) REFERENCES Restaurants(RestaurantID) ON DELETE CASCADE
);
INSERT INTO Orders (UserID, RestaurantID, OrderStatus, TotalAmount)
VALUES (1, 1, 'pending', 25.98);



CREATE TABLE OrderItems (
    OrderItemID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    MenuItemID INT,
    Quantity INT NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID) ON DELETE CASCADE,
    FOREIGN KEY (MenuItemID) REFERENCES MenuItems(MenuItemID) ON DELETE CASCADE
);
INSERT INTO OrderItems (OrderID, MenuItemID, Quantity, Price)
VALUES (1, 1, 2, 12.99);


CREATE TABLE Payments (
    PaymentID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    PaymentMethod ENUM('credit_card', 'debit_card', 'paypal', 'cash_on_delivery') NOT NULL,
    PaymentStatus ENUM('pending', 'completed', 'failed') DEFAULT 'pending',
    PaymentDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Amount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID) ON DELETE CASCADE
);
INSERT INTO Payments (OrderID, PaymentMethod, PaymentStatus, Amount)
VALUES (1, 'credit_card', 'completed', 25.98);



CREATE TABLE DeliveryDetails (
    DeliveryID INT AUTO_INCREMENT PRIMARY KEY,
    OrderID INT,
    DeliveryAddress TEXT NOT NULL,
    DeliveryPhone VARCHAR(15) NOT NULL,
    DeliveryStatus ENUM('pending', 'out_for_delivery', 'delivered', 'failed') DEFAULT 'pending',
    DeliveredAt TIMESTAMP,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID) ON DELETE CASCADE
);
INSERT INTO DeliveryDetails (OrderID, DeliveryAddress, DeliveryPhone)
VALUES (1, '123 Main St', '123-456-7890');
