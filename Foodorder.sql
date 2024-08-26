
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
VALUES 
('Vijay', 'vijay@online.com', 'Random_password', 'Vijay Master', '123 Main St', '90256-78690'),
('Aarav', 'aarav@online.com', 'Aarav_pwd', 'Aarav Singh', '456 Maple Rd', '80123-12345'),
('Anaya', 'anaya@online.com', 'Anaya_pwd', 'Anaya Patel', '789 Pine St', '70856-67890'),
('Ishaan', 'ishaan@online.com', 'Ishaan_pwd', 'Ishaan Kapoor', '321 Oak St', '60543-43210'),
('Zara', 'zara@online.com', 'Zara_pwd', 'Zara Khan', '654 Birch Rd', '90234-56789'),
('Aryan', 'aryan@online.com', 'Aryan_pwd', 'Aryan Sharma', '987 Cedar Ln', '60789-34567'),
('Maya', 'maya@online.com', 'Maya_pwd', 'Maya Rao', '123 Redwood St', '80678-23456'),
('Rohan', 'rohan@online.com', 'Rohan_pwd', 'Rohan Joshi', '456 Walnut Dr', '90212-09876'),
('Diya', 'diya@online.com', 'Diya_pwd', 'Diya Singh', '789 Sycamore St', '80456-98765'),
('Kabir', 'kabir@online.com', 'Kabir_pwd', 'Kabir Gupta', '321 Cherry Ave', '60890-54321');

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
VALUES 
('Pizza Place', '456 Elm St', '987-654-3210', 'Best pizza in town.'),
('Burger Joint', '123 Oak Rd', '765-432-1098', 'Delicious burgers and fries.'),
('Sushi World', '789 Pine Ave', '654-321-0987', 'Fresh sushi and sashimi.'),
('Taco Fiesta', '321 Maple Ln', '543-210-9876', 'Authentic Mexican tacos.'),
('Pasta House', '654 Birch Rd', '432-109-8765', 'Homemade pasta and sauces.'),
('Curry Corner', '987 Cedar Blvd', '321-098-7654', 'Spicy Indian curries.'),
('BBQ Grill', '123 Redwood St', '210-987-6543', 'Smoked meats and BBQ.'),
('Salad Stop', '456 Walnut Dr', '109-876-5432', 'Healthy salads and wraps.'),
('Bakery Bliss', '789 Sycamore St', '098-765-4321', 'Freshly baked goods.'),
('Seafood Shack', '321 Cherry Ave', '876-543-2109', 'Seafood and shellfish.'); 


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
VALUES 
(1, 'Margherita Pizza', 'Classic pizza with tomatoes and mozzarella.', 12.99, 'margherita.jpg'),
(2, 'Cheeseburger', 'Juicy burger with cheddar cheese.', 8.99, 'cheeseburger.jpg'),
(3, 'Salmon Sashimi', 'Fresh salmon slices.', 15.99, 'salmon_sashimi.jpg'),
(4, 'Chicken Tacos', 'Tacos with grilled chicken and salsa.', 9.99, 'chicken_tacos.jpg'),
(5, 'Spaghetti Carbonara', 'Pasta with bacon and creamy sauce.', 11.99, 'carbonara.jpg'),
(6, 'Chicken Curry', 'Spicy chicken curry.', 10.99, 'chicken_curry.jpg'),
(7, 'BBQ Ribs', 'Smoked pork ribs with BBQ sauce.', 14.99, 'bbq_ribs.jpg'),
(8, 'Caesar Salad', 'Salad with romaine lettuce and croutons.', 7.99, 'caesar_salad.jpg'),
(9, 'Chocolate Cake', 'Rich chocolate cake.', 5.99, 'chocolate_cake.jpg'),
(10, 'Grilled Shrimp', 'Shrimp grilled to perfection.', 13.99, 'grilled_shrimp.jpg');

SELECT * FROM MenuItems;


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
VALUES 
(1, 1, 'pending', 25.98),
(2, 2, 'delivered', 8.99),
(3, 3, 'preparing', 31.98),
(4, 4, 'out_for_delivery', 19.98),
(5, 5, 'delivered', 23.98),
(6, 6, 'cancelled', 10.99),
(7, 7, 'pending', 14.99),
(8, 8, 'delivered', 7.99),
(9, 9, 'preparing', 17.97),
(10, 10, 'pending', 13.99);

SELECT * FROM Orders;




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
VALUES 
(1, 1, 2, 12.99),
(2, 2, 1, 8.99),
(3, 3, 2, 15.99),
(4, 4, 2, 9.99),
(5, 5, 2, 11.99),
(6, 6, 1, 10.99),
(7, 7, 1, 14.99),
(8, 8, 1, 7.99),
(9, 9, 3, 5.99),
(10, 10, 1, 13.99);

SELECT * FROM OrderItems;




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
VALUES 
(1, 'credit_card', 'completed', 25.98),
(2, 'debit_card', 'completed', 8.99),
(3, 'paypal', 'pending', 31.98),
(4, 'cash_on_delivery', 'completed', 19.98),
(5, 'credit_card', 'failed', 23.98),
(6, 'debit_card', 'completed', 10.99),
(7, 'paypal', 'completed', 14.99),
(8, 'credit_card', 'completed', 7.99),
(9, 'cash_on_delivery', 'pending', 17.97),
(10, 'credit_card', 'completed', 13.99);

SELECT * FROM Payments;




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
VALUES 
(1, '123 Main St', '123-456-7890'),
(2, '456 Maple Rd', '234-567-8901'),
(3, '789 Pine St', '345-678-9012'),
(4, '321 Oak St', '456-789-0123'),
(5, '654 Birch Rd', '567-890-1234'),
(6, '987 Cedar Ln', '678-901-2345'),
(7, '123 Redwood St', '789-012-3456'),
(8, '456 Walnut Dr', '890-123-4567'),
(9, '789 Sycamore St', '901-234-5678'),
(10, '321 Cherry Ave', '012-345-6789');

SELECT * FROM DeliveryDetails;
SELECT OrderID FROM Orders;

