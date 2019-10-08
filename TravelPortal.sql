BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "Passenger" (
	"Passenger ID"	varchar(10) NOT NULL,
	"First Name"	char(10) NOT NULL,
	"Last Name"	char(10),
	"Age"	integer NOT NULL,
	"Sex"	char(1) NOT NULL,
	"Origin"	char(20),
	"Destination"	char(20),
	"Phone Number"	integer CHECK(`Phone Number`<=9999999999 and `Phone Number`>=0),
	"Date of Travel"	date,
	"Budget"	integer,
	PRIMARY KEY("Passenger ID")
);
CREATE TABLE IF NOT EXISTS "Flight" (
	"FlightNumber"	INTEGER NOT NULL,
	"AirlineCode"	varchar(10) NOT NULL,
	"Origin"	NUMERIC NOT NULL,
	"Destination"	NUMERIC NOT NULL,
	"Price"	INTEGER NOT NULL,
	"Departure Time"	time NOT NULL,
	"Arrival Time"	time NOT NULL,
	"Days"	varchar(7) NOT NULL,
	"Seats Available"	INTEGER NOT NULL,
	PRIMARY KEY("FlightNumber")
);
CREATE TABLE IF NOT EXISTS "Airline" (
	"AirlineCode"	varchar(10) NOT NULL,
	"Name"	char(20) NOT NULL,
	"Number Of Flights"	INTEGER,
	"Headquater"	varchar(20),
	PRIMARY KEY("AirlineCode")
);
CREATE TABLE IF NOT EXISTS "Booking" (
	"BookingID"	varchar(10) NOT NULL,
	"BookingTime"	time NOT NULL,
	"BookingDate"	date NOT NULL,
	"TransactionID"	varchar(10) NOT NULL,
	"FlightNumber"	INTEGER NOT NULL,
	"PassengerID"	varchar(10),
	PRIMARY KEY("BookingID")
);
CREATE TABLE IF NOT EXISTS "Transaction" (
	"TransactionID"	varchar(10) NOT NULL,
	"BookingID"	varchar(10) NOT NULL,
	"PassengerID"	varchar(10) NOT NULL,
	"Amount"	INTEGER NOT NULL,
	PRIMARY KEY("TransactionID")
);
INSERT INTO "Passenger" ("Passenger ID","First Name","Last Name","Age","Sex","Origin","Destination","Phone Number","Date of Travel","Budget") VALUES ('1P111','Ankit','Dimri',20,'M','Mumbai','Delhi',9920650556,'2019-11-21',10000),
 ('1P112','Aayushi','Singh',20,'F','Mumbai','Delhi',7738819485,'2019-11-21',8000),
 ('1P113','Dheeraj','Chaudhary',19,'M','Banglore','Mumbai',8955674124,'2019-10-15',8000),
 ('1P114','Somyadeep ','Shrivastava',20,'M','Hyderabad','Delhi',7845142562,'2019-12-25',10000),
 ('1P115','Sujeet','Mourya',21,'M','Delhi','Banglore',8888547111,'2019-12-12',12000),
 ('1P116','Akshay','Jain',20,'M','Banglore','Mumbai',8521463795,'2019-11-30',6000),
 ('1P117','Kapil','Jhade',20,'M','Hyderabad','Delhi',8957642157,'2019-10-6',6000),
 ('1P118','Tarun','Gupta',21,'M','Hyderabad','Delhi',6847512497,'2019-10-6',4500),
 ('1P119','Priya','',20,'F','Delhi','Banglore',9896587421,'2019-11-10',8000),
 ('1P120','Srushti','Desai',21,'F','Mumbai','Delhi',8895741358,'2019-12-23',11000),
 ('1P121','Aman','Gupta',20,'F','Mumbai','Banglore',9687451235,'2019-11-11',5000);
INSERT INTO "Flight" ("FlightNumber","AirlineCode","Origin","Destination","Price","Departure Time","Arrival Time","Days","Seats Available") VALUES (11111,'1JA12','Mumbai','Delhi',6000,'12:00','14:00','MTWTFSS',560),
 (11112,'IGO89','Mumbai','Hyderabad',4500,'16:00','17:30','M-W--S-',250),
 (11113,'QA362','Delhi','Banglore',8000,'13:00','16:00','MTWTFS-',500),
 (11114,'3FE22','Banglore','Mumbai',9000,'08:00','09:30','MTWTFSS',450),
 (11115,'SPJ23','Hyderabad','Delhi',5000,'11:00','14:00','M--TF--',150),
 (11117,'QA362','Banglore','Mumbai',8000,'10:00','11:25','MTWTF--',300),
 (11118,'SPJ23','Mumbai','Hyderabad',5000,'06:00','08:00','M--TF--',250),
 (11119,'1JA12','Dellhi','Banglore',6999,'11:00','14:00','--WT-SS',300),
 (11120,'QA362','Mumbai','Delhi',5899,'09:00','11:00','MTWTFSS',500),
 (11121,'3FE22','Mumbai','Delhi',6500,'10:00','12:00','-TWTF-S',500);
INSERT INTO "Airline" ("AirlineCode","Name","Number Of Flights","Headquater") VALUES ('1JA12','Jet Airways',20,'Mumbai'),
 ('SPJ23','Spicejet',12,'Hyderabad'),
 ('QA362','Qatar Airways',30,'Delhi'),
 ('3FE22','Fly Emirates',25,'Delhi'),
 ('IGO89','Indigo',18,'Banglore');
INSERT INTO "Booking" ("BookingID","BookingTime","BookingDate","TransactionID","FlightNumber","PassengerID") VALUES ('B111','16:00','2019-10-18','TX111',11111,'1P111'),
 ('B112','16:02','2019-10-18','TX112',11111,'1P112'),
 ('B113','10:00','2019-09-30','TX113',11121,'1P120'),
 ('B114','01:00','2019-10-21','TX114',11113,'1P115'),
 ('B115','08:00','2019-10-25','TX115',11114,'1P113');
INSERT INTO "Transaction" ("TransactionID","BookingID","PassengerID","Amount") VALUES ('TX111','B111','1P111',6000),
 ('TX112','B112','1P112',6000),
 ('TX113','B113','1P120',6500),
 ('TX114','B114','1P115',8000),
 ('TX115','B115','1P113',9000);
COMMIT;
