CREATE database Kundendatenbank;

USE Kundendatenbank;

CREATE TABLE Kurs (
    KursID INT AUTO_INCREMENT PRIMARY KEY,
    KursName VARCHAR(100) NOT NULL,
    BeginDat DATE NOT NULL,
    Preis FLOAT NOT NULL,
    AdressID INT NOT NULL
);

CREATE TABLE Kunde(
    KundenID INT AUTO_INCREMENT PRIMARY KEY,    
    Firma VARCHAR(100),
    Anrede VARCHAR(50),
    Nachname VARCHAR(100) NOT NULL,
    Vorname VARCHAR(10) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Tel INT,
    AnfrageDatum Date NOT NULL,
    Kauf BOOLEAN NOT NULL,
    WeitereKomm BOOLEAN NOT NULL,
    Interesse BOOLEAN NOT NULL,
    Newsletter BOOLEAN NOT NULL,
    GebDatum DATE,
    AdressID INT NOT NULL,
    AnfrageKurs INT NOT NULL,
    SprachID int NOT NULL
);

CREATE TABLE KursTeilgenommen (
    TeilnahmeID INT AUTO_INCREMENT PRIMARY KEY,
    Bezahlt BOOLEAN NOT NULL,
    PruefungBestanden BOOLEAN NOT NULL,
    InteresseFolgekurs BOOLEAN NOT NULL,
    InteressePersCoaching BOOLEAN NOT NULL,
    BewertungSterne INT,
    BewertungText VARCHAR(1000),
    KundenID INT NOT NULL,
    KursID INT NOT NULL
);

CREATE TABLE Adresse (
    AdressID INT AUTO_INCREMENT PRIMARY KEY,
    Land VARCHAR(100),
    Bundesland VARCHAR(100),
    Ort VARCHAR(100),
    Strasse VARCHAR(100),
    Hausnummer VARCHAR(5)
);

CREATE TABLE Sprache (
    SprachID int AUTO_INCREMENT PRIMARY KEY,
    Bezeichnung VARCHAR(100) NOT NULL
);

CREATE TABLE Beschwerde (
    BeschwerdenID int AUTO_INCREMENT PRIMARY KEY,
    Titel VARCHAR(100) NOT NULL,
    Beschreibung VARCHAR(1000) NOT NULL,
    KundenID INT NOT NULL
);

CREATE TABLE LetzteAktivitaet (
    AktivitaetsID INT AUTO_INCREMENT PRIMARY KEY,
    Datum DATE NOT NULL,
    KursID INT NOT NULL,
    KundenID INT NOT NULL
);

ALTER TABLE LetzteAktivitaet
ADD FOREIGN KEY (KursID) REFERENCES Kurs (KursID);

ALTER TABLE Beschwerde
ADD FOREIGN KEY (KundenID) REFERENCES Kunde (KundenID);

ALTER TABLE KursTeilgenommen
ADD FOREIGN KEY (KursID) REFERENCES Kurs (KursID);

ALTER TABLE KursTeilgenommen
ADD FOREIGN KEY (KundenID) REFERENCES Kunde (KundenID);

ALTER TABLE Kurs
ADD FOREIGN KEY (AdressID) REFERENCES Adresse (AdressID); 

ALTER TABLE Kunde
ADD FOREIGN KEY (AdressID) REFERENCES Adresse (AdressID);

ALTER TABLE Kunde
ADD FOREIGN KEY (SprachID) REFERENCES Sprache (SprachID);

ALTER TABLE Kunde
ADD FOREIGN KEY (AnfrageKurs) REFERENCES Kurs (KursID);

INSERT INTO Sprache (Bezeichnung)
VALUES ("Deutsch");

INSERT INTO Sprache (Bezeichnung)
VALUES ("Englisch");

INSERT INTO Adresse (Land, Bundesland, Ort, Strasse, Hausnummer)
VALUES ("Österreich", "Tirol", "Innsbruck", "Anichstraße", 5);

INSERT INTO Adresse (Land, Bundesland, Ort, Strasse, Hausnummer)
VALUES ("Österreich", "Tirol", "Innsbruck", "Musterstraße", 3);

INSERT INTO Kurs (KursName, BeginDat, AdressID, Preis)
VALUES ("TestKurs", "2018-05-13", 1, 299.99);

INSERT INTO Kunde (Firma, Anrede, Nachname, Vorname, Email, Tel, AdressID, AnfrageDatum, Kauf, AnfrageKurs, WeitereKomm,Interesse,Newsletter,GebDatum,SprachID)
VALUES ("Firma1", "Herr", "Köll", "Mauricio", "Mauricio.Koell@students.htlinn.ac.at",01234567,2,"2018-02-12", True, 1, True,True, True, "1999-12-05", 1);

INSERT INTO Beschwerde (Titel, Beschreibung, KundenID)
VALUES ("Meine Beschwerde", "Der Kurs hat nicht stattgefunden!", 1);

INSERT INTO KursTeilgenommen (KursID, KundenID, bezahlt, PruefungBestanden,InteresseFolgekurs,InteressePersCoaching,BewertungSterne,BewertungText)
VALUES (1,1,True,True,True,True,5,"War super!");

INSERT INTO LetzteAktivitaet (Datum, KursID, KundenID)
VALUES ("2018-05-30", 1, 1);

Select * from Kunde;
Select * from Kurs;
Select * from Adresse;
Select * from Sprache;
Select * from Beschwerde;
Select * from LetzteAktivitaet;
Select * from KursTeilgenommen;
