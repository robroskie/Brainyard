DROP TABLE IF EXISTS Persons; 

CREATE TABLE Persons (
    PersonID int,
    LastName varchar(255),
    FirstName varchar(255),
    Address varchar(255),
    City varchar(255)
);

INSERT INTO Persons (
    PersonID,
    LastName,
    FirstName,
    Address,
    City
)

VALUES 
(2, "abc", "afghbc", "afghbc", "fghabc");