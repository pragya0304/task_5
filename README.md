Task 5: SQL Joins (Inner, Left, Right, Full)
## Objective
Learn to combine data from multiple tables using SQL join types to merge records efficiently.

# Tools Used
MySQL 8.0 (Community Server) 
MySQL Workbench 

# Description
In this task, we created two related tables — Customers and Orders — and used different join operations to retrieve combined data.
We practiced:

INNER JOIN → Returns only matching rows from both tables.

LEFT JOIN → Returns all rows from the left table with matched rows from the right table.

RIGHT JOIN → Returns all rows from the right table with matched rows from the left table.

FULL JOIN → Returns all rows from both tables, matched or unmatched.

Tables Created
1. Customers Table
CustomerID	CustomerName	Country
  1            John Doe	    USA
  2	           Jane Smith 	Canada
  3          Mike Johnson	  UK
  4	         Emily Davis	 Australia

2. Orders Table
OrderID	CustomerID	Product	  OrderDate
101	       1	      Laptop	  2024-07-01
102        2	    Smartphone	2024-07-05
103	       1	     Headphones	2024-07-10
104	       5	     Tablet    	2024-07-15

SQL Queries
-- Create Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    Country VARCHAR(50)
);

-- Create Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    Product VARCHAR(50),
    OrderDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Insert into Customers
INSERT INTO Customers (CustomerID, CustomerName, Country) VALUES
(1, 'John Doe', 'USA'),
(2, 'Jane Smith', 'Canada'),
(3, 'Mike Johnson', 'UK'),
(4, 'Emily Davis', 'Australia');

-- Insert into Orders
INSERT INTO Orders (OrderID, CustomerID, Product, OrderDate) VALUES
(101, 1, 'Laptop', '2024-07-01'),
(102, 2, 'Smartphone', '2024-07-05'),
(103, 1, 'Headphones', '2024-07-10'),
(104, 5, 'Tablet', '2024-07-15');

-- INNER JOIN
SELECT Customers.CustomerID, Customers.CustomerName, Orders.Product, Orders.OrderDate
FROM Customers
INNER JOIN Orders
ON Customers.CustomerID = Orders.CustomerID;

-- LEFT JOIN
SELECT Customers.CustomerID, Customers.CustomerName, Orders.Product, Orders.OrderDate
FROM Customers
LEFT JOIN Orders
ON Customers.CustomerID = Orders.CustomerID;

-- RIGHT JOIN 
SELECT Customers.CustomerID, Customers.CustomerName, Orders.Product, Orders.OrderDate
FROM Customers
RIGHT JOIN Orders
ON Customers.CustomerID = Orders.CustomerID;

-- FULL JOIN 
SELECT Customers.CustomerID, Customers.CustomerName, Orders.Product, Orders.OrderDate
FROM Customers
LEFT JOIN Orders
ON Customers.CustomerID = Orders.CustomerID
UNION
SELECT Customers.CustomerID, Customers.CustomerName, Orders.Product, Orders.OrderDate
FROM Customers
RIGHT JOIN Orders
ON Customers.CustomerID = Orders.CustomerID;
## Output Example
INNER JOIN Result: (Matching customers with orders)

CustomerID	CustomerName	Product	OrderDate
1	John Doe	Laptop	2024-07-01
2	Jane Smith	Smartphone	2024-07-05
1	John Doe	Headphones	2024-07-10

## Outcome
Learned to merge data from multiple tables using all join types.
Understood the differences between INNER, LEFT, RIGHT, and FULL joins.
Practiced handling unmatched records in queries.
