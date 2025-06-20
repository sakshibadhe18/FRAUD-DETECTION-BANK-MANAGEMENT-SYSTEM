CREATE DATABASE bank;
USE bank;

# 1st table is customer
CREATE TABLE customer(
Cust_id INT PRIMARY KEY auto_increment,
Cust_Name VARCHAR(100)NOT NULL,
Moblie VARCHAR(15)UNIQUE NOT NULL,
Email VARCHAR(100) UNIQUE NOT NULL,
ADDRESS VARCHAR(50) NOT NULL,
Country VARCHAR(50) NOT NULL
);
INSERT INTO customer(Cust_Name, Moblie, Email, ADDRESS, Country) VALUES ('Sakshi Badhe', 9152276019 , 'sakshi11@gmail.com', 'Kharghar', 'India'),
('Sanyukta Gadge', 7608980769 , 'sanyukta12@gmail.com', 'Kamothe', 'India'), ('Manisha Tupe', 9199304678, 'Manisha05@gmail.com', 'Vashi', 'India'),
('Pragati Gadge', 9865412300 , 'pragati15@gmail.com', 'Belapur', 'India'), ('Pratik Badhe', 9619935371 , 'pratikbadhe22@gmail.com', 'Ghansoli', 'India'),
('Sahil Shelar', 7506891829 , 'sahil12@gmail.com', 'Kamothe', 'India'), ('Karan Shete', 7607691982 , 'karanshete11@gmail.com', 'Koparkhairane', 'India'),
('Rohit Sawant', 8897462974, 'rohii18@gmail.com', 'Karanjade', 'India'), ('Snehal Gaikwad', 9087675745 , 'snehalgaikwad@gmail.com', 'CBD Belapur', 'India'),
('Narayan Badhe', 9801354760 , 'narayan06@gmail.com', 'Kamothe', 'India'), ('Pratik Sawant', 7606192933 , 'bhaiya13@gmail.com', 'Karanjade', 'India'),
('Sauju Gadge', 7661283969 , 'sauju@gmail.com', 'Vashi', 'India'), ('Abishek Kale', 9930466120 , 'abhi60@gmail.com', 'Neral', 'India'),
('Pranav Bandal ', 9716788208, 'pranav@gmail.com', 'Nerul', 'India'), ('Satish Mestry', 8962917728 , 'satish99@gmail.com', 'Kamothe', 'India'),
('Chhaya Salekar', 8345672198 , 'chhaya15@gmail.com', 'Turbhe', 'India'), ('Rishi Yadav', 8649466288 , 'rishiyadav56@gmail.com', 'Juinagar', 'India');

SELECT * FROM customer;

# 2nd table is Account
CREATE TABLE Accounts(
Acc_id INT PRIMARY KEY ,
Cust_id INT,
AccType ENUM ('Savings','Current','Business') NOT NULL,
Balance DECIMAL (15,2)NOT NULL DEFAULT 0.00,
Status ENUM('Active','Closed','Frozen')NOT NULL DEFAULT 'Active',
FOREIGN KEY (Cust_id) REFERENCES customer (Cust_id) ON DELETE CASCADE
);

INSERT INTO Accounts(Acc_id,Cust_id, AccType, Balance, Status) VALUES (101,1,'Savings',50000.60,'Active'),
(102,2,'Savings',80000.00,'Active'), (103,3,'Savings',50000.00,'Frozen'), (104,4,'Current',100000.00,'Active'), (105,5,'Business',150000.60,'Active'), 
(106,6,'Savings',0.00,'Closed'),(107,7,'Savings',100.00,'Frozen'), (108,8,'Business',0.00,'Closed'),(109,9,'Current',70000.00,'Active'), (110,10,'Business',250000.00,'Active'),
(111,11,'Savings',70000.20,'Frozen'),(112,12,'Current',1000000.00,'Active'),(113,13,'Current',0.00,'Closed'),(114,14,'Business',200000.15,'Active'),
(115,15,'Savings',20000.80,'Active'), (116,16,'Savings',60000.30,'Active'),(117,17,'Savings',10000.80,'Active');
SELECT * FROM Accounts;

# 3rd table is Transactions
CREATE TABLE Transactions(
TID INT PRIMARY KEY ,
Acc_id INT,
Amount DECIMAL(10,2) NOT NULL,
TDate DATETIME DEFAULT CURRENT_TIMESTAMP,
TType ENUM('Credit','Debit') NOT NULL,
TMode ENUM('Cash','Online','Cheque','UPI')NOT NULL,
Location VARCHAR(200),
Status ENUM('Completed','Pending','Failed') NOT NULL,
FOREIGN KEY (Acc_id) REFERENCES Accounts (Acc_id) ON DELETE CASCADE
);

INSERT INTO Transactions (TID,Acc_id, Amount, TDate, TType, TMode, Location, Status) VALUES
(1, 101, 5000.00, '2024-03-01 10:15:30', 'Credit', 'Online', 'Mumbai', 'Completed'),
(2, 102, 12000.00, '2024-03-02 09:45:10', 'Credit', 'Cheque', 'Pune', 'Completed'),
(3, 103, 2000.75, '2024-03-03 16:30:25', 'Credit', 'UPI', 'Chennai', 'Failed'),
(4, 104, 300.00, '2024-03-04 18:30:50', 'Debit', 'UPI', 'Kolkata', 'Completed'),
(5, 105, 7000.25, '2024-03-04 16:15:00', 'Credit', 'Online', 'Hyderabad', 'Completed'),
(6, 106, 8000.00, '2024-03-05 08:20:35', 'Credit', 'Cheque', 'Bangalore', 'Failed'),
(7, 107, 900.00, '2024-03-05 11:45:50', 'Debit', 'Cash', 'Jaipur', 'Pending'),
(8, 108, 500.00, '2024-03-06 17:00:20', 'Credit', 'Online', 'Lucknow', 'Failed'),
(9, 109, 1100.00, '2024-03-07 14:10:15', 'Credit', 'UPI', 'Indore', 'Completed'),
(10, 110, 9200.00, '2024-03-07 16:25:45', 'Debit', 'Cheque', 'Patna', 'Pending'),
(11, 111, 5300.00, '2024-03-08 12:05:55', 'Credit', 'Online', 'Bhopal', 'Failed'),
(12, 112, 7500.00, '2024-03-09 15:45:20', 'Debit', 'UPI', 'Delhi', 'Completed'),
(13, 113, 600.00, '2024-03-10 09:30:10', 'Credit', 'Cash', 'Surat', 'Failed'),
(14, 114, 8200.00, '2024-03-10 18:55:35', 'Debit', 'Online', 'Nagpur', 'Completed'),
(15, 115, 1200.50, '2024-03-11 11:20:40', 'Credit', 'UPI', 'Chandigarh', 'Failed'),
(16, 116, 400.00, '2024-03-12 07:10:25', 'Debit', 'Cheque', 'Ahmedabad', 'Completed'),
(17, 117, 10500.00, '2024-03-13 20:05:55', 'Credit', 'Online', 'Goa', 'Completed');

DROP DATABASE bank;

SELECT * FROM Transactions;

# 4th table is FraudAlerts
CREATE TABLE FraudAlerts (
    AlertID INT PRIMARY KEY ,
    TID INT,  
    AlertType VARCHAR(50),
    AlertLevel ENUM('Low', 'Medium', 'High', 'Critical'),
    DetectedAt DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (TID) REFERENCES Transactions(TID)
);

INSERT INTO FraudAlerts (AlertID,TID,AlertType,AlertLevel,DetectedAt) VALUES
(1001,1, 'Large Amount', 'Critical', '2024-03-02 09:50:10'),
(1002,2, 'Failed Transaction', 'Medium', '2024-03-02 14:30:50'),
(1003,3, 'Multiple Small Transactions', 'Low', '2024-03-04 18:35:00'),
(1004,4, 'High-Value Transaction', 'Critical', '2024-03-05 08:25:35'),
(1005,5, 'Multiple Declines', 'High', '2024-03-07 15:45:25'),
(1006,6, ' Failed Transaction', 'Medium', '2024-03-07 18:00:45'),
(1007,7, 'Repeated Failed Transactions', 'High', '2024-03-09 10:10:15'),
(1008,8, 'Failed Transaction', 'Medium', '2024-03-10 14:15:20'),
(1009,9, 'Unusual Time Transaction', 'Low', '2024-03-04 12:15:40'),
(1010,10, 'Cash Deposit Alert', 'Low', '2024-03-06 10:55:15'),
(1011,11, 'New Device Used', 'Medium', '2024-03-06 13:15:55'),
(1012,12, 'Account Takeover Suspected', 'Critical', '2024-03-08 19:25:10'),
(1013,13, 'Failed Transaction', 'Medium', '2024-03-01 11:35:45'),
(1014,14, 'High Amount Transfer', 'High', '2024-03-10 12:35:50'),
(1015,15, 'International Transaction', 'Medium', '2024-03-01 10:20:30'),
(1016,16, 'Suspicious Bank Account', 'High', '2024-03-09 08:50:30'),
(1017,17, 'Unusual Spending Pattern', 'Medium', '2024-03-03 16:10:20');

SELECT * FROM FraudAlerts ;

# 5th table is FraudInvestigation

CREATE TABLE FraudInvestigations ( 
InvestigationID INT PRIMARY KEY, 
AlertID INT,
InvestigatorID INT, 
Status ENUM('Open', 'In Progress', 'Closed'), 
Resolution VARCHAR(255), 
InvestigatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
FOREIGN KEY (AlertID) REFERENCES FraudAlerts(AlertID), 
FOREIGN KEY (InvestigatorID) REFERENCES customer(Cust_id) );

INSERT INTO FraudInvestigations(InvestigationID,AlertID,InvestigatorID,Status,Resolution) VALUES
(201,1001,1,'In Progress','Awaiting customer response'),
(202,1002,2,'Closed','Fraud confirmed'),
(203,1003,3,'Open',null),
(204, 1004, 4, 'Closed', 'Fraud confirmed, account locked'),
(205, 1005, 5,'In Progress', NULL),
(206, 1006, 6, 'Closed', 'Customer confirmed failed transaction'),
(207, 1007, 7, 'Open', NULL),
(208, 1008, 8, 'Closed', 'System error caused failure'),
(209, 1009, 9, 'In Progress', NULL),
(210, 1010, 10, 'Closed', 'No fraudulent activity detected'),
(211, 1011, 11, 'Open', NULL),
(212, 1012, 12, 'Closed', 'Account takeover confirmed, security measures applied'),
(213, 1013, 13, 'Closed', 'Failed transaction due to insufficient balance'),
(214, 1014, 14, 'In Progress', NULL),
(215, 1015, 15, 'Closed', 'Legitimate international transaction'),
(216, 1016, 16, 'In Progress', NULL),
(217, 1017, 17, 'Closed', 'Unusual spending pattern verified, no fraud found');

SELECT * FROM FraudInvestigations ;
SHOW DATABASES;
SHOW TABLES;

# Query
# 1.
SELECT * FROM FraudInvestigations
LIMIT 10 ;

# 2.
SELECT * FROM FraudInvestigations 
WHERE status = 'Closed';

# 3.
SELECT * FROM Accounts
WHERE  Status = 'Closed' ;  

# 4.
SELECT * FROM FraudAlerts
ORDER BY AlertLevel ;

# 5.
SELECT COUNT(Cust_Name),ADDRESS FROM customer
GROUP BY ADDRESS;

# 6. 
SELECT customer.*,Accounts.*
FROM customer
INNER JOIN Accounts
ON customer.Cust_id=Accounts.Cust_id;

SELECT Accounts.*,Transactions.*
FROM Accounts
INNER JOIN Transactions
ON Accounts.Acc_id=Transactions.Acc_id;

SELECT Transactions.*,FraudAlerts.*
FROM Transactions
INNER JOIN FraudAlerts
ON Transactions.TID=FraudAlerts.TID;

SELECT FraudAlerts.*,FraudInvestigations.*
FROM FraudAlerts
INNER JOIN FraudInvestigations
ON FraudAlerts.AlertID=FraudInvestigations.AlertID;

# 7.
SELECT AlertID FROM FraudAlerts
UNION 
SELECT InvestigatorID FROM FraudInvestigations;

# 8.
SELECT *  
FROM customer  
WHERE Cust_id IN 
(SELECT Cust_id 
FROM transactions WHERE amount > 50000);

CALL GetFraudInvestigationsByStatus('Closed');

SELECT * FROM Accounts WHERE Status = 'Closed';

SELECT * FROM FraudAlerts ORDER BY AlertLevel;

SELECT * FROM FraudInvestigations WHERE Status = 'Closed';

SELECT * FROM customer WHERE Cust_id IN
(SELECT Cust_id FROM transactions WHERE Amount > 100000);

SELECT FraudAlerts.*, FraudInvestigations.* FROM FraudAlerts
INNER JOIN FraudInvestigations ON FraudAlerts.AlertID = FraudInvestigations.AlertID;

SELECT COUNT(Cust_Name), Address FROM customer GROUP BY Address;
SELECT * FROM customer;

SELECT 
    c.Cust_Name,
    c.Email,
    SUM(a.Balance) AS Total_Balance
FROM 
    customer c
JOIN 
    Accounts a ON c.Cust_id = a.Cust_id
GROUP BY 
    c.Cust_id, c.Cust_Name, c.Email
ORDER BY 
    Total_Balance DESC;

SELECT 
    t.Acc_id,
    t.TID,
    t.TDate,
    t.TType,
    t.Amount,
    SUM(
        CASE 
            WHEN t.TType = 'Credit' THEN t.Amount 
            ELSE -t.Amount 
        END
    ) OVER (PARTITION BY t.Acc_id ORDER BY t.TDate) AS Running_Balance
FROM 
    Transactions t
WHERE 
    t.Status = 'Completed'
ORDER BY 
    t.Acc_id, t.TDate;
    
    SELECT 
    fa.AlertID,
    fa.AlertType,
    fa.AlertLevel,
    fa.DetectedAt,
    t.TID,
    t.Amount,
    t.TDate,
    c.Cust_Name,
    c.Email
FROM 
    FraudAlerts fa
JOIN 
    Transactions t ON fa.TID = t.TID
JOIN 
    Accounts a ON t.Acc_id = a.Acc_id
JOIN 
    customer c ON a.Cust_id = c.Cust_id
WHERE 
    fa.AlertLevel IN ('High', 'Critical')
ORDER BY 
    fa.AlertLevel DESC;

SELECT 
    c.Cust_Name,
    c.Email,
    SUM(t.Amount) AS Total_Credited
FROM 
    customer c
JOIN 
    Accounts a ON c.Cust_id = a.Cust_id
JOIN 
    Transactions t ON a.Acc_id = t.Acc_id
WHERE 
    t.TType = 'Credit' AND t.Status = 'Completed'
GROUP BY 
    c.Cust_id, c.Cust_Name, c.Email
ORDER BY 
    Total_Credited DESC
LIMIT 3;

SELECT 
    c.Cust_Name,
    c.Email
FROM 
    customer c
JOIN 
    Accounts a ON c.Cust_id = a.Cust_id
LEFT JOIN 
    Transactions t ON a.Acc_id = t.Acc_id 
                   AND t.TDate >= DATE_SUB(CURDATE(), INTERVAL 3 MONTH)
                   AND t.Status = 'Completed'
WHERE 
    t.TID IS NULL;

SELECT 
    c.Cust_Name,
    COUNT(t.TID) AS Failed_Transactions
FROM 
    customer c
JOIN 
    Accounts a ON c.Cust_id = a.Cust_id
JOIN 
    Transactions t ON a.Acc_id = t.Acc_id
WHERE 
    t.Status = 'Failed'
GROUP BY 
    c.Cust_id, c.Cust_Name
HAVING 
    COUNT(t.TID) > 2;

SELECT *
FROM (
    SELECT 
        t.*,
        ROW_NUMBER() OVER (PARTITION BY t.Acc_id ORDER BY t.TDate DESC) AS rn
    FROM 
        Transactions t
    WHERE 
        t.Status = 'Completed'
) AS recent
WHERE rn = 1;

-- High-frequency query: Check account balance
SELECT Acc_id , balance FROM accounts
 WHERE cust_id = 101;
 
 -- Aggregate with filter: Total deposits by account type
SELECT AccType, SUM(balance) as total_balance
FROM accounts
GROUP BY AccType;

EXPLAIN SELECT Acc_id, balance FROM accounts WHERE cust_id = 101;

CREATE INDEX idx_cust_id ON accounts(cust_id);

ALTER TABLE transactions
PARTITION BY RANGE (YEAR(TDate)) (
  PARTITION p2022 VALUES LESS THAN (2023),
  PARTITION p2023 VALUES LESS THAN (2024)
);

CREATE INDEX idx_transactions_account_date ON Transactions(Acc_id, TDate);

CREATE INDEX idx_accounts_Acc_id ON Accounts(Acc_id);


SELECT c.Cust_id, c.Cust_name, a.Acc_id, t.Amount
FROM Customer c
JOIN Accounts a ON c.Cust_id = a.Cust_id
JOIN Transactions t ON a.Acc_id = t.Acc_id;


SELECT t.Acc_id, t.Amount, SUM(t.Amount) OVER (PARTITION BY t.Acc_id ORDER BY t.Tdate) AS Running_Total
FROM Transactions t;

SELECT *
FROM Accounts
WHERE Cust_id IN (
  SELECT Cust_id FROM Customer WHERE ADDRESS = 'Kamothe'
);

EXPLAIN SELECT c.Cust_id, c.Cust_name, a.Acc_id, t.Amount
FROM Customer c
JOIN Accounts a ON c.Cust_id = a.Cust_id
JOIN Transactions t ON a.Acc_id = t.Acc_id;

CREATE INDEX idx_trans_acc_id ON Transactions(Acc_id);


-- Step 1: Index creation
CREATE INDEX idx_transactions_acc_id ON Transactions(Acc_id);

-- Step 2: Optimized query
SELECT c.Cust_id, c.Cust_name, SUM(t.Amount) AS Total_Transaction
FROM Customer c
JOIN Accounts a ON c.Cust_id = a.Cust_id
JOIN Transactions t USE INDEX (idx_transactions_acc_id) ON a.Acc_id = t.Acc_id
GROUP BY c.Cust_id, c.Cust_name;


SELECT c.Cust_name, SUM(t.Amount)
FROM Customer c
JOIN Accounts a ON c.Cust_id = a.Cust_id
JOIN Transactions t ON a.Acc_id = t.Acc_id
WHERE t.TType = 'Credit'
GROUP BY c.Cust_name;


CREATE INDEX idx_Cust_id ON Accounts(Cust_id);

SELECT c.Cust_name, SUM(t.Amount)
FROM Customer c
JOIN Accounts a ON c.Cust_id = a.Cust_id
JOIN Transactions t USE INDEX (idx_acc_id) ON a.Acc_id = t.Acc_id
WHERE t.TType = 'Credit'
GROUP BY c.Cust_name;

SELECT * FROM Transactions WHERE Amount > 7000;

SELECT FraudAlerts.*, FraudInvestigations.*
FROM FraudAlerts
INNER JOIN FraudInvestigations
ON FraudAlerts.AlertID = FraudInvestigations.AlertID;

SELECT COUNT(Cust_Name), Address FROM customer GROUP BY Address;

EXPLAIN SELECT * FROM Transactions WHERE Amount > 50000;

CREATE INDEX idx_amount ON Transactions(Amount);
CREATE INDEX idx_status ON Accounts(Status);

SELECT c.* 
FROM customer c
JOIN Accounts a ON c.Cust_id = a.Cust_id
WHERE a.Status = 'Closed';
SHOW INDEXES FROM Transactions;
SHOW INDEXES FROM Accounts;

SELECT * FROM Transactions WHERE TDate >= CURDATE();

SELECT * FROM FraudAlerts WHERE AlertLevel IN ('High', 'Critical');

SELECT Acc_id, SUM(Amount) AS TotalAmount
FROM Transactions
WHERE Status = 'Completed'
GROUP BY Acc_id;

CREATE TABLE Monthly_Transaction_Summary (
  Acc_id INT,
  TotalAmount DECIMAL(15,2)
);
DROP TABLE IF EXISTS Monthly_Transaction_Summary;
SELECT * FROM Monthly_Transaction_Summary;

SELECT * FROM Monthly_High_Fraud;

CREATE TABLE Monthly_High_Fraud (
    AlertID INT,
    TID INT,
    AlertLevel VARCHAR(50)
);

DROP PROCEDURE IF EXISTS Load_HighLevelFraudData;
DROP TABLE IF EXISTS monthly_high_fraud;

CALL Load_HighLevelFraudData2();

SELECT * FROM fraudalerts
WHERE AlertLevel IN ('High', 'Critical');

CREATE TABLE Error_Log (
  LogID INT AUTO_INCREMENT PRIMARY KEY,
  EventTime DATETIME,
  ErrorMsg TEXT
);
DROP TABLE Error_Log;
SELECT * FROM Error_Log;