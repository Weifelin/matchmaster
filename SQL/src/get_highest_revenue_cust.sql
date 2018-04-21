CREATE TEMPORARY TABLE Temp AS
SELECT P.SSN AS Identifier, P.FirstName, P.LastName, SUM(D.BookingFee) AS Revenue
  FROM Person P, Date D, Profile Pr
  WHERE P.SSN=Pr.OwnerSSN AND (Pr.ProfileID=D.Profile1 OR Pr.ProfileID=D.Profile2)
  GROUP BY P.SSN;
SELECT *
FROM Temp
WHERE Revenue=(SELECT MAX(Revenue) FROM Temp);
DROP TABLE Temp;