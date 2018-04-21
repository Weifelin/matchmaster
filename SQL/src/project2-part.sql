-- Produce a list of the highest-rated calendar dates to have a date on
SELECT DATE_FORMAT(D.Date_Time, '%m-%d') AS Day, COUNT(DAY(D.Date_Time)) AS Date_Occurance
FROM Date D
GROUP BY DATE_FORMAT(D.Date_Time, 'Y%-%m-%d')
ORDER BY Date_Occurance DESC
LIMIT 1;

-- a profile's pending dates
SELECT D.Profile1, D.Profile2, D.Date_Time
FROM Date D
WHERE (D.Profile1 = '?=' OR D.Profile1 = '?=') AND -- ProfileID is the parameter
  D.Date_Time > CURRENT_DATE;


-- a profile's past dates
SELECT D.Profile1, D.Profile2, D.Date_Time
FROM Date D
WHERE (D.Profile1 = '?=' OR D.Profile1 = '?=') AND -- ProfileID is the parameter
  D.Date_Time < CURRENT_DATE;


-- a profile's favorites list (based on "likes")
SELECT L.Likee
FROM Likes L
WHERE L.Liker = '?='; -- ?= is The ProfileID


-- Search for profiles based on physical characteristics, location, etc.
-- location based
SELECT Pf.ProfileID
FROM Profile Pf,  Person Ps
WHERE Ps.SSN = Pf.OwnerSSN AND Ps.City = '?='; -- The parameter is the city name.

-- gender based
SELECT P.ProfileID
FROM Profile P
WHERE P.M_F = '?='; -- gender: Male/Female is the parameter

-- Age Based
SELECT P.ProfileID
FROM Profile P
WHERE P.Age >= '?=' AND P.Age <= '?='; -- The first ?= is the minimal age and the second one is maximum.

-- Height based
SELECT P.ProfileID
FROM Profile P
WHERE P.Height >= '?=' AND P.Height <= '?='; -- The first ?= is the minimal height and the second one is maximum.

-- Weight Based
SELECT P.ProfileID
FROM Profile P
WHERE P.Weight >= '?=' AND P.Weight <= '?=';  -- The first ?= is the minimal Weight and the second one is maximum.

SELECT P.ProfileID
FROM Profile P
WHERE P.HairColor = '?='; -- hair color is the parameter


-- Most active profiles
-- SELECT P.ProfileID
-- FROM Profile P, Date D, Likes L, Referral R
-- WHERE P.ProfrileID IN


-- SELECT  P.ProfileID, COUNT(D.Profile1)+COUNT(D.Profile2)+COUNT(L.Liker)+COUNT(R.ProfileA) AS active
--        FROM  Profile P, Date D, Likes L, BlindDate R
--        WHERE (D.Profile1 = L.Liker = R.ProfileA = P.ProfileID) OR (D.Profile2 = L.Liker = R.ProfileA = P.ProfileID)
--        ORDER BY active DESC

CREATE TEMPORARY TABLE actives AS
(SELECT D.Profile1 AS Profile, COUNT(*) AS count
FROM Date D
GROUP BY D.Profile1)
UNION ALL
(SELECT D.Profile2 AS Profile, COUNT(*) AS count
FROM Date D
GROUP BY D.Profile2)
UNION ALL
(SELECT L.Liker AS Profile, COUNT(*) AS count
FROM Likes L
GROUP BY L.Liker)
UNION ALL
(SELECT R.ProfileA AS Profile, COUNT(*) AS count
FROM BlindDate R
GROUP BY R.ProfileA);

SELECT A.Profile, SUM(A.count)
FROM actives A
GROUP BY A.Profile
ORDER BY SUM(A.count) DESC
LIMIT 1;
-- Most highly rated profiles

CREATE TEMPORARY TABLE temp3 AS
(SELECT D.Profile1 AS Profile, AVG(USER1Rating) AS rating
FROM Date D
GROUP BY D.Profile1)
UNION ALL
(SELECT D.Profile2 AS Profile, AVG(USER2Rating) AS rating
FROM Date D
GROUP BY D.Profile2);

SELECT V.Profile, AVG(V.rating)
FROM temp3 V
GROUP BY V.Profile
ORDER BY AVG(V.Rating) DESC
LIMIT 5;

-- Popular geo-date locations
SELECT D.Location, COUNT(*)
FROM Date D
GROUP BY D.Location
ORDER BY COUNT(*) DESC
LIMIT 1;

-- Personalized date suggestion list
SELECT P.ProfileID
FROM Profile P, Date D
WHERE(P.ProfileID = D.Profile1 AND D.Profile2 = '?=') OR (P.ProfileID = D.Profile2 AND D.Profile1 = '?=');
