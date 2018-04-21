UPDATE Person
	SET Password='999@99',
    FirstName='Desirae',
    LastName='Berg',
    Street='45 Rockefeller Plaza',
    City='New York',
    State='New York',
    Zipcode=10111,
    Email='vitae@magnased.com',
    Telephone='(237) 888-8888'
    WHERE SSN = '999-99-9999';
UPDATE User
    SET PPP='Super-User',
    Rating='5',
    DateOfLastAct=CURRENT_TIMESTAMP
    WHERE SSN = '999-99-9999';
    