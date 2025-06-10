-- You can open a query tab using CTRL + T from your keyboard
-- activate schema
use NorthWind;

-- SQL Keywords are not case sensivite 
-- SELECT is same as select
-- Every SQL query must start with select
select column1, column2
FROM table1;

-- if you want to return all rows and columns
select * 
from table1;

-- ; also indicate the end of the query

-- Customers table
SELECT * FROM Customers;

-- The following SQL statement selects "CustomerName" "City" and "Country" columns from the customer table
select customername, city, country
from customers;

-- Product information
select ProductID, ProductName
from Products;

-- SQl query to return emplyee firstname, lastname and birthdate
select firstname, lastname, birthdate
from employees;

-- SQL query to find customername address city
select customername, address, city
from customers;

-- countries in the customers table
select country
from customers;

-- different countries
SELECT DISTINCT Country 
FROM Customers;

 -- number of countries
 select count(distinct country)
 from customers;
-- count function will count the number of rows in the results set

-- SQL query to return different cities from suppliers table
select distinct city
from suppliers;

-- SQL query to return number of cities from customers table
select count(distinct city)
from customers;

-- WHERE clause
select *
from customers
where country = 'Mexico';

-- values from the table must be in either '' or ""
select *
from customers
where country = "Mexico";

select *
from products
where productid = 1;

-- SQL query to return customers from London
select *
from customers
where city = 'London';

-- SQL query to return amount of customers from USA
SELECT count(*)
FROM Customers
WHERE Country = 'USA';

select * from customers
where customerid = 1;

-- products with price higher than 100
select * from products
where price > 100;

-- SQL query to return Customers with their customerid is equal to and greater than 15.
select *
from customers
where customerid > 15;

-- SQL query to return order details where order quantity is less than 3.
select *
from order_details
where quantity < 3;

-- SQL query to find details of employees who were born after 1960-01-01.
select *
from employees
where birthdate > '1960-01-01';

-- AND, OR and NOT Operators
select *
from customers
where country = 'germany'
and city = 'berlin';
-- and operators requires both conditions to be met.

select *
from suppliers
where country = 'Japan'
and city = 'tokyo';

-- SQL query to find customer from UK and London.
select *
from customers
where country = 'UK'
and city = 'london';

-- SQL query to find customer from UK and US.
select *
from customers
where country = 'US' 
and country = 'UK';
-- SQL query to find customer from UK -or- US.

-- SQL query to find products with price is less than 5 and productid more than 10.

select *
from products
where price < 5
and productid > 10;

select *
from customers
where city = 'berlin'
or city = 'stuttgart';
-- or operators returns reuslt if either of the conditions are true.

select *
from customers
where country = 'germany'
or country = 'spain';

-- SQL query to find customers from Portland or Kirkland.
select *
from customers
where city = 'portland'
or city = ' kirkland';

-- SQL query to find orders before 1996-08-27 or after 1997-02-21.
select *
from orders
where orderdate < '1996-08-27'
or orderdate > '1997-02-21';

-- Order by (sorting results)
select *
from customers
order by country;

-- SQL query to return product names and order by Price. Ascending.
SELECT ProductName, Price 
FROM PRODUCTS
order by Price asc;

--  SQL query to return product names and order by Price. Descending.
SELECT ProductName, Price 
FROM PRODUCTS
order by Price desc;

-- order of writing column name is important. What is written first will be recalled first
select *
from customers
order by country, customername;
-- will recall country first.

select *
from customers
order by customername, country;
-- will recall customername first

-- SQL query to sort employess by lastname and birthdate in decreasing order.
select *
from employees
order by lastname desc, birthdate desc;

-- SQL query to retrieve all columns from the Customers table for customers located in the USA and sort them by CustomerName in ascending order.
select *
from customers
where country = 'usa'
order by customername;

-- Limit Clause
select *
from customers
limit 3;

-- top 5 cheapest products
select *
from products
order by price
limit 5;

select *
from customers
where country = 'germany'
limit 3;

select *
from products
where categoryid=1
limit 3;
-- limit will always work at the last step.

-- SQL query to get the top 10 products from the Products table with a Price greater than 20, limiting the result to 10 rows.
select *
from products
where price > 20
limit 10;

-- SQL query to find the first 3 customer in the Customers table who live in 'London'.
select *
from customers
where city = 'london'
limit 3;

-- min max avg sum and count functions
-- min price
select min(price)
as smallestprice
from products;

-- highest price
select max(price)
as largestprice
from products;
-- as will give your search an name.

select min(orderdate)
from orders;

select min(productname)
from products;

select max(productname)
from products;

-- number of products in products table
select count(productid)
from products;

-- average product price
select avg(price)
from products;

select round(avg(price),2)
from products;

select sum(quantity)
from order_details;

-- How to approach writing queries, write an SQL query to return the productname, price and product category of bikes, ordered, by price in descending order and limited to 5 rows
select productname, price, productcategory
from products
Where productcategory = 'bikes'
order by price desc
limit 5;
-- This wont run as its an example syntax.

-- like operator
-- returns names with first letter A
select customername
from customers
where customername 
like 'a%';

-- or

select *
from customers
where customername
like 'a%';

-- returns names with final letter A

select *
from customers
where customername
like '%a';

-- names starting with MA
select *
from customers
where customername
like 'ma%';

-- names with OR inside
select *
from customers
where customername
like '%or%';

-- customer name including FOOD
select *
from customers
where customername
like '%food%';

-- will return R in second position
select *
from customers
where customername
like '_r%';

-- name at least 3 characters but starts with alter
select *
from customers
where customername
like 'a__%';

-- name at least 3 characters starts with A 3rd letter is O
select *
from customers
where contactname
like 'a%o';

-- find cities with at least 4 characters
SELECT * 
FROM Customers 
WHERE Country 
LIKE '____%';

-- SQL query to find customers whose CustomerName does not start with 'a'.

select *
from customers
where customername
not like 'a%';

-- SQL query to find all suppliers from countries that contain the substring 'land' (e.g., 'Finland', 'Poland') in the Country field.
select *
from suppliers
where country
like '%land%';

-- SQL query to find all employees whose FirstName contains the letter 'n ' as the second character.
select *
from employees
where firstname
like '_n%';

-- SQL query to find all shippers whose ShipperName contains the word 'Express'.
select *
from shippers
where shippername
like '%express%';

-- employee firstname including m and lastname including with a.
select firstname, lastname
from employees
where firstname 
like '%m%'
and lastname
like '%a%';

-- in operator
select *
from customers
where country
in ('germany', 'france', 'uk');

-- or

select *
from customers
where country = 'germany' 
or country = 'france' 
or country = 'uk';

-- not operator 
select *
from customers
where country
not in ('germany', 'france', 'uk');

-- subqueries customers who are in the same country as suppliers
select *
from customers
where country
in (select country from suppliers);

-- find out the name of the products the same as product category
select *
from products
where productname in (select categoryname from categories);
-- use the subquery to get category name to pop up, but it doesnt match with product category.

-- SQL query to find all customers from either Berlin, 'Paris', or 'Madrid' in the Customers table.
select *
from customers
where country
in ('paris', 'berlin', 'madrid');

-- SQL query to find all orders that were shipped by ShipperID 1 or 3 from the Orders table.
select * 
from Orders 
where ShipperID 
in (1,3);
 

-- SQL query to find all products that have UnitPrice is 10, 20, or 30.
SELECT * 
FROM Products 
WHERE Price 
IN (10, 20, 30);

-- SQL query to find all customers who have placed an order. Use a subquery on the Orders table to match the customers. 
select * 
from customers 
where customerid 
in (select customerID from orders);
 
-- between operator
select *
from products
where price
between 10 
and 20;

-- not between
select *
from products
where price
not between 10 
and 20;

-- between products
select *
from products
where productname
between 'konbu'
and 'tofu';


-- select products from price and category range between 10 and 20
select *
from products
where price
between 10 
and 20
and categoryid 
not in (1,2,3);

select *
from products
where productname
between 'carnarvon tigers' 
and 'mozzarella di giovanni'
order by productname;


SELECT * 
FROM Orders
WHERE OrderDate 
BETWEEN '1996-07-01' 
AND '1996-07-31';
 
-- aliasing
select customerid
as id, customername
as customer
from customers;

select customername 
as customer, contactname
as 'contact person'
from customers;

select o.orderid, o.orderdate, c.customername
from customers
as c, orders
as o
where c.customername='around the horn';











-- Retrieve all columns from the "Customers" table.
SELECT * 
FROM Customers;

-- Retrieve only the "CustomerName" and "City" columns from the "Customers" table.
select customername, city 
from customers;

-- Retrieve distinct values of the "City" column from the "Customers" table.
 select count(distinct city)  
 from customers;
 
 -- Retrieve all columns from the "Products" table where the "Price" is greater than 50.
 select * 
 from products 
 where price > 50;

-- Retrieve all columns from the "Customers" table where the "Country" is either 'USA' or 'UK'.
select *
from customers
where country = 'usa'
or country = 'uk';

-- Retrieve all columns from the "Orders" table, sorted by the "OrderDate" in descending order.
select * 
from orders 
order by orderdate desc;

-- Retrieve all columns from the "Products" table where the "Price" is between 20 and 50, ordered by descending "Price".
select * 
from products 
where price < 20 
or price > 50
order by price desc;

-- Retrieve all columns from the "Customers" table where the "Country" is 'USA' and "City" is either 'Portland' or 'Kirkland', ordered by ascending "CustomerName"
select *
from customers
where country = 'usa'
or city = 'kirkland'
order by customername asc;

-- Retrieve all columns from the "Customers" table where the "Country" is 'UK' or "City" is 'London', ordered by descending "CustomerName"
select *
from customers
where country = 'uk'
or city = 'london'
order by customername desc;

-- Retrieve all columns from the "Products" table where the "CategoryID" is 1 or 2, ordered by ascending "ProductName"
select *
from products
where categoryid
in (1,2) 
order by productname asc;

-- Find the total number of orders in the Orders table.
SELECT count(quantity)
FROM order_details;

-- Count the number of customers who have placed orders
SELECT COUNT(DISTINCT CustomerID) AS CustomerCount
FROM Orders;

-- Retrieve all orders where the order date is in July 1996.
select *
from orders
where orderdate >= '1996-07-01'
and orderdate < '1996-08-01';


-- Retrieve products with unit prices between 100 and 200.
select * 
from products 
where unit
between '100'
and '200';

-- Retrieve all columns from the Orders table for orders made by customers whose name starts with "A".
Select * 
From orders 
Where customerid in (select customerid from customers where customername like 'a%');

 
-- Calculate the average unit price of products.
select avg(unit)
from products
where price;

-- Retrieve customers whose company names contain 'Food' anywhere in the name.
select *
from customers
where customername
like '%food%';

-- Get all employees whose last name starts with "S" and first name ends with "L".
select firstname, lastname
from employees
where firstname 
like '%l'
and lastname
like '%s';

-- Find all orders made by customers with IDs 1, 3, and 5.
select *
from orders
where customerid
in (1, 3, 5);

-- Find all products whose name contains "chocolate".
select *
from products
where productname
like '%chocolate%';

-- Find the maximum unit price of products.
select max(price) 
from products;


-- Retrieve the top 5 most expensive products from the Products table.
select * 
from products 
order by price desc 
limit 5;

-- Find all products whose names start with 'Ch'.
select * 
from products 
where productname 
like ('ch%');




-- JOIN CLAUSES


ALTER TABLE orders
ADD FOREIGN KEY (CustomerID) REFERENCES customers(CustomerID);
 
ALTER TABLE orders
ADD FOREIGN KEY (EmployeeID) REFERENCES employees(EmployeeID);
 
ALTER TABLE orders
ADD FOREIGN KEY (ShipperID) REFERENCES shippers(ShipperID);
 
ALTER TABLE order_details
ADD FOREIGN KEY (OrderID) REFERENCES orders(OrderID);
 
ALTER TABLE order_details
ADD FOREIGN KEY (ProductID) REFERENCES products(ProductID);
 
ALTER TABLE products
ADD FOREIGN KEY (CategoryID) REFERENCES categories(CategoryID);
 
ALTER TABLE products
ADD FOREIGN KEY (SupplierID) REFERENCES suppliers(SupplierID);
 













