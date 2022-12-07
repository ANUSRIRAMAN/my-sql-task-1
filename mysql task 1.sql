create database taskday35;

CREATE TABLE movie (
    Id INT Primary key auto_increment,
    MovieName VARCHAR(255),
    Director VARCHAR(255),
    Language VARCHAR(255)
);

select * from movie;


Insert Into movie (MovieName,  Director, Language) Values ("Interstellar","Christopher Nolan","English"), ("Edge of Tomorrow","Doug Liman","English"), ("Mission Impossible 5","Christopher McQuarrie","English"), ("fast and Furious 7","James Wan","English");


CREATE TABLE media (
    Id INT Primary key auto_increment,
    Name VARCHAR(255),
    Type VARCHAR(255),
    Size VARCHAR(255),
    MovieId VARCHAR(255)
);


select * from media;




ALTER TABLE media  DROP COLUMN MovieId;

Insert Into media (Name, Type, Size) Values ("Interstellar","Video","10MB"), ("Edge of Tomorrow","Image","250KB"), ("Mission Impossible 5","Image","400KB"), ("fast and Furious 7","Video","110MB");

ALTER TABLE media  ADD COLUMN MovieId INT;

UPDATE media SET MovieId=1 WHERE Id=1;
UPDATE media SET MovieId=2 WHERE Id=2;
UPDATE media SET MovieId=3 WHERE Id=3;
UPDATE media SET MovieId=4 WHERE Id=4;


CREATE TABLE genre (
    Id INT Primary key auto_increment,
    Name VARCHAR(255)
);


select * from genre;


Insert Into genre (Name) Values ("Sci-Fi"), ("Sci-Fi, Action"), ("Sci-Fi, Action"), ("Action , Thriller") ;



CREATE TABLE Movie_genre (
    Id INT ,
    MovieId INT,
    FOREIGN KEY (MovieId) REFERENCES movie(Id),
    GenreId INT,
    FOREIGN KEY (GenreId) REFERENCES genre(Id)
);



select * from  Movie_genre;

Insert Into Movie_genre (Id) Values (1), (2), (3), (4), (5);

UPDATE Movie_genre SET MovieId=1, GenreID=1 WHERE Id=1;
UPDATE Movie_genre SET MovieId=1, GenreID=4 WHERE Id=2;
UPDATE Movie_genre SET MovieId=2, GenreID=1 WHERE Id=3;
UPDATE Movie_genre SET MovieId=3, GenreID=3 WHERE Id=4;
UPDATE Movie_genre SET MovieId=3, GenreID=2 WHERE Id=5;


CREATE TABLE user (
    Id INT Primary key auto_increment,
    Name VARCHAR(255),
    Age INT
);

select * from user;
Insert Into user (Name, Age) Values ("siva", 20), ("viswa",30);


CREATE TABLE review (
    Id INT Primary key auto_increment,
     MovieId INT,
    FOREIGN KEY (MovieId) REFERENCES movie(Id),
    UserId INT,
    FOREIGN KEY (UserId) REFERENCES user(Id),
    Review_points INT,
    Review varchar(255)
);


select * from review;

Insert Into review (Id) Values (1), (2), (3), (4);
UPDATE review SET MovieId=1,UserId=1,Review_points=4,Review = "greatest of all time in space movies" WHERE Id=1;
UPDATE review SET MovieId=2,UserId=2,Review_points=3, Review = "Best of the best with full Action" WHERE Id=2;
UPDATE review SET MovieId=3,UserId=2,Review_points=4,  Review = "greatest of all Mission impossible series " WHERE Id=3;
UPDATE review SET MovieId=4,UserId=1,Review_points=3, Review = "Action packed thriller" WHERE Id=4;


CREATE TABLE arist (
    Id INT Primary key auto_increment,
    Arist_Name VARCHAR(255),
    Experience VARCHAR(255),
    Contact_Number DOUBLE
);

select * from arist;
Insert Into arist (Arist_Name, Experience, Contact_Number) Values ("Matthew David McConaughey","15 years",1111111111), ("Tom Cruise","30 years",222222222222), ("Tom Cruise","30 years",222222222222),("Vin disel","25 years",33333333333);


CREATE TABLE skills (
    Id INT Primary key auto_increment,
    Skills VARCHAR(255)
);


select * from skills;
Insert Into skills (Skills) Values ("Action"), ("Stunt without stunt double"), ("Stunt without stunt double"), ("car stunt and negative role");


CREATE TABLE Arist_skills (
    Id INT Primary key auto_increment,
	AristId INT,
    FOREIGN KEY (AristId) REFERENCES arist(Id),
    SkillId INT,
    FOREIGN KEY (SkillId ) REFERENCES skills(Id)
    );
    
    
select * from Arist_skills;




    
Insert Into Arist_skills (Id) Values (1), (2), (3), (4), (5), (6);

UPDATE Arist_skills SET AristId=1,SkillId=1 WHERE Id=1;
UPDATE Arist_skills SET AristId=2,SkillId=1 WHERE Id=2;
UPDATE Arist_skills SET AristId=2,SkillId=2 WHERE Id=3;
UPDATE Arist_skills SET AristId=3,SkillId=1 WHERE Id=4;
UPDATE Arist_skills SET AristId=3,SkillId=3 WHERE Id=5;
UPDATE Arist_skills SET AristId=3,SkillId=4 WHERE Id=6;

ALTER TABLE movie ADD COLUMN HeroId INT;

ALTER TABLE movie ADD FOREIGN KEY (HeroId) REFERENCES arist(Id);


ALTER TABLE movie ADD COLUMN VillanId INT;

ALTER TABLE movie ADD FOREIGN KEY (VillanId) REFERENCES arist(Id);



UPDATE movie SET HeroId=2,VillanId=1 WHERE Id=1;
UPDATE movie SET HeroId=3,VillanId=1 WHERE Id=2;
UPDATE movie SET HeroId=2,VillanId=1 WHERE Id=3;
UPDATE movie SET HeroId=1,VillanId=1 WHERE Id=4;




select * from movie;

select * from media;

select * from genre;

select * from user;

select * from review;

select * from arist;

select * from skills;

CREATE TABLE Roles (
    Id INT Primary key auto_increment,
	AristId INT,
    FOREIGN KEY (AristId) REFERENCES arist(Id),
    SkillId INT,
    FOREIGN KEY (SkillId ) REFERENCES skills(Id)
    ,
    role varcharacter(255)
    );
    
   
Insert Into Roles (Id) Values (1), (2), (3), (4);
UPDATE Roles SET AristId=1,SkillId=1, role="Hero" WHERE Id=1;
UPDATE Roles SET AristId=2,SkillId=1, role="Hero" WHERE Id=2;
UPDATE Roles SET AristId=2,SkillId=2, role="Hero" WHERE Id=3;
UPDATE Roles SET AristId=3,SkillId=1, role="Hero" WHERE Id=4;
    
    
select * from Roles; 


select * from movie;

select * from media;

select * from genre;

select * from user;

select * from review;

select * from arist;

select * from skills;
    