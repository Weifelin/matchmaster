SELECT DATE(D.Date_Time) AS CalendarDate,
  CONCAT_WS(', ', P1.LastName, P1.FirstName) AS U1Name,
  CONCAT_WS(', ', P2.LastName, P2.FirstName) AS U2Name,
  CONCAT_WS(', ', CR.LastName, CR.FirstName) AS CustRep,
  DATE(D.Date_Time) AS CalendarDate,
  D.Location,
  D.BookingFee,
  D.User1Rating,
  D.User2Rating,
  D.Comments
FROM Date D, Profile Pr1, Profile Pr2, Person P1, Person P2, Person CR
WHERE D.Profile1=Pr1.ProfileID AND
  D.Profile2=Pr2.ProfileID AND
  D.CustRep=CR.SSN AND
  Pr1.OwnerSSN=P1.SSN AND
  Pr2.OwnerSSN=P2.SSN AND
      ((P1.FirstName=? AND P1.LastName=?)
       OR (P2.FirstName=? AND P2.LastName=?));