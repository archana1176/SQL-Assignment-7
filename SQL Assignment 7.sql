
 --  1 Add a new column called DOB in Persons table with data type as Date
 
 ALTER TABLE Persons ADD DOB DATE;
 SELECT * FROM persons; 
UPDATE persons SET dob='1997-06-02' WHERE id=1; 
UPDATE persons SET dob='1989-05-20' WHERE id=2; 
UPDATE persons SET dob='1999-11-22' WHERE id=3; 
UPDATE persons SET dob='1985-03-13' WHERE id=4; 
UPDATE persons SET dob='1994-12-07' WHERE id=5; 
SELECT FLOOR(DATEDIFF(CURDATE(),dob)/365.25) AS age FROM PERSONS;

--  2 Write a user-defined function to calculate age using DOB

DELIMITER $$
CREATE FUNCTION Calculate_Age (DOB DATE)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE Age INT;
    SET Age =  FLOOR(DATEDIFF(CURDATE(),dob)/365.25);
    RETURN Age;
END $$
DELIMITER ;
SELECT calculate_age('1997-06-03');

-- 3 Write a select query to fetch the Age of all persons using the function that has been created

SELECT calculate_age(dob) AS age FROM persons;


-- 4 Find the length of each country name in the Country table

SELECT Country_name, LENGTH(Country_name) AS Name_Length
FROM Country;

-- 5  Extract the first three characters of each country's name in the Country table

SELECT Country_name, SUBSTR(Country_name, 1, 3) AS First_Three_Chars
FROM Country;

-- 6 Convert all country names to uppercase and lowercase in the Country table

-- Uppercase
SELECT Country_name, UPPER(Country_name) AS Uppercase_Name
FROM Country;
-- Lowercase
SELECT Country_name, LOWER(Country_name) AS Lowercase_Name
FROM Country;





 
