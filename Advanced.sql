
-- Write a stored procedure that accepts the month and year as inputs and prints the ordernumber, orderdate and status of the orders placed in that month. 
SELECT * FROM orders;

DELIMITER &&  
CREATE procedure spNUMBER(IN p_month INT, IN p_year INT)
BEGIN 
	SELECT ordernumber, orderdate, status
    FROM orders
    WHERE month(orderdate) = p_month AND year(orderdate) = P_year;
END ; &&
DELIMITER ;


CALL spNUMBER(11,2003);










--  a. Write function that takes the customernumber as input and returns the purchase_status based on the following criteria . [table:Payments]
SELECT * FROM payments;

DELIMITER $$  
CREATE FUNCTION get_purchase_status (cust_number INT) RETURNS VARCHAR(10)
DETERMINISTIC 
BEGIN
    DECLARE total_amount DECIMAL(10,2);
    DECLARE purchase_status VARCHAR(10);
    
    SELECT SUM(amount) INTO total_amount
    FROM payments
    WHERE customerNumber = cust_number;
    
    IF total_amount < 25000 THEN
        SET purchase_status = 'Silver';
    ELSEIF total_amount >= 25000 AND total_amount < 50000 THEN
        SET purchase_status = 'Gold';
    ELSE
        SET purchase_status = 'Platinum';
    END IF;
    
    RETURN purchase_status;
END 
$$ DELIMITER ; 



select get_purchase_status(103);












--  Write a query that displays customerNumber, customername and purchase_status from customers table.
SELECT * FROM customers;


select customernumber, customername, get_purchase_status(customernumber) as purchase_status FROM customers;









-- Replicate the functionality of 'on delete cascade' and 'on update cascade' using triggers on movies and rentals tables. 
-- Note: Both tables - movies and rentals - don't have primary or foreign keys. Use only triggers to implement the above.
select * from movies;

select * from rentals;


DELIMITER $$
CREATE TRIGGER trg_movies_update
AFTER DELETE ON movies
FOR EACH ROW
BEGIN
    UPDATE rentals
    SET movieid = id
    WHERE movieid = OLD.id ;
END;

DELIMITER $$
CREATE TRIGGER trg_movies_delete 
AFTER DELETE ON movies 
FOR EACH ROW 
BEGIN
    DELETE FROM  rentals
    WHERE movieid 
    NOT IN (SELECT DISTINCT id FROM movies);
END;












-- Select the first name of the employee who gets the third highest salary. [table: employee]
SELECT * FROM employee
order by salary desc
limit 2,1;











-- Assign a rank to each employee  based on their salary. The person having the highest salary has rank 1. [table: employee]
SELECT * from Employee
order by salary DESC;

SElect *,
row_number() over(order BY  salary DESC) As Salary_rank
FROM employee;