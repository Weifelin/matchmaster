SELECT P.SSN, P.FirstName, P.LastName
FROM Person P, Profile Pr
WHERE P.SSN=Pr.OwnerSSN AND Pr.ProfileID IN
            (
            SELECT Pr2.ProfileID
            FROM Profile Pr2, Profile Pr3, Person P2, Date D
            WHERE Pr3.OwnerSSN=P2.SSN AND P2.FirstName=? AND P2.LastName=? AND (
              (Pr2.ProfileID = D.Profile1 AND Pr3.ProfileID=D.Profile2) OR
              (Pr2.ProfileID = D.Profile2 AND Pr3.ProfileID=D.Profile1)
            )
            );