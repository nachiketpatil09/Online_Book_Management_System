CREATE TABLE Authors (
    AuthorID INT PRIMARY KEY,
    AuthorName VARCHAR(100) NOT NULL,
    Country VARCHAR(50)
);

CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(100) NOT NULL
);


CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    BookName VARCHAR(200) NOT NULL,
    AuthorID INT NOT NULL,
    CategoryID INT NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    Stock INT NOT NULL,
    PublishYear INT NOT NULL,
    CONSTRAINT fk_author
        FOREIGN KEY (AuthorID)
        REFERENCES Authors(AuthorID),
    CONSTRAINT fk_category
        FOREIGN KEY (CategoryID)
        REFERENCES Categories(CategoryID)
);



CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL,
    City VARCHAR(50),
    Phone VARCHAR(15),
    Email VARCHAR(100) UNIQUE
);


CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT NOT NULL,
    OrderDate DATE NOT NULL,
    TotalAmount DECIMAL(10,2) NOT NULL,
    CONSTRAINT fk_customer
        FOREIGN KEY (CustomerID)
        REFERENCES Customers(CustomerID)
);


CREATE TABLE Order_Details (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT NOT NULL,
    BookID INT NOT NULL,
    Quantity INT NOT NULL,
    CONSTRAINT fk_order
        FOREIGN KEY (OrderID)
        REFERENCES Orders(OrderID),
    CONSTRAINT fk_book
        FOREIGN KEY (BookID)
        REFERENCES Books(BookID)
);


CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    OrderID INT NOT NULL,
    PaymentMethod VARCHAR(50) NOT NULL,
    PaymentStatus VARCHAR(20) NOT NULL,
    PaymentDate DATE,
    CONSTRAINT fk_payment_order
        FOREIGN KEY (OrderID)
        REFERENCES Orders(OrderID)
);




INSERT INTO Authors (AuthorID, AuthorName, Country) VALUES
(1, 'Chetan Bhagat', 'India'),
(2, 'J.K. Rowling', 'United Kingdom'),
(3, 'Paulo Coelho', 'Brazil'),
(4, 'Robin Sharma', 'Canada'),
(5, 'James Clear', 'USA'),
(6, 'Dan Brown', 'USA'),
(7, 'R.K. Narayan', 'India'),
(8, 'Sudha Murty', 'India'),
(9, 'Ruskin Bond', 'India'),
(10, 'George Orwell', 'United Kingdom');



select* from Authors;

INSERT INTO Categories (CategoryID, CategoryName) VALUES
(1, 'Fiction'),
(2, 'Science'),
(3, 'Technology'),
(4, 'History'),
(5, 'Self Help'),
(6, 'Biography'),
(7, 'Business'),
(8, 'Programming');

select* from Categories;



INSERT INTO Books (BookID, BookName, AuthorID, CategoryID, Price, Stock, PublishYear)
VALUES
(1, 'Half Girlfriend', 1, 1, 350.00, 15, 2014),
(2, 'Harry Potter and the Philosopher''s Stone', 2, 1, 799.00, 20, 1997),
(3, 'The Alchemist', 3, 5, 450.00, 12, 1988),
(4, 'The Monk Who Sold His Ferrari', 4, 5, 500.00, 8, 1997),
(5, 'Atomic Habits', 5, 5, 650.00, 25, 2018),
(6, 'The Da Vinci Code', 6, 1, 550.00, 10, 2003),
(7, 'Malgudi Days', 7, 1, 300.00, 18, 1943),
(8, 'Wise and Otherwise', 8, 6, 280.00, 14, 2002),
(9, 'The Blue Umbrella', 9, 1, 220.00, 30, 1980),
(10, 'Animal Farm', 10, 1, 400.00, 9, 1945);


INSERT INTO Books (BookID, BookName, AuthorID, CategoryID, Price, Stock, PublishYear)
VALUES
(11, 'The 5 AM Club', 4, 5, 599.00, 16, 2018),
(12, 'Think Like a Monk', 5, 5, 499.00, 22, 2020),
(13, 'Digital Fortress', 6, 3, 450.00, 13, 1998),
(14, 'The Guide', 7, 1, 350.00, 11, 1958),
(15, 'Grandma’s Bag of Stories', 8, 6, 320.00, 19, 2015),
(16, 'Roads to Mussoorie', 9, 6, 270.00, 10, 2003),
(17, 'Coming Home', 1, 1, 380.00, 15, 2018),
(18, 'Harry Potter and the Chamber of Secrets', 2, 1, 820.00, 18, 1998),
(19, 'Brida', 3, 5, 410.00, 14, 1990),
(20, 'Angels and Demons', 6, 1, 620.00, 12, 2000);


INSERT INTO Books (BookID, BookName, AuthorID, CategoryID, Price, Stock, PublishYear)
VALUES
(21, 'Ikigai', 5, 5, 550.00, 20, 2016),
(22, 'Inferno', 6, 1, 680.00, 15, 2013),
(23, 'The White Tiger', 1, 1, 420.00, 11, 2008),
(24, 'Harry Potter and the Prisoner of Azkaban', 2, 1, 850.00, 18, 1999),
(25, 'Eleven Minutes', 3, 5, 470.00, 14, 2003),
(26, 'Who Will Cry When You Die?', 4, 5, 390.00, 17, 1999),
(27, 'Origin', 6, 3, 720.00, 10, 2017),
(28, 'The Room on the Roof', 9, 6, 310.00, 13, 1956),
(29, 'Three Thousand Stitches', 8, 6, 340.00, 16, 2017),
(30, 'Animal Farm Special Edition', 10, 1, 450.00, 9, 2021);







select* from Books;

SELECT * FROM Books ORDER BY BookID;

select count(*) from Books;


INSERT INTO Customers (CustomerID, CustomerName, City, Phone, Email)
VALUES
(1, 'Amit Sharma', 'Pune', '9876543210', 'amit@gmail.com'),
(2, 'Priya Patil', 'Mumbai', '9876543211', 'priya@gmail.com'),
(3, 'Rahul Verma', 'Nagpur', '9876543212', 'rahul@gmail.com'),
(4, 'Sneha Joshi', 'Pune', '9876543213', 'sneha@gmail.com'),
(5, 'Rohan Kulkarni', 'Nashik', '9876543214', 'rohan@gmail.com'),
(6, 'Anjali Deshmukh', 'Aurangabad', '9876543215', 'anjali@gmail.com'),
(7, 'Vikas Singh', 'Delhi', '9876543216', 'vikas@gmail.com'),
(8, 'Neha Gupta', 'Jaipur', '9876543217', 'neha@gmail.com'),
(9, 'Karan Mehta', 'Surat', '9876543218', 'karan@gmail.com'),
(10, 'Pooja Nair', 'Kochi', '9876543219', 'pooja@gmail.com'),
(11, 'Arjun Reddy', 'Hyderabad', '9876543220', 'arjun@gmail.com'),
(12, 'Meera Iyer', 'Chennai', '9876543221', 'meera@gmail.com'),
(13, 'Sahil Khan', 'Bhopal', '9876543222', 'sahil@gmail.com'),
(14, 'Komal Shah', 'Ahmedabad', '9876543223', 'komal@gmail.com'),
(15, 'Nitin Pawar', 'Kolhapur', '9876543224', 'nitin@gmail.com'),
(16, 'Ayesha Sheikh', 'Pune', '9876543225', 'ayesha@gmail.com'),
(17, 'Deepak Yadav', 'Lucknow', '9876543226', 'deepak@gmail.com'),
(18, 'Ritika Roy', 'Kolkata', '9876543227', 'ritika@gmail.com'),
(19, 'Manoj Kumar', 'Patna', '9876543228', 'manoj@gmail.com'),
(20, 'Sonia Fernandes', 'Goa', '9876543229', 'sonia@gmail.com');



select count(*) from Customers;

INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES
(1, 1, '2026-01-05', 1150.00),
(2, 2, '2026-01-10', 799.00),
(3, 3, '2026-01-15', 950.00),
(4, 4, '2026-02-02', 500.00),
(5, 5, '2026-02-08', 650.00),
(6, 6, '2026-02-15', 550.00),
(7, 7, '2026-03-01', 300.00),
(8, 8, '2026-03-05', 280.00),
(9, 9, '2026-03-10', 220.00),
(10, 10, '2026-03-15', 600.00);

INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES
(11, 11, '2026-04-01', 599.00),
(12, 12, '2026-04-05', 499.00),
(13, 13, '2026-04-10', 450.00),
(14, 14, '2026-04-15', 350.00),
(15, 15, '2026-05-01', 320.00),
(16, 16, '2026-05-05', 270.00),
(17, 17, '2026-05-10', 380.00),
(18, 18, '2026-05-15', 820.00),
(19, 19, '2026-06-01', 410.00),
(20, 20, '2026-06-05', 620.00);


INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES
(21, 1, '2026-06-10', 550.00),
(22, 2, '2026-06-15', 680.00),
(23, 3, '2026-07-01', 420.00),
(24, 4, '2026-07-05', 850.00),
(25, 5, '2026-07-10', 470.00),
(26, 6, '2026-07-15', 390.00),
(27, 7, '2026-08-01', 720.00),
(28, 8, '2026-08-05', 310.00),
(29, 9, '2026-08-10', 340.00),
(30, 10, '2026-08-15', 450.00);


INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES
(31, 11, '2026-09-01', 500.00),
(32, 12, '2026-09-05', 650.00),
(33, 13, '2026-09-10', 550.00),
(34, 14, '2026-09-15', 300.00),
(35, 15, '2026-10-01', 799.00),
(36, 16, '2026-10-05', 450.00),
(37, 17, '2026-10-10', 600.00),
(38, 18, '2026-10-15', 350.00),
(39, 19, '2026-11-01', 520.00),
(40, 20, '2026-11-05', 900.00);

select count(*) from Orders;


INSERT INTO Order_Details (OrderDetailID, OrderID, BookID, Quantity)
VALUES
(1,1,1,2),
(2,2,2,1),
(3,3,3,2),
(4,4,4,1),
(5,5,5,1),
(6,6,6,1),
(7,7,7,2),
(8,8,8,1),
(9,9,9,3),
(10,10,10,1),
(11,11,11,2),
(12,12,12,1),
(13,13,13,2),
(14,14,14,1),
(15,15,15,3),
(16,16,16,2),
(17,17,17,1),
(18,18,18,2),
(19,19,19,1),
(20,20,20,2);


INSERT INTO Order_Details (OrderDetailID, OrderID, BookID, Quantity)
VALUES
(21,21,21,1),
(22,22,22,2),
(23,23,23,1),
(24,24,24,2),
(25,25,25,1),
(26,26,26,3),
(27,27,27,1),
(28,28,28,2),
(29,29,29,1),
(30,30,30,2),
(31,31,1,1),
(32,32,2,2),
(33,33,3,1),
(34,34,4,2),
(35,35,5,1),
(36,36,6,2),
(37,37,7,1),
(38,38,8,3),
(39,39,9,2),
(40,40,10,1);


INSERT INTO Order_Details (OrderDetailID, OrderID, BookID, Quantity)
VALUES
(41,1,11,1),
(42,2,12,2),
(43,3,13,1),
(44,4,14,2),
(45,5,15,1),
(46,6,16,2),
(47,7,17,1),
(48,8,18,1),
(49,9,19,2),
(50,10,20,1),
(51,11,21,2),
(52,12,22,1),
(53,13,23,2),
(54,14,24,1),
(55,15,25,2),
(56,16,26,1),
(57,17,27,2),
(58,18,28,1),
(59,19,29,2),
(60,20,30,1);


select count(*) from Order_Details;

INSERT INTO Payments (PaymentID, OrderID, PaymentMethod, PaymentStatus, PaymentDate)
VALUES
(1,1,'UPI','Paid','2026-01-05'),
(2,2,'Card','Paid','2026-01-10'),
(3,3,'Cash','Paid','2026-01-15'),
(4,4,'UPI','Pending','2026-02-02'),
(5,5,'Card','Paid','2026-02-08'),
(6,6,'Net Banking','Paid','2026-02-15'),
(7,7,'UPI','Paid','2026-03-01'),
(8,8,'Cash','Pending','2026-03-05'),
(9,9,'Card','Paid','2026-03-10'),
(10,10,'UPI','Paid','2026-03-15'),
(11,11,'Cash','Paid','2026-04-01'),
(12,12,'Card','Pending','2026-04-05'),
(13,13,'UPI','Paid','2026-04-10'),
(14,14,'Net Banking','Paid','2026-04-15'),
(15,15,'Cash','Paid','2026-05-01'),
(16,16,'Card','Paid','2026-05-05'),
(17,17,'UPI','Pending','2026-05-10'),
(18,18,'Cash','Paid','2026-05-15'),
(19,19,'Card','Paid','2026-06-01'),
(20,20,'UPI','Paid','2026-06-05');

INSERT INTO Payments (PaymentID, OrderID, PaymentMethod, PaymentStatus, PaymentDate)
VALUES
(21,21,'Card','Paid','2026-06-10'),
(22,22,'UPI','Paid','2026-06-15'),
(23,23,'Cash','Pending','2026-07-01'),
(24,24,'Net Banking','Paid','2026-07-05'),
(25,25,'Card','Paid','2026-07-10'),
(26,26,'UPI','Paid','2026-07-15'),
(27,27,'Cash','Paid','2026-08-01'),
(28,28,'Card','Pending','2026-08-05'),
(29,29,'UPI','Paid','2026-08-10'),
(30,30,'Cash','Paid','2026-08-15'),
(31,31,'Net Banking','Paid','2026-09-01'),
(32,32,'UPI','Paid','2026-09-05'),
(33,33,'Card','Pending','2026-09-10'),
(34,34,'Cash','Paid','2026-09-15'),
(35,35,'UPI','Paid','2026-10-01'),
(36,36,'Card','Paid','2026-10-05'),
(37,37,'Cash','Pending','2026-10-10'),
(38,38,'UPI','Paid','2026-10-15'),
(39,39,'Card','Paid','2026-11-01'),
(40,40,'Net Banking','Paid','2026-11-05');


select count(*) from Payments;

--Display all Books in database table
select* from Books;

--Display Books whose price is greater than 500
select * from Books
where price>500;

--customer from pune
select*from Customers
where city='Pune'


--price sorted by desc
select* from Books
order by price desc;


--top 5 most expensive book
select* from Books
order by price desc
limit 5;


--display book published after 2020
select*from Books
where PublishYear>2020;

--Display book with stock is less than 10
select*from Books
where Stock<10;


--display customer name start with A
select*from Customers
where CustomerName like 'A%'


--count total number of books
select count(*) as TotalBooks
from Books;


--find avg price of all books

select avg(price)as AveragePrice
from Books;

--Highest and Lowest Priced Book

select 
max(Price)As HighestPrice,
min(Price)As LowestPrice
from Books;

--Total Stock avilable in the BookStore

select sum(Stock)As TotalStock
from Books;

--count the numbers of book in each category

select CategoryID,count(BookID)as
TotalBooks
From Books
Group By CategoryID;

--count the number of orders placed by each customer

select CustomerID,count(OrderID)as
TotalOrders
From Orders group by CustomerID;

--Display book with Author name

select b.BookName,a.AuthorName
from Books b
inner join Authors a
on b.AuthorID=a.AuthorID;

SELECT
    b.BookName,
    c.CategoryName
FROM Books b
INNER JOIN Categories c
ON b.CategoryID = c.CategoryID;


--display customer name with order date

SELECT
    c.CustomerName,
    o.OrderDate
FROM Customers c
INNER JOIN Orders o
ON c.CustomerID = o.CustomerID;


--customer name with payment status

SELECT
    c.CustomerName,
    p.PaymentStatus
FROM Customers c
INNER JOIN Orders o
ON c.CustomerID = o.CustomerID
INNER JOIN Payments p
ON o.OrderID = p.OrderID;


--display book name,quantity,and customer name for rach order

SELECT
    b.BookName,
    od.Quantity,
    c.CustomerName
FROM Order_Details od
INNER JOIN Books b
ON od.BookID = b.BookID
INNER JOIN Orders o
ON od.OrderID = o.OrderID
INNER JOIN Customers c
ON o.CustomerID = c.CustomerID;


--display order id total amount and payment method

SELECT
    o.OrderID,
    o.TotalAmount,
    p.PaymentMethod
FROM Orders o
INNER JOIN Payments p
ON o.OrderID = p.OrderID;


--display book that never been orderd

SELECT b.BookName
FROM Books b
LEFT JOIN Order_Details od
ON b.BookID = od.BookID
WHERE od.BookID IS NULL;

--top customer who spent much money on books

SELECT
    c.CustomerName,
    SUM(o.TotalAmount) AS TotalSpent
FROM Customers c
INNER JOIN Orders o
ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerName
ORDER BY TotalSpent DESC
LIMIT 5;


--best selling book 

SELECT
    b.BookName,
    SUM(od.Quantity) AS TotalSold
FROM Books b
INNER JOIN Order_Details od
ON b.BookID = od.BookID
GROUP BY b.BookName
ORDER BY TotalSold DESC
LIMIT 1;



--book that currently out of stock

SELECT *
FROM Books
WHERE Stock = 0;

--display monthly sale

SELECT
    EXTRACT(MONTH FROM OrderDate) AS Month,
    SUM(TotalAmount) AS MonthlySales
FROM Orders
GROUP BY EXTRACT(MONTH FROM OrderDate)
ORDER BY Month;

--total sales by category

SELECT
    c.CategoryName,
    SUM(b.Price * od.Quantity) AS TotalSales
FROM Categories c
INNER JOIN Books b
ON c.CategoryID = b.CategoryID
INNER JOIN Order_Details od
ON b.BookID = od.BookID
GROUP BY c.CategoryName;

--pending payments

SELECT *
FROM Payments
WHERE PaymentStatus = 'Pending';



--customer who placed the latest order

SELECT
    c.CustomerName,
    o.OrderDate
FROM Customers c
JOIN Orders o
ON c.CustomerID = o.CustomerID
ORDER BY o.OrderDate DESC
LIMIT 1;


--create a view to display complete order detail


CREATE VIEW OrderDetailsView AS
SELECT
    o.OrderID,
    c.CustomerName,
    b.BookName,
    od.Quantity,
    o.TotalAmount,
    p.PaymentStatus
FROM Orders o
JOIN Customers c
ON o.CustomerID = c.CustomerID
JOIN Order_Details od
ON o.OrderID = od.OrderID
JOIN Books b
ON od.BookID = b.BookID
JOIN Payments p
ON o.OrderID = p.OrderID;


SELECT * FROM OrderDetailsView;

--create a stored procedure to display all paid orders

CREATE OR REPLACE PROCEDURE GetPaidOrders()
LANGUAGE SQL
AS $$
SELECT *
FROM Payments
WHERE PaymentStatus = 'Paid';
$$;

call GetPaidOrders()

--create a trigger function 

CREATE OR REPLACE FUNCTION update_book_stock()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE Books
    SET Stock = Stock - NEW.Quantity
    WHERE BookID = NEW.BookID;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

--create a trigger 

CREATE TRIGGER trg_update_stock
AFTER INSERT ON Order_Details
FOR EACH ROW
EXECUTE FUNCTION update_book_stock();

--create an index on the bookname column

CREATE INDEX idx_bookname
ON Books(BookName);

