create database task_5;
use task_5;
create table Customers(
CustomerID int primary key,
CustomerName varchar(50),
Country varchar(50)
);
insert into Customers(CustomerID,CustomerName,Country)values(1, 'John Doe','USA'),
(2, 'Jane Smith','Canada'),
(3, 'Mike Johnson','UK'),
(4, 'Emily Davis ','USA');
select * from Customers;
create table Orders(
OrderId int primary key,
CustomerID Int,
Product varchar(50),
OrderDate Date,
foreign key (CustomerID) References Customers(CustomerID)
);

insert into Orders(OrderId,CustomerID,Product,OrderDate) values(101,1,'Laptop','2024-07-01'),
(102,2,'Smartphone','2024-07-01'),
(103,3,'Headphones','2024-07-10'),
(104,4,'Tablet','2024-07-15');

-- inner join 
select Customers.CustomerID,Customers.CustomerName,Orders.Product,Orders.OrderDate
from Customers inner join Orders
on Customers.CustomerID = Orders.CustomerID;

-- right join
select Customers.CustomerID, Customers.CustomerName,Orders.Product,Orders.OrderDate
from Customers
Right Join Orders on Customers.CustomerId = Orders.CustomerID;

-- left join
select Customers.CustomerID, Customers.CustomerName,Orders.Product,Orders.OrderDate
from Customers
left join Orders 
on Customers.CustomerID = Orders.CustomerID;

-- full join 
select Customers.CustomerID , Customers.CustomerName, Orders.Product , Orders.OrderDate from Customers
Left join Orders
on Customers.CustomerID = Orders.CustomerID
Union select Customers.CustomerID,CustomerName,Orders.Product,Orders.OrderDate
from Customers
right join Orders
on Customers.CustomerID = Orders.CustomerID;