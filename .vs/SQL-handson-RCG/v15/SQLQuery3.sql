-- Create Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100) UNIQUE,
    Phone VARCHaR(20),
    Address VARCHAR(255),
    City VARCHAR(50),
    State VARCHAR(50),
    PostalCode VARCHAR(20),
    Country VARCHAR(50),
    DateOfBirth DATE,
    RegistrationDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create Products table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(100),
    Description TEXT,
    Price DECIMAL(10,2),
    StockQuantity INT,
    Category VARCHAR(50),
    CreatedDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Optional: Create Orders table to link Customers and Products
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    ProductID INT,
    OrderDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Quantity INT,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
-- Insert sample customers
INSERT INTO Customers (FirstName, LastName, Email, Phone, Address, City, State, PostalCode, Country, DateOfBirth)
VALUES
('James', 'Doe', 'john.doe@example.com', '5434567890', '123 Main St', 'Nellore', 'AP', '524001', 'India', '1985-06-15'),
('Jahh', 'Sahari', 'jane.smith@example.com', '9876543210', '456 Market Rd', 'Hyderabad', 'TS', '500001', 'India', '1990-09-20'),
('Rajesh', 'Kumar', 'raj.kumar@example.com', '9988776655', '765 Park Ave', 'Chennai', 'TN', '600001', 'India', '1988-12-05');

-- Insert sample products
INSERT INTO Products (ProductName, Description, Price, StockQuantity, Category)
VALUES
('Laptop+iphone', '15-inch laptop with 8GB RAM and 512GB SSD', 75000.00, 10, 'Electronics'),
('Smartphone+headset', 'Android smartphone with 128GB storage', 25000.00, 25, 'Electronics'),
('Headphones+iphonesmartwatch', 'Wireless noise-cancelling headphones', 5000.00, 50, 'Accessories');

-- Insert sample orders (linking customers and products)
INSERT INTO Orders (CustomerID, ProductID, Quantity, TotalAmount)
VALUES
(1, 1, 1, 75000.00),  -- John buys a Laptop
(2, 2, 2, 50000.00),  -- Jane buys 2 Smartphones
(3, 3, 3, 15000.00);  -- Raj buys 3 Headphones
