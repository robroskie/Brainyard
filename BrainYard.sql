

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

DROP TABLE if exists BUser;


CREATE TABLE BUser (
    StudentEmail VARCHAR(50),
    Faculty VARCHAR(20),
    UserStatus INTEGER,
    University VARCHAR(20),
    UserName VARCHAR(10),
    Password VARCHAR(20) NOT NULL,
    GPA DECIMAL(1,1),
    UserId INTEGER UNIQUE IDENTITY,
    CurrentYear VARCHAR(10),
    PreferredEmail VARCHAR(50),
    CorAnsTot INTEGER,
    PRIMARY KEY (StudentEmail, UserId)
);


CREATE TABLE Categories (
    CategoryId INTEGER PRIMARY KEY IDENTITY,
    subjTitle CHAR(20),
    Faculty CHAR(20),
    Difficulty INTEGER,
    CHECK (Difficulty >= 0 AND Difficulty<= 5)
);

CREATE TABLE Answers (
    AnsId INTEGER PRIMARY KEY IDENTITY,
    PTime DATETIME,
    Category INTEGER,
    QId INTEGER,
    Description VARCHAR(500),
    FOREIGN KEY (Category) REFERENCES Categories(CategoryId) ON DELETE SET NULL ON UPDATE SET NULL,
    PRIMARY KEY (AnsId)
);

CREATE TABLE Ratings (
    UserId INTEGER,
    AnsId INTEGER,
    RatingId INTEGER,
    Score INTEGER,
    PTime DATETIME,
    CHECK (Score >= 0 AND Score <= 5),
    FOREIGN KEY (UserId) REFERENCES User(UserId) ON DELETE SET NULL ON UPDATE SET NULL,
    FOREIGN KEY (AnsId) REFERENCES Answers(AnsId) ON DELETE SET NULL ON UPDATE SET NULL
);

CREATE TABLE Transactions (
    Transactionid INTEGER IDENTITY,
    Status INTEGER,
    UserId INTEGER,
    CurrTimes   DATETIME,
    DogeAmo INTEGER,
    EtheAmo INTEGER,
    BitAmo INTEGER,
    PRIMARY KEY (transactionid),
    FOREIGN KEY (userId) REFERENCES User(UserId)
);

CREATE TABLE Currency (
    IndexName CHAR(10) PRIMARY KEY NOT NULL,
    MarketRate INTEGER,
    coinName CHAR(10),
    CurTime DATETIME
);

CREATE TABLE Questions (
    QId INTEGER PRIMARY KEY IDENTITY,
    UserId INTEGER,
    Description VARCHAR(500),
    Category INTEGER,
    TimeUntilClose DATETIME,
    postTime DATETIME,
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


INSERT BUser(StudentEmail, Faculty, UserStatus, University, UserName, Password, GPA, UserId, CurrentYear, PreferredEmail, CorAnsTot) VALUES ('joegaspari@ubc.com', 'Biochemistry', 2, 'UBC', 'jgaspari', 'hello1', 4.0, 1, 'Completed', 'joegaspari6@gmail.com', null);
INSERT BUser(StudentEmail, Faculty, UserStatus, University, UserName, Password, GPA, UserId, CurrentYear, PreferredEmail, CorAnsTot) VALUES ('kevindowel@sfu.com', 'English', 1, 'Simon-Fraser-University', 'bookGod', '2smart4u', 3.4, 2, '3', 'kDowel@hotmail.com', null);
INSERT BUser(StudentEmail, Faculty, UserStatus, University, UserName, Password, GPA, UserId, CurrentYear, PreferredEmail, CorAnsTot) VALUES ('alexking@capilanou.ca', 'Art-History', 1, 'Capilano-University', 'ArtPOP', '12345', 2.4, 3, '2', 'artpopqueen@gmail.com', null);
INSERT BUser(StudentEmail, Faculty, UserStatus, University, UserName, Password, GPA, UserId, CurrentYear, PreferredEmail, CorAnsTot) VALUES ('ninasorini@tru.ca', 'Economics', 4, 'Trinity-Western University', 'ninaS1234', 'ninas12345', 4.0, 4, '4', 'ninasorini6@yahoo.ca', null);
INSERT BUser(StudentEmail, Faculty, UserStatus, University, UserName, Password, GPA, UserId, CurrentYear, PreferredEmail, CorAnsTot) VALUES ('lucascollings@ubc.ca', 'Math', 2, 'UBC', 'LCollings', 'mathisfun12', 2.5, 5, '4', 'lcollings@hotmail.com', null);
INSERT BUser(StudentEmail, Faculty, UserStatus, University, UserName, Password, GPA, UserId, CurrentYear, PreferredEmail, CorAnsTot) VALUES ('trevorMcdown@ucalgary.ca', 'Cultural-Studies', 3, 'University-of-Calgary', 'Mcdownknows', 'hay1234', 3.5, 6, '1', null, null);
INSERT BUser(StudentEmail, Faculty, UserStatus, University, UserName, Password, GPA, UserId, CurrentYear, PreferredEmail, CorAnsTot) VALUES ('giuliano@tru.ca', 'Computer-Science', 5, 'Trinity-Western-University', 'GaryIuliano1', 'irapsag123', 3.4, 7, '4', 'giuliano45@hotmail.com', null);
INSERT BUser(StudentEmail, Faculty, UserStatus, University, UserName, Password, GPA, UserId, CurrentYear, PreferredEmail, CorAnsTot) VALUES ('williamchen@ubc.ca', 'Biology', 1, 'UBC', 'CHEN242', '12345CHEN', 2.0, 8, 'Completed', 'will.Chen@gmail.com', null);
INSERT BUser(StudentEmail, Faculty, UserStatus, University, UserName, Password, GPA, UserId, CurrentYear, PreferredEmail, CorAnsTot) VALUES ('jacobharding@sfu.com', 'Chemisty', 3, 'Simon-Fraser-University', 'JakeRakes', 'rakesincash', 4.0, 9, '2', 'jake.harding@yahoo.ca', null);
INSERT BUser(StudentEmail, Faculty, UserStatus, University, UserName, Password, GPA, UserId, CurrentYear, PreferredEmail, CorAnsTot) VALUES ('junekang@tru.ca', 'Data-Science', 5, 'Trinity-Western-University', 'KINGKang', 'Jun-21', 3.2, 10, '3', 'jkang@hotmail.com', null);



INSERT Question (QId, UserId, Description, Category, TimeUntilClose, postTime) VALUES (1, 8, 'What adaptations make fungi such effective decomposers?', 4, '2011-01-12 12:12:12', '2011-02-12 12:12:12');
INSERT Question (QId, UserId, Description, Category, TimeUntilClose, postTime) VALUES (2, 1, 'How does a Cas9 protein recognize its complementing genetic target sequence?', 4, '2012-04-11 12:12:12', '2012-05-11 12:12:12');
INSERT Question (QId, UserId, Description, Category, TimeUntilClose, postTime) VALUES (3, 9, 'What does it mean for a molecule to have chirality?', 5, '2012-04-21 12:12:12', '2012-05-21 12:12:12');
INSERT Question (QId, UserId, Description, Category, TimeUntilClose, postTime) VALUES (4, 8, 'Who invented the first microscope?', 12, '2015-07-08 12:12:12', '2015-08-08 12:12:12');
INSERT Question (QId, UserId, Description, Category, TimeUntilClose, postTime) VALUES (5, 5, 'The measure of how greatly a substance slows the velocity of light is referred to as (blank)?', 13, '2015-11-19 12:12:12', '2016-01-19 12:12:12');
INSERT Question (QId, UserId, Description, Category, TimeUntilClose, postTime) VALUES (6, 1, 'If a particular gel chromatography column is said to have a size exclusion range of 2000 - 100000 Daltons indicate after the name of the compound whether it would be fractionated completely included or completely excluded from the column? (2 marks)(Hemoglobin� 65000)(Myoglobin� 17000)(Myosin� 180000)(Galatin� 150000)(BS Albumin� 66430)(Vitamin B12 1350)(Vitamin C� 1760)', 4, '2015-11-20 12:12:12', '2016-01-20 12:12:12');
INSERT Question (QId, UserId, Description, Category, TimeUntilClose, postTime) VALUES (7, 7, 'Consider a population governed by the discrete distribution p(x) where p(x) = _ for x = 1 and p(x) = 1 _ _ for x = 0 where _ _ [0 1]. Three independent observations are {0 1 0}. Find the likelihood function', 11, '2016-01-09 12:12:12', '2016-02-09 12:12:12');
INSERT Question (QId, UserId, Description, Category, TimeUntilClose, postTime) VALUES (8, 6, 'Which painter is often associated with Francoise Gilot?', 3, '2016-01-09 12:12:12', '2016-02-09 12:12:12');
INSERT Question (QId, UserId, Description, Category, TimeUntilClose, postTime) VALUES (9, 6, 'What are the features of neoclassical poetry?�', 6, '2016-01-09 12:12:12', '2016-02-09 12:12:12');
INSERT Question (QId, UserId, Description, Category, TimeUntilClose, postTime) VALUES (10, 2, 'What is the difference between micro and marco economics?', 8, '2016-01-22 12:12:12', '2016-02-22 12:12:12');
INSERT Question (QId, UserId, Description, Category, TimeUntilClose, postTime) VALUES (11, 4, 'How do you write a for loop in java??', 7, '2016-01-23 12:12:12', '2016-02-23 12:12:12');
INSERT Question (QId, UserId, Description, Category, TimeUntilClose, postTime) VALUES (12, 6, 'What is Formalist Criticism and how can it be used?', 6, '2017-01-23 12:12:12', '2017-02-23 12:12:12');
INSERT Question (QId, UserId, Description, Category, TimeUntilClose, postTime) VALUES (13, 5, 'What is cyclic phosphorylation?', 4, '2017-01-24 12:12:12', '2017-02-24 12:12:12');
INSERT Question (QId, UserId, Description, Category, TimeUntilClose, postTime) VALUES (14, 8, 'List the 3 phases of the Calvin Cycle', 4, '2017-02-01 12:12:12', '2017-03-01 12:12:12');
INSERT Question (QId, UserId, Description, Category, TimeUntilClose, postTime) VALUES (15, 8, 'The actor Michael J. Fox suffers from Parkinsons disease and John Nash subject of the movie A Beautiful Mind was a paranoid schizophrenic. The brains of both people can be characterized as having?', 10, '2017-02-02 12:12:12', '2017-03-02 12:12:12');
INSERT Question (QId, UserId, Description, Category, TimeUntilClose, postTime) VALUES (16, 10, 'What are the small visible bumps on the tongue called?', 4, '2017-02-15 12:12:12', '2017-03-15 12:12:12');
INSERT Question (QId, UserId, Description, Category, TimeUntilClose, postTime) VALUES (17, 5, 'Why can�t you claim a cause and effect relationship with correlational studies?', 8, '2017-02-16 12:12:12', '2017-03-16 12:12:12');
INSERT Question (QId, UserId, Description, Category, TimeUntilClose, postTime) VALUES (18, 10, 'Helmholtz was a(n) __________ who studied ________?', 12, '2017-02-17 12:12:12', '2017-03-17 12:12:12');
INSERT Question (QId, UserId, Description, Category, TimeUntilClose, postTime) VALUES (19, 3, 'What is the brain region that is associated with movement?', 4, '2017-05-07 12:12:12', '2017-05-17 12:12:12');
INSERT Question (QId, UserId, Description, Category, TimeUntilClose, postTime) VALUES (20, 6, 'How does cognitive psychology address the critiques of behaviorism through applying scientific methods to the study of what?', 10, '2018-04-14 12:12:12', '2018-05-14 12:12:12');
INSERT Question (QId, UserId, Description, Category, TimeUntilClose, postTime) VALUES (21, 7, 'A cell in prophase II of meiosis contains 12 chromosomes. How many chromosomes would be present in a cell from the same organism if it were in prophase of mitosis?', 4, '2018-05-22 12:12:12', '2018-06-22 12:12:12');
INSERT Question (QId, UserId, Description, Category, TimeUntilClose, postTime) VALUES (22, 8, 'What were the three waves of the feminist movement?', 12, '2019-06-01 12:12:12', '2019-07-01 12:12:12');
INSERT Question (QId, UserId, Description, Category, TimeUntilClose, postTime) VALUES (23, 2, 'What is dream consciousness characterized by?', 10, '2020-06-29 12:12:12', '2020-07-29 12:12:12');
INSERT Question (QId, UserId, Description, Category, TimeUntilClose, postTime) VALUES (24, 1, 'What is the chemical formula for photosynthesis', 5, '2020-06-30 12:12:12', '2020-07-30 12:12:12');
INSERT Question (QId, UserId, Description, Category, TimeUntilClose, postTime) VALUES (25, 2, 'When was the earliest known use of toilet paper and how do we come to know the use of it today?', 1, '2020-07-05 12:12:12', '2020-08-05 12:12:12');
INSERT Question (QId, UserId, Description, Category, TimeUntilClose, postTime) VALUES (26, 4, 'How does Auxin play a role in plant growth and development?', 4, '2020-08-06 12:12:12', '2020-08-06 12:12:12');

INSERT Answers (AnsId, PTime, Category, QId, Decription) VALUES (1, '2011-01-14 12:12', 4, 1, 'The large surface area of a mycelium makes them such effective decomposers');
INSERT Answers (AnsId, PTime, Category, QId, Decription) VALUES (2, '2011-01-20 12:12', 4, 1, 'They grow towards dead tissues');
INSERT Answers (AnsId, PTime, Category, QId, Decription) VALUES (3, '2011-01-21 12:12', 4, 1, 'They secrete a strong acidic substance that rapidly breaks down proteins');
INSERT Answers (AnsId, PTime, Category, QId, Decription) VALUES (4, '2012-04-12 12:12', 4, 2, 'Using a gRNA protein sequence that includes the desired cut peptide sequence');
INSERT Answers (AnsId, PTime, Category, QId, Decription) VALUES (5, '2012-04-15 12:12', 4, 2, 'Two proteins bind to dna and cut it');
INSERT Answers (AnsId, PTime, Category, QId, Decription) VALUES (6, '2012-04-16 12:12', 5, 3, 'It can bed light at a different polarity');
INSERT Answers (AnsId, PTime, Category, QId, Decription) VALUES (7, '2012-04-17 12:12', 5, 3, 'The molecule has a copy or mirror image of itself that has different chemical properties');
INSERT Answers (AnsId, PTime, Category, QId, Decription) VALUES (8, '2012-04-19 12:12', 5, 3, 'The molecule has S/R properties that define the trigonometry of it in 3D space');
INSERT Answers (AnsId, PTime, Category, QId, Decription) VALUES (9, '2012-04-20 12:12', 5, 3, 'It has the ability to bend light at a different angle');
INSERT Answers (AnsId, PTime, Category, QId, Decription) VALUES (10, '2012-04-22 12:12', 5, 3, 'It means it can react to acids more intensely');
INSERT Answers (AnsId, PTime, Category, QId, Decription) VALUES (11, '2015-07-12 12:12', 12, 4, 'Hans Janssen');
INSERT Answers (AnsId, PTime, Category, QId, Decription) VALUES (12, '2015-07-15 12:12', 12, 4, 'Pasture');
INSERT Answers (AnsId, PTime, Category, QId, Decription) VALUES (13, '2015-11-21 12:12', 13, 5, 'density');
INSERT Answers (AnsId, PTime, Category, QId, Decription) VALUES (14, '2015-11-26 12:12', 13, 5, 'Purity');
INSERT Answers (AnsId, PTime, Category, QId, Decription) VALUES (15, '2015-11-27 12:12', 13, 5, 'Viscosity');
INSERT Answers (AnsId, PTime, Category, QId, Decription) VALUES (16, '2015-11-21 12:12', 4, 6, 'Hemoglobin Myoglobin and BS albumin would all be included. Myosin and Galatin would not be included and Vitamin B12 and C would fraction out completely');
INSERT Answers (AnsId, PTime, Category, QId, Decription) VALUES (17, '2016-01-04 12:12', 4, 6, 'Hemoglobin BS albumin would all be included. Myosin+Myoglobin+Galatin would not be included and Vitamin B12 and C would fraction out completely');
INSERT Answers (AnsId, PTime, Category, QId, Decription) VALUES (18, '2016-01-11 12:12', 3, 8, 'Leonardo Da Vinci');
INSERT Answers (AnsId, PTime, Category, QId, Decription) VALUES (19, '2016-01-14 12:12', 3, 8, 'Pablo Picaso');
INSERT Answers (AnsId, PTime, Category, QId, Decription) VALUES (20, '2016-02-08 12:12', 3, 8, 'Grant Wood');
INSERT Answers (AnsId, PTime, Category, QId, Decription) VALUES (21, '2016-01-15 12:12', 6, 9, 'Neoclassicism as a label is applied to a period of English literature lasting from 1660 the Restoration of Charles II till about 1800');
INSERT Answers (AnsId, PTime, Category, QId, Decription) VALUES (22, '2016-02-01 12:12', 6, 9, 'The prefix neo means new while classical refers to a return to the ideologies set in place by Greeks and Romans during the Classic period');
INSERT Answers (AnsId, PTime, Category, QId, Decription) VALUES (23, '2016-01-23 12:12', 8, 10, 'Macro looks at the big picture while Micro looks at individuals and the small relationships amongst them');
INSERT Answers (AnsId, PTime, Category, QId, Decription) VALUES (24, '2016-01-27 12:12', 8, 10, 'Economics is divided into two categories: microeconomics and macroeconomics. Microeconomics is the study of individuals and business decisions while macroeconomics looks at the decisions of countries and governments');
INSERT Answers (AnsId, PTime, Category, QId, Decription) VALUES (25, '2016-01-29 12:12', 8, 10, 'Microeconomics is the study of particular markets and segments of the economy. It looks at issues such as consumer behaviour individual labour markets and the theory of firms.Macro economics is the study of the whole economy. It looks at aggregate variables such as aggregate demand national output and inflation.');
INSERT Answers (AnsId, PTime, Category, QId, Decription) VALUES (26, '2016-02-20 12:12', 7, 11, 'Int size = 5;for (int x=0;x<=size;x++){');
INSERT Answers (AnsId, PTime, Category, QId, Decription) VALUES (27, '2016-02-22 12:12', 7, 11, 'for (int x=0:x<=size:x++) as we use int x to be a counter of a sort that increments upwards we check the condition. We exit the loop once the constraint is met. Best to set the constraint outside the loop as it will need to be initialized to continually check your constraint');
INSERT Answers (AnsId, PTime, Category, QId, Decription) VALUES (28, '2017-01-26 12:12', 6, 12, 'Formalist Criticism designates an approach to understanding narratives that is rooted in close attention to how meaning is conveyed. It begins from the premise that form and content are closely related');
INSERT Answers (AnsId, PTime, Category, QId, Decription) VALUES (29, '2017-02-11 12:12', 6, 12, 'The comparison of one thing to another in which there is a literal substitution; her love is a tsunami.');
INSERT Answers (AnsId, PTime, Category, QId, Decription) VALUES (30, '2017-02-12 12:12', 4, 13, 'IS the cyclic phosphorylation of ADP to form ATP which is then consumed as an energy source');
INSERT Answers (AnsId, PTime, Category, QId, Decription) VALUES (31, '2017-02-27 12:12', 4, 13, 'The process most occurs in plants in photosystem 1');
INSERT Answers (AnsId, PTime, Category, QId, Decription) VALUES (32, '2017-02-24 12:12', 4, 14, 'enzyme RuBisCO incorporates carbon dioxide into an organic molecule 3-PGa organic molecule is reduced using electrons supplied by NADPH RuBP molecule that starts the cycle is regenerated so that the cycle can continue');
INSERT Answers (AnsId, PTime, Category, QId, Decription) VALUES (33, '2017-02-07 12:12', 10, 15, 'Alzheimers');
INSERT Answers (AnsId, PTime, Category, QId, Decription) VALUES (34, '2017-02-20 12:12', 10, 15, 'Parkinsons Disease');
INSERT Answers (AnsId, PTime, Category, QId, Decription) VALUES (35, '2017-02-21 12:12', 10, 15, 'Dopamine Deficiency');
INSERT Answers (AnsId, PTime, Category, QId, Decription) VALUES (36, '2017-03-01 12:12', 4, 16, 'Taste-buds');
INSERT Answers (AnsId, PTime, Category, QId, Decription) VALUES (37, '2017-03-02', 4, 16, 'papillae');
INSERT Answers (AnsId, PTime, Category, QId, Decription) VALUES (38, '2017-02-20', 8, 17, 'Due to the possible presence of a third hidden variable unknown to both parties that is causing an unseen force that either positively or negatively influences the data');
INSERT Answers (AnsId, PTime, Category, QId, Decription) VALUES (39, '2017-02-28 12:12', 8, 17, 'Behavior is too complex variable and reactive to allow for cause and effect determinations');
INSERT Answers (AnsId, PTime, Category, QId, Decription) VALUES (40, '2017-03-04 12:12', 8, 17, 'If two variables are correlated then by definition one cannot cause the other');
INSERT Answers (AnsId, PTime, Category, QId, Decription) VALUES (41, '2017-03-06 12:12', 8, 17, 'Correlational studies are not empirical');
INSERT Answers (AnsId, PTime, Category, QId, Decription) VALUES (42, '2017-03-14 12:12', 12, 18, 'Philospher; the mind body problem');
INSERT Answers (AnsId, PTime, Category, QId, Decription) VALUES (43, '2017-03-15 12:12', 12, 18, 'Was both a physicist and philosopher whos work encompasses both the mind body problem and advances in fluid dynamics');
INSERT Answers (AnsId, PTime, Category, QId, Decription) VALUES (44, '2017-04-20 12:12', 4, 19, 'Cerebellum');
INSERT Answers (AnsId, PTime, Category, QId, Decription) VALUES (45, '2017-04-22 12:12', 4, 19, 'Cerebellum and Motor Cortex');
INSERT Answers (AnsId, PTime, Category, QId, Decription) VALUES (46, '2017-05-12 12:12', 4, 19, 'Cerebellum and Motor Cortex');
INSERT Answers (AnsId, PTime, Category, QId, Decription) VALUES (47, '2018-04-19 12:12', 10, 20, 'Through neurological mechanisms underlying observable behavior.');
INSERT Answers (AnsId, PTime, Category, QId, Decription) VALUES (48, '2018-05-02 12:12', 10, 20, 'Mental processes such as memory perception and thought.');
INSERT Answers (AnsId, PTime, Category, QId, Decription) VALUES (49, '2018-05-24 12:12', 4, 21, 'As the cell is in prophase it has 24');
INSERT Answers (AnsId, PTime, Category, QId, Decription) VALUES (50, '2018-05-27 12:12', 4, 21, 'Has 48 as the cell is about to split');
INSERT Answers (AnsId, PTime, Category, QId, Decription) VALUES (51, '2018-06-11 12:12', 4, 21, 'The cell is full and expressing normal numbers of 24');
INSERT Answers (AnsId, PTime, Category, QId, Decription) VALUES (52, '2018-06-11 12:12', 4, 21, 'The cell is full and expressing normal numbers of 48');
INSERT Answers (AnsId, PTime, Category, QId, Decription) VALUES (53, '2019-06-11 12:12', 12, 22, '19th century; 1960s; then 1990s');
INSERT Answers (AnsId, PTime, Category, QId, Decription) VALUES (54, '2019-06-18 12:12', 12, 22, 'The strongest and most talked about is the third way from around 1990s onward');
INSERT Answers (AnsId, PTime, Category, QId, Decription) VALUES (55, '2019-06-29 12:12', 12, 22, 'First wave – 19th century equal rights under law Second wave – 1960s personal is political reproductive rights Third wave – from mid 1990s – challenging fixed gender categories reclaiming of negative language (e.g. Slut-walk).');
INSERT Answers (AnsId, PTime, Category, QId, Decription) VALUES (56, '2020-07-05 12:12', 10, 23, 'Lucid dreaming being aware in the dream');
INSERT Answers (AnsId, PTime, Category, QId, Decription) VALUES (57, '2020-07-10 12:12', 10, 23, 'Having full memories of the dreams in a waking state as to cause a confusion with reality');
INSERT Answers (AnsId, PTime, Category, QId, Decription) VALUES (58, '2020-07-14 12:12', 10, 23, 'Having an in-between like dream state where you feel awake');
INSERT Answers (AnsId, PTime, Category, QId, Decription) VALUES (59, '2020-07-12 12:12', 5, 24, '6CO2 + 6H2O → C6H12O6 + 6O2.');
INSERT Answers (AnsId, PTime, Category, QId, Decription) VALUES (60, '2020-07-15', 5, 24, 'six carbon dioxide molecules and six water molecules are converted by light energy captured by chlorophyll into a sugar molecule and six oxygen molecules');
INSERT Answers (AnsId, PTime, Category, QId, Decription) VALUES (61, '2020-08-04 12:12', 1, 25, 'The use of paper for hygiene has been recorded in China in the 6th century AD with specifically manufactured toilet paper being mass-produced in the 14th century.Modern commercial toilet paper originated in the 19th century with a patent for roll-based dispensers being made in 1883');
INSERT Answers (AnsId, PTime, Category, QId, Decription) VALUES (62, '2020-07-23 12:12', 4, 26, 'Controls the direction of the stemming of buds');
INSERT Answers (AnsId, PTime, Category, QId, Decription) VALUES (63, '2020-07-25 12:12', 4, 26, 'Auxins are a powerful growth hormone produced naturally by plants. They are found in shoot and root tips and promote cell division stem and root growth. They can also drastically affect plant orientation by promoting cell division to one side of the plant in response to sunlight and gravity.');

INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (1, 1, 1, 3, '2011-01-15');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (8, 1, 2, 4, '2011-01-16');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (10, 1, 3, 4, '2011-01-17');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (4, 1, 4, 2, '2011-01-17');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (2, 2, 5, 2, '2011-01-21');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (10, 2, 6, 1, '2011-01-22');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (1, 3, 7, 0, '2011-01-22');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (8, 3, 8, 2, '2011-01-23');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (7, 3, 9, 1, '2011-01-23');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (3, 4, 10, 4, '2012-04-13');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (5, 4, 11, 5, '2012-04-14');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (7, 4, 12, 4, '2012-04-15');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (9, 4, 13, 5, '2012-04-15');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (5, 5, 14, 3, '2012-04-15');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (7, 5, 15, 4, '2012-04-16');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (10, 5, 16, 3, '2012-04-19');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (1, 5, 17, 2, '2012-04-22');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (5, 6, 18, 2, '2012-04-17');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (8, 6, 19, 3, '2012-04-17');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (9, 6, 20, 4, '2012-04-18');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (10, 7, 21, 4, '2012-04-18');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (1, 7, 22, 5, '2012-04-19');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (9, 7, 23, 3, '2012-04-20');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (1, 8, 24, 4, '2012-04-20');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (9, 8, 25, 4, '2012-04-21');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (10, 8, 26, 4, '2012-04-22');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (1, 9, 27, 2, '2012-04-20');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (2, 9, 28, 3, '2012-04-30');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (10, 9, 29, 1, '2012-05-01');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (1, 10, 30, 1, '2012-04-28');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (10, 10, 31, 0, '2012-05-02');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (9, 10, 32, 0, '2012-05-04');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (8, 10, 33, 0, '2012-05-10');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (5, 11, 34, 5, '2015-07-18');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (6, 11, 35, 4, '2015-07-19');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (7, 11, 36, 4, '2015-07-19');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (1, 12, 37, 3, '2015-07-20');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (3, 12, 38, 4, '2015-07-21');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (6, 12, 39, 2, '2015-07-23');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (10, 12, 40, 1, '2015-07-26');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (4, 12, 41, 1, '2015-07-28');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (1, 13, 42, 0, '2015-11-26');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (6, 13, 43, 1, '2015-11-27');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (4, 13, 44, 2, '2015-11-28');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (5, 14, 45, 0, '2015-11-26');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (10, 14, 46, 0, '2015-11-30');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (1, 14, 47, 1, '2016-01-02');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (1, 15, 48, 4, '2016-01-12');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (10, 15, 49, 3, '2016-01-13');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (5, 15, 50, 5, '2016-01-14');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (7, 15, 51, 4, '2016-01-15');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (1, 16, 52, 5, '2015-11-22');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (7, 16, 53, 4, '2015-11-23');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (10, 16, 54, 5, '2015-11-38');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (1, 17, 55, 2, '2016-01-06');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (10, 17, 56, 3, '2016-01-09');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (8, 17, 57, 4, '2016-01-10');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (5, 17, 58, 1, '2016-01-21');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (3, 18, 59, 2, '2016-01-15');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (6, 18, 60, 1, '2016-01-16');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (7, 18, 61, 3, '2016-01-16');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (1, 19, 62, 4, '2016-01-19');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (10, 19, 63, 5, '2016-01-20');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (3, 19, 64, 1, '2016-01-20');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (6, 19, 65, 5, '2016-02-01');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (7, 19, 66, 4, '2016-02-03');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (3, 20, 67, 0, '2016-02-08');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (6, 20, 68, 1, '2016-02-08');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (7, 20, 69, 2, '2016-02-09');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (1, 20, 70, 1, '2016-02-09');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (5, 21, 71, 3, '2016-01-16');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (6, 21, 72, 1, '2016-01-19');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (10, 22, 73, 5, '2016-01-25');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (6, 22, 74, 4, '2016-01-26');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (4, 22, 75, 2, '2016-01-27');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (1, 23, 76, 2, '2016-01-24');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (4, 23, 77, 1, '2016-01-28');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (6, 23, 78, 3, '2016-01-29');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (2, 23, 79, 2, '2016-01-30');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (1, 24, 80, 3, '2016-02-01');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (10, 24, 81, 2, '2016-02-03');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (5, 24, 82, 3, '2016-02-05');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (6, 24, 83, 2, '2016-02-10');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (4, 24, 84, 4, '2016-02-11');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (1, 25, 85, 5, '2016-02-07');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (10, 25, 86, 5, '2016-02-08');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (6, 25, 87, 4, '2016-02-08');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (5, 25, 88, 5, '2016-02-15');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (9, 25, 89, 2, '2016-02-18');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (10, 26, 90, 4, '2016-02-24');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (4, 26, 91, 4, '2016-02-25');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (3, 26, 92, 3, '2016-02-29');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (1, 27, 93, 5, '2016-02-21');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (7, 27, 94, 5, '2016-02-22');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (5, 27, 95, 3, '2016-02-23');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (5, 28, 96, 5, '2017-01-28');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (5, 29, 97, 2, '2017-02-11');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (1, 29, 98, 3, '2017-02-12');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (2, 29, 99, 5, '2017-02-12');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (10, 30, 100, 4, '2017-02-13');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (5, 30, 101, 3, '2017-02-14');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (6, 30, 102, 4, '2017-02-15');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (8, 30, 103, 4, '2017-02-16');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (1, 31, 104, 0, '2017-02-27');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (4, 31, 105, 1, '2017-02-27');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (6, 32, 106, 3, '2017-02-27');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (9, 32, 107, 3, '2017-02-29');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (1, 32, 108, 2, '2017-02-30');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (10, 32, 109, 3, '2017-03-01');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (10, 33, 110, 3, '2017-02-08');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (7, 33, 111, 2, '2017-02-09');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (5, 33, 112, 3, '2017-02-10');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (10, 34, 113, 1, '2017-02-20');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (1, 34, 114, 1, '2017-02-20');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (1, 35, 115, 5, '2017-02-23');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (5, 35, 116, 4, '2017-02-24');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (8, 35, 117, 3, '2017-02-29');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (9, 35, 118, 4, '2017-02-29');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (10, 37, 119, 5, '2017-03-05');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (1, 37, 120, 5, '2017-03-15');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (8, 37, 121, 5, '2017-03-16');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (1, 38, 122, 4, '2017-02-20');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (5, 38, 123, 4, '2017-02-21');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (9, 38, 124, 4, '2017-02-21');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (10, 38, 125, 5, '2017-02-24');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (4, 39, 126, 1, '2017-02-21');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (2, 39, 127, 2, '2017-02-21');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (10, 39, 128, 0, '2017-02-25');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (10, 40, 129, 0, '2017-03-05');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (5, 40, 130, 1, '2017-03-06');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (6, 40, 131, 3, '2017-03-09');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (7, 41, 132, 2, '2017-03-09');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (10, 41, 133, 2, '2017-03-10');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (5, 42, 134, 3, '2017-03-15');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (6, 42, 135, 5, '2017-03-19');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (1, 42, 136, 4, '2017-03-22');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (8, 43, 137, 5, '2017-03-18');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (10, 43, 138, 5, '2017-03-22');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (1, 44, 139, 2, '2017-04-22');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (8, 44, 140, 3, '2017-04-21');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (10, 45, 141, 5, '2017-04-22');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (1, 45, 142, 5, '2017-04-23');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (5, 45, 143, 4, '2017-04-23');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (5, 47, 144, 3, '2018-04-20');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (4, 47, 145, 3, '2018-04-21');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (1, 47, 146, 2, '2018-04-22');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (1, 48, 147, 5, '2018-05-04');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (10, 48, 148, 1, '2018-05-10');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (5, 49, 149, 4, '2018-05-25');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (6, 49, 150, 4, '2018-05-29');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (10, 50, 151, 2, '2018-05-28');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (1, 50, 152, 1, '2018-05-29');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (6, 51, 153, 4, '2018-06-11');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (4, 51, 154, 5, '2018-06-13');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (2, 51, 155, 3, '2018-06-15');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (5, 52, 156, 0, '2018-06-12');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (10, 52, 157, 1, '2018-06-16');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (1, 52, 158, 1, '2018-06-22');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (8, 53, 159, 3, '2019-06-15');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (7, 53, 160, 1, '2019-06-16');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (5, 54, 161, 2, '2019-06-24');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (4, 55, 162, 4, '2019-06-29');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (1, 55, 163, 5, '2019-07-04');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (1, 56, 164, 3, '2020-07-15');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (5, 56, 165, 4, '2020-07-16');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (6, 56, 166, 4, '2020-07-17');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (6, 57, 167, 2, '2020-07-11');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (10, 58, 168, 2, '2020-07-15');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (9, 58, 169, 3, '2020-07-16');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (9, 59, 170, 5, '2020-07-15');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (1, 60, 171, 5, '2020-07-22');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (10, 60, 172, 5, '2020-07-23');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (5, 61, 173, 4, '2020-08-10');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (2, 61, 174, 5, '2020-08-11');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (10, 62, 175, 2, '2020-07-24');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (10, 63, 176, 5, '2020-07-25');
INSERT Ratings (UserId, AnsId, RatingId, Score, PTime) VALUES (5, 63, 177, 4, '2020-07-29');