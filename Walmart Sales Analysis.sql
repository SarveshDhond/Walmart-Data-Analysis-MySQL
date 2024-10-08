SET SQL_SAFE_UPDATES = 0;

# TURNED TIME INTO SESSIONS - MORNING / AFTERNOON AND EVENING
select time,
case
when time BETWEEN '00:00:00' AND '12:00:00' THEN 'Morning'
when time BETWEEN '12:01:00' AND '16:00:00' THEN 'Afternoon'
ELSE 'Evening'
END
AS Time_of_the_day
from SALES;

# ADDED NEW CREATED SESSIONS INTO A NEW COLUMN 
UPDATE SALES
SET Time_of_day = (case
when time BETWEEN '00:00:00' AND '12:00:00' THEN 'Morning'
when time BETWEEN '12:01:00' AND '16:00:00' THEN 'Afternoon'
ELSE 'Evening'
END);


SELECT Date, Dayname (Date)
FROM SALES;

# ADDED NEW COLUMN 
ALTER TABLE SALES
ADD COLUMN Day_name VARCHAR(30);

# UPDATED COLUMN WITH VALUES
UPDATE SALES
SET day_name = dayname(date);

# ADDED NEW COLUMMN
ALTER TABLE SALES
ADD Months_name VARCHAR (30);


SELECT date,
monthname(date)
from SALES;

# UPDATED CCOLUMN WITH VALUES
UPDATE SALES
SET Months_name = monthname(date);


# HOW MANY UNIQUE CITIES DOES THE DATA HAVE - 3 (YANGON, NAYPYITAW & MANDALAY)
SELECT distinct city from SALES;

# IN WHICH CITY IS EACH BRANCH - A IN YANGON, B IN MANDALAY & C IN NAYPYITAW
SELECT DISTINCT city,
branch
FROM SALES;

# HOW MANY UNIQUE PRODUCT LINES DOES THE DATA HAVE - 6
# FOOD & BEVERAGES, HEALTH & BEAUTY, SPORTS & TRAVEL, FASHION ACCESSORIES,  HOME & LIFESTYLE AND ELECTRONIC ACCESSORIES.
SELECT distinct product_line FROM SALES;

# WHAT IS THE MOST COMMON PAYMENT METHOD - CASH
SELECT payment_method,
COUNT(payment_method) AS Frequency
FROM SALES
GROUP BY payment_method;

# WHAT IS THE MOST SELLING PRODUCT LINE - FASHION ACCESSORIES
SELECT product_line,
COUNT(product_line) AS Frequency
FROM SALES
GROUP BY product_line;

# WHAT IS THE TOTAL REVENUE BY MONTH - JANUARY ($116,292), FEBRUARY ($95,727) AND MARCH ($108,867)
SELECT Months_name,
SUM(total)
FROM SALES
GROUP BY Months_name;

# WHAT MONTH HAS THE LARGEST COGS (COST OF GOODS SOLD) - JANUARY ($110,754)
SELECT Months_name,
SUM(cogs)
FROM SALES
GROUP BY Months_name;

# WHAT PRODUCT LINE HAS THE LARGEST REVENUE - FOOD & BEVERAGES ($56,145)
SELECT product_line, sum(total)
FROM SALES
GROUP BY product_line
ORDER BY sum(total);

# WHICH IS THE CITY WITH THE LARGEST REVENUE - NAYPYITAW ( BRANCH C - $110,491)
SELECT * FROM SALES;
SELECT city, sum(total), branch
FROM SALES
GROUP BY city, branch;

# WHAT PRODUCT LINE HAS THE LARGEST VAT (VALUE ADDED TAX) - HOME & LIFESTYLE (16%)
select product_line, AVG(vat)
FROM SALES
GROUP BY product_line;

# WHICH BRANCH SOLD THE MOST PRODUCTS - BRANCH A FROM CITY YANGON (1849)
SELECT branch, SUM(quantity), city
FROM SALES
GROUP BY branch, city;

# WHAT IS THE MOST COMMON PRODUCT LINE BY GENDER - 
# ITS FASHION ACCESSORIES FOR FEMALES AND HEALTH & BEAUTY FOR MALES
SELECT gender, product_line, COUNT(gender)
FROM SALES
GROUP BY gender, product_line
ORDER BY count(gender) desc;

# WHAT IS THE AVERAGE RATING FOR EACH PRODUCT LINE - 
# HOME & LIFESTYLE - 6.84, SPORTS & TRAVEL - 6.86, ELECTRONIC ACCESSORIES - 6.90
# HEALTH & BEAUTY - 6.98, FASHION ACCESSORIES - 7.03 AND FOOD & BEVERAGES - 7.11
SELECT AVG(rating), product_line
FROM SALES
GROUP BY product_line
ORDER BY avg(rating);

# WHICH OF THE CUSTOMER TYPE BRINGS THE MOST REVENUE - MEMBERS ($163,625)
SELECT customer_type, SUM(total) AS Totyal_Revenue
FROM SALES
GROUP BY customer_type;

# WHICH CITY HAS THE LARGEST TAX (VAT) PERCENTAGE - NAYPYITAW (16%)
SELECT city, avg(vat)
FROM SALES
GROUP BY city;

# WHICH CUSTOMER TYPE PAYS THE MOST TAX / VAT - MEMBERS (15.61%)
SELECT customer_type, avg(vat) 
FROM SALES
GROUP BY customer_type;

# HOW MANY UNIQUE CUSTOMER TYPES DOES THE DATA HAVE - 2 (NORMAL AND MEMBER)
SELECT distinct(customer_type)
FROM SALES;

# HOW MANY UNIQUE PAYMENT METHODS DOES THE DATA HAVE - 3 ( CREDIT CARD, EWALLET AND CASH)
SELECT distinct(payment_method)
FROM SALES;

# WHAT IS THE MOST COMMON CUSTOMER TYPE - MEMBER (499)
SELECT COUNT(customer_type), customer_type
FROM SALES
GROUP BY customer_type;

# WHAT IS THE GENDER OF MOST OF THE CUSTOMERS - MALES (498)
SELECT COUNT(gender), gender
FROM SALES
GROUP BY gender;

# WHAT IS THE GENDER DISTRIBUTION PER BRANCH - 
# A HAS 160 FEMALES AND 179 MALES, B HAS 160 FEMALES AND 169 MALES AND C HAS 177 FEMALES AND 150 MALES
SELECT COUNT(gender), branch, gender
FROM SALES
GROUP BY branch, gender
ORDER BY branch asc;

# WHICH TIME OF THE DAY DO CUSTOMERS GIVE THE MOST RATINGS PER BRANCH - 
# AFTERNOON FOR BRANCH A, MORNING FOR BRANCH B AND EVENING FOR BRANCH C
SELECT avg(rating), time_of_day, branch
FROM SALES
GROUP BY time_of_day, branch
ORDER BY avg(rating)desc;

# WHICH DAY OF THE WEEK HAS BEST AVERAGE RATING - MONDAY (7.1)
SELECT day_name,AVG(rating)
FROM SALES
GROUP BY day_name
ORDER BY avg(rating);

# WHICH DAY OF THE WEEK HAS THE BEST AVERAGE RATING PER BRANCH - A(FRIDAY - 7.31), B(MONDAY - 7.27), C(SATURDAY - 7.23)
SELECT avg(rating), branch, day_name
FROM SALES
GROUP BY day_name, branch
ORDER BY avg(rating) desc;