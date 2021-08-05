

DROP TABLE if exists UserLog;
DROP TABLE if exists Status;
DROP TABLE if exists GraveYard;
DROP TABLE if exists PayMethod;
DROP TABLE if exists Questions;
DROP TABLE if exists Currency;
DROP TABLE if exists Transactions;
DROP TABLE if exists Ratings;
DROP TABLE if exists Answers;
DROP TABLE if exists Categories;





DROP TABLE if exists User;



CREATE TABLE User (
    StudentEmail VARCHAR(50),
    Faculty VARCHAR(20),
    UserStatus INTEGER,
    University VARCHAR(20),
    UserName VARCHAR(10),
    Password VARCHAR(20) NOT NULL,
    GPA DECIMAL(1,1),
    UserId CHAR(15) UNIQUE,
    Year INTEGER,
    PreferredEmail VARCHAR(50),
    CorAnswerTol INTEGER,
    PRIMARY KEY (StudentEmail, UserId)
);

CREATE TABLE Categories (
    CategoryId CHAR(10) PRIMARY KEY,
    Faculty CHAR(20),
    SubFaculty CHAR(20),
    Difficulty INTEGER,
    Name CHAR(10),
    CHECK (Difficulty >= 0 AND Difficulty<= 5)
);

CREATE TABLE Answers (
    AnsId CHAR(10),
    Time DATETIME,
    Category CHAR(10),
    QId CHAR(10),
    Description VARCHAR(250),
    FOREIGN KEY (Category) REFERENCES Categories(CategoryId) ON DELETE SET NULL ON UPDATE SET NULL,
    PRIMARY KEY (AnsId)
);

CREATE TABLE Ratings (
    UserId CHAR(15),
    AnsId CHAR(10),
    RatingId CHAR(10),
    Score INTEGER,
    Time DATETIME,
    CHECK (Score >= 0 AND Score <= 5),
    FOREIGN KEY (UserId) REFERENCES User(UserId) ON DELETE SET NULL ON UPDATE SET NULL,
    FOREIGN KEY (AnsId) REFERENCES Answers(AnsId) ON DELETE SET NULL ON UPDATE SET NULL
);

CREATE TABLE Transactions (
    TransactionId CHAR(15),
    Status INTEGER,
    UserId CHAR(15),
    Times   DATETIME,
    DogeAmo INTEGER,
    EtheAmo INTEGER,
    BitAmo INTEGER,
    PRIMARY KEY (transactionid),
    FOREIGN KEY (userId) REFERENCES User(UserId)
);

CREATE TABLE Currency (
    IndexName CHAR(10) PRIMARY KEY NOT NULL,
    MarketRate INTEGER,
    Time DATETIME
);

CREATE TABLE Questions (
    QId CHAR(10) PRIMARY KEY,
    UserId CHAR(10),
    Description VARCHAR(500),
    Category CHAR(10),
    TimeUntilClose INTEGER,
    Time DATETIME,
    FOREIGN KEY (Category) REFERENCES Categories(CategoryId),
    FOREIGN KEY (UserId) REFERENCES User(UserId)
);

CREATE TABLE PayMethod (
    UserId CHAR(10) PRIMARY KEY,
    DogeAd VARCHAR(50),
    BitAd  VARCHAR(50),
    EthAd  VARCHAR(50),
    DogeAmount  INTEGER,
    BitAmount   INTEGER,
    EthAmount   INTEGER,
    FOREIGN KEY (UserId) REFERENCES User(UserId)
);

CREATE TABLE GraveYard (
    YardId CHAR(10) PRIMARY KEY,
    AnsId CHAR(10),
    Status  CHAR(10),
    QId  CHAR(10),
    FOREIGN KEY (AnsId) REFERENCES Answers(AnsId),
    FOREIGN KEY (QId) REFERENCES Questions(QId)
);


CREATE TABLE Status (
    StatId INTEGER PRIMARY KEY,
    Name VARCHAR(10),
    PaymentRatios Integer,
    CHECK (StatId >= 0 AND StatId <= 5)
);

CREATE TABLE UserLog(
  StudentEmail VARCHAR(50),
  LogId INTEGER,
  AccessIp  INTEGER,
  StartTime DATETIME,
  EndTime DATETIME,
  
  FOREIGN KEY (StudentEmail) REFERENCES User(StudentEmail),
  PRIMARY KEY (StudentEmail, LogId)
);

