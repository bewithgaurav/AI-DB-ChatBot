-- ============================================================
-- 🎯 AI Chatbot Demo - Sample Data Setup
-- Simple tables perfect for natural language queries
-- ============================================================

-- Drop tables if they exist (for clean setup)
IF OBJECT_ID('OrderItems', 'U') IS NOT NULL DROP TABLE OrderItems;
IF OBJECT_ID('Orders', 'U') IS NOT NULL DROP TABLE Orders;
IF OBJECT_ID('Products', 'U') IS NOT NULL DROP TABLE Products;
IF OBJECT_ID('Customers', 'U') IS NOT NULL DROP TABLE Customers;

-- ============================================================
-- 1. CUSTOMERS TABLE
-- ============================================================
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100),
    City NVARCHAR(50),
    Country NVARCHAR(50),
    JoinDate DATE
);

INSERT INTO Customers (Name, Email, City, Country, JoinDate) VALUES
('Acme Corporation', 'orders@acme.com', 'New York', 'USA', '2023-01-15'),
('Globex Industries', 'purchasing@globex.com', 'Chicago', 'USA', '2023-02-20'),
('Wayne Enterprises', 'bruce@wayne.com', 'Gotham', 'USA', '2023-03-10'),
('Stark Industries', 'tony@stark.com', 'Malibu', 'USA', '2023-04-05'),
('Umbrella Corp', 'sales@umbrella.com', 'Raccoon City', 'USA', '2023-05-12'),
('Cyberdyne Systems', 'info@cyberdyne.com', 'Los Angeles', 'USA', '2023-06-18'),
('Initech', 'peter@initech.com', 'Austin', 'USA', '2023-07-22'),
('Dunder Mifflin', 'michael@dundermifflin.com', 'Scranton', 'USA', '2023-08-30'),
('Sterling Cooper', 'don@sterlingcooper.com', 'New York', 'USA', '2023-09-14'),
('Wonka Industries', 'willy@wonka.com', 'London', 'UK', '2023-10-25');

-- ============================================================
-- 2. PRODUCTS TABLE
-- ============================================================
CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    ProductName NVARCHAR(100) NOT NULL,
    Category NVARCHAR(50),
    Price DECIMAL(10,2),
    StockQuantity INT,
    ReorderLevel INT
);

INSERT INTO Products (ProductName, Category, Price, StockQuantity, ReorderLevel) VALUES
('Laptop Pro 15', 'Electronics', 1299.99, 45, 20),
('Wireless Mouse', 'Electronics', 29.99, 150, 50),
('USB-C Hub', 'Electronics', 49.99, 8, 25),        -- LOW STOCK!
('Mechanical Keyboard', 'Electronics', 149.99, 62, 30),
('Monitor 27 inch', 'Electronics', 399.99, 5, 15), -- LOW STOCK!
('Office Chair', 'Furniture', 299.99, 28, 10),
('Standing Desk', 'Furniture', 599.99, 12, 8),
('Desk Lamp', 'Furniture', 45.99, 3, 20),          -- LOW STOCK!
('Notebook Pack (100)', 'Supplies', 24.99, 200, 50),
('Pen Set (50)', 'Supplies', 19.99, 180, 40),
('Printer Paper', 'Supplies', 34.99, 7, 30),       -- LOW STOCK!
('Coffee Maker', 'Appliances', 89.99, 35, 15);

-- ============================================================
-- 3. ORDERS TABLE
-- ============================================================
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT FOREIGN KEY REFERENCES Customers(CustomerID),
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),
    Status NVARCHAR(20)
);

-- Insert orders with varied dates for trend analysis
INSERT INTO Orders (CustomerID, OrderDate, TotalAmount, Status) VALUES
-- Acme Corporation - TOP CUSTOMER (6 orders, $15,500 total)
(1, '2024-10-05', 2599.98, 'Completed'),
(1, '2024-10-18', 1299.99, 'Completed'),
(1, '2024-11-02', 3499.97, 'Completed'),
(1, '2024-11-15', 2100.00, 'Completed'),
(1, '2024-11-28', 4500.00, 'Completed'),
(1, '2024-12-05', 1500.00, 'Processing'),

-- Globex Industries - 2nd (5 orders, $12,800 total)
(2, '2024-10-10', 2999.95, 'Completed'),
(2, '2024-10-25', 1899.97, 'Completed'),
(2, '2024-11-08', 3200.00, 'Completed'),
(2, '2024-11-22', 2700.00, 'Completed'),
(2, '2024-12-03', 2000.00, 'Shipped'),

-- Wayne Enterprises - 3rd (4 orders, $9,500 total)
(3, '2024-10-12', 1999.98, 'Completed'),
(3, '2024-11-05', 2500.00, 'Completed'),
(3, '2024-11-20', 3000.00, 'Completed'),
(3, '2024-12-01', 2000.00, 'Shipped'),

-- Stark Industries - 4th (3 orders, $7,200 total)
(4, '2024-10-20', 2400.00, 'Completed'),
(4, '2024-11-10', 2800.00, 'Completed'),
(4, '2024-12-02', 2000.00, 'Processing'),

-- Umbrella Corp - 5th (3 orders, $5,500 total)
(5, '2024-10-28', 1500.00, 'Completed'),
(5, '2024-11-12', 2000.00, 'Completed'),
(5, '2024-12-04', 2000.00, 'Shipped'),

-- Other customers - smaller orders
(6, '2024-11-01', 899.99, 'Completed'),
(6, '2024-12-01', 1200.00, 'Processing'),
(7, '2024-11-08', 549.98, 'Completed'),
(8, '2024-11-15', 799.99, 'Completed'),
(8, '2024-12-02', 450.00, 'Shipped'),
(9, '2024-11-20', 1299.99, 'Completed'),
(10, '2024-11-25', 649.99, 'Completed'),
(10, '2024-12-05', 899.99, 'Processing');

-- ============================================================
-- 4. ORDER ITEMS TABLE (Optional - for detailed queries)
-- ============================================================
CREATE TABLE OrderItems (
    OrderItemID INT PRIMARY KEY IDENTITY(1,1),
    OrderID INT FOREIGN KEY REFERENCES Orders(OrderID),
    ProductID INT FOREIGN KEY REFERENCES Products(ProductID),
    Quantity INT,
    UnitPrice DECIMAL(10,2)
);

-- Sample order items
INSERT INTO OrderItems (OrderID, ProductID, Quantity, UnitPrice) VALUES
(1, 1, 2, 1299.99),  -- 2 Laptops
(2, 1, 1, 1299.99),  -- 1 Laptop
(3, 4, 3, 149.99),   -- 3 Keyboards
(3, 2, 10, 29.99),   -- 10 Mice
(4, 6, 7, 299.99),   -- 7 Chairs
(5, 7, 5, 599.99),   -- 5 Standing Desks
(5, 8, 10, 45.99);   -- 10 Desk Lamps

-- ============================================================
-- ✅ VERIFICATION QUERIES
-- ============================================================
SELECT 'Customers' AS TableName, COUNT(*) AS RecordCount FROM Customers
UNION ALL
SELECT 'Products', COUNT(*) FROM Products
UNION ALL
SELECT 'Orders', COUNT(*) FROM Orders
UNION ALL
SELECT 'OrderItems', COUNT(*) FROM OrderItems;

-- Preview data
SELECT '--- CUSTOMERS ---' AS Info;
SELECT * FROM Customers;

SELECT '--- PRODUCTS (Low Stock Highlighted) ---' AS Info;
SELECT *, 
    CASE WHEN StockQuantity < ReorderLevel THEN '⚠️ LOW STOCK' ELSE '✓ OK' END AS StockStatus
FROM Products;

SELECT '--- TOP CUSTOMERS BY ORDERS ---' AS Info;
SELECT 
    c.Name,
    COUNT(o.OrderID) AS TotalOrders,
    SUM(o.TotalAmount) AS TotalSpent
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.Name
ORDER BY TotalSpent DESC;
