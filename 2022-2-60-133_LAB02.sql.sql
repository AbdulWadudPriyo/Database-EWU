--Task01


--Account Table
CREATE TABLE account
(

account_no char(5),
balance number Not null,
constraint act_no primary key (account_no),
constraint balance_chk check (balance >= 0)

);


--Customer Table
CREATE TABLE customer
(

customer_no char(5),
customer_name varchar2(20) Not null,
customer_city varchar2(10),
constraint cus_no primary key (customer_no)

);


--Depositor Table
CREATE TABLE depositor
(

account_no char(5),
customer_no char(5),
constraint act_cus primary key (account_no, customer_no)

);

--Task02

--Adding Date of Birth Column
Alter TABLE customer
Add date_of_birth date;


--Removing Date of Birth Column
Alter TABLE customer
Drop column date_of_birth;


--Rename
Alter TABLE depositor
Rename column account_no to a_no;


--Rename
Alter TABLE depositor
Rename column customer_no to c_no;


--Foreign Key fk1
Alter TABLE depositor
Add constraint depositor_fk1
foreign key (a_no) references account (account_no);


--Foreign Key fk2
Alter TABLE depositor
Add constraint depositor_fk2
foreign key (c_no) references customer (customer_no);



--Task03

--Inserting values in account table

Insert into account values ('A-101', 12000);
Insert into account values ('A-102', 6000);
Insert into account values ('A-103', 2500);


--Inserting values in customer table

Insert into customer values ('C-101', 'Alice', 'Dhaka');
Insert into customer values ('C-102', 'Annie', 'Dhaka');
Insert into customer values ('C-103', 'Bob', 'Chittagong');
Insert into customer values ('C-104', 'Charlie', 'Khulna');


--Inserting values in depositor table

Insert into depositor values ('A-101', 'C-101');
Insert into depositor values ('A-103', 'C-102');
Insert into depositor values ('A-103', 'C-104');
Insert into depositor values ('A-102', 'C-103'); 


--Task04

Alter TABLE depositor
Rename column account_no to a_no;

Alter TABLE depositor
Rename column customer_no to c_no;

SELECT customer_name, customer_city
FROM customer;

SELECT distinct customer_city
FROM customer;

SELECT account_no
FROM account
WHERE balance > 7000;

SELECT customer_no, customer_city
FROM customer
WHERE customer_city = 'Khulna';

SELECT customer_no, customer_city
FROM customer
WHERE not (customer_city = 'Dhaka');

SELECT customer_name, customer_city
FROM customer
join depositor on customer_no = c_no
join account on account_no = a_no
WHERE balance > 7000;

SELECT customer_name, customer_city
FROM customer
join depositor on customer_no = c_no
join account on account_no = a_no
WHERE balance > 7000 and customer_city != 'Khulna';

SELECT account_no, balance
FROM account
join depositor on account_no = a_no
join customer on customer-no = c_no
WHERE c_no = 'C-102';

SELECT account_no, balance
FROM account
join depositor on account_no = a_no
join customer on customer-no = c_no
WHERE customer_city in ('Dhaka', 'Khulna');

SELECT customer_no, customer_name, customer_city
FROM customer
WHERE customer_no not in (SELECT c-no from depositor);
