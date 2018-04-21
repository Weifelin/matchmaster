START TRANSACTION;
UPDATE Employee, Person SET Role=?, HourlyRate=?, Password=?, Street=?, City=?, State=?, Zipcode=?, Email=?, Telephone=?
  WHERE Person.SSN=Employee.SSN AND Person.SSN=?;
COMMIT;