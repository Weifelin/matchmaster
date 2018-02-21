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


  -- Account number, account creation date same as profile id.
  CreditCardNum CHAR(16),
  CHECK (CreditCardNum LIKE '[0-9]{16}'),
  CreditCardExp CHAR(7),
  CHECK (CreditCardExp LIKE '[0-9]{2}/[0-9]{4}'),
  Rating DECIMAL,
  LastActiveDate DATE,
  CHECK (0 <= (SELECT COUNT(*) FROM User) ),
  FOREIGN KEY (PersonID) REFERENCES Person(PersonID)
    ON DELETE NO ACTION
    ON UPDATE CASCADE ,
  PRIMARY KEY (PersonID),
  UNIQUE KEY (Username)
);

CREATE TABLE Account (
  AccountNum INTEGER NOT NULL ,
  UserID    CHAR(24) NOT NULL ,
  AccountName CHAR(10) DEFAULT 'Default',
  AccountCreationDate DATE NOT NULL ,
  CHECK ((SELECT COUNT(*) FROM User) <= (SELECT COUNT(*) FROM Account)),
  FOREIGN KEY (UserID) REFERENCES User(Username)
    ON UPDATE CASCADE
    ON DELETE CASCADE ,
  PRIMARY KEY (UserID, AccountNum)
);

CREATE TABLE Profile (
  ProfileID INTEGER NOT NULL ,
  UserID    CHAR(24) NOT NULL,
  AccountNum INTEGER NOT NULL ,
  ProfileName CHAR(24),
  Age INTEGER,
  Gender CHAR(10) DEFAULT 'NotToTell',
  Rating DECIMAL,
  CHECK (Gender IN ('NotToTell', 'Male', 'Female')),
  -- physical, hobbies, photos char will be in another table.
  DateGeoRange DECIMAL,
  DateAgeMin INTEGER,
  DateAgeMax INTEGER,
  Height INTEGER,
  Weight DECIMAL,
  HairColor CHAR(25),
  EyeColor CHAR(20),
  Race CHAR(20),
  ProfilePlacementPriority CHAR(4) DEFAULT 'dflt',
  CHECK (ProfilePlacementPriority IN ('High', 'Mid', 'dflt')),
  CHECK (DateAgeMin>16),
  CHECK ((SELECT COUNT(*) FROM User) <= (SELECT COUNT(*) FROM Profile)),
  FOREIGN KEY (UserID) REFERENCES User(Username)
    ON UPDATE CASCADE
    ON DELETE CASCADE ,
  FOREIGN KEY (AccountNum) REFERENCES Account (AccountNum)
    ON UPDATE CASCADE
    ON DELETE CASCADE ,
  PRIMARY KEY (ProfileID)
);

CREATE TABLE Hobby (
  ProfileId INTEGER NOT NULL,
  Hobby CHAR(50),
  FOREIGN KEY (ProfileId) REFERENCES Profile (ProfileID)
    ON UPDATE CASCADE
    ON DELETE CASCADE ,
  PRIMARY KEY (ProfileId, Hobby)
);



CREATE TABLE Photo
(
    ProfileID INTEGER NOT NULL,
    PhotoPath VARCHAR(512),
    FOREIGN KEY (ProfileID) REFERENCES Profile (ProfileID)
      ON UPDATE CASCADE
      ON DELETE CASCADE ,
    PRIMARY KEY (ProfileID, PhotoPath)
);

CREATE TABLE Employee(
  EmployeeId INTEGER NOT NULL ,
  StartDate DATE,
  HourlyRate DECIMAL,
  SSN INT,
  EmpType ENUM('Manager', 'Customer Representative') DEFAULT 'Customer Representative' NOT NULL,
  FOREIGN KEY (EmployeeId) REFERENCES Person(PersonID)
    ON UPDATE CASCADE
    ON DELETE CASCADE ,
  PRIMARY KEY (EmployeeId)
);



CREATE TABLE Date(
  DateId INTEGER NOT NULL ,
  ProfileAId INTEGER NOT NULL ,
  ProfileBId INTEGER NOT NULL ,
  CHECK (
    ProfileAId <> ProfileBId AND
    (SELECT P.UserID FROM Profile P WHERE ProfileAId = P.ProfileID) <>
    (SELECT P.UserID FROM Profile P WHERE ProfileBId = P.ProfileID)
  ),

  Date DATE,
  GeoLocation CHAR(100),
  BookingFee DECIMAL,
  CustomerRepresentative INTEGER NOT NULL ,
  CommentfromA VARCHAR(280),
  CommentfromB VARCHAR(280),
  User1Rating INTEGER,
  User2Rating INTEGER,
  CHECK(User1Rating IN (1,2,3,4,5)),
  CHECK(User2Rating IN (1,2,3,4,5)),
  FOREIGN KEY (ProfileAId) REFERENCES Profile (ProfileID)
    ON UPDATE CASCADE
    ON DELETE SET NULL ,
  FOREIGN KEY (ProfileBId) REFERENCES Profile (ProfileID)
     ON UPDATE CASCADE
     ON DELETE SET NULL ,
  FOREIGN KEY (CustomerRepresentative) REFERENCES Employee(EmployeeId)
     ON UPDATE CASCADE
     ON DELETE NO ACTION ,
  PRIMARY KEY (DateId)
);


CREATE TABLE Likes(
  LikerId INTEGER NOT NULL,
  LikeeId INTEGER NOT NULL,
  Date DATE,
  -- self like enabled,
  FOREIGN KEY (LikerId) REFERENCES Profile (ProfileID),
  FOREIGN KEY (LikeeId) REFERENCES Profile (ProfileID),
  PRIMARY KEY (LikerId, LikeeId)
);

CREATE TABLE Referral(
  ReferrerId INTEGER NOT NULL ,
  RefereeAId INTEGER NOT NULL ,
  RefereeBId INTEGER NOT NULL,
  Date DATE,
  FOREIGN KEY (ReferrerId) REFERENCES Profile (ProfileID)
    ON UPDATE CASCADE
     ON DELETE SET NULL ,
  FOREIGN KEY (RefereeAId) REFERENCES Profile (ProfileID)
    ON UPDATE CASCADE
     ON DELETE SET NULL ,
  FOREIGN KEY (RefereeBId) REFERENCES Profile (ProfileID)
    ON UPDATE CASCADE
     ON DELETE CASCADE ,
  CHECK (RefereeAId <> RefereeBId <> ReferrerId),
  PRIMARY KEY (RefereeBId, RefereeAId, ReferrerId)
);

