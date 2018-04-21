SELECT P.SSN, P.FirstName, P.LastName, U.Rating
FROM Person P, User U
WHERE P.SSN=U.SSN
ORDER BY Rating DESC LIMIT 5;