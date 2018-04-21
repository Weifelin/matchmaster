CREATE TEMPORARY TABLE Temp AS
SELECT P.SSN, P.FirstName, P.LastName, COUNT(D.Date_Time) AS NumDates, SUM(D.BookingFee) AS Earned
  FROM Person P, Employee E, Date D
  WHERE P.SSN=E.SSN AND D.CustRep=E.SSN
  GROUP BY P.SSN;
SELECT *
FROM Temp
WHERE Earned=(SELECT MAX(Earned) FROM Temp);
DROP TABLE Temp;