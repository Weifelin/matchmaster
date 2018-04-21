CREATE TEMPORARY TABLE Activity AS
(SELECT Pr.OwnerSSN AS Pers, COUNT(*) AS count
FROM Date D, Profile Pr
  WHERE D.Profile1=Pr.ProfileID
GROUP BY Pr.OwnerSSN)
UNION ALL
(SELECT Pr.OwnerSSN AS Pers, COUNT(*) AS count
FROM Date D, Profile Pr
  WHERE D.Profile2=Pr.ProfileID
GROUP BY Pr.OwnerSSN)
UNION ALL
(SELECT Pr.OwnerSSN AS Pers, COUNT(*) AS count
FROM Likes L, Profile Pr
  WHERE L.Liker=Pr.ProfileID
GROUP BY Pr.OwnerSSN)
UNION ALL
(SELECT Pr.OwnerSSN AS Pers, COUNT(*) AS count
FROM BlindDate R, Profile Pr
  WHERE R.ProfileA=Pr.ProfileID
GROUP BY Pr.OwnerSSN);

SELECT A.Pers, SUM(A.count)
FROM Activity A
GROUP BY A.Pers
ORDER BY SUM(A.count) DESC
LIMIT 5;