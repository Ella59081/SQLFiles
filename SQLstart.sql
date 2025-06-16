--create a database
CREATE DATABASE aptech;
USE aptech;

--create a table
CREATE TABLE employees(
   id INT PRIMARY KEY IDENTITY(1, 1), --each column of the table
   FirstName NVARCHAR(50),
   LastName NVARCHAR(50),
   Department NVARCHAR(50),
   HireDate DATE 
)

--put values in the table
INSERT INTO employees(FirstName, LastName, Department, HireDate  ) VALUES
('John', 'Johnson', 'Finance', '2020-01-22'),
('Bob', 'Ross', 'Engineering', '2015-06-02'),
('Eleanor', 'Ebere', 'Finance', '2022-03-20'),
('Gru', 'Benson', 'Finance', '2023-11-05'),
('Deborah', 'Kings', 'Finance', '2012-04-11'),
('Johnson', 'Riles', 'Media', '2016-08-07')

--get all employees
SELECT * fROM employees;


--get all the firstnames and hiredates from the table
SELECT Firstname, HireDate
from 
employees;


--update the lastname of an employee
UPDATE employees SET
LastName = 'Bobrisky'
WHERE id = 3 AND id = 4

--delete an employee
DELETE FROM employees
WHERE id = 3


--RETRIEVE EMPLOOYEE IN IT DEPARTMENT
SELECT * FROM employees
where Department = 'Media';


--get number of employees
SELECT count(*) as total_employees_no FROM employees;


--get number of employees from each department
SELECT Department, count(*) as employeeCount
FROM employees
GROUP by Department;

--get employees in ascending order
SELECT * FROM employees
ORDER by FirstName ASC


--get the first employee with their fistname in ascending order
SELECT * FROM employees
ORDER by FirstName ASC 
OFFSET 0 ROWS FETCH NEXT 1 ROWS ONLY;



CREATE TABLE Employees2 (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Department NVARCHAR(50),
    Salary DECIMAL(10,2),
    HireDate DATE,
    City�NVARCHAR(50)
);

INSERT INTO Employees2 (FirstName, LastName, Department, Salary, HireDate, City) VALUES
('Alice','Anderson','Sales',55000.00,'2018-02-14','New York'),
('Bob','Brown','Engineering',72000.00,'2019-03-01','Los Angeles'),
('Charlie','Clark','HR',60000.00,'2020-07-23','Chicago'),
('Diana','Davis','Marketing',58000.00,'2017-11-19','Houston'),
('Ethan','Edwards','Finance',65000.00,'2016-05-04','Phoenix'),
('Fiona','Flores','IT',70000.00,'2021-01-12','Philadelphia'),
('George','Garcia','Sales',52000.00,'2018-08-30','San Antonio'),
('Hannah','Harris','Engineering',73000.00,'2019-12-15','San Diego'),
('Ian','Ivanov','HR',61000.00,'2020-02-10','Dallas'),
('Jenna','Johnson','Marketing',59000.00,'2017-06-25','San Jose'),
('Kevin','King','Finance',68000.00,'2016-09-17','New York'),
('Laura','Lopez','IT',71000.00,'2021-03-05','Los Angeles'),
('Michael','Martinez','Sales',53000.00,'2018-10-10','Chicago'),
('Nora','Nguyen','Engineering',74000.00,'2022-04-01','Houston'),
('Oliver','Owens','HR',62000.00,'2019-05-22','Phoenix'),
('Patricia','Perez','Marketing',60000.00,'2017-08-14','Philadelphia'),
('Quentin','Quinn','Finance',69000.00,'2016-11-30','San Antonio'),
('Rachel','Robinson','IT',72000.00,'2021-06-18','San Diego'),
('Samuel','Scott','Sales',54000.00,'2019-01-09','Dallas'),
('Tina','Thompson','Engineering',75000.00,'2022-07-27','San Jose'),
('Ulysses','Underwood','HR',63000.00,'2020-03-29','New York'),
('Victoria','Valdez','Marketing',61000.00,'2017-10-21','Los Angeles'),
('William','White','Finance',70000.00,'2016-12-11','Chicago'),
('Xander','Xu','IT',73000.00,'2021-09-02','Houston'),
('Yolanda','Young','Sales',55000.00,'2018-11-03','Phoenix'),
('Zach','Zimmerman','Engineering',76000.00,'2023-02-14','Philadelphia'),
('Amy','Adams','HR',64000.00,'2020-05-06','San Antonio'),
('Brandon','Baker','Marketing',62000.00,'2017-01-15','San Diego'),
('Caroline','Campbell','Finance',71000.00,'2016-03-08','Dallas'),
('David','Diaz','IT',74000.00,'2021-10-21','San Jose'),
('Elena','Evans','Sales',56000.00,'2019-02-25','New York'),
('Frank','Foster','Engineering',77000.00,'2023-05-30','Los Angeles'),
('Grace','Green','HR',65000.00,'2020-07-19','Chicago'),
('Henry','Hughes','Marketing',63000.00,'2017-12-07','Houston'),
('Isabella','Ingram','Finance',72000.00,'2016-06-14','Phoenix'),
('Jack','Jackson','IT',75000.00,'2021-11-11','Philadelphia'),
('Karen','Kelly','Sales',57000.00,'2019-03-19','San Antonio'),
('Leo','Lewis','Engineering',78000.00,'2023-08-22','San Diego'),
('Mia','Mitchell','HR',66000.00,'2020-09-30','Dallas'),
('Noah','Nelson','Marketing',64000.00,'2017-04-05','San Jose'),
('Olivia','Ortiz','Finance',73000.00,'2016-08-09','New York'),
('Peter','Parker','IT',76000.00,'2021-12-01','Los Angeles'),
('Quinn','Quinton','Sales',58000.00,'2019-05-27','Chicago'),
('Rebecca','Reed','Engineering',79000.00,'2023-11-16','Houston'),
('Steven','Smith','HR',67000.00,'2020-11-29','Phoenix'),
('Teresa','Turner','Marketing',65000.00,'2017-02-02','Philadelphia'),
('Victor','Vega','Finance',74000.00,'2016-10-18','San Antonio'),
('Wendy','Williams','IT',77000.00,'2021-08-08','San Diego'),
('Xavier','Xiong','Sales',59000.00,'2019-07-07','Dallas'),
('Zoe','Zimmerman','Engineering',80000.00,'2024-01-12','San Jose');

SELECT * FROM Employees2
--list all firstname, lastname and departments for employees in sales department
--count the number of employees in each department



--list all firstname, lastname and departments for employees in sales department
SELECT FirstName, LastName, Department FROM Employees2 
WHERE Department = 'Sales'


--count the number of employees in each department

SELECT Department, count(*) as total_no_of_employees
FROM Employees2
GROUP by Department

--Aggregrate functions: 
--count, sum, avg, min, max, disctint

SELECT SUM(salary) as total_salary
FROM Employees2

SELECT MIN(salary) as least_salary
FROM Employees2

SELECT MAX(salary) as highest_salary
FROM Employees2

SELECT * FROM Employees2
WHERE salary = (select MIN(salary) FROM Employees2)

--calculate the average salary for each department
SELECT department, AVG(salary) as Average_salary
FROM Employees2
GROUP by department

--find all employees hired after january
SELECT * FROM Employees2
WHERE HireDate > '2022-01-01'

--list the top 5 highest paid employees 

SELECT * FROM Employees2
ORDER BY salary DESC
OFFSET 0 ROWS FETCH NEXT 5 ROWS ONLY;

SELECT  TOP 5 salary, FirstName, LastName, Department
FROM Employees2 
ORDER BY salary  DESC

SELECT  TOP 5 salary
FROM Employees2 
ORDER BY salary  DESC


--show the total payroll cost for engineering department
SELECT department, SUM(salary) as total_payroll
FROM Employees2
WHERE department = 'Engineering'
GROUP BY Department

--display each city once along with the count of employee in that city

SELECT DISTINCT city, count(*) as employee_count
FROM Employees2
GROUP BY city

--idenify the emloyee whose last name begin with 'S'
SELECT * FROM Employees2
WHERE lastname LIKE 's%'

--select employee with salary between 60000 and 70000
SELECT * FROM Employees2
WHERE salary BETWEEN 60000 AND 70000

--find department with the highest average salary
SELECT TOP 1 Department, AVG(salary) AS average_salary
FROM Employees2
GROUP BY department
ORDER BY AVG(salary) DESC

--get all employees earning above the company wide average salary 
SELECT * FROM Employees2
WHERE salary > (SELECT AVG(salary) FROM Employees2)

--difference between RDBMS and DBMS
--what are the roles of DBA
--How to improve database performance

--list all the department
SELECT DISTINCT department 
FROM Employees2
GROUP BY department

--find all department with more than 8 employee
SELECT Department , count(*) as employeeCount
FROM Employees2		
GROUP BY Department
Having COUNT(*) > 8

--cities where at least 5 employees live
SELECT DISTINCT City FROM Employees2
WHERE City IN (SELECT City
FROM Employees2
GROUP BY city
Having COUNT(*) >= 5)

--employee hired after the earliest hire date in the company
SELECT * FROM Employees2
WHERE hiredate > (SELECT Min(Hiredate)
FROM Employees2)

--list the third highest paid in the company
SELECT * FROM Employees2
WHERE salary = (SELECT MIN(TOP 3 salary) DISTINCT salary
FROM Employees
ORDER BY salary DESC
OFFSET 0 ROWS FETCH NEXT 3 ROWS ONLY)

--delete all employees with salary below the company average;
DELETE FROM Employees2
WHERE salary < (SELECT AVG(salary) FROM Employees2)

--find employees whose salary ranks in the top 10% of all salary
SELECT * FROM Employees2 
WHERE salary IN (SELECT TOP 10 PERCENT salary FROM Employees2) 
 

SELECT department, count(*) as department_count
FROM Employees2
GROUP BY department

--how many employees were hired each year
SELECT Hiredate, count(*) as employee_count
FROM Employees2
GROUP BY HireDate

SELECT YEAR(hiredate) as HireYear, count(*) as employee_count
FROM Employees2
GROUP by YEAR(hiredate)
ORDER BY HireYear

--how many employee were hired each month of 2021
SELECT MONTH(hiredate)as HireMonth, count(*) as hired_employee
FROM Employees2
WHERE YEAR(hiredate) = 2021
GROUP by MONTH(hiredate)
ORDER BY HireMonth

--group employees into 10000 salary bands and count each band
SELECT (salary/10000) * 10000 AS salaryBand, count(*) as numEployee
FROM Employees2
GROUP BY (salary/10000) * 10000
ORDER BY salaryBand

--show payroll subtotal by department and city plus grand total
SELECT department, SUM(salary) as total_salary
FROM Employees2
GROUP BY department

SELECT City, SUM(salary) as total_salary
FROM Employees2
GROUP BY city

