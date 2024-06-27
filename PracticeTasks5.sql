create database L4;
use L4;

--------EXERCISE 1

-- Create Client_Master table
CREATE TABLE Client_Master (
    client_no varchar(6) Not null primary key,
    name VARCHAR(20),
    address1 VARCHAR(30),
    address2 VARCHAR(30),
    city VARCHAR(15),
    state VARCHAR(15),
    pincode int,
    bal_due decimal(10,2)
);

-- Create Product_Master table
CREATE TABLE Product_Master (
    Product_no  varchar(6) not null primary key,
    Description VARCHAR(255),
	profit_percent int,
	unit_measure varchar(255),
    Qty_on_hand int,
    Reorder_lvl int,
    Sell_price decimal(15,2),
    Cost_price decimal(15,2),
);


-- Insert data into Client_Master table
INSERT INTO Client_Master (client_no, name, city, state, pincode, bal_due)
VALUES
('0001', 'Ivan', 'Bombay', 'Maharashtra', 400054, 15000),
('0002', 'Vandana', 'Madras', 'Tamilnadu', 780001, 0),
('0003', 'Pramada', 'Bombay', 'Maharashtra', 400057, 5000),
('0004', 'Basu', 'Bombay', 'Maharashtra', 0, 0),
('0005', 'Ravi', 'Delhi', 'Maharashtra', 0, 2000),
('0006', 'Rukmini', 'Bombay', 'Maharashtra', 0, 0);


-- Insert data into Product_Master table
INSERT INTO Product_Master (Product_no, Description,profit_percent,Qty_on_hand,Reorder_lvl, Sell_price, Cost_price)
VALUES
('P00001','1.44 floppies',5, 100, 20, 525, 500),
('P03453', 'Monitors',6, 10, 3, 12000, 11200),
('P06734', 'Mouse',5, 20, 5, 1050, 500),
('P07865', '1.22 floppies',5, 100, 20, 525, 500),
('P07868', 'Keyboards',2, 10, 3, 3150, 3050),
('P07885', 'CD Drive',2.5, 10, 3, 5250, 5100),
('P07965', '540 HDD',4, 10, 3, 8400, 8000),
('P07975', '1.44 Drive',5, 10, 3, 1050, 1000),
('P08865', '1.22 Drive',5, 2, 3, 1050, 1000);


-- i) Find out the names of all the clients.
SELECT name 
FROM Client_Master;

-- ii) Retrieve the list of names and cities of all the clients.
SELECT name, city 
FROM Client_Master;

-- iii) List the various products available from the Product_Master table.
SELECT Description 
FROM Product_Master;

-- iv) List all the clients who are located in Bombay.
SELECT name 
FROM Client_Master 
WHERE city = 'Bombay';

-- v) Display the information for client no 0001 and 0002.
SELECT * 
FROM Client_Master 
WHERE client_no IN ('0001', '0002');

-- vi) Find the products with descriptions as '1.44 Drive' and '1.22 Drive'.
SELECT * 
FROM Product_Master 
WHERE Description IN ('1.44 Drive', '1.22 Drive');

-- vii) Find all the products whose sell price is greater than 5000.
SELECT * 
FROM Product_Master 
WHERE Sell_price > 5000;

--viii) the list of employees who stay in bombay,delhi or madras
select *
from Client_Master
where city in ('Bombay','Delhi','Madras');

--ix)
select *
from Product_Master
where Sell_price > 2000 and Sell_price<=5000;

--x)
select name, city, state
from Client_Master
where state <> 'Maharashtra';


-----------EXERCISE 2
--i)
update Product_Master
set Sell_price = 1150.00
where Description = '1.44 floppies';

--ii)
delete from Client_Master
where client_no=0001;

--iii)
update Client_Master
set city = 'Bombay'
where client_no=0005;

--iv)
update Client_Master
set bal_due = 1000
where client_no=0001;

--v)
select (Sell_price)*15
from Product_Master
where Sell_price>1500;

--vi)
select *
from Client_Master
where city like '_a%';

--vii)
select name
from Client_Master
where name like '_a%';

--viii)
select *
from Product_Master
order by Description;

--ix)
select count(Reorder_lvl)
from Product_Master;

--x)
select avg(Sell_price)
from Product_Master;

--xi)
select min(Sell_price)
from Product_Master;

--xii)
select min(Sell_price) as 'min_price',max(Sell_price) as 'max_price'
from Product_Master;

--xiii)
select count(*)
from Product_Master
where Sell_price >= 1500;


--EXERCISE#3

-- i)
CREATE TABLE Sales_master
(
    Salesman_no VARCHAR(6) PRIMARY KEY CHECK ( Salesman_no LIKE 'S%' ),
    Sal_name    VARCHAR(20)  NOT NULL,
    Address     VARCHAR(100) NOT NULL,
    City        VARCHAR(20),
    State       VARCHAR(20),
    Pincode     int,
    Sal_amt     int     NOT NULL CHECK ( Sal_amt NOT LIKE 0),
    Tgt_to_get  int     NOT NULL CHECK ( Tgt_to_get NOT LIKE 0),
    Ytd_sales  int     NOT NULL CHECK ( Ytd_sales NOT LIKE 0),
    Remarks     VARCHAR(30)
);

-- ii 
CREATE TABLE Sales_order
(
    S_order_no   VARCHAR(6) PRIMARY KEY CHECK ( S_order_no LIKE '0%' ),
    S_order_date DATE,
    Client_no    VARCHAR(25),
    Dely_add     VARCHAR(6) DEFAULT 'f',
    Salesman_no  VARCHAR(6),
    Dely_type    CHAR(1),
    Billed_yn    CHAR(1),
    Dely_date    DATE,
    Order_status VARCHAR(10) CHECK ( Order_status LIKE 'Ip' OR Order_status LIKE 'F' OR Order_status LIKE 'Bo' OR
                                      Order_status LIKE 'C'),
    CHECK ( Dely_date > S_order_date )
);

-- iii 
-- ALTER TABLE PRODUCT_MASTER
--     ADD PRIMARY KEY (PRODUCT_NO);
CREATE TABLE Sales_order_details
(
    S_order_no   VARCHAR(6),
    Product_no   VARCHAR(6),
    Qty_order    int,
    Qty_disp     int,
    Product_rate int,
    FOREIGN KEY (S_order_no) REFERENCES Sales_order (S_order_no),
    PRIMARY KEY (S_order_no, Product_no)
);
SELECT *
FROM SALES_MASTER;

select * from SALES_ORDER;

-- Inserting data to Sales_Master
INSERT INTO SALES_MASTER
VALUES ('S00001', 'Kiran', 'A/14 worli', 'Bombay', 'Mah', 400002, 3000, 100, 50, 'Good');

INSERT INTO SALES_MASTER
VALUES ('S00002', 'Manish', '65,nariman', 'Bombay', 'Mah', 400001, 3000, 200, 100, 'Good');

INSERT INTO SALES_MASTER
VALUES ('S00003', 'Ravi', 'P-7 Bandra', 'Bombay', 'Mah', 400032, 3000, 200, 100, 'Good');

INSERT INTO SALES_MASTER
VALUES ('S00004', 'Ashish', 'A/5 Juhu', 'Bombay', 'Mah', 400044, 3500, 200, 150, 'Good');

select *
from Sales_master;

-- Inserting data Sales_order table
INSERT INTO Sales_order(S_order_no, S_order_date, Client_no, Dely_type, Billed_yn, Salesman_no, Dely_date,
                        Order_status)
VALUES ('019001', '12-jan-96', '0001', 'F', 'N', 'S00001', '20-jan-96', 'Ip');

INSERT INTO Sales_order(S_order_no, S_order_date, Client_no, Dely_type, Billed_yn, Salesman_no, Dely_date,
                        Order_status)
VALUES ('019002', '25-jan-96', '0002', 'P', 'N', 'S00002', '27-jan-96', 'C');

INSERT INTO Sales_order(S_order_no, S_order_date, Client_no, Dely_type, Billed_yn, Salesman_no, Dely_date,
                        Order_status)
VALUES ('016865', '18-feb-96', '0003', 'F', 'Y', 'S00003', '20-feb-96', 'F');

INSERT INTO Sales_order(S_order_no, S_order_date, Client_no, Dely_type, Billed_yn, Salesman_no, Dely_date,
                        Order_status)
VALUES ('019003', '03-apr-96', '0001', 'F', 'Y', 'S00001', '07-apr-96', 'F');

INSERT INTO Sales_order(S_order_no, S_order_date, Client_no, Dely_type, Billed_yn, Salesman_no, Dely_date,
                        Order_status)
VALUES ('046866', '20-may-96', '0004', 'P', 'N', 'S00002', '22-may-96', 'C');

INSERT INTO Sales_order(S_order_no, S_order_date, Client_no, Dely_type, Billed_yn, Salesman_no, Dely_date,
                        Order_status)
VALUES ('010008', '24-may-96', '0005', 'F', 'N', 'S00004', '26-may-96', 'Ip');


-- Inserting data Sales_order_details table
INSERT INTO SALES_ORDER_DETAILS(S_order_no, Product_no, Qty_order, Qty_disp, Product_rate)
VALUES ('019001', 'P00001', 4, 4, 525);

INSERT INTO SALES_ORDER_DETAILS(S_order_no, Product_no, Qty_order, Qty_disp, Product_rate)
VALUES ('019001', 'P07965', 2, 1, 8400);

INSERT INTO SALES_ORDER_DETAILS(S_order_no, Product_no, Qty_order, Qty_disp, Product_rate)
VALUES ('019001', 'P07885', 2, 1, 5250);

INSERT INTO SALES_ORDER_DETAILS(S_order_no, Product_no, Qty_order, Qty_disp, Product_rate)
VALUES ('019002', 'P00001', 10, 0, 525);

INSERT INTO SALES_ORDER_DETAILS(S_order_no, Product_no, Qty_order, Qty_disp, Product_rate)
VALUES ('046866', 'P07868', 3, 3, 3150);

INSERT INTO SALES_ORDER_DETAILS(S_order_no, Product_no, Qty_order, Qty_disp, Product_rate)
VALUES ('046866', 'P07885', 10, 10, 5250);

INSERT INTO SALES_ORDER_DETAILS(S_order_no, Product_no, Qty_order, Qty_disp, Product_rate)
VALUES ('019003', 'P00001', 4, 4, 1050);

INSERT INTO SALES_ORDER_DETAILS(S_order_no, Product_no, Qty_order, Qty_disp, Product_rate)
VALUES ('019003', 'P03453', 2, 2, 1050);

INSERT INTO SALES_ORDER_DETAILS(S_order_no, Product_no, Qty_order, Qty_disp, Product_rate)
VALUES ('046866', 'P06734', 1, 1, 12000);

INSERT INTO SALES_ORDER_DETAILS(S_order_no, Product_no, Qty_order, Qty_disp, Product_rate)
VALUES ('046866', 'P07965', 1, 0, 8400);

INSERT INTO SALES_ORDER_DETAILS(S_order_no, Product_no, Qty_order, Qty_disp, Product_rate)
VALUES ('010008', 'P07975', 1, 0, 1050);

INSERT INTO SALES_ORDER_DETAILS(S_order_no, Product_no, Qty_order, Qty_disp, Product_rate)
VALUES ('010008', 'P00001', 10, 5, 525);

SELECT * FROM Sales_order;


--EXERCISE#4

-- Q1
-- CREATING TABLE Challan_Header
CREATE TABLE Challan_Header
(
    Challan_no   VARCHAR(6) PRIMARY KEY,
    s_order_no   VARCHAR(6),
    challan_date DATE NOT NULL,
    billed_yn    CHAR(1) DEFAULT ('N'),
    FOREIGN KEY (s_order_no) REFERENCES sales_order (S_ORDER_NO),
    CHECK ( billed_yn in ('Y', 'N') )
);

-- CREATING TABLE Challan_Details
CREATE TABLE Challan_Details
(
    Challan_no VARCHAR(6),
    Qty_disp   int NOT NULL,
    product_no VARCHAR(6) REFERENCES product_master(product_no),
    Primary key (Challan_no, product_no)
);

-- Q2
-- Inserting values in Challan_Header
Insert into challan_header
values ('CH9001', '019001', '1995-12-12', 'Y');
Insert into challan_header
values ('CH865', '046866', '1995-11-12', 'Y');
Insert into challan_header
values ('CH3965', '010008', '1995-10-12', 'Y');

-- Inserting values in Challan_Details
Insert into challan_details
values ('CH9001', 4, 'P00001');
Insert into challan_details
values ('CH9001', 1, 'P07965');
Insert into challan_details
values ('CH9001', 1, 'P07885');
Insert into challan_details
values ('CH6865', 3, 'P07868');
Insert into challan_details
values ('CH6865', 4, 'P03453');
Insert into challan_details
values ('CH6865', 10, 'P00001');
Insert into challan_details
values ('CH3965', 5, 'P00001');
Insert into challan_details
values ('CH3965', 2, 'P07975');

-- Objective
-- Q1
--ALTER TABLE client_master
--add client_no PRIMARY KEY;

---- Q2
--ALTER TABLE client_master
--ADD  Phone_no VARCHAR(12);

---- Q3
--ALTER TABLE product_master 
--ALTER description NOT NULL;--, profit_percent NOT NULL, sell_price NOT NULL, cost_price NOT NULL;


---- Q4
--ALTER TABLE client_master
--MODIFY CLIENT_NO VARCHAR2(10);

-- Q5
SELECT PRODUCT_NO, description
FROM product_master 
WHERE PROFIT_PERCENT BETWEEN 1 AND 4
  

-- DROP TABLE Challan_Details;


--EXERCISE#5

select* from client_master
select* from product_master


-- 1.

SELECT p.product_no, p.description
FROM Product_master p
JOIN Sales_order_details sod ON p.product_no = sod.product_no
JOIN Sales_order so ON sod.S_order_no = so.S_order_no
JOIN client_master c ON so.client_no = c.client_no
WHERE c.name = 'Ivan Sayross';

--2.

SELECT p.product_no, p.description, sod.qty_order
FROM Product_master p
JOIN Sales_order_details sod ON p.product_no = sod.product_no
JOIN Sales_order so ON sod.S_order_no = so.S_order_no
WHERE so.Dely_type = 'F';

--3.

SELECT p.product_no, p.description
FROM Product_master p
JOIN Sales_order_details sod ON p.product_no = sod.product_no
WHERE sod.qty_order > 0;


--4.
SELECT DISTINCT c.name
FROM client_master c
JOIN Sales_order so ON c.client_no = so.client_no
JOIN Sales_order_details sod ON so.S_order_no = sod.S_order_no
JOIN Product_master p ON sod.product_no = p.product_no
WHERE p.description LIKE '%CD DRIVE%';


--5. 

SELECT sod.product_no, sod.S_order_no
FROM Sales_order_details sod
JOIN Product_master p ON sod.product_no = p.product_no
WHERE p.description = '1.44 floppies' AND sod.qty_order < 5;


-- 6. 

SELECT p.product_no, p.description, sod.qty_order
FROM Product_master p
JOIN Sales_order_details sod ON p.product_no = sod.product_no
JOIN Sales_order so ON sod.S_order_no = so.S_order_no
JOIN client_master c ON so.client_no = c.client_no
WHERE c.name IN ('Vandan Saitwal', 'Ivan Bayross');


--7. 

SELECT p.product_no, p.description, sod.qty_order
FROM Product_master p
JOIN Sales_order_details sod ON p.product_no = sod.product_no
JOIN Sales_order so ON sod.S_order_no = so.S_order_no
WHERE so.client_no IN ('C00001', 'C00002');


--8.

SELECT so.S_order_no, so.client_no, so.salesman_no
FROM Sales_order so
GROUP BY so.S_order_no, so.client_no, so.salesman_no
HAVING COUNT(DISTINCT so.salesman_no) > 1;


--EXERCISE  6

--Q1

SELECT p.description, SUM(sod.qty_disp) AS total_quantity_sold
FROM Product_master p
JOIN Sales_order_details sod ON p.product_no = sod.product_no
GROUP BY p.description;


--Q2

SELECT p.description, SUM(sod.qty_disp * p.sell_price) AS total_value_sold
FROM Product_master p
JOIN Sales_order_details sod ON p.product_no = sod.product_no
GROUP BY p.description;


--Q3

SELECT c.client_no, AVG(sod.qty_disp) AS avg_quantity_sold
FROM client_master c
JOIN Sales_order so ON c.client_no = so.client_no
JOIN Sales_order_details sod ON so.S_order_no = sod.S_order_no
GROUP BY c.client_no
--HAVING so.Sal_amt<= 15000;


--Q4

SELECT p.product_no, p.description
FROM Product_master p
JOIN Sales_order_details sod ON p.product_no = sod.product_no
JOIN Sales_order so ON sod.S_order_no = so.S_order_no
JOIN client_master c ON so.client_no = c.client_no
WHERE c.name = 'Ivan';

-- Q5 
SELECT DISTINCT c.name
FROM client_master c
JOIN Sales_order so ON c.client_no = so.client_no
JOIN Sales_order_details sod ON so.S_order_no = sod.S_order_no
JOIN Product_master p ON sod.product_no = p.product_no
WHERE p.description LIKE '%CD Drive%';


--Q6 .

SELECT p.product_no, p.description, sod.qty_disp
FROM client_master c
JOIN Sales_order so ON c.client_no = so.client_no
JOIN Sales_order_details sod ON so.S_order_no = sod.S_order_no
JOIN Product_master p ON sod.product_no = p.product_no
WHERE c.name IN ('Vandana', 'Ivan');


--Q7 

SELECT product_no, SUM(qty_order) AS total_qty_ordered
FROM Sales_order_details
GROUP BY product_no;


--Q8 

SELECT sod.product_no, p.description, SUM(sod.qty_order) AS qty_ordered
FROM Sales_order_details sod
JOIN Product_master p ON sod.product_no = p.product_no
GROUP BY sod.product_no, p.description;


--Q9 
--SELECT S_order_no, TO_CHAR(S_order_date, 'Day') AS order_day
--FROM Sales_order;


--Q10 

--SELECT S_order_no, TO_CHAR(Dely_date, 'Month DD') AS delivery_date
--FROM Sales_order;
