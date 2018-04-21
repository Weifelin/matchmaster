CREATE TEMPORARY TABLE Report AS
#Customer Rep earnings from dates
  SELECT P.SSN AS Identifier, P.LastName, COUNT(D.Date_Time) AS NumDates, SUM(D.BookingFee) AS Earned
  FROM Person P, Employee E, Date D
  WHERE P.SSN=E.SSN AND (YEAR(D.Date_Time)=? AND MONTH(D.Date_Time)=?) AND D.CustRep=E.SSN
  GROUP BY P.SSN;
#Super user fees
INSERT INTO Report(Identifier, LastName, NumDates, Earned) VALUES (
    'PPP', 'Super-User', (SELECT COUNT(U.SSN) FROM User U WHERE U.PPP='Super-User'), 100*NumDates
);
# Good-User
INSERT INTO Report(Identifier, LastName, NumDates, Earned) VALUES (
    'PPP', 'Good-User', (SELECT COUNT(U.SSN) FROM User U WHERE U.PPP='Good-User'), 50*NumDates
);
#Free-User
INSERT INTO Report(Identifier, LastName, NumDates, Earned) VALUES (
    'PPP', 'User-User', (SELECT COUNT(U.SSN) FROM User U WHERE U.PPP='User-User'), 0
);
#Totals
INSERT INTO Report(Identifier, LastName, NumDates, Earned) VALUES (
    'Total', '', 0, (SELECT SUM(R.Earned) FROM Report R)
);
SELECT * FROM Report;
DROP TABLE Report;