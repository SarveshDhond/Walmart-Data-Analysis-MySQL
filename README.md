# WALMART SALES, PRODUCT AND CUSTOMER DATA ANALYSIS

## OVERVIEW
This project analyzes Walmart sales and order data to generate actionable insights addressing key business questions related to sales performance, product trends, and customer behavior for the established retail leader.

## TECH STACK
- Querry language &rarr; SQL

## AREAS OF KEY INSIGHT
- Product Analysis
- Sales Analysis
- Customer Analysis

## DATA STRUCTURE AND INITIAL CHECKS

|  COLUMNS       |DATA TYPES|
|----------------|----------|
| Invoice_id     | VARCHAR  |
| branch         | VARCHAR  |
| city           | VARCHAR  |
| customer_type  | VARCHAR  |
| gender         | VARCHAR  |
| product_line   | VARCHAR  |
| unit_price     | DECIMAL  |
| quantity       | INTEGER  |
| vat            | DECIMAL  | 
| total          | DECIMAL  |
| date           | DATETIME |
| time           | TIME     |
| payment_method | VARCHAR  |
| cogs           | DECIMAL  |
| gross_margin   | DECIMAL  |
| gross_income   | DECIMAL  |
| rating         | DECIMAL  |
| Time_of_day    | VARCHAR  |
| Day_name       | VARCHAR  |
| Month_name     | VARCHAR  |
| Months_name    | VARCHAR  |

## BUSINESS QUESTIONS ANSWERED
Quesries for these questions can be found here &rarr; [SQL_queries](https://github.com/SarveshDhond/Walmart_Data_Analysis/blob/main/Walmart%20Sales%20Analysis.sql)

### Generic Question
1. How many unique cities does the data have?
2. In which city is each branch?

### Product based questions
1. How many unique product lines does the data have?
2. What is the most common payment method?
3. What is the most selling product line?
4. What is the total revenue by month?
5. What month had the largest COGS?
6. What product line had the largest revenue?
7. Which is the city with the largest revenue?
8. What product line had the largest VAT?
9. Which branch sold the most product?
10. What is the most common product line by gender?
11. What is the average rating of each product line?

### Sales questions
1. Which of the customer types brings the most revenue?
2. Which city has the largest tax percentage / VAT (Value Added Tax)?
3. Which customer type pays the most in VAT?

### Customer related questions
1. How many unique customer types does the data have?
2. How many unique payment methods does the data have?
3. What is the most common customer type?
4. What is the gender of most of the customers?
5. What is the gender distribution per branch?
6. Which time of the day do customers give the most ratings?
7. Which day of the week has the best average ratings?
8. Which day of the week has the best average ratings per branch?
