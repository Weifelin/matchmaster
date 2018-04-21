CREATE TEMPORARY TABLE Report AS
SELECT CONCAT_WS(', ', CR.LastName, CR.FirstName) AS CustRep,
  CONCAT_WS(', ', P1.LastName, P1.FirstName) AS U1Name,
  CONCAT_WS(', ', P2.LastName, P2.FirstName) AS U2Name,
  D.BookingFee
  FROM Date D, Person P1, Person P2, Person CR, Profile Pr1, Profile Pr2
  WHERE
    ((P1.FirstName=? AND P1.LastName=?)
     OR (P2.FirstName=? AND P2.LastName=?)) AND
      P1.SSN=Pr1.OwnerSSN AND
      P2.SSN=Pr2.OwnerSSN AND
      CR.SSN=D.CustRep AND
      Pr1.ProfileID=D.Profile1 AND
      Pr2.ProfileID=D.Profile2;
SELECT * FROM Report;
SELECT SUM(BookingFee) AS TotalRevenue FROM Report;
DROP TABLE Report;