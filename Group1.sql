-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 19, 2020 at 09:16 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aat_database`
--

-- --------------------------------------------------------

--
-- Table structure for table `accommodation`
--

CREATE TABLE `accommodation` (
  `accomNo` char(4) NOT NULL COMMENT 'Accommodation Number',
  `accomName` varchar(30) DEFAULT NULL COMMENT 'Accommodation Name',
  `address` varchar(50) NOT NULL COMMENT 'Accommodation Address',
  `postcode` int(4) NOT NULL,
  `state` varchar(3) NOT NULL,
  `type` char(15) DEFAULT NULL COMMENT 'Hotel, Rental Company, or Private Person',
  `starRating` int(1) DEFAULT NULL COMMENT 'Star Rating out of Five',
  `URL` text NOT NULL COMMENT 'Accommodation Website'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Accommodation Details';

--
-- Dumping data for table `accommodation`
--

INSERT INTO `accommodation` (`accomNo`, `accomName`, `address`, `postcode`, `state`, `type`, `starRating`, `URL`) VALUES
('A001', 'Deluge Resort', '72 Whitehaven Crescent BAYVIEW HEIGHTS', 4868, 'QLD', 'Hotel', 4, 'delugereport.com.au'),
('A002', 'Seven Seas Hotel', '4 Taylor Street COBRAM EAST', 3644, 'VIC', 'Rental Company', 2, '7Seas.com.au'),
('A003', 'Luxury Resort & Spa', '52 Rose Street THREE BRIDGES', 3797, 'WA', 'Hotel', 4, 'resortLuxury&SPA.com.au'),
('A004', 'Comfort Hotel & Spa', '44 Walter Crescent BATEMANS BAY', 2536, 'NSW', 'Hotel', 2, 'comfortHOTEL.com.au'),
('A005', 'Ebony Valley Resort & Spa', '35 Lane Street MACLEOD WEST', 3085, 'SA', 'Rental Company', 5, 'ebonyvalley.com.au'),
('A006', 'Illustrious Coast Motel', '4 Ageston Road WULKURAKA', 4305, 'ACT', 'Hotel', 1, 'CoastIllustiuous.com.au'),
('A007', 'Emerald Pastures Resort & Spa', '61 Walter Crescent BATEMANS BAY', 2536, 'NSW', 'Rental Company', 4, 'emeraldpastures.com.au'),
('A008', 'Sunrise Baron Hotel', '73 Murphy Street DOCTORS CAP', 6401, 'WA', 'Hotel', 3, 'sunrisebaron.com.au');

-- --------------------------------------------------------

--
-- Table structure for table `accomtypelookup`
--

CREATE TABLE `accomtypelookup` (
  `type` char(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `accomtypelookup`
--

INSERT INTO `accomtypelookup` (`type`) VALUES
('Hotel'),
('Private Person'),
('Rental Company');

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `bookingID` char(4) NOT NULL COMMENT 'Booking Identification Number',
  `startDate` date NOT NULL COMMENT 'Tour Starting Date',
  `endDate` date NOT NULL COMMENT 'Tour Ending Date',
  `numOfParticipants` int(2) NOT NULL COMMENT 'Number of Participants for the Client',
  `status` varchar(15) NOT NULL COMMENT 'Booking Status',
  `comment` varchar(250) DEFAULT NULL,
  `clientID` char(4) NOT NULL,
  `guideRegNo` char(4) NOT NULL COMMENT 'The guide for the tour',
  `tourDest` char(15) NOT NULL COMMENT 'Tour Destination',
  `staffID` char(4) NOT NULL COMMENT 'Staff Member who processed the booking'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Booking Details';

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`bookingID`, `startDate`, `endDate`, `numOfParticipants`, `status`, `comment`, `clientID`, `guideRegNo`, `tourDest`, `staffID`) VALUES
('B001', '2019-12-01', '2019-12-05', 4, 'Completed', NULL, 'C001', 'G004', 'Sydney', 'S001'),
('B002', '2018-06-15', '2018-06-17', 3, 'Completed', 'Restaurant with halal meat!', 'C002', 'G002', 'Melbourne', 'S004'),
('B003', '2019-01-01', '2019-01-03', 2, 'Completed', NULL, 'C003', 'G010', 'Gold Coast', 'S004'),
('B004', '2020-01-14', '2020-01-16', 5, 'Completed', 'My friends are allergic to peanut!', 'C004', 'G006', 'Alice Springs', 'S002'),
('B005', '2020-06-12', '2020-06-15', 2, 'Completed', 'My husband and I are vegetrians!', 'C005', 'G007', 'Adelaide', 'S007'),
('B006', '2020-09-22', '2020-09-24', 1, 'In-progress', NULL, 'C006', 'G003', 'Canberra', 'S007'),
('B007', '2020-09-23', '2020-09-24', 6, 'In-progress', 'Some participants are vegan', 'C001', 'G008', 'Perth', 'S004'),
('B008', '2020-09-05', '2020-09-08', 3, 'Completed', NULL, 'C004', 'G007', 'Adelaide', 'S007'),
('B009', '2020-10-01', '2020-10-03', 1, 'In-the-future', 'I have nut allergies!', 'C007', 'G001', 'Gold Coast', 'S001');

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `clientID` char(4) NOT NULL COMMENT 'Client Identification Number',
  `fName` varchar(25) NOT NULL COMMENT 'Client''s First Name',
  `lName` varchar(25) NOT NULL COMMENT 'Client''s Last Name',
  `DoB` date NOT NULL COMMENT 'Date of Birth',
  `gender` varchar(1) NOT NULL,
  `mobileNo` varchar(14) NOT NULL,
  `email` varchar(100) NOT NULL,
  `emergCont` varchar(14) NOT NULL COMMENT 'Client''s Emergency Contact Number'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Client Details';

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`clientID`, `fName`, `lName`, `DoB`, `gender`, `mobileNo`, `email`, `emergCont`) VALUES
('C001', 'Nicholas', 'Abbie', '1979-11-23', 'M', '(08) 8745 8527', 'nicholasannie@gmail.com', '(03) 5359 9852'),
('C002', 'Eva', 'Cook', '1968-04-13', 'F', '(03) 8778 1896', 'evacook@gmail.com', '(02) 6215 4698'),
('C003', 'Justin', 'Keats', '1985-08-02', 'M', '(07) 3702 1176', 'justinKeats@gmail.com', '(03) 6215 3240'),
('C004', 'Rebecca', 'Reibey', '1983-08-16', 'F', '(02) 4786 4029', 'rebeccaribey@gmail.com', '(02) 4043 3208'),
('C005', 'Christopher', 'Dulhunty', '1994-02-28', 'M', '(03) 5385 3314', 'christopherdulhunty@gmail.com', '(08) 9238 4898'),
('C006', 'Olivia', 'Morey', '1983-01-21', 'F', '(03) 5300 8562', 'oliviamorey@gmail.com', '(07) 3768 4222'),
('C007', 'Mason', 'Tozer', '1965-05-28', 'M', '(03) 5373 6421', 'masontozer@gmail.com', '(03) 8496 3055');

-- --------------------------------------------------------

--
-- Table structure for table `genderlookup`
--

CREATE TABLE `genderlookup` (
  `gender` char(1) NOT NULL,
  `description` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `genderlookup`
--

INSERT INTO `genderlookup` (`gender`, `description`) VALUES
('F', 'Female'),
('M', 'Male');

-- --------------------------------------------------------

--
-- Table structure for table `guide`
--

CREATE TABLE `guide` (
  `guideRegNo` char(4) NOT NULL COMMENT 'Guide Registration Number',
  `guideName` varchar(50) NOT NULL COMMENT 'Guide Full Name',
  `regDate` date NOT NULL COMMENT 'Guide Registration Date',
  `phoneNo` varchar(14) NOT NULL,
  `email` varchar(100) NOT NULL,
  `highestQual` varchar(15) DEFAULT NULL COMMENT 'Highest Qualification',
  `yrsExperience` smallint(6) GENERATED ALWAYS AS (timestampdiff(YEAR,`regDate`,curdate())) VIRTUAL,
  `hrlyRate` decimal(5,2) NOT NULL COMMENT 'Guide''s Hourly Rate',
  `mentor` varchar(4) DEFAULT NULL COMMENT 'Guide Registration Number for Mentor (Foreign Key)',
  `tourDest` varchar(15) NOT NULL COMMENT 'The tour that he/she guides (Foreign Key)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Guide Details';

--
-- Dumping data for table `guide`
--

INSERT INTO `guide` (`guideRegNo`, `guideName`, `regDate`, `phoneNo`, `email`, `highestQual`, `hrlyRate`, `mentor`, `tourDest`) VALUES
('G001', 'Sophia Bindon', '2007-01-19', '(08) 8725 0712', 'SophiaBindon@gmail.com', 'Diploma', '50.00', NULL, 'Gold Coast'),
('G002', 'Chelsea Wylde', '2006-03-13', '(08) 9079 3828', 'ChelseaWylde@gmail.com', NULL, '50.00', NULL, 'Melbourne'),
('G003', 'Nicholas Gair', '2013-12-23', '(07) 3949 8215', 'NicholasGair@gmail.com', 'Diploma', '35.00', 'G004', 'Canberra'),
('G004', 'Jordan Kershaw', '2002-02-28', '(08) 8338 4466', 'JordanKershaw@gmail.com', 'Certificate', '60.00', NULL, 'Sydney'),
('G005', 'Kiara Benham', '2018-06-19', '(08) 8720 3860', 'KiaraBenham@gmail.com', NULL, '35.00', 'G001', 'Melbourne'),
('G006', 'Jesse Beuzeville', '2016-07-26', '(03) 6220 2865', 'JesseBeuzeville@gmail.com', 'Certificate', '25.00', 'G002', 'Alice Springs'),
('G007', 'Georgia Osburn', '2016-01-05', '(07) 4568 2269', 'GeorgiaOsburn@gmail.com', 'High School', '30.00', 'G004', 'Adelaide'),
('G008', 'Levi Minahan', '2016-09-12', '(02) 4970 9717', 'LeviMinahan@gmail.com', NULL, '40.00', 'G002', 'Perth'),
('G009', 'Mason Everard', '2018-01-21', '(07) 4076 3401', 'MasonEverard@gmail.com', 'Diploma', '30.00', 'G004', 'Sydney'),
('G010', 'Sebastian Petterd', '2017-04-29', '(08) 9030 1936', 'SebastianPetterd@gmail.com', 'High School', '30.00', 'G001', 'Gold Coast');

-- --------------------------------------------------------

--
-- Table structure for table `itinerary`
--

CREATE TABLE `itinerary` (
  `bookingID` char(4) NOT NULL COMMENT 'The itinerary for the booking',
  `date` date NOT NULL,
  `depTime` time NOT NULL COMMENT 'Departure Time',
  `depPoint` varchar(35) NOT NULL COMMENT 'Departure Point (location)',
  `activitiesDescr` varchar(250) NOT NULL COMMENT 'Activties Description',
  `accomNo` char(4) NOT NULL COMMENT 'The accommodation for the clients'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Itinerary Details';

--
-- Dumping data for table `itinerary`
--

INSERT INTO `itinerary` (`bookingID`, `date`, `depTime`, `depPoint`, `activitiesDescr`, `accomNo`) VALUES
('B001', '2019-12-01', '11:00:00', 'Brisbane Airport', 'Sydney Airport (Arrival) > Sydney Harbour Bridge > Accommodation', 'A004'),
('B001', '2019-12-02', '09:30:00', 'Accommodation', 'Sydney Opera House > Darling Harbour', 'A004'),
('B001', '2019-12-03', '10:00:00', 'Accommodation', 'Bondai Beach > Royal Botanic Garden', 'A004'),
('B001', '2019-12-04', '10:00:00', 'Accommodation', 'Taronga Zoo Sydney > SEA LIFE Sydney Aquarium', 'A004'),
('B001', '2019-12-05', '10:00:00', 'Accommodation', 'Luna Park > Accommodation > Sydney Airport (Return)', 'A004'),
('B002', '2018-06-15', '08:00:00', 'Perth Airport', 'Melbourne Airport (Arrival) > National Gallery of Victoria > Accommodation', 'A002'),
('B002', '2018-06-16', '10:00:00', 'Accommodation', 'Melbourne Museum > Royal Botanic Gardens', 'A002'),
('B002', '2018-06-17', '10:00:00', 'Accommodation', 'Queen Victoria Market > Accommodation > Melbourne Airport (Return)', 'A002'),
('B003', '2019-01-01', '08:30:00', 'Broome Airport', 'Gold Coast Airport (Arrival) > SkyPoint Observation Deck > Accommodation', 'A001'),
('B003', '2019-01-02', '10:00:00', 'Accommodation', 'Currumbin Wildlife Sanctuary > Dreamworld Park', 'A001'),
('B003', '2019-01-03', '09:45:00', 'Accommodation', 'Warner Bros. Movie World > Accommodation > Gold Coast Airport (Return)', 'A001'),
('B004', '2020-01-14', '08:45:00', 'Sydney Airport', 'Alice Springs Airport (Arrival) > National Road Transport Hall of Fame > Accommodation', 'A003'),
('B004', '2020-01-15', '10:00:00', 'Accommodation', 'ANZAC Hill > Araluen Cultural Precinct', 'A003'),
('B004', '2020-01-16', '10:00:00', 'Accommodation', 'Reptile Centre > Accommodation > Alice Springs Airport (Return)', 'A003'),
('B005', '2020-06-12', '09:10:00', 'Perth Airport', 'Adelaide Airport (Arrival) > South Australian Museum > Accommodation', 'A005'),
('B005', '2020-06-13', '10:00:00', 'Accommodation', 'Adelaide Zoo > Adelaide Oval', 'A005'),
('B005', '2020-06-14', '10:00:00', 'Accommodation', 'Adelaide Central Market > Adelaide Botanic Garden', 'A005'),
('B005', '2020-06-15', '10:00:00', 'Accommodation', 'Cleland Conservation Park > Accommodation > Adelaide Airport (Return)', 'A005'),
('B006', '2020-09-22', '07:45:00', 'Gold Coast Airport', 'Canberra Airport (Arrival) > Telstra Tower > Accommodation', 'A006'),
('B006', '2020-09-23', '10:00:00', 'Accommodation', 'Australian War Memorial > National Gallery of Australia', 'A006'),
('B006', '2020-09-24', '10:00:00', 'Accommodation', 'National Zoo & Aquarium > Accommodation > Canberra Airport (Return)', 'A006'),
('B007', '2020-09-23', '05:30:00', 'Sydney Airport', 'Perth Airport (Arrival) > The Bell Tower > Accommodation', 'A008'),
('B007', '2020-09-24', '08:45:00', 'Accommodation', 'Kings Park and Botanic Garden > Perth Zoo > Accommodation > Perth Airport (Return)', 'A008'),
('B008', '2020-09-05', '09:00:00', 'Sydney Airport', 'Adelaide Airport (Arrival) > South Australian Museum > Accommodation', 'A005'),
('B008', '2020-09-06', '10:00:00', 'Accommodation', 'Adelaide Zoo > Adelaide Oval', 'A005'),
('B008', '2020-09-07', '10:00:00', 'Accommodation', 'Adelaide Central Market > Adelaide Botanic Garden', 'A005'),
('B008', '2020-09-08', '10:00:00', 'Accommodation', 'Cleland Conservation Park > Accommodation > Adelaide Airport (Return)', 'A005'),
('B009', '2020-10-01', '06:45:00', 'Darwin International Airport', 'Gold Coast Airport (Arrival) > SkyPoint Observation Deck > Accommodation', 'A001'),
('B009', '2020-10-02', '10:00:00', 'Accommodation', 'Currumbin Wildlife Sanctuary > Dreamworld Park', 'A001'),
('B009', '2020-10-03', '09:45:00', 'Accommodation', 'Warner Bros. Movie World > Accommodation > Gold Coast Airport (Return)', 'A001');

-- --------------------------------------------------------

--
-- Table structure for table `preference`
--

CREATE TABLE `preference` (
  `clientID` char(4) NOT NULL COMMENT 'Preference Belongs to the client',
  `tourDest` char(15) NOT NULL COMMENT 'Preference is about the tour',
  `prefAccomType` varchar(20) NOT NULL COMMENT 'Preferred Accommodation Type',
  `starRating` int(1) DEFAULT NULL COMMENT 'Accommodation Star Rating Preferred',
  `pointOfInterest` varchar(25) NOT NULL COMMENT 'Point (Location) Of Interest',
  `comment` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Preference Details';

--
-- Dumping data for table `preference`
--

INSERT INTO `preference` (`clientID`, `tourDest`, `prefAccomType`, `starRating`, `pointOfInterest`, `comment`) VALUES
('C001', 'Perth', 'Hotel', 5, 'Zoo', 'I want a hotel with strict hygiene'),
('C001', 'Sydney', 'Hotel', 5, 'Sightseeing', 'Prefer a hotel with a pool'),
('C002', 'Melbourne', 'Hotel', 4, 'Museum', 'I want a room above sixth floor'),
('C003', 'Gold Coast', 'Beach House', 4, 'Beach', 'I want a place near the beach');

-- --------------------------------------------------------

--
-- Table structure for table `qualificationlookup`
--

CREATE TABLE `qualificationlookup` (
  `qualification` char(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `qualificationlookup`
--

INSERT INTO `qualificationlookup` (`qualification`) VALUES
('Certificate'),
('Diploma'),
('High School');

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `clientID` char(4) NOT NULL COMMENT 'Client who reviewed',
  `tourDest` char(15) NOT NULL COMMENT 'Review is about the tour.',
  `reviewDate` date NOT NULL COMMENT 'Date reviewed',
  `overallRating` int(1) NOT NULL COMMENT 'Overall Rating of the tour out of five',
  `comment` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Review Details';

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`clientID`, `tourDest`, `reviewDate`, `overallRating`, `comment`) VALUES
('C001', 'Sydney', '2020-01-02', 4, 'Amazing trip! Had a blast, would highly recommend.'),
('C002', 'Melbourne', '2018-07-07', 5, 'Had a fantastic time!'),
('C003', 'Gold Coast', '2019-02-15', 3, 'It was good until the hotel caught on fire.'),
('C004', 'Alice Springs', '2020-01-27', 4, 'Very nice tour, would definitely come back.'),
('C005', 'Adelaide', '2020-06-23', 4, 'Had a really good time with a very good company.');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `staffID` char(4) NOT NULL COMMENT 'Staff Identification Number',
  `staffName` varchar(50) NOT NULL COMMENT 'Staff Full Name',
  `address` varchar(50) NOT NULL,
  `phoneNo` varchar(14) NOT NULL,
  `email` varchar(100) NOT NULL,
  `hireDate` date NOT NULL COMMENT 'Date hired and started working',
  `position` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Staff Details';

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staffID`, `staffName`, `address`, `phoneNo`, `email`, `hireDate`, `position`) VALUES
('S001', 'Jennifer Mullins', '84 Pipeclay Road REDBANK', '(02) 6779 9641', 'jennifermullins@gmail.com', '2009-08-24', 'Receptionist'),
('S002', 'Seth Weaver', '7 Wallum Court ZARA', '(02) 6620 5032', 'sethweaver@gmail.com', '2005-03-14', 'Manager'),
('S003', 'Nicole Rogers', '20 Davenport Street MILA', '(02) 6114 4545', 'nicolerogers@gmail.com', '2018-11-19', 'Assistant'),
('S004', 'Stephanie Meyer', '2 Ghost Hill Road MARSDEN PARK', '(02) 6126 3452', 'stephaniemeyer@gmail.com', '2011-09-19', 'Receptionist'),
('S005', 'Shawn Yates', '50 Davenport Street BUKALONG', '(02) 4730 2011', 'shawnyates@gmail.com', '2013-12-09', 'Accountant'),
('S006', 'Sarah James', '53 Ugoa Street GREEN POINT', '(02) 4984 6135', 'sarahjames@gmail.com', '2015-02-23', 'Media Planner'),
('S007', 'Ashley Cook', '4 Bette McNee Street BAGO', '(02) 6190 0158', 'ashleycook@gmail.com', '2017-06-29', 'Receptionist');

-- --------------------------------------------------------

--
-- Table structure for table `starratinglookup`
--

CREATE TABLE `starratinglookup` (
  `starRating` int(1) NOT NULL COMMENT 'Star Rating Out of Five'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `starratinglookup`
--

INSERT INTO `starratinglookup` (`starRating`) VALUES
(1),
(2),
(3),
(4),
(5);

-- --------------------------------------------------------

--
-- Table structure for table `statuslookup`
--

CREATE TABLE `statuslookup` (
  `status` char(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `statuslookup`
--

INSERT INTO `statuslookup` (`status`) VALUES
('Completed'),
('In-progress'),
('In-the-future');

-- --------------------------------------------------------

--
-- Table structure for table `tour`
--

CREATE TABLE `tour` (
  `tourDest` char(15) NOT NULL COMMENT 'Tour Destination',
  `daysLength` int(1) NOT NULL COMMENT 'Tour''s length in days',
  `maxGrpSize` int(2) NOT NULL COMMENT 'Maximum Group Size',
  `startAgeRg` int(2) NOT NULL COMMENT 'Starting Age Range',
  `endAgeRg` int(2) NOT NULL COMMENT 'Ending Age Range',
  `costPerPerson` decimal(7,2) NOT NULL COMMENT 'Cost per Person',
  `officialLang` varchar(15) NOT NULL COMMENT 'Official Language of the Tour'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='Tour Details';

--
-- Dumping data for table `tour`
--

INSERT INTO `tour` (`tourDest`, `daysLength`, `maxGrpSize`, `startAgeRg`, `endAgeRg`, `costPerPerson`, `officialLang`) VALUES
('Adelaide', 4, 15, 15, 75, '500.00', 'English'),
('Alice Springs', 3, 9, 15, 75, '460.00', 'English'),
('Canberra', 3, 10, 15, 75, '480.00', 'Mandarin'),
('Gold Coast', 3, 25, 15, 75, '3100.00', 'English'),
('Melbourne', 3, 15, 15, 75, '1250.00', 'Mandarin'),
('Perth', 2, 10, 15, 75, '270.00', 'English'),
('Sydney', 5, 25, 15, 75, '2500.00', 'English');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accommodation`
--
ALTER TABLE `accommodation`
  ADD PRIMARY KEY (`accomNo`),
  ADD UNIQUE KEY `URL` (`URL`) USING HASH,
  ADD KEY `type` (`type`),
  ADD KEY `starRating` (`starRating`);

--
-- Indexes for table `accomtypelookup`
--
ALTER TABLE `accomtypelookup`
  ADD PRIMARY KEY (`type`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`bookingID`),
  ADD KEY `clientID` (`clientID`),
  ADD KEY `guideRegNo` (`guideRegNo`),
  ADD KEY `tourDest` (`tourDest`),
  ADD KEY `staffID` (`staffID`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`clientID`),
  ADD UNIQUE KEY `mobileNo` (`mobileNo`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `gender` (`gender`);

--
-- Indexes for table `genderlookup`
--
ALTER TABLE `genderlookup`
  ADD PRIMARY KEY (`gender`);

--
-- Indexes for table `guide`
--
ALTER TABLE `guide`
  ADD PRIMARY KEY (`guideRegNo`),
  ADD UNIQUE KEY `phoneNo` (`phoneNo`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `mentor` (`mentor`),
  ADD KEY `highestQual` (`highestQual`),
  ADD KEY `tourDest` (`tourDest`);

--
-- Indexes for table `itinerary`
--
ALTER TABLE `itinerary`
  ADD PRIMARY KEY (`bookingID`,`date`) USING BTREE,
  ADD KEY `accomNo` (`accomNo`);

--
-- Indexes for table `preference`
--
ALTER TABLE `preference`
  ADD PRIMARY KEY (`clientID`,`tourDest`) USING BTREE,
  ADD KEY `starRating` (`starRating`),
  ADD KEY `tourDest` (`tourDest`);

--
-- Indexes for table `qualificationlookup`
--
ALTER TABLE `qualificationlookup`
  ADD PRIMARY KEY (`qualification`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`clientID`,`tourDest`),
  ADD KEY `overallRating` (`overallRating`),
  ADD KEY `tourDest` (`tourDest`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`staffID`),
  ADD UNIQUE KEY `phoneNo` (`phoneNo`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `starratinglookup`
--
ALTER TABLE `starratinglookup`
  ADD PRIMARY KEY (`starRating`);

--
-- Indexes for table `statuslookup`
--
ALTER TABLE `statuslookup`
  ADD PRIMARY KEY (`status`);

--
-- Indexes for table `tour`
--
ALTER TABLE `tour`
  ADD PRIMARY KEY (`tourDest`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `starratinglookup`
--
ALTER TABLE `starratinglookup`
  MODIFY `starRating` int(1) NOT NULL AUTO_INCREMENT COMMENT 'Star Rating Out of Five', AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accommodation`
--
ALTER TABLE `accommodation`
  ADD CONSTRAINT `accommodation_ibfk_1` FOREIGN KEY (`type`) REFERENCES `accomtypelookup` (`type`),
  ADD CONSTRAINT `accommodation_ibfk_2` FOREIGN KEY (`starRating`) REFERENCES `starratinglookup` (`starRating`);

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`clientID`) REFERENCES `client` (`clientID`),
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`guideRegNo`) REFERENCES `guide` (`guideRegNo`),
  ADD CONSTRAINT `booking_ibfk_3` FOREIGN KEY (`tourDest`) REFERENCES `tour` (`tourDest`),
  ADD CONSTRAINT `booking_ibfk_4` FOREIGN KEY (`staffID`) REFERENCES `staff` (`staffID`),
  ADD CONSTRAINT `booking_ibfk_5` FOREIGN KEY (`status`) REFERENCES `statuslookup` (`status`);

--
-- Constraints for table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `client_ibfk_1` FOREIGN KEY (`gender`) REFERENCES `genderlookup` (`gender`);

--
-- Constraints for table `guide`
--
ALTER TABLE `guide`
  ADD CONSTRAINT `guide_ibfk_1` FOREIGN KEY (`mentor`) REFERENCES `guide` (`guideRegNo`),
  ADD CONSTRAINT `guide_ibfk_2` FOREIGN KEY (`tourDest`) REFERENCES `tour` (`tourDest`),
  ADD CONSTRAINT `guide_ibfk_3` FOREIGN KEY (`highestQual`) REFERENCES `qualificationlookup` (`qualification`);

--
-- Constraints for table `itinerary`
--
ALTER TABLE `itinerary`
  ADD CONSTRAINT `itinerary_ibfk_1` FOREIGN KEY (`accomNo`) REFERENCES `accommodation` (`accomNo`),
  ADD CONSTRAINT `itinerary_ibfk_2` FOREIGN KEY (`bookingID`) REFERENCES `booking` (`bookingID`);

--
-- Constraints for table `preference`
--
ALTER TABLE `preference`
  ADD CONSTRAINT `preference_ibfk_1` FOREIGN KEY (`clientID`) REFERENCES `client` (`clientID`),
  ADD CONSTRAINT `preference_ibfk_2` FOREIGN KEY (`tourDest`) REFERENCES `tour` (`tourDest`),
  ADD CONSTRAINT `preference_ibfk_3` FOREIGN KEY (`starRating`) REFERENCES `starratinglookup` (`starRating`);

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`clientID`) REFERENCES `client` (`clientID`),
  ADD CONSTRAINT `review_ibfk_2` FOREIGN KEY (`tourDest`) REFERENCES `tour` (`tourDest`),
  ADD CONSTRAINT `review_ibfk_3` FOREIGN KEY (`overallRating`) REFERENCES `starratinglookup` (`starRating`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
