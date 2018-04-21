START TRANSACTION;
INSERT INTO Person (SSN, Password, FirstName, LastName, Street, City, State, Zipcode, Email, Telephone)
VALUES(?,?,?,?,?,?,?,?,?,?);
INSERT INTO Employee (SSN, Role, StartDate, HourlyRate) VALUES (?, ?, NOW(), ?);
COMMIT;