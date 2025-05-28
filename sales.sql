create database company;
use company;
select * from sales;

-- find the orders shipped as 'economy' mode with a total amount greate than 25000
select ship_mode,total_amount from sales
where ship_mode='Economy' and total_amount>25000;

-- Retrieve all sales data for 'Technology' category in ;Ireland' made after 2020-01-01
select * from sales
where country = 'Ireland' and Category = 'Technology' and Order_date > '2020-01-01';
-- list the top 10 most profitable sales transaction in descending order
select * from sales
order by unit_profit desc
limit 10; 

select * from sales
order by unit_profit desc
limit 10,20; -- help u to skip the 10 records and shows the next 20 records

-- find all customers whose name starts with 'j' end with 'n'
select Customer_Name from sales
where Customer_Name like 'J%n';

-- Retrive all products names that contains  'ACCO' anywhere in the name
select Order_ID,Product_Name from sales
where Product_Name like '%ACCO%';

-- get the top 5 cities with the highest total sales
select City, sum(Total_Amount) as Amount
from sales
group by City
order by Amount desc
limit 5;

-- display the second of 10 recors for customer_name and total_amount in decreasing order
select Customer_Name,Total_Amount from sales
order by Total_Amount desc
limit 10,20;

-- Find the total revenue,average unit cost, and total number of orders
select sum(Total_Amount) as 'Total_Revenue',
avg(Unit_Cost) as 'avg_unit_cost',
count(Order_Id) AS 'Total_orders'
from sales;

-- count unique number of regions
select count(distinct(Region))  as uniq_reg from sales;

-- find the number of oders placed by each customers
select Customer_Name , count(Order_Id) as Order_Count
from sales
group by Customer_Name
Order by Order_Count desc;

-- Rank 5 products based on total sales using Rank().alter
select Product_Name,sum(Total_Amount) as Total_Sales,
Rank() over (order by sum(Total_Amount) desc) as Sales_Rank
from sales
group by Product_Name
limit 5;
