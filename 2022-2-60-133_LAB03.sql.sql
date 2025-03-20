--File Uploading
@D:\Projects\SQL_Files\banking.sql

--Finding all name and cities of branches
SELECT branch_name, branch_city
FROM branch
WHERE assets > 100000;

--Finding all account numbers in downtown branch or balance (600 to 750)
SELECT account_number
FROM account
WHERE branch_name = 'Downtown' OR balance>=600 AND balance<=750;

--Finding all account numbers which are opened in Rye city branch
SELECT account.account_number 
FROM account 
JOIN branch ON account.branch_name = branch.branch_name 
WHERE branch.branch_city = 'Rye';

--Finding all loan numbers which are >=1000 and customers from Harrison City
SELECT loan.loan_number 
FROM loan 
JOIN borrower ON loan.loan_number = borrower.loan_number 
JOIN customer ON borrower.customer_name = customer.customer_name 
WHERE loan.amount >= 1000 AND customer.customer_city = 'Harrison';

--Displaing account related information in decending order of balance
SELECT *
FROM account
ORDER BY balance DESC;

--Displaying customer related information in alphabetic order of customer cities
SELECT *
FROM customer
ORDER BY customer_city ASC;

--Finding all customer names who have an account as well as a loan
SELECT depositor.customer_name
FROM depositor
INTERSECT
SELECT borrower.customer_name
FROM borrower;

--Finding all customer related information who have an account or a loan
SELECT customer.* 
FROM customer 
JOIN depositor ON customer.customer_name = depositor.customer_name 
UNION 
SELECT customer.* 
FROM customer 
JOIN borrower ON customer.customer_name = borrower.customer_name;

--Finding all customer names and their cities who have a loan but not an account
SELECT customer.customer_name, customer.customer_city
FROM customer
JOIN borrower ON customer.customer_name = borrower.customer_name
WHERE customer.customer_name NOT IN (SELECT customer_name FROM depositor);

--Finding total assets of all branches
SELECT SUM(assets) FROM branch;

--Finding average balance of accounts at each branch
SELECT branch_name, AVG(balance)
FROM account
GROUP BY branch_name;

--Finding average balance of accounts at each branch city
SELECT branch.branch_city, AVG(account.balance) 
FROM account 
JOIN branch ON account.branch_name = branch.branch_name 
GROUP BY branch.branch_city;

--Finding the lowest amount of loan at each branch
SELECT branch_name, MIN(amount)
FROM loan
GROUP BY branch_name;

--Finding total number of loan at each branches
SELECT branch_name, COUNT(loan_number)
FROM loan
GROUP BY branch_name;

--Finding customer name and account number of the account which has the highest balance
SELECT depositor.customer_name, account.account_number, account.balance 
FROM account 
JOIN depositor ON account.account_number = depositor.account_number 
WHERE balance = (SELECT MAX(balance) FROM account);

--Table Showing
SELECT * FROM branch;
SELECT * FROM account;
SELECT * FROM customer;
SELECT * FROM loan;
SELECT * FROM depositor;
SELECT * FROM borrower;


