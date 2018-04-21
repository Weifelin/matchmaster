SELECT P.SSN, P.LastName, P.FirstName,
  P.Street, P.City, P.State, P.Zipcode,
  P.Email, P.Telephone,
  U.PPP AS UserType, U.Rating, U.DateOfLastAct AS LastActive
FROM Person P, User U
WHERE P.SSN=U.SSN;