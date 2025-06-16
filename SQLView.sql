CREATE DATABASE stores

USE  stores

CREATE TABLE Customers (
  CustomerID    INT            PRIMARY KEY,
  FirstName     NVARCHAR(50)   NOT NULL,
  LastName      NVARCHAR(50)   NOT NULL,
  Email         NVARCHAR(100)  NOT NULL,
  SignupDate    DATE           NOT NULL
);


CREATE TABLE Products (
  ProductID     INT            PRIMARY KEY,
  ProductName   NVARCHAR(100)  NOT NULL,
  Category      NVARCHAR(50)   NOT NULL,
  UnitPrice     DECIMAL(10,2)  NOT NULL
);


CREATE TABLE Orders (
  OrderID       INT            PRIMARY KEY,
  CustomerID    INT            NOT NULL REFERENCES Customers(CustomerID),
  OrderDate     DATE           NOT NULL
);

CREATE TABLE OrderItems (
  OrderItemID   INT            PRIMARY KEY,
  OrderID       INT            NOT NULL REFERENCES Orders(OrderID),
  ProductID     INT            NOT NULL REFERENCES Products(ProductID),
  Quantity      INT            NOT NULL
);


INSERT INTO Customers (CustomerID, FirstName, LastName, Email,       SignupDate) VALUES
 ( 1, 'Alice',    'Adams',    'alice.adams@example.com',    '2024-01-05'),
 ( 2, 'Bob',      'Brown',    'bob.brown@example.com',      '2024-01-12'),
 ( 3, 'Carol',    'Clark',    'carol.clark@example.com',    '2024-01-20'),
 ( 4, 'David',    'Davis',    'david.davis@example.com',    '2024-02-02'),
 ( 5, 'Eve',      'Evans',    'eve.evans@example.com',      '2024-02-15'),
 ( 6, 'Frank',    'Foster',   'frank.foster@example.com',   '2024-03-01'),
 ( 7, 'Grace',    'Green',    'grace.green@example.com',    '2024-03-18'),
 ( 8, 'Henry',    'Hill',     'henry.hill@example.com',     '2024-04-04'),
 ( 9, 'Ivy',      'Ingram',   'ivy.ingram@example.com',     '2024-04-20'),
 (10, 'Jack',     'Johnson',  'jack.johnson@example.com',   '2024-05-05'),
 (11, 'Kelly',    'King',     'kelly.king@example.com',     '2024-05-22'),
 (12, 'Leo',      'Lewis',    'leo.lewis@example.com',      '2024-06-10'),
 (13, 'Mia',      'Martinez', 'mia.martinez@example.com',   '2024-06-28'),
 (14, 'Noah',     'Nelson',   'noah.nelson@example.com',    '2024-07-15'),
 (15, 'Olga',     'Owens',    'olga.owens@example.com',     '2024-08-01'),
 (16, 'Pete',     'Parker',   'pete.parker@example.com',    '2024-08-19'),
 (17, 'Quinn',    'Quincy',   'quinn.quincy@example.com',   '2024-09-04'),
 (18, 'Rita',     'Robinson', 'rita.robinson@example.com',  '2024-09-20'),
 (19, 'Sam',      'Scott',    'sam.scott@example.com',      '2024-10-06'),
 (20, 'Tina',     'Turner',   'tina.turner@example.com',    '2024-10-22');

INSERT INTO Products (ProductID, ProductName,              Category,        UnitPrice) VALUES
 ( 1, 'Gaming Laptop',            'Electronics',     1200.00),
 ( 2, 'Wireless Mouse',           'Electronics',       25.00),
 ( 3, 'Office Chair',             'Furniture',        150.00),
 ( 4, 'Desk Lamp',                'Furniture',         45.00),
 ( 5, 'Water Bottle',             'Accessories',       20.00),
 ( 6, 'USB-C Cable',              'Accessories',       10.00),
 ( 7, 'Noise-Cancel Headphones',  'Electronics',      200.00),
 ( 8, 'Standing Desk',            'Furniture',        350.00),
 ( 9, '27\" Monitor',             'Electronics',      300.00),
 (10, 'Keyboard',                 'Electronics',       50.00),
 (11, 'Backpack',                 'Accessories',       80.00),
 (12, 'Webcam',                   'Electronics',       60.00),
 (13, 'Notebook (Pack of 5)',     'Office Supplies',    5.00),
 (14, 'Pen Set (10 pens)',        'Office Supplies',   12.00),
 (15, 'Coffee Maker',             'Appliances',        85.00),
 (16, 'Blender',                  'Appliances',        70.00),
 (17, 'Smartphone',               'Electronics',      800.00),
 (18, 'Tablet',                   'Electronics',      400.00),
 (19, 'HDMI Cable',               'Accessories',       15.00),
 (20, 'Microphone',               'Electronics',      120.00);

INSERT INTO Orders (OrderID, CustomerID, OrderDate) VALUES
 (101,  1, '2025-01-10'),
 (102,  2, '2025-01-11'),
 (103,  3, '2025-01-12'),
 (104,  4, '2025-01-13'),
 (105,  5, '2025-01-14'),
 (106,  6, '2025-01-15'),
 (107,  7, '2025-01-16'),
 (108,  8, '2025-01-17'),
 (109,  9, '2025-01-18'),
 (110, 10, '2025-01-19'),
 (111, 11, '2025-01-20'),
 (112, 12, '2025-01-21'),
 (113, 13, '2025-01-22'),
 (114, 14, '2025-01-23'),
 (115, 15, '2025-01-24'),
 (116, 16, '2025-01-25'),
 (117, 17, '2025-01-26'),
 (118, 18, '2025-01-27'),
 (119, 19, '2025-01-28'),
 (120, 20, '2025-01-29');

INSERT INTO OrderItems (OrderItemID, OrderID, ProductID, Quantity) VALUES
 (1001, 101,  1, 1),
 (1002, 102,  2, 2),
 (1003, 103,  3, 1),
 (1004, 104,  4, 3),
 (1005, 105,  5, 2),
 (1006, 106,  6, 1),
 (1007, 107,  7, 2),
 (1008, 108,  8, 1),
 (1009, 109,  9, 2),
 (1010, 110, 10, 1),
 (1011, 111, 11, 3),
 (1012, 112, 12, 1),
 (1013, 113, 13, 5),
 (1014, 114, 14, 2),
 (1015, 115, 15, 1),
 (1016, 116, 16, 4),
 (1017, 117, 17, 1),
 (1018, 118, 18, 2),
 (1019, 119, 19, 3),
 (1020, 120, 20, 1);

 --create a view that shows order details then list all orders

CREATE VIEW OrderDetail AS 
SELECT O.OrderID , C.FirstName + ' ' + C.LastName AS CustomerName,
P.ProductName, P.Category, OI.Quantity, (P.UnitPrice * OI.Quantity) AS LineTotal
FROM OrderItems OI 
JOIN Products P ON OI.ProductID = P.ProductID
JOIN Orders O ON O.OrderID = OI.OrderID
JOIN Customers C ON C.CustomerID = O.CustomerID

SELECT * FROM OrderDetail
-----------------------------------------------------

--display customers who have placed an order

CREATE VIEW AllOrders AS

SELECT OI.OrderID, C.FirstName + ' ' + C.LastName AS CustomerName,
P.ProductName, P.Category,
OI.Quantity, O.OrderDate
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID 
JOIN OrderItems OI ON O.OrderID = OI.OrderID
JOIN Products P ON OI.ProductID  = P.ProductID

SELECT * FROM AllOrders
-----------------------------------------------------

--CREATE a view that summarizes total revenue per product, then list the 
--top 5 best selling products by revenue.
CREATE VIEW [topProducts] AS
SELECT TOP 5 P.ProductName, P.ProductID, OI.Quantity, SUM(P.UnitPrice * OI.Quantity) AS TotalRevenue
FROM Products P
JOIN OrderItems OI ON OI.ProductID = P.ProductID
GROUP BY P.ProductName, P.ProductID, OI.Quantity
ORDER BY TotalRevenue DESC

SELECT * FROM [topProducts]
-----------------------------------------------------

--build a view showing each customers total spent, then return whose total spent exceeds $500.

CREATE VIEW CustomersTotalSpent AS

SELECT C.CustomerID, C.FirstName + ' ' + C.LastName AS CustomerName, (P.UnitPrice * OI.Quantity) AS TotalSpent 
FROM Customers C 
JOIN Orders O ON C.CustomerID = O.CustomerID
JOIN OrderItems OI ON O.OrderID = OI.OrderID
JOIN Products P ON OI.ProductID = P.ProductID
WHERE (P.UnitPrice * OI.Quantity) > 500

SELECT * FROM CustomersTotalSpent
-----------------------------------------------------


--create view listing each category with revenue above $1000

CREATE VIEW GetRevenue	AS 

SELECT P.Category, COUNT(OI.Quantity) AS TotalQuantity, SUM(P.UnitPrice * OI.Quantity) AS TotalRevenue
FROM Products P 
JOIN OrderItems OI ON OI.ProductID = P.ProductID
GROUP BY P.Category
HAVING SUM(P.UnitPrice * OI.Quantity) > 1000

SELECT * FROM GetRevenue
-----------------------------------------------------

--Build a view that shows customer's first order date, then 
--list customers who have never placed an order.

SELECT
