CREATE DATABASE HEALTHCARE;
USE HEALTHCARE;

CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    ContactInfo VARCHAR(100),
    Address VARCHAR(255)
);
	
CREATE TABLE InsurancePolicy (
    PolicyID INT PRIMARY KEY,
    PolicyType VARCHAR(50),
    StartDate DATE,
    EndDate DATE,
    PremiumAmount DECIMAL(10, 2),
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

CREATE TABLE Hospital (
    HospitalID INT PRIMARY KEY,
    HospitalName VARCHAR(100),
    Location VARCHAR(100)
);

CREATE TABLE Claim (
    ClaimID INT PRIMARY KEY,
    ClaimAmount DECIMAL(10, 2),
    ClaimStatus VARCHAR(20),
    ClaimDate DATE,
    PolicyID INT,
    HospitalID INT,
    CustomerID INT,
    FOREIGN KEY (PolicyID) REFERENCES InsurancePolicy(PolicyID),
    FOREIGN KEY (HospitalID) REFERENCES Hospital(HospitalID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    PaymentDate DATE,
    PaymentAmount DECIMAL(10, 2),
    PolicyID INT,
    CustomerID INT,
    FOREIGN KEY (PolicyID) REFERENCES InsurancePolicy(PolicyID),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

INSERT INTO Customer (CustomerID, Name, ContactInfo, Address)
VALUES 
(1, 'John Doe', 'john@example.com', '123 Main St'),
(2, 'Jane Smith', 'jane@example.com', '456 Elm St'),
(3, 'Michael Johnson', 'michaelj@example.com', '789 Oak St'),
(4, 'Emily Davis', 'emilyd@example.com', '101 Maple Ave'),
(5, 'William Brown', 'william@example.com', '202 Pine St'),
(6, 'Olivia Miller', 'oliviam@example.com', '303 Cedar St'),
(7, 'James Wilson', 'jamesw@example.com', '404 Spruce St'),
(8, 'Linda Martinez', 'lindam@example.com', '505 Birch Blvd'),
(9, 'Robert Anderson', 'roberta@example.com', '606 Walnut Dr'),
(10, 'Patricia Thomas', 'patriciat@example.com', '707 Chestnut Ln'),
(11, 'Alex Carter', 'alexc@example.com', '222 Broad St'),
(12, 'Sophia Lee', 'sophial@example.com', '333 Pine Blvd'),
(13, 'Benjamin Evans', 'benjamine@example.com', '121 Willow Ln'),
(14, 'Ava Hernandez', 'avah@example.com', '567 Cypress Ave'),
(15, 'Lucas Thomas', 'lucast@example.com', '345 Mulberry St'),
(16, 'Mason White', 'masonw@example.com', '900 Oak Rd'),
(17, 'Ella Young', 'ellay@example.com', '567 Sycamore Ln'),
(18, 'Ethan Martin', 'ethanm@example.com', '234 Aspen Dr'),
(19, 'Liam Rodriguez', 'liamr@example.com', '432 Maple St'),
(20, 'Mia Scott', 'mias@example.com', '678 Birch Blvd'),
(21, 'Jacob Walker', 'jacobw@example.com', '121 Cherry Ln'),
(22, 'Isabella Hall', 'isabellah@example.com', '789 Fir Ave'),
(23, 'James Allen', 'jamesa@example.com', '234 Cedar St'),
(24, 'Charlotte King', 'charlottek@example.com', '456 Hickory St'),
(25, 'Michael Wright', 'michaelw@example.com', '321 Maple Dr'),
(26, 'Amelia Turner', 'ameliat@example.com', '876 Willow Blvd'),
(27, 'Daniel Hill', 'danielh@example.com', '543 Poplar St'),
(28, 'Aiden Green', 'aideng@example.com', '678 Spruce St'),
(29, 'Oliver Adams', 'olivera@example.com', '123 Elm St'),
(30, 'Emily Nelson', 'emilyn@example.com', '234 Oak Dr'),
(31, 'Henry Baker', 'henryb@example.com', '789 Pine St'),
(32, 'Emma Harris', 'emmah@example.com', '345 Cedar Blvd'),
(33, 'Sophie Lewis', 'sophiel@example.com', '121 Birch Ln'),
(34, 'Noah Collins', 'noahc@example.com', '567 Maple Rd'),
(35, 'Grace Simmons', 'graces@example.com', '654 Mulberry St'),
(36, 'Mason Foster', 'masonf@example.com', '432 Cypress Dr'),
(37, 'Ella Watson', 'ellaw@example.com', '987 Walnut Blvd'),
(38, 'Liam Ward', 'liamw@example.com', '543 Willow Ave'),
(39, 'Ava Brooks', 'avab@example.com', '678 Sycamore St'),
(40, 'William Bell', 'williamb@example.com', '123 Fir Rd'),
(41, 'Abigail Parker', 'abigailp@example.com', '234 Poplar Dr'),
(42, 'Elijah Sanders', 'elijahs@example.com', '456 Elm St'),
(43, 'Isabella Price', 'isabellap@example.com', '789 Oak Ln'),
(44, 'Jackson Russell', 'jacksonr@example.com', '345 Cedar St'),
(45, 'Emma Rivera', 'emmar@example.com', '678 Birch Dr'),
(46, 'Lucas Jenkins', 'lucasj@example.com', '987 Pine St'),
(47, 'Sophia Howard', 'sophiah@example.com', '432 Maple Rd'),
(48, 'Liam Murphy', 'liamm@example.com', '222 Oak Blvd'),
(49, 'Charlotte Cox', 'charlottec@example.com', '543 Spruce St'),
(50, 'Amelia Rivera', 'ameliar@example.com', '987 Poplar Ln');


INSERT INTO InsurancePolicy (PolicyID, PolicyType, StartDate, EndDate, PremiumAmount, CustomerID)
VALUES 
(1, 'Health Insurance', '2023-01-01', '2024-01-01', 1200.00, 1),
(2, 'Life Insurance', '2022-07-01', '2027-07-01', 5000.00, 2),
(3, 'Auto Insurance', '2022-10-01', '2024-10-01', 1500.00, 3),
(4, 'Home Insurance', '2021-05-01', '2023-05-01', 2500.00, 4),
(5, 'Health Insurance', '2023-03-01', '2024-03-01', 1000.00, 5),
(6, 'Travel Insurance', '2024-01-01', '2025-01-01', 800.00, 6),
(7, 'Life Insurance', '2023-06-01', '2028-06-01', 4000.00, 7),
(8, 'Accident Insurance', '2022-09-01', '2024-09-01', 700.00, 8),
(9, 'Auto Insurance', '2023-02-01', '2026-02-01', 1300.00, 9),
(10, 'Home Insurance', '2022-12-01', '2024-12-01', 3200.00, 10),
(11, 'Health Insurance', '2024-04-01', '2025-04-01', 1250.00, 11),
(12, 'Life Insurance', '2023-07-01', '2028-07-01', 5500.00, 12),
(13, 'Health Insurance', '2022-09-01', '2025-09-01', 1600.00, 13),
(14, 'Accident Insurance', '2021-11-01', '2023-11-01', 900.00, 14),
(15, 'Travel Insurance', '2024-03-01', '2025-03-01', 1150.00, 15),
(16, 'Health Insurance', '2023-04-01', '2026-04-01', 1850.00, 16),
(17, 'Auto Insurance', '2022-06-01', '2025-06-01', 950.00, 17),
(18, 'Home Insurance', '2023-10-01', '2024-10-01', 3100.00, 18),
(19, 'Life Insurance', '2024-02-15', '2030-02-15', 4100.00, 19),
(20, 'Health Insurance', '2023-12-01', '2026-12-01', 1650.00, 20),
(21, 'Life Insurance', '2024-03-01', '2030-03-01', 4300.00, 21),
(22, 'Auto Insurance', '2022-08-01', '2025-08-01', 1700.00, 22),
(23, 'Health Insurance', '2023-02-01', '2024-02-01', 1100.00, 23),
(24, 'Travel Insurance', '2022-11-01', '2023-11-01', 850.00, 24),
(25, 'Home Insurance', '2024-01-01', '2025-01-01', 3400.00, 25),
(26, 'Health Insurance', '2021-10-01', '2022-10-01', 900.00, 26),
(27, 'Life Insurance', '2023-08-01', '2030-08-01', 4800.00, 27),
(28, 'Accident Insurance', '2022-07-01', '2024-07-01', 950.00, 28),
(29, 'Travel Insurance', '2024-02-01', '2025-02-01', 1150.00, 29),
(30, 'Health Insurance', '2023-11-01', '2024-11-01', 1050.00, 30),
(31, 'Home Insurance', '2023-06-01', '2024-06-01', 3200.00, 31),
(32, 'Auto Insurance', '2024-04-01', '2026-04-01', 1250.00, 32),
(33, 'Life Insurance', '2022-12-01', '2032-12-01', 5300.00, 33),
(34, 'Health Insurance', '2024-05-01', '2025-05-01', 1450.00, 34),
(35, 'Accident Insurance', '2023-01-01', '2025-01-01', 700.00, 35),
(36, 'Travel Insurance', '2023-07-01', '2024-07-01', 1300.00, 36),
(37, 'Auto Insurance', '2022-05-01', '2024-05-01', 1600.00, 37),
(38, 'Health Insurance', '2023-08-01', '2026-08-01', 1800.00, 38),
(39, 'Home Insurance', '2021-03-01', '2023-03-01', 2800.00, 39),
(40, 'Life Insurance', '2022-09-01', '2027-09-01', 4900.00, 40),
(41, 'Accident Insurance', '2023-04-01', '2024-04-01', 750.00, 41),
(42, 'Travel Insurance', '2022-08-01', '2023-08-01', 1050.00, 42),
(43, 'Home Insurance', '2023-09-01', '2024-09-01', 3300.00, 43),
(44, 'Life Insurance', '2024-06-01', '2030-06-01', 4500.00, 44),
(45, 'Health Insurance', '2022-07-01', '2023-07-01', 1350.00, 45),
(46, 'Auto Insurance', '2023-05-01', '2026-05-01', 1450.00, 46),
(47, 'Travel Insurance', '2024-02-01', '2025-02-01', 1000.00, 47),
(48, 'Home Insurance', '2023-04-01', '2025-04-01', 3000.00, 48),
(49, 'Life Insurance', '2022-10-01', '2028-10-01', 4600.00, 49),
(50, 'Health Insurance', '2024-01-01', '2025-01-01', 1400.00, 50);


INSERT INTO Hospital (HospitalID, HospitalName, Location)
VALUES
(1, 'City Hospital', 'Downtown'),
(2, 'General Hospital', 'North Avenue'),
(3, 'Saint Mary Hospital', 'East Blvd'),
(4, 'River Valley Hospital', 'West Side'),
(5, 'Greenwood Hospital', 'Greenwood Park'),
(6, 'Central Health Clinic', 'Downtown'),
(7, 'Sunrise Medical Center', 'South Side'),
(8, 'Blue Ridge Hospital', 'North Hills'),
(9, 'Mountainview Hospital', 'East Ridge'),
(10, 'Lakeside Clinic', 'Lakeside'),
(11, 'Willowbrook Hospital', 'Willowbrook'),
(12, 'Hope Medical Center', 'West Town'),
(13, 'Valley Health', 'East Side'),
(14, 'Northpoint Hospital', 'North District'),
(15, 'Southside Clinic', 'South District'),
(16, 'Oakwood Health Center', 'Oakwood'),
(17, 'Eastside Medical', 'East Point'),
(18, 'Pinecrest Clinic', 'West End'),
(19, 'Summit Hospital', 'North Summit'),
(20, 'Heritage Health', 'Heritage Lane'),
(21, 'Bayview Hospital', 'Bay Area'),
(22, 'Fairview Clinic', 'Fairview Rd'),
(23, 'Highland Hospital', 'Highland Park'),
(24, 'Parkland Medical Center', 'Parkland'),
(25, 'Bayshore Hospital', 'Bayshore Dr'),
(26, 'Hilltop Hospital', 'Hilltop'),
(27, 'Riverside Clinic', 'River Rd'),
(28, 'Skyline Medical', 'Skyline Ave'),
(29, 'Westwood Hospital', 'Westwood'),
(30, 'New Horizons Clinic', 'Downtown'),
(31, 'Broadway Hospital', 'Broadway'),
(32, 'Meadowview Health', 'Meadowview'),
(33, 'Liberty Hospital', 'Liberty Blvd'),
(34, 'Oceanview Medical', 'Oceanview Dr'),
(35, 'Cedarwood Clinic', 'Cedarwood'),
(36, 'Union Health', 'Union Square'),
(37, 'Garden Park Hospital', 'Garden Park'),
(38, 'Northgate Hospital', 'Northgate'),
(39, 'Seaside Health', 'Seaside'),
(40, 'Hillcrest Clinic', 'Hillcrest'),
(41, 'Evergreen Medical', 'Evergreen Lane'),
(42, 'Springfield Hospital', 'Springfield'),
(43, 'Clearwater Health', 'Clearwater'),
(44, 'Westlake Clinic', 'Westlake'),
(45, 'Ashwood Medical', 'Ashwood'),
(46, 'Brookfield Hospital', 'Brookfield'),
(47, 'Stonebridge Clinic', 'Stonebridge'),
(48, 'Lighthouse Medical', 'Lighthouse Point'),
(49, 'Ridgeview Hospital', 'Ridgeview'),
(50, 'Silver Oak Clinic', 'Silver Oak Blvd');


INSERT INTO Claim (ClaimID, PolicyID, ClaimDate, ClaimAmount, ClaimStatus, HospitalID, CustomerID)
VALUES 
(1, 1, '2023-01-15', 500.00, 'Approved', 1, 1),
(2, 2, '2023-02-20', 1000.00, 'Rejected', 2, 2),
(3, 3, '2023-03-25', 750.00, 'Approved', 3, 3),
(4, 4, '2023-04-05', 1200.00, 'Pending', 4, 4),
(5, 5, '2023-05-10', 850.00, 'Approved', 5, 5),
(6, 6, '2023-06-01', 400.00, 'Rejected', 6, 6),
(7, 7, '2023-07-15', 1500.00, 'Pending', 7, 7),
(8, 8, '2023-08-20', 900.00, 'Approved', 8, 8),
(9, 9, '2023-09-30', 600.00, 'Rejected', 9, 9),
(10, 10, '2023-10-05', 1150.00, 'Approved', 10, 10),
(11, 11, '2023-11-10', 700.00, 'Pending', 11, 11),
(12, 12, '2023-12-01', 1300.00, 'Rejected', 12, 12),
(13, 13, '2023-01-12', 950.00, 'Approved', 13, 13),
(14, 14, '2023-02-05', 1100.00, 'Pending', 14, 14),
(15, 15, '2023-03-15', 750.00, 'Approved', 15, 15),
(16, 16, '2023-04-01', 800.00, 'Rejected', 16, 16),
(17, 17, '2023-05-07', 900.00, 'Pending', 17, 17),
(18, 18, '2023-06-09', 850.00, 'Approved', 18, 18),
(19, 19, '2023-07-15', 600.00, 'Rejected', 19, 19),
(20, 20, '2023-08-20', 950.00, 'Pending', 20, 20),
(21, 21, '2023-09-30', 1000.00, 'Approved', 21, 21),
(22, 22, '2023-10-15', 1150.00, 'Rejected', 22, 22),
(23, 23, '2023-11-10', 700.00, 'Pending', 23, 23),
(24, 24, '2023-12-20', 950.00, 'Approved', 24, 24),
(25, 25, '2023-01-22', 750.00, 'Rejected', 25, 25),
(26, 26, '2023-02-14', 1100.00, 'Pending', 26, 26),
(27, 27, '2023-03-17', 850.00, 'Approved', 27, 27),
(28, 28, '2023-04-20', 1000.00, 'Pending', 28, 28),
(29, 29, '2023-05-15', 650.00, 'Approved', 29, 29),
(30, 30, '2023-06-18', 1300.00, 'Rejected', 30, 30),
(31, 31, '2023-07-21', 750.00, 'Approved', 31, 31),
(32, 32, '2023-08-22', 850.00, 'Pending', 32, 32),
(33, 33, '2023-09-12', 1200.00, 'Approved', 33, 33),
(34, 34, '2023-10-18', 800.00, 'Rejected', 34, 34),
(35, 35, '2023-11-21', 950.00, 'Pending', 35, 35),
(36, 36, '2023-12-25', 600.00, 'Approved', 36, 36),
(37, 37, '2023-01-14', 1300.00, 'Rejected', 37, 37),
(38, 38, '2023-02-17', 1100.00, 'Pending', 38, 38),
(39, 39, '2023-03-28', 1050.00, 'Approved', 39, 39),
(40, 40, '2023-04-15', 750.00, 'Rejected', 40, 40),
(41, 41, '2023-05-27', 1150.00, 'Pending', 41, 41),
(42, 42, '2023-06-19', 950.00, 'Approved', 42, 42),
(43, 43, '2023-07-30', 850.00, 'Rejected', 43, 43),
(44, 44, '2023-08-16', 1000.00, 'Approved', 44, 44),
(45, 45, '2023-09-28', 1250.00, 'Pending', 45, 45),
(46, 46, '2023-10-21', 600.00, 'Approved', 46, 46),
(47, 47, '2023-11-18', 850.00, 'Rejected', 47, 47),
(48, 48, '2023-12-22', 1000.00, 'Pending', 48, 48),
(49, 49, '2023-01-25', 750.00, 'Approved', 49, 49),
(50, 50, '2023-02-17', 1300.00, 'Rejected', 50, 50);



INSERT INTO Payments (PaymentID, PaymentDate, PaymentAmount, CustomerID)
VALUES
(1, '2023-02-15', 500.00, 1),
(2, '2023-04-10', 750.00, 2),
(3, '2023-06-15', 850.00, 3),
(4, '2023-09-01', 900.00, 4),
(5, '2023-11-05', 1150.00, 5),
(6, '2023-02-22', 950.00, 6),
(7, '2023-03-25', 750.00, 7),
(8, '2023-06-15', 850.00, 8),
(9, '2023-09-02', 950.00, 9),
(10, '2023-11-15', 1000.00, 10),
(11, '2023-02-10', 950.00, 11),
(12, '2023-05-15', 850.00, 12),
(13, '2023-08-10', 650.00, 13),
(14, '2023-07-15', 750.00, 14),
(15, '2023-12-10', 1200.00, 15),
(16, '2023-02-28', 600.00, 16),
(17, '2023-06-10', 1050.00, 17),
(18, '2023-10-15', 950.00, 18),
(19, '2023-11-12', 1000.00, 19),
(20, '2023-12-01', 600.00, 20),
(21, '2024-01-10', 850.00, 21),
(22, '2024-03-05', 750.00, 22),
(23, '2024-04-12', 1300.00, 23),
(24, '2023-01-20', 1000.00, 24),
(25, '2023-02-15', 1200.00, 25),
(26, '2023-03-10', 400.00, 26),
(27, '2023-04-25', 600.00, 27),
(28, '2023-05-30', 700.00, 28),
(29, '2023-06-15', 1300.00, 29),
(30, '2023-07-20', 1100.00, 30),
(31, '2023-08-05', 800.00, 31),
(32, '2023-09-10', 900.00, 32),
(33, '2023-10-25', 600.00, 33),
(34, '2023-11-15', 1150.00, 34),
(35, '2023-12-05', 700.00, 35),
(36, '2024-01-15', 750.00, 36),
(37, '2024-02-20', 1100.00, 37),
(38, '2024-03-25', 1000.00, 38),
(39, '2024-04-10', 1300.00, 39),
(40, '2024-05-30', 850.00, 40),
(41, '2024-06-20', 800.00, 41),
(42, '2024-07-10', 950.00, 42),
(43, '2024-08-15', 1300.00, 43),
(44, '2024-09-20', 1100.00, 44),
(45, '2024-10-05', 750.00, 45),
(46, '2024-11-15', 1150.00, 46),
(47, '2024-12-01', 850.00, 47),
(48, '2025-01-15', 1250.00, 48),
(49, '2025-02-25', 1000.00, 49),
(50, '2025-03-10', 1200.00, 50);




-- Retrieve all customers and their contact information
SELECT Name, ContactInfo, Address
FROM Customer;

-- Retrieve all insurance policies with premium amounts
SELECT PolicyType, PremiumAmount, StartDate, EndDate
FROM InsurancePolicy;

-- Retrieve all claims that are 'Approved'
SELECT ClaimID, ClaimAmount, ClaimDate, ClaimStatus
FROM Claim
WHERE ClaimStatus = 'Approved';

--  List all hospitals in the database
SELECT HospitalName, Location
FROM Hospital;

-- Retrieve all payments made for a specific customer
SELECT Payments.PaymentID, Payments.PaymentDate, Payments.PaymentAmount
FROM Customer
JOIN InsurancePolicy ON Customer.CustomerID = InsurancePolicy.CustomerID
JOIN Payments ON InsurancePolicy.PolicyID = Payments.PolicyID
WHERE Customer.CustomerID = 1;  -- For John Doe

-- List all customers along with the count of their associated active policies
SELECT c.CustomerID, c.name, COUNT(p.PolicyID) AS active_policy_count
FROM Customer c
LEFT JOIN InsurancePolicy p ON c.CustomerID = p.CustomerID
WHERE p.EndDate >= CURRENT_DATE
GROUP BY c.CustomerID, c.name;

-- List all policies associated with a specific customer
SELECT * FROM InsurancePolicy WHERE 1<CustomerID<50;

-- Get all active policies as of today
SELECT * FROM InsurancePolicy WHERE EndDate >= CURRENT_DATE;

-- Find the total claims filed by a particular customer
SELECT COUNT(*) FROM Claim WHERE 1<CustomerID<50;

-- List all claims submitted in the last month
SELECT * FROM Claim WHERE ClaimDate >= DATE_SUB(CURRENT_DATE, INTERVAL 1 MONTH);

-- Get details of all partnered hospitals
SELECT * FROM Hospital;

-- Find all claims processed by a specific hospital
SELECT * FROM Claim WHERE 1<HospitalID<50;

-- Retrieve all payment records for a specific policy
SELECT * FROM Payments WHERE 1<PolicyID<50;

-- List customers who have missed a payment
SELECT * FROM Customer c
JOIN InsurancePolicy p ON c.CustomerID = p.CustomerID
WHERE NOT EXISTS (
    SELECT 1 FROM Payments py WHERE py.PolicyID = p.PolicyID AND py.PaymentDate IS NOT NULL
);

-- List of types of policies
SELECT PolicyType FROM InsurancePolicy GROUP BY PolicyType;




-- Calculate the total claim amount per customer
SELECT Customer.Name, SUM(Claim.ClaimAmount) AS TotalClaimed
FROM Customer
JOIN InsurancePolicy ON Customer.CustomerID = InsurancePolicy.CustomerID
JOIN Claim ON InsurancePolicy.PolicyID = Claim.PolicyID
GROUP BY Customer.Name;

-- Retrieve all customers with policies that have expired
SELECT Customer.Name, InsurancePolicy.PolicyType, InsurancePolicy.EndDate
FROM Customer
JOIN InsurancePolicy ON Customer.CustomerID = InsurancePolicy.CustomerID
WHERE InsurancePolicy.EndDate < CURDATE();

-- Calculate the total premiums paid by each customer
SELECT Customer.Name, SUM(Payments.PaymentAmount) AS TotalPremiumsPaid
FROM Customer
JOIN InsurancePolicy ON Customer.CustomerID = InsurancePolicy.CustomerID
JOIN Payments ON InsurancePolicy.PolicyID = Payments.PolicyID
GROUP BY Customer.Name;

-- List all policies that have at least one pending claim
SELECT DISTINCT InsurancePolicy.PolicyID, InsurancePolicy.PolicyType, Claim.ClaimStatus
FROM InsurancePolicy
JOIN Claim ON InsurancePolicy.PolicyID = Claim.PolicyID
WHERE Claim.ClaimStatus = 'Pending';

-- Find the top 3 hospitals by the number of claims filed
SELECT Hospital.HospitalName, COUNT(Claim.ClaimID) AS ClaimCount
FROM Hospital
JOIN Claim ON Hospital.HospitalID = Claim.HospitalID
GROUP BY Hospital.HospitalName
ORDER BY ClaimCount DESC
LIMIT 3;

-- Calculate total premiums collected per policy type 
SELECT policytype, SUM(PremiumAmount) AS total_premium
FROM InsurancePolicy
GROUP BY policytype;

-- Find customers with multiple active policies
SELECT CustomerID, COUNT(*) AS active_policies
FROM InsurancePolicy
WHERE EndDate >= CURRENT_DATE
GROUP BY CustomerID
HAVING active_policies > 0;

-- Identify high-risk customers based on high claim frequency
SELECT CustomerID, COUNT(*) AS claim_count
FROM Claim
WHERE ClaimStatus = 'approved'
GROUP BY CustomerID;

-- Generate a report of the total amount approved and pending
SELECT ClaimStatus, 
       SUM(CASE WHEN claimstatus = 'approved' THEN claimamount ELSE 0 END) AS approved_amount,
       SUM(CASE WHEN claimstatus = 'pending' THEN claimamount ELSE 0 END) AS pending_amount
FROM Claim
GROUP BY ClaimStatus;

-- Analyze the average claim amount per hospital
SELECT HospitalID, AVG(claimamount) AS avg_claim_amount
FROM Claim
GROUP BY HospitalID;

-- Identify customers with expired policies who have pending claims
SELECT DISTINCT c.CustomerID, c.name
FROM Customer c
JOIN InsurancePolicy p ON c.CustomerID = p.CustomerID
JOIN Claim cl ON cl.PolicyID = p.PolicyID
WHERE p.enddate < CURRENT_DATE AND cl.claimstatus = 'pending';

-- Find hospitals with frequent claims (more than average)
SELECT hospitalid, COUNT(*) AS claim_count
FROM Claim
GROUP BY hospitalid
HAVING claim_count > (SELECT AVG(claim_count) FROM (SELECT hospitalid, COUNT(*) AS claim_count FROM Claim GROUP BY hospitalid) AS claim_counts);

-- Calculate total revenue generated by premium payments for each policy type
SELECT p.policytype, SUM(premiumamount) AS total_revenue
FROM Payments py
JOIN InsurancePolicy p ON py.policyid = p.policyid
GROUP BY p.policytype;

-- Identify hospitals with a high average claim amount
SELECT hospitalid, AVG(claimamount) AS avg_claim_amount
FROM Claim
GROUP BY hospitalid
HAVING avg_claim_amount > 1000;

-- Find the top 3 hospitals with the most claims in the past year
SELECT hospitalid, COUNT(*) AS claim_count
FROM Claim
WHERE claimdate >= DATE_SUB(CURRENT_DATE, INTERVAL 1 YEAR)
GROUP BY hospitalid
ORDER BY claim_count DESC
LIMIT 3;

-- Calculate premium due for a customer
SELECT calculate_premium_due(1) as result;

-- Get the total claims approved for a customer
SELECT get_total_claims_approved(1) as result; 

-- Calculate average claim amount per hospital
SELECT avg_claim_amount(1) as result;

-- Get customer payment status
SELECT payment_status(1) as result;

-- Get count of active policies for a customer
SELECT active_policies_count(1) as result;

-- Insert a new customer
call insert_customer(51, 'DD', '1234455678', 'South City');

-- Update policy status based on expiration date
call update_polici_status();

-- Process a claim
call process_claim(1, 'Approved');

-- Generate a summary report for all claims in a period
call summary_report('2023-11-11' , '2025-01-01');

-- Insert a payment record
call insert_payment(51, 120000, '2024-11-11');

-- View of all active policies
select* from activepolicies;

-- Customer Payment Summary
select* from customerpaymentsummary;

-- Claims Pending Approval
select* from pendingclaims;

-- Frequent Claim Hospitals
select* from frequentclaimhospitals;

-- High Premium Policies
select* from highpremiumpolicies;