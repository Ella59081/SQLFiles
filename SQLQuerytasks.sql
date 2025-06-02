CREATE DATABASE aptechStudents;
USE aptechStudents;

CREATE TABLE students(
   id INT PRIMARY KEY IDENTITY(1, 1),
   FirstName NVARCHAR(50),
   LastName NVARCHAR(50),
   Gender NVARCHAR(10),
   StateOfBirth CHAR(50),
   Age NUMERIC(5),
   RegisteredDate DATE
)

INSERT INTO students(FirstName, LastName, Gender, StateOfBirth, Age, RegisteredDate ) VALUES
('Eleanor', 'Ebere', 'Female', 'Abia state', '23', '2024/08/05'),
('Joanna', 'Enoch', 'Female', 'Rivers state', '18', '2022/05/01'),
('Michael', 'Enoch', 'Male', 'Rivers state', '12', '2023/03/11'),
('Melody', 'Collins', 'Female', 'Edo state', '18', '2023/12/11'),
('Divine', 'Bamidele', 'Female', 'Lagos state', '22', '2023/04/06'),
('Samuel', 'Fakuade', 'Male', 'Ebonyi state', '24', '2024/01/01'),
('Gerald', 'Gerald', 'Male', 'Osun state', '27', '2023/07/10'),
('Caleb', 'Caleb', 'Male', 'Edo state', '16', '2024/02/01'),
('Abas', 'Thomas', 'Male', 'Aqua-Ibom state', '28', '2023/12/01'),
('Chis', 'Topher', 'Male', 'Anambara state', '19', '2022/05/01'),
('Mann', 'Walters', 'Male', 'Ebonyi state', '18', '2022/05/01'),
('Mann', 'Walters', 'Male', 'Ebonyi state', '18', '2022/05/01'),
('Good', 'Luck', 'Male', 'Anambara state', '18', '2022/05/01')

SELECT * FROM students

SELECT * FROM students
WHERE Gender = 'Female'

SELECT * FROM students
WHERE StateOfBirth = 'Abia State'

SELECT * FROM students
WHERE Age < 18


UPDATE students SET
StateOfBirth = 'Lagos State'
WHERE StateOfBirth = 'Rivers state'



SELECT * FROM students
WHERE Age BETWEEN 14 AND 16


SELECT StateOfBirth, count(*) as StateCount
FROM students
GROUP by StateOfBirth;


SELECT Gender, count(*) as GenderCount
FROM students
GROUP by Gender;


SELECT * FROM students
ORDER by Age ASC
OFFSET 0 ROWS FETCH NEXT 1 ROWS ONLY;


SELECT * FROM students
ORDER BY RegisteredDate ASC
OFFSET 0 ROWS FETCH NEXT 1 ROWS ONLY;

DELETE FROM students
WHERE Age =  (SELECT MIN(Age) from students)
