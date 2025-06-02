CREATE DATABASE Company;
USE Company;

CREATE TABLE Departments (
  DepartmentID   INT            PRIMARY KEY,
  DepartmentName NVARCHAR(50)   NOT NULL
);

CREATE TABLE Employees (
  EmployeeID     INT            IDENTITY(1,1) PRIMARY KEY,
  FirstName      NVARCHAR(50)   NOT NULL,
  LastName       NVARCHAR(50)   NOT NULL,
  DepartmentID   INT            NOT NULL
    CONSTRAINT FK_Employees_Departments FOREIGN KEY REFERENCES Departments(DepartmentID),
  Salary         DECIMAL(10,2)  NOT NULL,
  HireDate       DATE           NOT NULL
);

INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
  (1, 'Human Resources'),
  (2, 'Information Technology'),
  (3, 'Sales'),
  (4, 'Marketing');

INSERT INTO Employees (FirstName, LastName, DepartmentID, Salary,   HireDate) VALUES
  ('John',    'Smith',    1,  55000.00, '2019-01-15'),
  ('Jane',    'Doe',      2,  75000.00, '2018-03-22'),
  ('Alice',   'Johnson',  3,  65000.00, '2020-07-10'),
  ('Bob',     'Brown',    4,  60000.00, '2017-11-05'),
  ('Carol',   'Davis',    1,  58000.00, '2021-02-14'),
  ('Daniel',  'Martinez', 2,  80000.00, '2016-08-30'),
  ('Emily',   'Wilson',   3,  67000.00, '2019-05-23'),
  ('Frank',   'Clark',    4,  62000.00, '2020-12-01'),
  ('Grace',   'Lee',      1,  59000.00, '2018-09-17'),
  ('Henry',   'Walker',   2,  78000.00, '2019-10-10'),
  ('Irene',   'Hall',     3,  71000.00, '2021-03-29'),
  ('Jack',    'Allen',    4,  63000.00, '2017-06-12'),
  ('Kelly',   'Young',    1,  60000.00, '2018-02-08'),
  ('Larry',   'Hernandez',2,  82000.00, '2016-04-19'),
  ('Monica',  'King',     3,  69000.00, '2020-01-27'),
  ('Nathan',  'Scott',    4,  65000.00, '2019-07-07');

--list the first name, lastname and department of every employee
SELECT e.FirstName, e.LastName, d.DepartmentName
FROM Employees AS e
INNER JOIN Departments AS d
ON e.DepartmentID = d.DepartmentID

--show employees who work in information along with their hiredate
SELECT e.FirstName, e.LastName, d.DepartmentName
FROM Employees AS e
INNER JOIN Departments AS d
ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Information Technology'

--retrieve firstname, department for employees earning more than 70,000
SELECT e.FirstName, d.DepartmentName
FROM Employees AS e
INNER JOIN Departments AS d
ON e.DepartmentID = d.DepartmentID
WHERE e.salary > 70000


--find employees hired after january 1, 2019 and include their department names
SELECT e.FirstName, e.HireDate, d.DepartmentName
FROM Employees AS e
INNER JOIN Departments AS d
ON e.DepartmentID = d.DepartmentID
WHERE e.HireDate > '2019-01-01'

--list employee whose department name end with ing
SELECT e.FirstName, e.HireDate, d.DepartmentName
FROM Employees AS e
INNER JOIN Departments AS d
ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName LIKE '%ing'

--display employees in sales with a salary below 68000 showing names and hiredate
SELECT e.FirstName, e.LastName, d.DepartmentName, e.HireDate, e.Salary
FROM Employees AS e
INNER JOIN Departments AS d
ON e.DepartmentID = d.DepartmentID
WHERE e.Salary < 68000

--return all employees by department, ordered by department name, then the last name.
SELECT e.LastName, d.DepartmentName
FROM Employees AS e
INNER JOIN Departments AS d
ON e.DepartmentID = d.DepartmentID
ORDER BY d.DepartmentName, e.LastName


--show each department average salary
SELECT  d.DepartmentName, AVG(e.Salary) AS average_salary
FROM Employees AS e
INNER JOIN Departments AS d
ON e.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName

--list employees hired between 2018-01-01 and 2020-12-31 including their department name
SELECT e.FirstName, e.LastName, e.HireDate, d.DepartmentName
FROM Employees AS e
INNER JOIN Departments AS d
ON e.DepartmentID = d.DepartmentID
WHERE e.HireDate BETWEEN '2018-01-01' AND  '2020-12-31'

--for each department, show the employees with the highest salary and their hiredate

SELECT e.FirstName, e.LastName, e.Salary, d.DepartmentName, e.HireDate
FROM Employees AS e
INNER JOIN Departments AS d
ON e.DepartmentID = d.DepartmentID
WHERE e.Salary in (SELECT Max(Salary) 
FROM Employees AS e
GROUP BY e.DepartmentID)


--get total sales for each department

SELECT d.DepartmentName, SUM(e.Salary) as total_salary
FROM Employees AS e
INNER JOIN Departments AS d
ON e.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName

--GET department which total salary exceeds 250,000 
SELECT d.DepartmentName, SUM(e.Salary) as total_salary
FROM Employees AS e
INNER JOIN Departments AS d
ON e.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName
HAVING SUM(e.Salary) > 250000

--get number of employees in each department

SELECT d.DepartmentName, COUNT(*) as employeeCount
FROM Employees AS e
INNER JOIN Departments AS d 
ON e.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentName

--get the average salary per department and list the employees that exceed the average
SELECT e.FirstName, e.LastName, e.Salary, d.DepartmentName, AVG(Salary) AS averageSalary
FROM Employees AS e
INNER JOIN Departments AS d
ON e.DepartmentID = d.DepartmentID
WHERE e.Salary > (SELECT AVG(e.Salary)
FROM Employees AS e
GROUP BY e.DepartmentID
)

SELECT e.FirstName, e.LastName, e.Salary, d.DepartmentName, AVG(Salary) AS averageSalary
FROM Employees AS e
INNER JOIN Departments AS d
ON e.DepartmentID = d.DepartmentID
GROUP BY e.FirstName, e.LastName, e.Salary, d.DepartmentName
HAVING e.Salary > (SELECT AVG(e.Salary)
FROM (SELECT e.DepartmentID, AVG(e.Salary) as avere
FROM Employees AS e
GROUP BY e.DepartmentID) as avere


SELECT d.DepartmentName, AVG(e.Salary) as averageSalary
FROM Employees AS e
INNER JOIN Departments AS d
ON e.DepartmentID = d.DepartmentID
GROUP BY DepartmentName