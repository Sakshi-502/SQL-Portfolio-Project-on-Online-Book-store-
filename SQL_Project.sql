Select * from books;
Select * from Customers;
Select * from Orders;



-- Q.1 Retrieve all books in the "Fiction" genre.
Select * from books 
where genre='Fiction';    

-- Q.2 Find books published after year 1950
Select * from Books 
WHERE published_year>1950;

-- Q.3 List all customers from the Canada
SELECT * FROM CUSTOMERS 
WHERE country='Canada';

--Q.4 Show orders placed in November 2023
select * from orders
where order_date between '2023-11-01' and '2023-11-30';

-- Q.5 Retrieve the total stock of books available.
Select SUM(stock) AS TotaL_Stock
from books;

--Q.6 Find the details of the most expensive book.
Select * from Books 
Order BY Price DESC 
Limit 1;

-- 	Q.7 Show all customers who ordered more than 1 quantity of a book
Select * from orders
where quantity>1;

-- Q.8 Retrieve all orders where the total amount exceeds $20
Select * from orders
where Total_amount>20;

-- Q.9 List all genres available in the Books table.
Select Distinct genre from Books;

--Q.10 Find the book with the lowest stock
Select * from Books 
Order By stock 
Limit 1;

-- Q.11 Calculate the total revenue generated from all orders
Select Sum(total_amount) as Revenue
from Orders;

Advanced Queries
-- 1)Retrieve the total number of books sold for each genre
SELECT * FROM Orders;
select * from books;

Select b.Genre,SUM(O.quantity) AS Total_Books_Sold
From Orders o
Join Books b ON o.book_id=b.book_id
GROUP BY b.Genre;

-- 2)Find the average price of books in the "Fantasy" genre
Select AVG(price) AS Average_Price
From books
Where Genre='Fantasy';

-- 3)List customers who have placed at least 2 orders

-- select * from orders inner join customers where orders.quantity>2 on orders.customer_id=orders.customer_id;
-- select * from orders where quantity>=2;

Select o.customer_id,c.name,Count(o.order_id) AS Order_Count
From orders o
JOIN Customers c on o.customer_id=c.customer_id
Group BY o.customer_id,c.name
Having Count(Order_Id)>=2;

-- 4)Find the most frequently ordered book

Select o.book_id,b.Title,Count(o.order_id) AS Order_Count
from orders o
Join Books b on o.book_id=b.book_id
Group by o.book_id,b.title 
Order by Order_Count DESC LIMIT 1;

-- 5) Show the top 3 most expensive books of 'Fantasy' Genre

Select * from Books 
Where genre='Fantasy'
ORDER BY price Desc Limit 3;

-- 6) Retrieve the total quantity of books sold by each author.

Select b.author,SUM(o.quantity) AS Total_books_Sold
From orders o
JOIN books b on o.book_id=b.book_id
Group By b.Author;

-- 7) List the cities where customers who spent over $30 are located

Select Distinct c.city,total_amount
From Orders o
Join customers c ON o.customer_id=c.customer_id
where o.total_amount>30;

-- 8)Find the customer who spent the most on orders

Select c.customer_id,c.name,SUM(o.total_amount) As Total_Spent
From orders o
Join customers c ON o.customer_id=c.customer_id
Group By c.customer_id,c.name
Order By Total_Spent Desc Limit 1;

-- 9)Calculate the stock remaining after fulfilling all orders

Select b.book_id,b.title,b.stock,
COALESCE(SUM(o.quantity),0) AS Order_Quantity,
b.stock - COALESCE(SUM(o.quantity),0) AS Remaining_Quantity
From books b
LEFT JOIN orders o 
on b.book_id = o.book_id
Group By book_id
Order By b.book_id;















