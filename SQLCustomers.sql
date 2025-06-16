CREATE DATABASE shops

use shops


CREATE TABLE Customers (
  CustomerID   INT            PRIMARY KEY,
  FirstName    NVARCHAR(50)   NOT NULL,
  LastName     NVARCHAR(50)   NOT NULL,
  Email        NVARCHAR(100)  NOT NULL,
  SignupDate   DATE           NOT NULL
);

CREATE TABLE Products (
  ProductID    INT            PRIMARY KEY,
  ProductName  NVARCHAR(100)  NOT NULL,
  Category     NVARCHAR(50)   NOT NULL,
  UnitPrice    DECIMAL(10,2)  NOT NULL
);

CREATE TABLE Orders (
  OrderID      INT            PRIMARY KEY,
  CustomerID   INT            NOT NULL
    REFERENCES Customers(CustomerID),
  OrderDate    DATETIME2      NOT NULL,
  ShipDate     DATETIME2      NULL
);

CREATE TABLE OrderItems (
  OrderItemID  INT            PRIMARY KEY,
  OrderID      INT            NOT NULL
    REFERENCES Orders(OrderID),
  ProductID    INT            NOT NULL
    REFERENCES Products(ProductID),
  Quantity     INT            NOT NULL
);



INSERT INTO Customers VALUES
 (1,'Alice','Anderson','alice@example.com','2024-01-05'),
 (2,'Bob','Brown','bob@example.com','2024-01-12'),
 (3,'Carol','Clark','carol@example.com','2024-01-20'),
 (4,'David','Davis','david@example.com','2024-02-02'),
 (5,'Eve','Evans','eve@example.com','2024-02-15'),
 (6,'Frank','Foster','frank@example.com','2024-03-01'),
 (7,'Grace','Green','grace@example.com','2024-03-18'),
 (8,'Henry','Hill','henry@example.com','2024-04-04'),
 (9,'Ivy','Ingram','ivy@example.com','2024-04-20'),
 (10,'Jack','Johnson','jack@example.com','2024-05-05'),
 (11,'Kelly','King','kelly@example.com','2024-05-22'),
 (12,'Leo','Lewis','leo@example.com','2024-06-10'),
 (13,'Mia','Martinez','mia@example.com','2024-06-28'),
 (14,'Noah','Nelson','noah@example.com','2024-07-15'),
 (15,'Olga','Owens','olga@example.com','2024-08-01'),
 (16,'Pete','Parker','pete@example.com','2024-08-19'),
 (17,'Quinn','Quincy','quinn@example.com','2024-09-04'),
 (18,'Rita','Robinson','rita@example.com','2024-09-20'),
 (19,'Sam','Scott','sam@example.com','2024-10-06'),
 (20,'Tina','Turner','tina@example.com','2024-10-22');


INSERT INTO Products VALUES
 (1,'Gaming Laptop','Electronics',1200.00),
 (2,'Wireless Mouse','Electronics',25.00),
 (3,'Office Chair','Furniture',150.00),
 (4,'Desk Lamp','Furniture',45.00),
 (5,'Water Bottle','Accessories',20.00),
 (6,'USB-C Cable','Accessories',10.00),
 (7,'Noise-Cancel Headphones','Electronics',200.00),
 (8,'Standing Desk','Furniture',350.00),
 (9,'Monitor 27""','Electronics',300.00),
 (10,'Keyboard','Electronics',50.00),
 (11,'Backpack','Accessories',80.00),
 (12,'Webcam','Electronics',60.00),
 (13,'Notebook','Office Supplies',5.00),
 (14,'Pen Set','Office Supplies',12.00),
 (15,'Coffee Maker','Appliances',85.00),
 (16,'Blender','Appliances',70.00),
 (17,'Smartphone','Electronics',800.00),
 (18,'Tablet','Electronics',400.00),
 (19,'HDMI Cable','Accessories',15.00),
 (20,'Microphone','Electronics',120.00);


INSERT INTO Orders VALUES
 (101,1,'2025-01-10 09:00','2025-01-12 14:00'),
 (102,2,'2025-01-11 11:30','2025-01-13 16:30'),
 (103,3,'2025-01-12 15:45','2025-01-14 10:20'),
 (104,4,'2025-01-13 08:20','2025-01-15 12:50'),
 (105,5,'2025-01-14 13:10','2025-01-16 17:00'),
 (106,6,'2025-01-15 10:05','2025-01-17 11:30'),
 (107,7,'2025-01-16 14:25','2025-01-18 15:45'),
 (108,8,'2025-01-17 16:00','2025-01-19 09:10'),
 (109,9,'2025-01-18 09:40','2025-01-20 13:00'),
 (110,10,'2025-01-19 12:55','2025-01-21 18:20'),
 (111,11,'2025-01-20 08:15','2025-01-22 14:30'),
 (112,12,'2025-01-21 14:35','2025-01-23 16:05'),
 (113,13,'2025-01-22 10:50','2025-01-24 12:15'),
 (114,14,'2025-01-23 11:20','2025-01-25 15:40'),
 (115,15,'2025-01-24 15:30','2025-01-26 10:25'),
 (116,16,'2025-01-25 09:00','2025-01-27 13:10'),
 (117,17,'2025-01-26 13:45','2025-01-28 11:55'),
 (118,18,'2025-01-27 17:10','2025-01-29 14:45'),
 (119,19,'2025-01-28 08:30','2025-01-30 12:00'),
 (120,20,'2025-01-29 16:20','2025-01-31 17:30');


INSERT INTO OrderItems VALUES
 (1001,101,1, 1),
 (1002,101,2, 2),
 (1003,102,3, 1),
 (1004,102,5, 1),
 (1005,103,7, 1),
 (1006,103,9, 2),
 (1007,104,2, 1),
 (1008,104,6, 3),
 (1009,105,8, 1),
 (1010,105,10,2),
 (1011,106,11,1),
 (1012,106,12,2),
 (11014013,107,13,5),
 (,107,14,2),
 (1015,108,15,1),
 (1016,108,16,1),
 (1017,109,17,1),
 (1018,109,18,2),
 (1019,110,19,3),
 (1020,110,20,1);


--list every order line with customer name, product name, quantity, price and order line

SELECT
C.FirstName + ' ' + C.LastName AS Customer, 
O.OrderDate,
P.ProductName,
OI.Quantity,
OI.Quantity * P.UnitPrice AS LineTotal
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
JOIN OrderItems OI ON O.OrderID = OI.OrderID
JOIN Products P ON OI.ProductID = P.ProductID

--find the total amount spent across all orders
 
SELECT C.CustomerID,
C.FirstName + ' ' + C.LastName AS Customer, 
SUM(OI.Quantity * P.UnitPrice) AS TotalSpent
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
JOIN OrderItems OI ON O.OrderID = OI.OrderID
JOIN Products P ON OI.ProductID = P.ProductID
GROUP BY C.CustomerID, C.FirstName, C.LastName

--show orders shipped late

SELECT C.CustomerID, OrderID,
C.FirstName + ' ' + C.LastName AS Customer, OrderDate
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
WHERE DATEDIFF(DAY, O.OrderDate, O.ShipDate) > 2
GROUP BY C.CustomerID, OrderID, C.FirstName, C.LastName, O.ShipDate, O.OrderDate
--(No orders were shipped late)--


--list the top 5 best selling products by quantity sold

SELECT TOP 5
P.ProductID,
P.ProductName,
SUM(OI.Quantity) AS TotalQuantitySold
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
JOIN OrderItems OI ON O.OrderID = OI.OrderID
JOIN Products P ON OI.ProductID = P.ProductID
GROUP BY P.ProductID, P.ProductName
ORDER BY TotalQuantitySold DESC


--find the monthly revenue for January 2025
SELECT 
DAY(O.ShipDate) AS DaysOfMonth,
SUM(OI.Quantity * P.UnitPrice) AS totalRevenue
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
JOIN OrderItems OI ON O.OrderID = OI.OrderID
JOIN Products P ON OI.ProductID = P.ProductID
WHERE O.ShipDate between '2025-01-01' and '2025-01-31'
GROUP BY O.ShipDate


--find customers who bought 'Wireless Mouse'

SELECT C.FirstName + ' ' + C.LastName AS Customer,
P.ProductName, SUM(Quantity) AS quantity
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
JOIN OrderItems OI ON O.OrderID = OI.OrderID
JOIN Products P ON OI.ProductID = P.ProductID
WHERE P.ProductName = 'Wireless Mouse'
GROUP BY C.FirstName,C.LastName, P.ProductName
 

 --find average order per customer

SELECT C.FirstName + ' ' + C.LastName AS CustomerName , O.OrderID,
AVG(OI.Quantity * P.UnitPrice) AS AvgOrder
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
JOIN OrderItems OI ON O.OrderID = OI.OrderID
JOIN Products P ON OI.ProductID = P.ProductID
GROUP BY C.FirstName, C.LastName, O.OrderID


--Find products never ordered in january 2025

SELECT P.ProductID , P.ProductName, P.Category,
P.UnitPrice
FROM Products P
JOIN OrderItems OI ON P.ProductID = OI.ProductID
JOIN Orders O ON OI.OrderID = O.OrderID
WHERE O.ShipDate NOT BETWEEN '2025-01-01' AND '2025-01-31'
--(none)

--find total items sold in each category

SELECT P.Category, COUNT(O.OrderID) AS ItemsSold,
SUM(OI.Quantity * P.UnitPrice) AS Total
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
JOIN OrderItems OI ON O.OrderID = OI.OrderID
JOIN Products P ON OI.ProductID = P.ProductID
GROUP BY P.Category

--find high value orders(Orders total that exceed 500)

SELECT O.OrderID, C.FirstName + ' ' + C.LastName, P.Category, OI.Quantity,
SUM(OI.Quantity * P.UnitPrice) AS TotalPrice
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
JOIN OrderItems OI ON O.OrderID = OI.OrderID
JOIN Products P ON OI.ProductID = P.ProductID
GROUP BY O.OrderID, C.FirstName, C.LastName, P.Category, OI.Quantity
HAVING SUM(OI.Quantity * P.UnitPrice) > 500

--List all orders with at least one item in the appliances

--latest purchase date per customer
SELECT O.OrderID, C.FirstName + ' ' + C.LastName AS CustomerName,
P.Category, OI.Quantity,
SUM(OI.Quantity * P.UnitPrice) AS TotalPrice,
MIN(O.ShipDate) AS LatestShipDate
FROM Customers C
JOIN Orders O ON C.CustomerID = O.CustomerID
JOIN OrderItems OI ON O.OrderID = OI.OrderID
JOIN Products P ON OI.ProductID = P.ProductID
GROUP BY O.OrderID, C.FirstName, C.LastName, P.Category, OI.Quantity
