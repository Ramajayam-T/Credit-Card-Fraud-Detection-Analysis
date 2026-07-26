CREATE TABLE transactions(
Time int,
V1 float,
V2 float,
V3 float,
V4 float,
V5 float,
V6 float,
V7 float,
V8 float,
V9 float,
V10 float,
V11 float,
V12 float,
V13 float,
V14 float,
V15 float,
v16 float,
V17 float,
V18 float,
V19 float,
V20 float,
V21 float,
V22 float,
V23 float,
V24 float,
V25 float,
V26 float,
V27 float,
V28 float,
Amount float,
Class int);

SHOW VARIABLES LIKE 'local_infile';

SET GLOBAL local_infile = 1;

LOAD DATA LOCAL INFILE 'C:/Users/RAMAJAYAM T/Downloads/archive/creditcard.csv'
INTO TABLE transactions
FIELDS TERMINATED BY ','
IGNORE 1 ROWS;

SELECT COUNT(*) as total_transactions FROM transactions; 										#total_no_of_transactions

SELECT Class,COUNT(*) as total_transactions FROM transactions GROUP BY Class; 				#how_many_are_normal-and-fraud-transactions
		
SELECT (COUNT(CASE WHEN class = 1 THEN 1 END) * 100.0 / COUNT(*)) AS fraud_percentage
FROM transactions;           																	 #percentage_of_fraud-transactions

SELECT SUM(Amount) AS total_transactions FROM transactions; 									 #total_amount_in_transactions

SELECT AVG(Amount) AS average_amount FROM transactions; 										 #average_amount_in_transactions

SELECT Class,AVG(Amount) AS average_amount_by_class FROM transactions GROUP BY Class; 			 #average_amount_in_transactions_fraud

SELECT * FROM transactions ORDER BY amount DESC LIMIT 10;										 #top10_highest_transactions

SELECT * FROM transactions WHERE Class=1 ORDER BY amount DESC LIMIT 10 ; 						#top10_highest_fraud_transactions

SELECT * FROM transactions WHERE Amount>(SELECT AVG(Amount) FROM transactions);					 #transactions_above_average_amount

SELECT MAX(Amount) AS Maximum_Amount , MIN(Amount) AS Minimum_Amount FROM transactions; 			#min_and_max_amount

SELECT * FROM transactions ORDER BY amount DESC LIMIT 10;											 #top10_highest_transactions

SELECT Class, COUNT(*) AS total_transactions,AVG(Amount) AS Avg_amount_transactions
 FROM transactions GROUP BY Class;                     												#avg_amount_from_class-or-fraud

SELECT class,
SUM(amount) AS total_transaction_amount,
(SUM(amount) * 100.0 / (SELECT SUM(amount) FROM transactions)) 
AS percentage_of_total_value
FROM transactions
GROUP BY class;    													  #percentage_of_total_transactions_from_class_or_fraud-transaction

