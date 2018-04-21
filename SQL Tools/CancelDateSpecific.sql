DELETE FROM Date
  WHERE ((Profile1 = 'Brenna_Berlin' AND Profile2 = 'VazquezFromAlajuela')
  OR (Profile2 = 'Brenna_Berlin' AND Profile1 = 'VazquezFromAlajuela')) 
  AND Date_Time = '2014-10-06 05:34:04';
  