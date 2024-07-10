CREATE DATABASE AIRPORT_MANAGAMEMENT_SYSTEM_PROJECT_FINAL
USE AIRPORT_MANAGAMEMENT_SYSTEM_PROJECT_FINAL

DROP TABLE CITY
CREATE TABLE CITY (
    CityName VARCHAR(100) NOT NULL PRIMARY KEY,
    STATE VARCHAR(100), 
    COUNTRY VARCHAR(100),
);
-- Insering values of Table: CITY--
INSERT INTO CITY (CityName, STATE, COUNTRY) VALUES('Louisville','Kentucky','United States');
INSERT INTO CITY (CityName, STATE, COUNTRY) VALUES ('Chandigarh','Chandigarh','India');
INSERT INTO CITY (CityName, STATE, COUNTRY) VALUES ('Fort Worth','Texas','United States');
INSERT INTO CITY (CityName, STATE, COUNTRY) VALUES('Delhi','Delhi','India');
INSERT INTO CITY (CityName, STATE, COUNTRY) VALUES('Mumbai','Maharashtra','India');
INSERT INTO CITY (CityName, STATE, COUNTRY) VALUES('San Francisco', 'California', 'United States');
INSERT INTO CITY (CityName, STATE, COUNTRY) VALUES('Frankfurt','Hesse','Germany');
INSERT INTO CITY (CityName, STATE, COUNTRY) VALUES('Houston','Texas','United States');
INSERT INTO CITY (CityName, STATE, COUNTRY) VALUES('New York City','New York','United States');
INSERT INTO CITY (CityName, STATE, COUNTRY) VALUES('Tampa', 'Florida', 'United States');

-- Creating AIRPORT table and referencing CITY
CREATE TABLE AIRPORT (
	AirportName VARCHAR(100) NOT NULL primary key,
	STATE VARCHAR(100), 
	COUNTRY VARCHAR(100),
	CityName VARCHAR(100),
	CONSTRAINT FK_CityName FOREIGN KEY (CityName) 
	REFERENCES CITY(CityName) ON DELETE CASCADE
);

--Insering values for Table: AIRPORT--

INSERT INTO AIRPORT (AirportName, STATE, COUNTRY, CityName) VALUES('Louisville International Airport','Kentucky','United States','Louisville');
INSERT INTO AIRPORT (AirportName, STATE, COUNTRY, CityName) VALUES('Chandigarh International Airport','Chandigarh','India','Chandigarh');
INSERT INTO AIRPORT (AirportName, STATE, COUNTRY, CityName) VALUES('Dallas/Fort Worth International Airport','Texas','United States','Fort Worth');
INSERT INTO AIRPORT (AirportName, STATE, COUNTRY, CityName) VALUES('Indira GandhiInternational Airport','Delhi','India','Delhi');
INSERT INTO AIRPORT (AirportName, STATE, COUNTRY, CityName) VALUES('Chhatrapati Shivaji International Airport','Maharashtra','India','Mumbai');
INSERT INTO AIRPORT (AirportName, STATE, COUNTRY, CityName) VALUES('San Francisco International Airport','California', 'United States','San Francisco');
INSERT INTO AIRPORT (AirportName, STATE, COUNTRY, CityName) VALUES('Frankfurt Airport','Hesse','Germany','Frankfurt');
INSERT INTO AIRPORT (AirportName, STATE, COUNTRY, CityName) VALUES('George Bush Intercontinental Airport','Texas','United States','Houston');
INSERT INTO AIRPORT (AirportName, STATE, COUNTRY, CityName) VALUES('John F. Kennedy International Airport','New York','United States','New York City');
INSERT INTO AIRPORT (AirportName, STATE, COUNTRY, CityName) VALUES('Tampa International Airport','Florida', 'United States','Tampa');

SELECT * FROM AIRPORT


-- Creating AIRLINE table
CREATE TABLE AIRLINE (
	AirlineID VARCHAR(3) NOT NULL PRIMARY KEY,
	AirlineName VARCHAR(100),
	THREE_DIGIT_CODE VARCHAR(3)
	);


-- Insering values for Table: AIRLINE --

INSERT INTO AIRLINE (AirlineID, AirlineName, THREE_DIGIT_CODE) VALUES('AA','American Airlines','001');
INSERT INTO AIRLINE (AirlineID, AirlineName, THREE_DIGIT_CODE) VALUES('AI','Air India Limited','098');
INSERT INTO AIRLINE (AirlineID, AirlineName, THREE_DIGIT_CODE) VALUES('LH','Lufthansa', '220');
INSERT INTO AIRLINE (AirlineID, AirlineName, THREE_DIGIT_CODE) VALUES('BA','British Airways','125');
INSERT INTO AIRLINE (AirlineID, AirlineName, THREE_DIGIT_CODE) VALUES('QR','Qatar Airways','157');
INSERT INTO AIRLINE (AirlineID, AirlineName, THREE_DIGIT_CODE) VALUES('9W','Jet Airways','589');
INSERT INTO AIRLINE (AirlineID, AirlineName, THREE_DIGIT_CODE) VALUES('EK','Emirates','176');
INSERT INTO AIRLINE (AirlineID, AirlineName, THREE_DIGIT_CODE) VALUES('EY','Ethiad Airways','607');

select * from AIRLINE


-- Creating CONTAINS table AS AIRPORTINFO TO BREAK MANY TO MANY RELATION
CREATE TABLE AIRPORTINFO(
	AirlineID VARCHAR(3) NOT NULL ,
	AirportName VARCHAR(100) NOT NULL ,
	PRIMARY KEY (AirlineID, AirportName), -- CANDIDATE KEY
	CONSTRAINT FK_AirlineID FOREIGN KEY (AirlineID)
	REFERENCES AIRLINE(AirlineID) ON DELETE CASCADE,
	CONSTRAINT FK_AiportName FOREIGN KEY (AirportName)
	REFERENCES AIRPORT(AirportName) ON DELETE CASCADE
);


-- Insering values into Table: AIRPORTINFO

INSERT INTO AIRPORTINFO (AirlineID, AirportName) VALUES('AA','Louisville International Airport');
INSERT INTO AIRPORTINFO (AirlineID, AirportName) VALUES('AA','John F. Kennedy International Airport');
INSERT INTO AIRPORTINFO (AirlineID, AirportName) VALUES('AA','George Bush Intercontinental Airport');
INSERT INTO AIRPORTINFO (AirlineID, AirportName) VALUES('AA','San Francisco International Airport');
INSERT INTO AIRPORTINFO (AirlineID, AirportName) VALUES('AA','Tampa International Airport');

INSERT INTO AIRPORTINFO (AirlineID, AirportName) VALUES('AI','Chandigarh International Airport');
INSERT INTO AIRPORTINFO (AirlineID, AirportName) VALUES('AI','Dallas/Fort Worth International Airport');
INSERT INTO AIRPORTINFO (AirlineID, AirportName) VALUES('AI','Indira GandhiInternational Airport');
INSERT INTO AIRPORTINFO (AirlineID, AirportName) VALUES('AI','Chhatrapati Shivaji International Airport');
INSERT INTO AIRPORTINFO (AirlineID, AirportName) VALUES('AI','George Bush Intercontinental Airport');

INSERT INTO AIRPORTINFO (AirlineID, AirportName) VALUES('LH','Chhatrapati Shivaji International Airport');
INSERT INTO AIRPORTINFO (AirlineID, AirportName) VALUES('LH','Frankfurt Airport');
INSERT INTO AIRPORTINFO (AirlineID, AirportName) VALUES('LH','John F. Kennedy International Airport');
INSERT INTO AIRPORTINFO (AirlineID, AirportName) VALUES('LH','San Francisco International Airport');
INSERT INTO AIRPORTINFO (AirlineID, AirportName) VALUES('LH','Dallas/Fort Worth International Airport');

INSERT INTO AIRPORTINFO (AirlineID, AirportName) VALUES('BA','John F. Kennedy International Airport');
INSERT INTO AIRPORTINFO (AirlineID, AirportName) VALUES('BA','Chhatrapati Shivaji International Airport');
INSERT INTO AIRPORTINFO (AirlineID, AirportName) VALUES('BA','Chandigarh International Airport');
INSERT INTO AIRPORTINFO (AirlineID, AirportName) VALUES('BA','Frankfurt Airport');
INSERT INTO AIRPORTINFO (AirlineID, AirportName) VALUES('BA','San Francisco International Airport');

INSERT INTO AIRPORTINFO (AirlineID, AirportName) VALUES('QR','Chhatrapati Shivaji International Airport');
INSERT INTO AIRPORTINFO (AirlineID, AirportName) VALUES('QR','Dallas/Fort Worth International Airport');
INSERT INTO AIRPORTINFO (AirlineID, AirportName) VALUES('QR','John F. Kennedy International Airport');
INSERT INTO AIRPORTINFO (AirlineID, AirportName) VALUES('QR','Tampa International Airport');
INSERT INTO AIRPORTINFO (AirlineID, AirportName) VALUES('QR','Louisville International Airport');

select * from AIRPORTINFO
-- Creating FLIGHT table
CREATE TABLE FLIGHT (
    FLIGHT_CODE VARCHAR(10) NOT NULL PRIMARY KEY,
    SOURCE VARCHAR(3),
    DESTINATION VARCHAR(3),
    ARRIVAL VARCHAR(10),
    DEPARTURE VARCHAR(10),
    STATUS VARCHAR(10),
    DURATION VARCHAR(30),
    FLIGHTTYPE VARCHAR(10),
    LAYOVER_TIME VARCHAR(30),
    NO_OF_STOPS INT,
    AIRLINEID VARCHAR(3),
	FOREIGN KEY(AirlineID) REFERENCES AIRLINE(AirlineID) ON DELETE CASCADE
);

INSERT INTO FLIGHT(FLIGHT_CODE, SOURCE, DESTINATION, ARRIVAL, DEPARTURE, STATUS, DURATION, FLIGHTTYPE, LAYOVER_TIME, NO_OF_STOPS, AirlineID)
VALUES('AI2014','BOM','DFW','02:10','03:15','On-time','24hr','Connecting',3,1,'AI');


INSERT INTO FLIGHT(FLIGHT_CODE, SOURCE, DESTINATION, ARRIVAL, DEPARTURE, STATUS, DURATION, FLIGHTTYPE, LAYOVER_TIME, NO_OF_STOPS, AirlineID)
VALUES('QR2305','BOM','DFW','13:00','13:55','Delayed','21hr','Non-stop',0,0,'QR');


INSERT INTO FLIGHT(FLIGHT_CODE, SOURCE, DESTINATION, ARRIVAL, DEPARTURE, STATUS, DURATION, FLIGHTTYPE, LAYOVER_TIME, NO_OF_STOPS, AirlineID)
VALUES('EY1234','JFK','TPA','19:20','20:05','On-time','16hrs','Connecting',5,2,'EY');


INSERT INTO FLIGHT(FLIGHT_CODE, SOURCE, DESTINATION, ARRIVAL, DEPARTURE, STATUS, DURATION, FLIGHTTYPE, LAYOVER_TIME, NO_OF_STOPS, AirlineID)
VALUES('LH9876','JFK','BOM','05:50','06:35','On-time','18hrs','Non-stop',0,0,'LH');


INSERT INTO FLIGHT(FLIGHT_CODE, SOURCE, DESTINATION, ARRIVAL, DEPARTURE, STATUS, DURATION, FLIGHTTYPE, LAYOVER_TIME, NO_OF_STOPS, AirlineID)
VALUES('BA1689','FRA','DEL','10:20','10:55','On-time','14hrs','Non-stop',0,0,'BA');


INSERT INTO FLIGHT(FLIGHT_CODE, SOURCE, DESTINATION, ARRIVAL, DEPARTURE, STATUS, DURATION, FLIGHTTYPE, LAYOVER_TIME, NO_OF_STOPS, AirlineID)
VALUES('AA4367','SFO','FRA','18:10','18:55','On-time','21hrs','Non-stop',0,0,'AA');


INSERT INTO FLIGHT(FLIGHT_CODE, SOURCE, DESTINATION, ARRIVAL, DEPARTURE, STATUS, DURATION, FLIGHTTYPE, LAYOVER_TIME, NO_OF_STOPS, AirlineID)
VALUES('QR1902','IXC','IAH','22:00','22:50','Delayed','28hrs','Non-stop',5,1,'QR');


INSERT INTO FLIGHT(FLIGHT_CODE, SOURCE, DESTINATION, ARRIVAL, DEPARTURE, STATUS, DURATION, FLIGHTTYPE, LAYOVER_TIME, NO_OF_STOPS, AirlineID)
VALUES('BA3056','BOM','DFW','02:15','02:55','On-time','29hrs','Connecting',3,1,'BA');


INSERT INTO FLIGHT(FLIGHT_CODE, SOURCE, DESTINATION, ARRIVAL, DEPARTURE, STATUS, DURATION, FLIGHTTYPE, LAYOVER_TIME, NO_OF_STOPS, AirlineID)
VALUES('EK3456','BOM','SFO','18:50','19:40','On-time','30hrs','Non-stop',0,0,'EK');


INSERT INTO FLIGHT(FLIGHT_CODE, SOURCE, DESTINATION, ARRIVAL, DEPARTURE, STATUS, DURATION, FLIGHTTYPE, LAYOVER_TIME, NO_OF_STOPS, AirlineID)
VALUES('9W2334','IAH','DEL','23:00','13:45','On-time','23hrs','Direct',0,0,'9W');


-- Updating the duration of a specific flight in the FLIGHT table
UPDATE FLIGHT
SET DURATION = '24hrs'
WHERE FLIGHT_CODE = 'QR2305';


UPDATE FLIGHT
SET DURATION = '24hrs'
WHERE FLIGHT_CODE = 'AI127';
 
SELECT * FROM FLIGHT

DROP TABLE PASSENGER
DROP TABLE PASSENGERINFO
DROP TABLE PASSENGER
DROP TABLE PASSENGERDETAIL

CREATE TABLE PASSENGERS(	
	PASSPORTNO VARCHAR(10) NOT NULL PRIMARY KEY,
	FNAME VARCHAR(20),
	M VARCHAR(1),
	LNAME VARCHAR(20),
	ADDRESS VARCHAR(100),
	PHONE  BIGINT,
	AGE INT,
	SEX VARCHAR(1)
);

--INSERTING VALUES IN TABLE: PASSENGERS--
INSERT INTO PASSENGERS(PASSPORTNO,FNAME,M,LNAME,ADDRESS,PHONE,AGE,SEX)
VALUES('A1234568','ALEN','M','SMITH','2230 NORTHSIDE, APT 11, ALBANY, NY',8080367290,30,'M');

INSERT INTO PASSENGERS(PASSPORTNO,FNAME,M,LNAME,ADDRESS,PHONE,AGE,SEX)
VALUES('B9876541','ANKITA','V','AHIR','3456 VIKAS APTS, APT 102,DOMBIVLI, INDIA',8080367280,26,'F');

INSERT INTO PASSENGERS(PASSPORTNO,FNAME,M,LNAME,ADDRESS,PHONE,AGE,SEX)
VALUES('C2345698','KHYATI','A','MISHRA','7820 MCCALLUM COURTS, APT 234, AKRON, OH',8082267280,30,'F');

INSERT INTO PASSENGERS(PASSPORTNO,FNAME,M,LNAME,ADDRESS,PHONE,AGE,SEX)
VALUES('D1002004','ANKITA','S','PATIL','7720 MCCALLUM BLVD, APT 1082, DALLAS, TX',9080367266,23,'F');

INSERT INTO PASSENGERS(PASSPORTNO,FNAME,M,LNAME,ADDRESS,PHONE,AGE,SEX)
VALUES('X9324666','TEJASHREE','B','PANDIT','9082 ESTAES OF RICHARDSON, RICHARDSON, TX',9004360125,28,'F');

INSERT INTO PASSENGERS(PASSPORTNO,FNAME,M,LNAME,ADDRESS,PHONE,AGE,SEX)
VALUES('B8765430','LAKSHMI','P','SHARMA','1110 FIR HILLS, APT 903, AKRON, OH',7666190505,30,'F');

INSERT INTO PASSENGERS(PASSPORTNO,FNAME,M,LNAME,ADDRESS,PHONE,AGE,SEX)
VALUES('J9801235','AKHILESH','D','JOSHI','345 CHATHAM COURTS, APT 678, MUMBAI, INDIA',9080369290,29,'M');

INSERT INTO PASSENGERS(PASSPORTNO,FNAME,M,LNAME,ADDRESS,PHONE,AGE,SEX)
VALUES('A1122334','MANAN','S','LAKHANI','5589 CHTHAM REFLECTIONS, APT 349 HOUSTON, TX',9004335126,25,'F');

INSERT INTO PASSENGERS(PASSPORTNO,FNAME,M,LNAME,ADDRESS,PHONE,AGE,SEX)
VALUES('Q1243567','KARAN','M','MOTANI','4444 FRANKFORD VILLA, APT 77, GUILDERLAND, NY',9727626643,22,'M');

INSERT INTO PASSENGERS(PASSPORTNO,FNAME,M,LNAME,ADDRESS,PHONE,AGE,SEX)
VALUES('S1243269','ROM','A','SOLANKI','7720 MCCALLUM BLVD, APT 2087, DALLAS, TX',9004568903,60,'M');

INSERT INTO PASSENGERS(PASSPORTNO,FNAME,M,LNAME,ADDRESS,PHONE,AGE,SEX)
VALUES('E3277889','John','A','GATES','1234 BAKER APTS, APT 59, HESSE, GERMANY',9724569986,10,'M');

INSERT INTO PASSENGERS(PASSPORTNO,FNAME,M,LNAME,ADDRESS,PHONE,AGE,SEX)
VALUES('K3212322','SARA','B','GOMES','6785 SPLITSVILLA, APT 34, MIAMI, FL',9024569226,15,'F');

INSERT INTO PASSENGERS(PASSPORTNO,FNAME,M,LNAME,ADDRESS,PHONE,AGE,SEX)
VALUES('P3452390','ALIA','V','BHAT','548 MARKET PLACE, SAN Francisco, CA',9734567800,10,'F');

INSERT INTO PASSENGERS(PASSPORTNO,FNAME,M,LNAME,ADDRESS,PHONE,AGE,SEX)
VALUES('W7543336','JOHN','P','SMITH','6666 ROCK HILL, APT 2902, TAMPA, FL',4624569986,55,'M');

INSERT INTO PASSENGERS(PASSPORTNO,FNAME,M,LNAME,ADDRESS,PHONE,AGE,SEX)
VALUES('R8990566','RIA','T','GUPTA','3355 PALENCIA, APT 2065, MUMBAI, INDIA',4724512343,10,'M');


-- Relationship between PASSENGER and FLIGHT
DROP TABLE PASSENGERINFO
CREATE TABLE PASSENGERINFO (
    PID INT NOT NULL,
	PASSPORTNO VARCHAR(10),
	PRIMARY KEY (PID, PASSPORTNO),
    FLIGHT_CODE VARCHAR(10),
	FOREIGN KEY (PASSPORTNO) REFERENCES PASSENGERS (PASSPORTNO) ON DELETE CASCADE,
    FOREIGN KEY (FLIGHT_CODE) REFERENCES FLIGHT(FLIGHT_CODE) ON DELETE CASCADE
);
INSERT INTO PASSENGERINFO(PID,PASSPORTNO, FLIGHT_CODE) VALUES(1,'A1234568','AI2014');
INSERT INTO PASSENGERINFO(PID,PASSPORTNO,FLIGHT_CODE) VALUES(2,'B9876541','LH9876');
INSERT INTO PASSENGERINFO(PID,PASSPORTNO,FLIGHT_CODE) VALUES(3,'C2345698','9W2334');
INSERT INTO PASSENGERINFO(PID,PASSPORTNO,FLIGHT_CODE) VALUES(4,'D1002004','QR1902');
INSERT INTO PASSENGERINFO(PID,PASSPORTNO,FLIGHT_CODE) VALUES(5,'X9324666','EY1234');
INSERT INTO PASSENGERINFO(PID,PASSPORTNO,FLIGHT_CODE) VALUES(6,'B8765430','BA3056');
INSERT INTO PASSENGERINFO(PID,PASSPORTNO,FLIGHT_CODE) VALUES(7,'J9801235','9W2334');
INSERT INTO PASSENGERINFO(PID,PASSPORTNO,FLIGHT_CODE) VALUES(8,'A1122334','AA4367');
INSERT INTO PASSENGERINFO(PID,PASSPORTNO,FLIGHT_CODE) VALUES(9,'Q1243567','QR1902');
INSERT INTO PASSENGERINFO(PID,PASSPORTNO,FLIGHT_CODE) VALUES(10,'S1243269','EK3456');
INSERT INTO PASSENGERINFO(PID,PASSPORTNO,FLIGHT_CODE) VALUES(11,'E3277889','BA1689');
INSERT INTO PASSENGERINFO(PID,PASSPORTNO,FLIGHT_CODE) VALUES(12,'K3212322','QR1902');
INSERT INTO PASSENGERINFO(PID,PASSPORTNO,FLIGHT_CODE) VALUES(13,'P3452390','AI2014');
INSERT INTO PASSENGERINFO(PID,PASSPORTNO,FLIGHT_CODE) VALUES(14,'W7543336','BA1689');
INSERT INTO PASSENGERINFO(PID,PASSPORTNO,FLIGHT_CODE) VALUES(15,'R8990566','QR2305');




-- Job type and salary for employees
CREATE TABLE EMPLOYEEINFO
(JOBTYPE VARCHAR(30) NOT NULL PRIMARY KEY,
SALARY BIGINT);

--INSERTING VALUES INTO TABLE: EMPLOYEE2--
INSERT INTO EMPLOYEEINFO(JOBTYPE, SALARY)VALUES('ADMINISTRATIVE SUPPORT',50000);
INSERT INTO EMPLOYEEINFO(JOBTYPE, SALARY)VALUES('ENGINEER',70000);
INSERT INTO EMPLOYEEINFO(JOBTYPE, SALARY)VALUES('TRAFFIC MONITOR',80000);
INSERT INTO EMPLOYEEINFO(JOBTYPE, SALARY)VALUES('AIRPORT AUTHORITY',90000);


--CREATING TABLE FOR EMPLOYEE DETAILS
CREATE TABLE EMPLOYEE(
	SSN bigINT NOT NULL PRIMARY KEY,
	FNAME VARCHAR(20),
	M VARCHAR(1),
	LNAME VARCHAR(20),
	ADDRESS VARCHAR(100),
	PHONE BIGINT,
	AGE INT,
	SEX VARCHAR(1),
	JOBTYPE VARCHAR(30),
	ASTYPE VARCHAR(30),
	ETYPE VARCHAR(30),
	SHIFT VARCHAR(20),
	POSITION VARCHAR(30),
	AirportName VARCHAR(100),
	FOREIGN KEY(AirportName) REFERENCES AIRPORT(AirportName) ON DELETE CASCADE,
	FOREIGN KEY (JOBTYPE) REFERENCES EMPLOYEEINFO(JOBTYPE) ON DELETE CASCADE

);

INSERT INTO EMPLOYEE(SSN, FNAME, M, LNAME, ADDRESS, PHONE, AGE, SEX, JOBTYPE, ASTYPE, ETYPE, SHIFT, POSITION, AirportName)
VALUES(123456789,'LINDA','M','GOODMAN','731 Fondren, Houston, TX',4356789345, 35, 'F','ADMINISTRATIVE SUPPORT','RECEPTIONIST','','','','Louisville International Airport');

INSERT INTO EMPLOYEE(SSN, FNAME, M, LNAME, ADDRESS, PHONE, AGE, SEX, JOBTYPE, ASTYPE, ETYPE, SHIFT, POSITION, AirportName)
VALUES(333445555,'JOHNY','N','PAUL','638 Voss, Houston, TX',9834561995, 40, 'M','ADMINISTRATIVE SUPPORT','SECRETARY','','','','Louisville International Airport');

INSERT INTO EMPLOYEE(SSN, FNAME, M, LNAME, ADDRESS, PHONE, AGE, SEX, JOBTYPE, ASTYPE, ETYPE, SHIFT, POSITION, AirportName)
VALUES(999887777,'JAMES','P','BOND','3321 Castle, Spring, TX',9834666995, 50, 'M','ENGINEER','','RADIO ENGINEER','','','Louisville International Airport');


INSERT INTO EMPLOYEE(SSN, FNAME, M, LNAME, ADDRESS, PHONE, AGE, SEX, JOBTYPE, ASTYPE, ETYPE, SHIFT, POSITION, AirportName)
VALUES(987654321,'SHERLOCK','A','HOLMES','123 TOP HILL, SAN Francisco,CA',8089654321, 47, 'M','TRAFFIC MONITOR','','','DAY','','San Francisco International Airport');

INSERT INTO EMPLOYEE(SSN, FNAME, M, LNAME, ADDRESS, PHONE, AGE, SEX, JOBTYPE, ASTYPE, ETYPE, SHIFT, POSITION, AirportName)
VALUES(666884444,'SHELDON','A','COOPER','345 CHERRY PARK, HESSE,GERMANY',1254678903, 55, 'M','TRAFFIC MONITOR','','NIGHT','','','Frankfurt Airport');


INSERT INTO EMPLOYEE(SSN, FNAME, M, LNAME, ADDRESS, PHONE, AGE, SEX, JOBTYPE, ASTYPE, ETYPE, SHIFT, POSITION, AirportName)
VALUES(453453453,'RAJ','B','SHARMA','345 FLOYDS, MUMBAI,INDIA',4326789031, 35, 'M','AIRPORT AUTHORITY','','','','MANAGER','Chhatrapati Shivaji International Airport');


INSERT INTO EMPLOYEE(SSN, FNAME, M, LNAME, ADDRESS, PHONE, AGE, SEX, JOBTYPE, ASTYPE, ETYPE, SHIFT, POSITION, AirportName)
VALUES(987987987,'NIKITA','C','PAUL','110 SYNERGY PARK, DALLAS,TX',5678904325, 33, 'F','ENGINEER','','AIRPORT CIVIL ENGINEER','','','Dallas/Fort Worth International Airport');


INSERT INTO EMPLOYEE(SSN, FNAME, M, LNAME, ADDRESS, PHONE, AGE, SEX, JOBTYPE, ASTYPE, ETYPE, SHIFT, POSITION, AirportName)
VALUES(888665555,'SHUBHAM','R','GUPTA','567 CHANDANI CHOWK, DELHI, INDIA',8566778890, 39, 'M','ADMINISTRATIVE SUPPORT','DATA ENTRY WORKER','','','','Indira GandhiInternational Airport');

INSERT INTO EMPLOYEE(SSN, FNAME, M, LNAME, ADDRESS, PHONE, AGE, SEX, JOBTYPE, ASTYPE, ETYPE, SHIFT, POSITION, AirportName)
VALUES(125478909,'PRATIK','T','GOMES','334 VITRUVIAN PARK, ALBANY, NY',4444678903, 56, 'M','TRAFFIC MONITOR','','DAY','','','John F. Kennedy International Airport');

INSERT INTO EMPLOYEE(SSN, FNAME, M, LNAME, ADDRESS, PHONE, AGE, SEX, JOBTYPE, ASTYPE, ETYPE, SHIFT, POSITION, AirportName)
VALUES(324567897,'ADIT','P','DESAI','987 SOMNATH, CHANDIGARH, INDIA',2244658909, 36, 'M','TRAFFIC MONITOR','','DAY','','','Chandigarh International Airport');

SELECT * FROM EMPLOYEE

-- Creating SERVES table
CREATE TABLE SERVES (
    SSN BIGINT NOT NULL,
    PID INT NOT NULL,
    PASSPORTNO VARCHAR(10) NOT NULL,
    PRIMARY KEY (SSN, PID, PASSPORTNO),
    FOREIGN KEY (SSN) REFERENCES EMPLOYEE(SSN) ON DELETE CASCADE,
    FOREIGN KEY (PID, PASSPORTNO) REFERENCES PASSENGERINFO(PID, PASSPORTNO) ON DELETE CASCADE
);


-- INSERTING VALUES INTO TABLE: SERVES--
INSERT INTO SERVES(SSN, PID, PASSPORTNO) VALUES(123456789,1,'A1234568');
INSERT INTO SERVES(SSN, PID, PASSPORTNO) VALUES(123456789,15,'R8990566');
INSERT INTO SERVES(SSN, PID, PASSPORTNO) VALUES(123456789,9,'Q1243567');
INSERT INTO SERVES(SSN, PID, PASSPORTNO) VALUES(888665555,4,'D1002004');
INSERT INTO SERVES(SSN, PID, PASSPORTNO) VALUES(888665555,13,'P3452390');
INSERT INTO SERVES(SSN, PID, PASSPORTNO) VALUES(333445555,10,'S1243269');
INSERT INTO SERVES(SSN, PID, PASSPORTNO) VALUES(333445555,12,'K3212322');
INSERT INTO SERVES(SSN, PID, PASSPORTNO) VALUES(888665555,12,'K3212322');
INSERT INTO SERVES(SSN, PID, PASSPORTNO) VALUES(123456789,7,'J9801235');
INSERT INTO SERVES(SSN, PID, PASSPORTNO) VALUES(888665555,7,'J9801235');

DROP TABLE TICKETINFO
-- Ticket pricing details (BOOKING DETAILS)
CREATE TABLE TICKETINFO (
    DATE_OF_BOOKING DATETIME NOT NULL,
    SOURCE VARCHAR(3) NOT NULL,
    DESTINATION VARCHAR(3) NOT NULL,
    CLASS VARCHAR(15) NOT NULL,
    PRICE INT,
    PRIMARY KEY (DATE_OF_BOOKING, SOURCE, DESTINATION, CLASS),
 
);

-- INSERTING VALUES INTO TICKET2--
INSERT INTO TICKETINFO(DATE_OF_BOOKING, SOURCE, DESTINATION, CLASS, PRICE) 
VALUES('11-MAY-24','BOM','DFW','ECONOMY',95000);

INSERT INTO TICKETINFO(DATE_OF_BOOKING, SOURCE, DESTINATION, CLASS, PRICE) 
VALUES('11-JUN-24','JFK','BOM','ECONOMY',100000);

INSERT INTO TICKETINFO(DATE_OF_BOOKING, SOURCE, DESTINATION, CLASS, PRICE) 
VALUES('21-AUG-24','IAH','DEL','BUSINESS',200000);

INSERT INTO TICKETINFO(DATE_OF_BOOKING, SOURCE, DESTINATION, CLASS, PRICE) 
VALUES('10-AUG-24','IXC','IAH','FIRST-CLASS',150000);

INSERT INTO TICKETINFO(DATE_OF_BOOKING, SOURCE, DESTINATION, CLASS, PRICE) 
VALUES('13-JUN-24','JFK','TPA','ECONOMY',98000);

INSERT INTO TICKETINFO(DATE_OF_BOOKING, SOURCE, DESTINATION, CLASS, PRICE) 
VALUES('11-NOV-24','BOM','DFW','ECONOMY',125000);

INSERT INTO TICKETINFO(DATE_OF_BOOKING, SOURCE, DESTINATION, CLASS, PRICE) 
VALUES('15-NOV-24','IAH','DEL','FIRST-CLASS',195000);

INSERT INTO TICKETINFO(DATE_OF_BOOKING, SOURCE, DESTINATION, CLASS, PRICE) 
VALUES('15-OCT-24','SFO','FRA','ECONOMY',170000);

INSERT INTO TICKETINFO(DATE_OF_BOOKING, SOURCE, DESTINATION, CLASS, PRICE) 
VALUES('12-NOV-24','IXC','IAH','ECONOMY',140000);

INSERT INTO TICKETINFO(DATE_OF_BOOKING, SOURCE, DESTINATION, CLASS, PRICE) 
VALUES('22-JAN-24','BOM','SFO','ECONOMY',45000);

INSERT INTO TICKETINFO(DATE_OF_BOOKING, SOURCE, DESTINATION, CLASS, PRICE) 
VALUES('19-OCT-24','FRA','DEL','ECONOMY',100000);

INSERT INTO TICKETINFO(DATE_OF_BOOKING, SOURCE, DESTINATION, CLASS, PRICE) 
VALUES('20-NOV-24','IXC','IAH','ECONOMY',120000);

INSERT INTO TICKETINFO(DATE_OF_BOOKING, SOURCE, DESTINATION, CLASS, PRICE) 
VALUES('13-MAY-24','BOM','DFW','ECONOMY',65000);

INSERT INTO TICKETINFO(DATE_OF_BOOKING, SOURCE, DESTINATION, CLASS, PRICE) 
VALUES('26-JUN-24','FRA','DEL','ECONOMY',80000);

INSERT INTO TICKETINFO(DATE_OF_BOOKING, SOURCE, DESTINATION, CLASS, PRICE) 
VALUES('11-AUG-24','BOM','DFW','ECONOMY',98000);

select * from TICKETINFO
DROP TABLE TICKETDETAIL
-- Cancellation details
CREATE TABLE TICKETDETAIL (
    DATE_OF_CANCELLATION DATETIME NOT NULL PRIMARY KEY,
    SURCHARGE INT,
   -- FOREIGN KEY (DATE_OF_CANCELLATION) REFERENCES TICKET1(DATE_OF_CANCELLATION) ON DELETE CASCADE
);

-- INSERTING VALUES INTO TABLE: TICKET3--

INSERT INTO TICKETDETAIL(DATE_OF_CANCELLATION, SURCHARGE) VALUES('10-DEC-24',75000);
INSERT INTO TICKETDETAIL(DATE_OF_CANCELLATION, SURCHARGE) VALUES('16-APRIL-24',75000);
INSERT INTO TICKETDETAIL(DATE_OF_CANCELLATION, SURCHARGE) VALUES('25-MAY-24',25000);

select * from TICKETDETAIL

-- Creating TICKET1 table
CREATE TABLE TICKET (
    TICKET_NUMBER BIGINT NOT NULL,
    SOURCE VARCHAR(3),
    DESTINATION VARCHAR(3),
    DATE_OF_BOOKING DATETIME,
    DATE_OF_TRAVEL DATETIME,
    SEATNO VARCHAR(5),
    CLASS VARCHAR(15),
    DATE_OF_CANCELLATION DATETIME,
    PID INT,
    PASSPORTNO VARCHAR(10),
    FLIGHT_CODE VARCHAR(10),
    PRIMARY KEY (TICKET_NUMBER),
    FOREIGN KEY (PID, PASSPORTNO) REFERENCES PASSENGERINFO(PID, PASSPORTNO) ON DELETE CASCADE,
    FOREIGN KEY (FLIGHT_CODE) REFERENCES FLIGHT(FLIGHT_CODE),
	FOREIGN KEY (DATE_OF_CANCELLATION) REFERENCES TICKETDETAIL(DATE_OF_CANCELLATION),
	FOREIGN KEY (DATE_OF_BOOKING, SOURCE, DESTINATION, CLASS) REFERENCES TICKETINFO(DATE_OF_BOOKING, SOURCE, DESTINATION, CLASS)

);
DROP TABLE TICKET
SELECT* FROM TICKET
--INSERTING INTO TABLE: TICKET1--
INSERT INTO TICKET(TICKET_NUMBER, SOURCE, DESTINATION, DATE_OF_BOOKING, DATE_OF_CANCELLATION, DATE_OF_TRAVEL, SEATNO, CLASS, PID, PASSPORTNO)
VALUES(0011234111122,'BOM','DFW','11-MAY-24','10-DEC-24','15-DEC-16','32A','ECONOMY',1,'A1234568');

INSERT INTO TICKET(TICKET_NUMBER, SOURCE, DESTINATION, DATE_OF_BOOKING, DATE_OF_CANCELLATION, DATE_OF_TRAVEL, SEATNO, CLASS, PID, PASSPORTNO)
VALUES(0984567222299,'JFK','BOM','11-JUN-24','10-DEC-24','','45D','ECONOMY',2,'B9876541');

INSERT INTO TICKET(TICKET_NUMBER, SOURCE, DESTINATION, DATE_OF_BOOKING, DATE_OF_CANCELLATION, DATE_OF_TRAVEL, SEATNO, CLASS, PID, PASSPORTNO)
VALUES(1768901333273,'IAH','DEL','21-AUG-24',NULL,'25-DEC-24','1A','BUSINESS',3,'C2345698');

INSERT INTO TICKET(TICKET_NUMBER, SOURCE, DESTINATION, DATE_OF_BOOKING, DATE_OF_CANCELLATION, DATE_OF_TRAVEL, SEATNO, CLASS, PID, PASSPORTNO)
VALUES(5890987441464,'IXC','IAH','10-AUG-24',NULL,'12-JAN-24','20C','FIRST-CLASS',4,'D1002004');

INSERT INTO TICKET(TICKET_NUMBER, SOURCE, DESTINATION, DATE_OF_BOOKING, DATE_OF_CANCELLATION, DATE_OF_TRAVEL, SEATNO, CLASS, PID, PASSPORTNO)
VALUES(1577654664266,'JFK','TPA','13-JUN-24',NULL,'10-DEC-24','54E','ECONOMY',5,'X9324666');

INSERT INTO TICKET(TICKET_NUMBER, SOURCE, DESTINATION, DATE_OF_BOOKING, DATE_OF_CANCELLATION, DATE_OF_TRAVEL, SEATNO, CLASS, PID, PASSPORTNO)
VALUES(2206543545545,'BOM','DFW','11-NOV-24',NULL,'12-FEB-24','43B','ECONOMY',6,'B8765430');

INSERT INTO TICKET(TICKET_NUMBER, SOURCE, DESTINATION, DATE_OF_BOOKING, DATE_OF_CANCELLATION, DATE_OF_TRAVEL, SEATNO, CLASS, PID, PASSPORTNO)
VALUES(7064321779737,'IAH','DEL','15-NOV-24',NULL,'25-DEC-24','27B','FIRST-CLASS',7,'J9801235');

INSERT INTO TICKET(TICKET_NUMBER, SOURCE, DESTINATION, DATE_OF_BOOKING, DATE_OF_CANCELLATION, DATE_OF_TRAVEL, SEATNO, CLASS, PID, PASSPORTNO)
VALUES(1571357215116,'SFO','FRA','15-OCT-24',NULL,'18-DEC-24','34E','ECONOMY',8,'A1122334');

INSERT INTO TICKET(TICKET_NUMBER, SOURCE, DESTINATION, DATE_OF_BOOKING, DATE_OF_CANCELLATION, DATE_OF_TRAVEL, SEATNO, CLASS, PID, PASSPORTNO)
VALUES(1570864987655,'IXC','IAH','12-NOV-24',NULL,'30-DEC-24','54C','ECONOMY',9,'Q1243567');

INSERT INTO TICKET(TICKET_NUMBER, SOURCE, DESTINATION, DATE_OF_BOOKING, DATE_OF_CANCELLATION, DATE_OF_TRAVEL, SEATNO, CLASS, PID, PASSPORTNO)
VALUES(1579283997799,'BOM','SFO','22-JAN-24','16-APRIL-24','15-DEC-25','38A','ECONOMY',10,'S1243269');

INSERT INTO TICKET(TICKET_NUMBER, SOURCE, DESTINATION, DATE_OF_BOOKING, DATE_OF_CANCELLATION, DATE_OF_TRAVEL, SEATNO, CLASS, PID, PASSPORTNO)
VALUES(1255701876107,'FRA','DEL','19-OCT-24',NULL,'31-DEC-24','57F','ECONOMY',11,'E3277889');

INSERT INTO TICKET(TICKET_NUMBER, SOURCE, DESTINATION, DATE_OF_BOOKING, DATE_OF_CANCELLATION, DATE_OF_TRAVEL, SEATNO, CLASS, PID, PASSPORTNO)
VALUES(1251334499699,'IXC','IAH','20-NOV-24',NULL,'12-JAN-25','45D','ECONOMY',12,'K3212322');

INSERT INTO TICKET(TICKET_NUMBER, SOURCE, DESTINATION, DATE_OF_BOOKING, DATE_OF_CANCELLATION, DATE_OF_TRAVEL, SEATNO, CLASS, PID, PASSPORTNO)
VALUES(1258776199490,'BOM','DFW','13-MAY-24','25-MAY-24','15-DEC-16','37C','ECONOMY',13,'P3452390');

INSERT INTO TICKET(TICKET_NUMBER, SOURCE, DESTINATION, DATE_OF_BOOKING, DATE_OF_CANCELLATION, DATE_OF_TRAVEL, SEATNO, CLASS, PID, PASSPORTNO)
VALUES(5891155114477,'FRA','DEL','26-JUN-24',NULL,'23-DEC-24','55C','ECONOMY',14,'W7543336');

INSERT INTO TICKET(TICKET_NUMBER, SOURCE, DESTINATION, DATE_OF_BOOKING, DATE_OF_CANCELLATION, DATE_OF_TRAVEL, SEATNO, CLASS, PID, PASSPORTNO)
VALUES(5893069766787,'BOM','DFW','11-AUG-24','25-MAY-24','22-DEC-24','33F','ECONOMY',15,'R8990566');

-- Update TICKET table to add FLIGHT_CODE for each TICKET_NUMBER

UPDATE TICKET SET FLIGHT_CODE = '9W2334' WHERE TICKET_NUMBER = 0011234111122;
UPDATE TICKET SET FLIGHT_CODE = 'AA4367' WHERE TICKET_NUMBER = 0984567222299;
UPDATE TICKET SET FLIGHT_CODE = 'QR1902' WHERE TICKET_NUMBER = 1768901333273;
UPDATE TICKET SET FLIGHT_CODE = 'EK3456' WHERE TICKET_NUMBER = 5890987441464;
UPDATE TICKET SET FLIGHT_CODE = 'BA1689' WHERE TICKET_NUMBER = 1577654664266;
UPDATE TICKET SET FLIGHT_CODE = 'QR1902' WHERE TICKET_NUMBER = 2206543545545;
UPDATE TICKET SET FLIGHT_CODE = 'AI2014' WHERE TICKET_NUMBER = 7064321779737;
UPDATE TICKET SET FLIGHT_CODE = 'BA1689' WHERE TICKET_NUMBER = 1571357215116;
UPDATE TICKET SET FLIGHT_CODE = 'QR2305' WHERE TICKET_NUMBER = 1570864987655;

UPDATE TICKET SET FLIGHT_CODE = '9W2334' WHERE TICKET_NUMBER = 1579283997799;
UPDATE TICKET SET FLIGHT_CODE = 'AA4367' WHERE TICKET_NUMBER = 1255701876107;
UPDATE TICKET SET FLIGHT_CODE = 'QR1902' WHERE TICKET_NUMBER = 1251334499699;
UPDATE TICKET SET FLIGHT_CODE = 'EK3456' WHERE TICKET_NUMBER = 1258776199490;
UPDATE TICKET SET FLIGHT_CODE = 'BA1689' WHERE TICKET_NUMBER = 5891155114477;
UPDATE TICKET SET FLIGHT_CODE = 'QR1902' WHERE TICKET_NUMBER = 5893069766787;

SELECT * FROM TICKET
 
DROP PROCEDURE DFWECONOMYPASSENGER
CREATE PROCEDURE DFWECONOMYPASSENGER
AS
BEGIN
    -- Select the required details
    SELECT 
        al.AirlineName,
        fl.FLIGHT_CODE,
        p1.FNAME,
        p1.LNAME,
        p2.PASSPORTNO,
        t.CLASS,
        t.DATE_OF_TRAVEL,
        t.DESTINATION,
        t.SOURCE,
        t.SEATNO,
        t.TICKET_NUMBER
    FROM 
        Airline al
        JOIN Flight fl ON al.AirlineID = fl.AirlineID
        JOIN TICKET t ON fl.FLIGHT_CODE = t.FLIGHT_CODE
        JOIN PASSENGERS p1 ON t.PASSPORTNO = p1.PASSPORTNO
        JOIN PASSENGERINFO p2 ON p1.PASSPORTNO = p2.PASSPORTNO
    WHERE 
        t.CLASS = 'ECONOMY'
        AND t.DESTINATION = 'DFW';

    -- The result set will be automatically output by the SELECT statement
END;

	 select * from TICKET
		 SELECT * FROM PASSENGERINFO
		 SELECT * FROM FLIGHT
		 SELECT* FROM PASSENGERS

EXEC DFWECONOMYPASSENGER;

-- STOR-- Testing the procedure in SQL Server Management Studio
ES PROCEDURE 02 GET ALL FLIGHT BY STATUS
drop procedure GetFlightsByStatus

 CREATE PROCEDURE GetFlightsByStatus
    @IN_STATUS VARCHAR(50)
AS
BEGIN
    -- Select distinct flight details based on the provided status
    SELECT DISTINCT 
        f.FLIGHT_CODE, 
        al.AirlineName, 
        f.ARRIVAL, 
        f.DEPARTURE, 
        f.SOURCE, 
        f.DESTINATION, 
        f.STATUS, 
        f.FLIGHTTYPE
    FROM 
        Airline al
        JOIN Flight f ON al.AirlineID = f.AirlineID
    WHERE 
        f.STATUS = @IN_STATUS;
END;


-- Testing the stored procedure
EXEC GetFlightsByStatus @IN_STATUS = 'Delayed';
-- or
EXEC GetFlightsByStatus @IN_STATUS = 'On-time';

-- TRIGGERS INSERT VALUE INTO FLIGHT TABLE
DROP TRIGGER DELAYEDFLIGHTS
CREATE TRIGGER DELAYEDFLIGHTS
ON FLIGHT
AFTER INSERT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM inserted WHERE STATUS = 'Delayed')
    BEGIN
        INSERT INTO DELAYED_FLIGHTS (FLIGHT_CODE, SOURCE, DESTINATION, AIRLINEID, REPORT_TIME)
        SELECT FLIGHT_CODE, SOURCE, DESTINATION, AIRLINEID, GETDATE()
        FROM inserted
        WHERE STATUS = 'Delayed';
    END
END;
DROP TRIGGER DELAYED_FLIGHTS
CREATE TABLE DELAYED_FLIGHTS 
(
    FLIGHT_CODE VARCHAR(20),
    SOURCE VARCHAR(20),
    DESTINATION VARCHAR(20),
    AIRLINEID VARCHAR(20),
    REPORT_TIME DATETIME
);
INSERT INTO FLIGHT(FLIGHT_CODE, SOURCE, DESTINATION, ARRIVAL, DEPARTURE, STATUS, DURATION, FLIGHTTYPE, LAYOVER_TIME, NO_OF_STOPS, AIRLINEID)
VALUES('AI127','BOM','DFW','02:10','03:15','Delayed','24hr','Connecting',3,1,'AI');

SELECT * FROM DELAYED_FLIGHTS

--TRIGGER 2 INSERTING AND UPDATING
CREATE TRIGGER UPDATEDSalary
ON EMPLOYEEINFO
AFTER INSERT, UPDATE
AS
BEGIN
    UPDATE e
    SET e.SALARY = CASE 
        WHEN i.JOBTYPE = 'Administrative Support' THEN i.SALARY * 1.10
        WHEN i.JOBTYPE = 'ENGINEER' THEN i.SALARY * 1.05
        WHEN i.JOBTYPE = 'TRAFFIC MONITOR' THEN i.SALARY * 1.25
        WHEN i.JOBTYPE = 'AIRPORT AUTHORITY' THEN i.SALARY * 1.45
        ELSE i.SALARY
    END
    FROM EMPLOYEEINFO e
    JOIN inserted i ON e.JOBTYPE = i.JOBTYPE;
END;
-- Insert a new employee record
INSERT INTO EMPLOYEEINFO (JOBTYPE, SALARY)
VALUES ('NEW_JOBTYPE', 45000);


-- Update an existing employee record
UPDATE EMPLOYEEINFO
SET SALARY = 60000
WHERE JOBTYPE = 'TRAFFIC MONITOR';


SELECT * FROM EMPLOYEEINFO

--TRIGGER 03
CREATE TABLE TICKET_PRICE_HISTORY(
	DATE_OF_BOOKING DATE NOT NULL PRIMARY KEY,
	SOURCE VARCHAR(3) NOT NULL,
	DESTINATION VARCHAR(3) NOT NULL,
	CLASS VARCHAR(15) NOT NULL,
	PRICE BIGINT
);
CREATE TRIGGER TRG_TICKET_PRICE_HISTORY
ON TICKETINFO
AFTER UPDATE
AS
BEGIN
    IF UPDATE(PRICE)
    BEGIN
        INSERT INTO TICKET_PRICE_HISTORY (DATE_OF_BOOKING, SOURCE, DESTINATION, CLASS, PRICE)
        SELECT 
            d.DATE_OF_BOOKING, 
            d.SOURCE, 
            d.DESTINATION, 
            d.CLASS, 
            d.PRICE
        FROM deleted d
        INNER JOIN inserted i ON d.DATE_OF_BOOKING = i.DATE_OF_BOOKING
                             AND d.SOURCE = i.SOURCE
                             AND d.DESTINATION = i.DESTINATION
                             AND d.CLASS = i.CLASS;
    END
END;
UPDATE TICKETINFO
SET PRICE = 150000
WHERE DATE_OF_BOOKING = '2024-05-11'
AND SOURCE = 'BOM'
AND DESTINATION = 'DFW'
AND CLASS = 'ECONOMY';

SELECT * FROM TICKETINFO
SELECT * FROM TICKET_PRICE_HISTORY

-- QUERIES
-- adding in here by self
--1
-- Query to find the number of flights each airline operates
SELECT AirlineID, COUNT(*) AS NumberOfFlights
FROM FLIGHT
GROUP BY AirlineID;
--CHECK BY JOIN

-- Query to find the average duration of flights for each airline
SELECT AirlineID, AVG(CAST(SUBSTRING(DURATION, 1, LEN(DURATION)-3) AS INT)) AS AverageDuration
FROM FLIGHT
GROUP BY AirlineID;

SELECT * FROM FLIGHT
select * from [dbo].[AIRLINE]

--2
-- Query to list all flights ordered by departure time
SELECT * FROM FLIGHT
ORDER BY DEPARTURE;

-- Query to list all airports in alphabetical order by city
SELECT * FROM AIRPORT
ORDER BY CityName DESC;

--view 3
-- Creating a view to show detailed flight information
CREATE VIEW Flight_Details AS
SELECT F.FLIGHT_CODE, F.SOURCE, F.DESTINATION, F.ARRIVAL, F.DEPARTURE, F.STATUS, F.DURATION, F.FLIGHTTYPE, F.LAYOVER_TIME, F.NO_OF_STOPS, A.AirlineName
FROM FLIGHT AS F 
JOIN AIRLINE AS A ON F.AirlineID = A.AirlineID;

-- Querying the FlightDetails view
SELECT * FROM Flight_Details;
SELECT * FROM FlightDetails
SELECT * FROM AIRLINE
SELECT * FROM FLIGHT


--query for applying condition in a view FlightDURATION
CREATE VIEW FLIGHTDURATION AS
SELECT 
    F.FLIGHT_CODE, 
    F.SOURCE, 
    F.DESTINATION, 
    F.ARRIVAL, 
    F.DEPARTURE, 
    F.STATUS, 
    F.DURATION, 
    F.FLIGHTTYPE, 
    F.LAYOVER_TIME, 
    F.NO_OF_STOPS, 
    A.AirlineName
FROM FLIGHT AS F 
JOIN AIRLINE AS A ON F.AirlineID = A.AirlineID
WHERE F.FLIGHTTYPE = 'Non-stop'
AND F.STATUS IN ('Active', 'Delayed');

SELECT * FROM FLIGHTDURATION


--INDEXING
-- Creating an index on the CityName column in the AIRPORT table
CREATE INDEX INDEX_CityName ON AIRPORT(CityName);
SELECT * FROM AIRPORT

-- Creating an index on the AirlineID column in the FLIGHT table
CREATE INDEX INDEX_AirlineID ON FLIGHT(AirlineID);
SELECT * FROM FLIGHT

-- Index on Flight Status
CREATE INDEX INDEX_FlightStatus ON FLIGHT(Status);
SELECT * FROM FLIGHT

-- Index on Passenger Name
CREATE INDEX INDEXX_PassengerName ON PASSENGERS(FNAME);
SELECT * FROM PASSENGERS

--SUBQUERY
-- Query to find all flights with a duration longer than the average flight duration
SELECT * FROM FLIGHT
WHERE CAST(SUBSTRING(DURATION, 1, LEN(DURATION)-3) AS INT)> 
      (SELECT AVG(CAST(SUBSTRING(DURATION, 1, LEN(DURATION)-3) AS INT)) FROM FLIGHT);

-- Query to find the airline(s) operating the most number of flights
SELECT AirlineID
FROM FLIGHT
GROUP BY AirlineID
HAVING COUNT(*) = (SELECT MAX(FlightCount) 
                   FROM (SELECT AIRLINEID ,COUNT(*) AS FlightCount FROM FLIGHT GROUP BY AIRLINEID) AS Sub);
-- Subquery to Get all flights with more than 100 passengers
SELECT FLIGHT_CODE
FROM FLIGHT
WHERE FLIGHT_CODE IN (
    SELECT FLIGHT_CODE
    FROM TICKET
    GROUP BY FLIGHT_CODE
    HAVING COUNT(PID) > 100
);

SELECT * FROM FLIGHT



--WILDCARDS
-- Query to find all flights that depart in the afternoon (12:00 to 18:00)12pm--6m
SELECT * FROM FLIGHT
WHERE DEPARTURE LIKE '12:%' OR DEPARTURE LIKE '13:%' OR DEPARTURE LIKE '14:%' OR DEPARTURE LIKE '15:%' OR DEPARTURE LIKE '16:%' OR DEPARTURE LIKE '17:%' OR DEPARTURE LIKE '18%:%';

SELECT * FROM FLIGHT

-- Query to find all cities in the United States
SELECT * FROM CITY
WHERE COUNTRY LIKE 'United States%';

-- Wildcard example: Get passengers with names starting with 'A'
SELECT * FROM PASSENGERS
WHERE FName LIKE 'A%';