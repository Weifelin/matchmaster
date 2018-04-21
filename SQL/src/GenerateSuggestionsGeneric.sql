SELECT P.ProfileID
  FROM Profile P, Date D
    WHERE (P.ProfileID = D.Profile1 AND D.Profile2 = '?=') OR (P.ProfileID = D.Profile2 AND D.Profile1 = '?=');
    