 -- select all employees in department 10 whose salary is greater than 3000. [table: employee]
SELECT *  FROM employee
WHERE deptno = 10 AND salary > 3000;

SELECT * FROM students;

ALTER TABLE students
ADD COLUMN grades VARCHAR(70);

UPDATE students
SET grades = 
	case
    when Marks <50 THEN 'second class'
    When marks < 80 then 'First class'
    Else 'Distinction'
    END;
    


-- a. How many students have graduated with first class?
SELECT count(*) FROM students
WHERE grades = 'first class';

SELECT count(marks) as first_class FROM students
WHERE marks>50 AND marks < 80;



-- b. How many students have obtained distinction? [table: students]
SELECT count(*) FROM students 
WHERE grades = 'Distinction';

SELECT count(*) as Distinction  FROM students
WHERE marks between 80 and 100; 


-- Get a list of city names from station with even ID numbers only. Exclude duplicates from your answer.[table: station]
SELECT * FROM Station;

SELECT DISTINCT city FROM station
WHERE MOD(id,2) = 0;

select distinct(city),id from station 
where id%2=0;



-- Find the difference between the total number of city entries in the table and the number of distinct city entries in the table. In other words,
-- if N is the number of city entries in station, and N1 is the number of distinct city names in station, write a query to find the value of N-N1 from station.

Select count(city) from station;
select count(distinct city) from station;


SELECT COUNT(city) - COUNT(DISTINCT city) AS differnce , count(city), count(DISTINCT city) FROM station;



-- a. Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates. [Hint: Use RIGHT() / LEFT() methods ]
SELECT * FROM station;

SELECT DISTINCT city FROM station
WHERE LEFT(city,1) IN ('a', 'e', 'i', 'o', 'u')
ORDER BY city;


SELECT DISTINCT city FROM station 
WHERE City LIKE 'a%'
OR City LIKE 'e%'
OR City LIKE 'i%'
OR City LIKE 'o%'
OR City LIKE 'u%'
ORDER BY city;


-- Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates.
SELECT DISTINCT city FROM station
WHERE LEFT(city,1) IN ('a', 'e', 'i', 'o', 'u')
AND RIGHT(city,1) IN ('a', 'e', 'i', 'o', 'u')
ORDER BY city;




-- Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.
SELECT city FROM station
WHERE LEFT(city,1) NOT  IN ('a', 'e', 'i', 'o', 'u')
ORDER BY city;



-- Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates. [table: station]
SELECT DISTINCT city FROM station
WHERE LEFT(city,1) NOT IN ('a', 'e', 'i', 'o', 'u')
OR RIGHT(city,1) NOT  IN ('a', 'e', 'i', 'o', 'u')
ORDER BY city;



-- . Write a query that prints a list of employee names having a salary greater than $2000 per month who have been employed for less than 36 months.
-- Sort your result by descending order of salary. [table: emp]
SELECT * FROM emp;

SELECT first_name,last_name,salary,hire_date FROM emp
WHERE salary > 2000 AND MONTH(DATEDIFF(curdate(),hire_date)) < 36
ORDER BY salary DESC;



-- How much money does the company spend every month on salaries for each department? [table: employee]
SELECT * FROM employee;

SELECT deptno,sum(salary)
FROM employee
GROUP BY deptno;


-- How many cities in the CITY table have a Population larger than 100000. [table: city]
SELECT * FROM city;

SELECT count(*) FROM city
WHERE population > 100000;

--  What is the total population of California? [table: city]
SELECT SUM(Population)
FROM city
WHERE district = 'california';


-- What is the average population of the districts in each country? [table: city]
SELECT district, ROUND(AVG(population),2) as AVG_population
FROM city
GROUP BY district;



--  Find the ordernumber, status, customernumber, customername and comments for all orders that are ‘Disputed=  [table: orders, customers]
SELECT * FROM orders;
SELECT * FROM customers;

SELECT orders.orderNumber, orders.status, orders.comments, customers.customernumber, customers.customername
FROM Orders
INNER JOIN customers 
ON orders.Customernumber = customers.customernumber
WHERE comments is null;



