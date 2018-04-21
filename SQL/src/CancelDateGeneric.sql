DELETE FROM Date
  WHERE ((Profile1 = '?=' AND Profile2 = '?=')
  OR (Profile2 = '?=' AND Profile1 = '?=')) 
  AND Date_Time = '?='; 