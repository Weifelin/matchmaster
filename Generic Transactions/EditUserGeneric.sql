UPDATE #Person
	SET Password='?=',
    FirstName='?=',
    LastName='?=',
    Street='?=',
    City='?=',
    State='?=',
    Zipcode='?=',
    Email='?=',
    Telephone='?='
    WHERE SSN = '?=';
UPDATE #User
    SET PPP='?=',
    Rating='?=',
    DateOfLastAct=CURRENT_TIMESTAMP
    WHERE SSN = '?=';
    