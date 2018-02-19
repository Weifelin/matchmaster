

CREATE TABLE User(
  UserID    CHAR(24) NOT NULL,
  LastName  CHAR(15) NOT NULL ,
  FirstName CHAR(15) NOT NULL ,
  Address   CHAR(50),
  City      CHAR(20),
  State     CHAR(15),
  -- ProfileId,
  -- we don't need this in user schema,
  -- just like person hobby example. User and its profile Id are connected by the profile schema with combination of
  -- userid and profileid as primary key.
  ZipCode   CHAR(11),
  Email     CHAR(50) NOT NULL ,
  -- Account number, account creation date same as profile id.
  CreditCardNum INTEGER,
  ProfilePlacementPriority CHAR(5) DEFAULT 'dflt',
  Rating INTEGER,
  LastActiveDate DATE,
  CHECK (ProfilePlacementPriority IN ('High', 'Mid', 'dflt')),
  CHECK (0 <= (SELECT COUNT(*) FROM User) ),
  PRIMARY KEY (UserID)
);

CREATE TABLE Accounts(
  AccountNum INTEGER NOT NULL ,
  UserID    CHAR(24) NOT NULL ,
  AccountCreationDate DATE NOT NULL ,
  CHECK ((SELECT COUNT(*) FROM User) <= (SELECT COUNT(*) FROM Accounts)),
  FOREIGN KEY (UserID) REFERENCES User(UserID),
  PRIMARY KEY (UserID, AccountNum)
);

CREATE TABLE Profiles(
  ProfileID INTEGER NOT NULL ,
  UserID    CHAR(24) NOT NULL,
  ProfileName CHAR(24),
  Age INTEGER,
  Address   CHAR(50),
  City      CHAR(20),
  State     CHAR(15),
  Gender CHAR(10) DEFAULT 'NotToTell',
  CHECK (Gender IN ('NotToTell', 'Male', 'Female')),
  -- physical, hobbies, photos char will be in another table.
  DateGeoRange DECIMAL,
  DateAgeMin INTEGER,
  DateAgeMax INTEGER,
  CHECK (DateAgeMin>16),
  CHECK ((SELECT COUNT(*) FROM User) <= (SELECT COUNT(*) FROM Profiles)),
  FOREIGN KEY (UserID) REFERENCES User(UserID),
  PRIMARY KEY (UserID, ProfileID)
);

CREATE TABLE Hobbies(
  UserID INTEGER NOT NULL,
  Hobby CHAR(20),
  FOREIGN KEY (UserID) REFERENCES User(UserID),
  PRIMARY KEY (UserID, Hobby)
);

CREATE TABLE PhysicalChar(
  UserID INTEGER NOT NULL,
  PhysicalChar CHAR(20),
  FOREIGN KEY (UserID) REFERENCES User(UserID),
  PRIMARY KEY (UserID, PhysicalChar)
);

CREATE TABLE Photos(
  UserID INTEGER NOT NULL,
  Photo LONGBLOB,
  FOREIGN KEY (UserID) REFERENCES User(UserID),
  PRIMARY KEY (UserID, Photo)
);

CREATE TABLE Employee(
  EmployeeID INTEGER NOT NULL AUTO_INCREMENT,
  StartDate DATE,
  HourlyRate DECIMAL,
  SSN INT,
  LastName CHAR(15) NOT NULL ,
  FirstName CHAR(15) NOT NULL ,
  Address CHAR(50),
  City CHAR(20),
  State CHAR(15),
  ZipCode CHAR(11),
  Telephone INTEGER,
  EmployeeType CHAR(5) DEFAULT 'Rglr',
  CHECK (EmployeeType IN ('Mngr', 'Rglr')),
  PRIMARY KEY (EmployeeID)
);
