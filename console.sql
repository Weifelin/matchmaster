-- Weifeng Lin
-- Ian Buitenkant
-- Andrew Jaffie

CREATE TABLE Person(
  PersonID INTEGER NOT NULL ,
  LastName  CHAR(15) NOT NULL ,
  FirstName CHAR(15) NOT NULL ,
  Address   CHAR(50),
  City      CHAR(20),
  State     CHAR(15),
  ZipCode   CHAR(11),
  Email     CHAR(50) NOT NULL ,
  Telephone INTEGER,
  CHECK (Email LIKE '.*@.*'),
  CHECK (ZipCode LIKE '^[0-9]*$'),
  PRIMARY KEY (PersonID)
);



CREATE TABLE User( -- user is customer
  Username CHAR(24) NOT NULL,
  PersonID INTEGER NOT NULL ,
  -- ProfileId,
  -- we don't need this in user schema,
  -- just like person hobby example. User and its profile Id are connected by the profile schema with combination of
  -- userid and profileid as primary key.


  -- Account number, account creation date same as profile id.
  CreditCardNum CHAR(16),
  CHECK (CreditCardNum LIKE '[0-9]{16}'),
  CreditCardExp CHAR(7),
  CHECK (CreditCardExp LIKE '[0-9]{2}/[0-9]{4}'),
  -- ProfilePlacementPriority CHAR(4) DEFAULT 'dflt',
  Rating DECIMAL,
  LastActiveDate DATE,
  -- CHECK (ProfilePlacementPriority IN ('High', 'Mid', 'dflt')),
  CHECK (0 <= (SELECT COUNT(*) FROM User) ),
  FOREIGN KEY (PersonID) REFERENCES Person(PersonID)
    ON DELETE NO ACTION
    ON UPDATE CASCADE ,
  PRIMARY KEY (PersonID),
  UNIQUE KEY (Username)
);

CREATE TABLE Accounts(
  AccountNum INTEGER NOT NULL ,
  UserID    CHAR(24) NOT NULL ,
  AccountName CHAR(10) DEFAULT 'Default',
  AccountCreationDate DATE NOT NULL ,
  CHECK ((SELECT COUNT(*) FROM User) <= (SELECT COUNT(*) FROM Accounts)),
  FOREIGN KEY (UserID) REFERENCES User(Username)
    ON UPDATE CASCADE
    ON DELETE CASCADE ,
  PRIMARY KEY (UserID, AccountNum)
);

CREATE TABLE Profiles(
  ProfileID INTEGER NOT NULL ,
  UserID    CHAR(24) NOT NULL,
  AccountNum INTEGER NOT NULL ,
  ProfileName CHAR(24),
  Age INTEGER,
  -- Address   CHAR(50),
  -- City      CHAR(20),
  -- State     CHAR(15),
  Gender CHAR(10) DEFAULT 'NotToTell',
  Rating DECIMAL,
  CHECK (Gender IN ('NotToTell', 'Male', 'Female')),
  -- physical, hobbies, photos char will be in another table.
  DateGeoRange DECIMAL,
  DateAgeMin INTEGER,
  DateAgeMax INTEGER,
  ProfilePlacementPriority CHAR(4) DEFAULT 'dflt',
  CHECK (ProfilePlacementPriority IN ('High', 'Mid', 'dflt')),
  CHECK (DateAgeMin>16),
  CHECK ((SELECT COUNT(*) FROM User) <= (SELECT COUNT(*) FROM Profiles)),
  FOREIGN KEY (UserID) REFERENCES User(Username)
    ON UPDATE CASCADE
    ON DELETE CASCADE ,
  FOREIGN KEY (AccountNum) REFERENCES Accounts(AccountNum)
    ON UPDATE CASCADE
    ON DELETE CASCADE ,
  PRIMARY KEY (ProfileID)
);

CREATE TABLE Hobbies(
  ProfileId INTEGER NOT NULL,
  Hobby CHAR(20),
  FOREIGN KEY (ProfileId) REFERENCES Profiles(ProfileID)
    ON UPDATE CASCADE
    ON DELETE CASCADE ,
  PRIMARY KEY (ProfileId, Hobby)
);

CREATE TABLE PhysicalChar(
  ProfileID INTEGER NOT NULL,
  PhysicalChar CHAR(20),
  FOREIGN KEY (ProfileID) REFERENCES Profiles(ProfileID)
    ON UPDATE CASCADE
    ON DELETE CASCADE ,
  PRIMARY KEY (ProfileID, PhysicalChar)
);

CREATE TABLE Photos
(
    ProfileID INTEGER NOT NULL,
    PhotoPath VARCHAR(512),
    FOREIGN KEY (ProfileID) REFERENCES Profiles (ProfileID)
      ON UPDATE CASCADE
      ON DELETE CASCADE ,
    PRIMARY KEY (ProfileID, PhotoPath)
);

CREATE TABLE Employee(
  -- EmployeeID INTEGER NOT NULL,
  EmployeeId INTEGER NOT NULL ,
  StartDate DATE,
  -- HourlyRate DECIMAL,
  SSN INT,
  -- LastName CHAR(15) NOT NULL ,
  -- FirstName CHAR(15) NOT NULL ,
  -- Address CHAR(50),
  -- City CHAR(20),
  -- State CHAR(15),
  -- ZipCode CHAR(11),
  -- CHECK (ZipCode LIKE '^[0-9]*$'),

  -- EmployeeType CHAR(5) DEFAULT 'Rglr',
  -- CHECK (EmployeeType IN ('Mngr', 'Rglr')),
  FOREIGN KEY (EmployeeId) REFERENCES Person(PersonID)
    ON UPDATE CASCADE
    ON DELETE CASCADE ,
  PRIMARY KEY (EmployeeId)
);

CREATE TABLE Manager(
  ManagerId INTEGER NOT NULL ,
  HourlyRate DECIMAL NOT NULL ,
  FOREIGN KEY (ManagerId) REFERENCES Employee(EmployeeId)
    ON DELETE CASCADE
    ON UPDATE CASCADE ,
  PRIMARY KEY (ManagerId)
);

CREATE TABLE Cust_Rep(
  Rep_Id INTEGER NOT NULL ,
  HourlyRate DECIMAL NOT NULL ,
  FOREIGN KEY (Rep_Id) REFERENCES Employee(EmployeeId)
    ON UPDATE CASCADE
    ON DELETE CASCADE ,
  PRIMARY KEY (Rep_Id)
);

CREATE TABLE Date(
  DateId INTEGER NOT NULL ,
  -- User1Id CHAR(24) NOT NULL ,
  -- User2Id CHAR(24) NOT NULL ,
  ProfileAId INTEGER NOT NULL ,
  ProfileBId INTEGER NOT NULL ,
  CHECK (
    ProfileAId <> ProfileBId AND
    (SELECT P.UserID FROM Profiles P WHERE ProfileAId = P.ProfileID) <>
    (SELECT P.UserID FROM Profiles P WHERE ProfileBId = P.ProfileID)
  ),

  Date DATE,
  GeoLocation CHAR(100),
  BookingFee DECIMAL,
  CustomerRepresentative INTEGER NOT NULL ,
  Comment LONGBLOB,
  User1Rating INTEGER,
  User2Rating INTEGER,
  CHECK(User1Rating IN (1,2,3,4,5)),
  CHECK(User2Rating IN (1,2,3,4,5)),
  -- CHECK (User1Id <> User2Id),
  -- FOREIGN KEY (User1Id) REFERENCES User(UserID),
  -- FOREIGN KEY (User2Id) REFERENCES User(UserID),
  FOREIGN KEY (ProfileAId) REFERENCES Profiles(ProfileID)
    ON UPDATE CASCADE
    ON DELETE SET NULL ,
  FOREIGN KEY (ProfileBId) REFERENCES Profiles(ProfileID)
     ON UPDATE CASCADE
     ON DELETE SET NULL ,
  FOREIGN KEY (CustomerRepresentative) REFERENCES Cust_Rep(Rep_Id)
     ON UPDATE CASCADE
     ON DELETE NO ACTION ,
  PRIMARY KEY (DateId)
);


CREATE TABLE Likes(
  LikerId INTEGER NOT NULL,
  LikeeId INTEGER NOT NULL,
  Date DATE,
  -- self like enabled,
  FOREIGN KEY (LikerId) REFERENCES Profiles(ProfileID),
  FOREIGN KEY (LikeeId) REFERENCES Profiles(ProfileID),
  PRIMARY KEY (LikerId, LikeeId)
);

CREATE TABLE Referral(
  ReferrerId INTEGER NOT NULL ,
  RefereeAId INTEGER NOT NULL ,
  RefereeBId INTEGER NOT NULL,
  Date DATE,
  FOREIGN KEY (ReferrerId) REFERENCES Profiles(ProfileID)
    ON UPDATE CASCADE
     ON DELETE SET NULL ,
  FOREIGN KEY (RefereeAId) REFERENCES Profiles(ProfileID)
    ON UPDATE CASCADE
     ON DELETE SET NULL ,
  FOREIGN KEY (RefereeBId) REFERENCES Profiles(ProfileID)
    ON UPDATE CASCADE
     ON DELETE CASCADE ,
  CHECK (RefereeAId <> RefereeBId <> ReferrerId),
  PRIMARY KEY (RefereeBId, RefereeAId, ReferrerId)
);

