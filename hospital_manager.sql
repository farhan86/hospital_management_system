-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 09, 2017 at 08:59 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hospital_manager`
--

-- --------------------------------------------------------

--
-- Table structure for table `bills`
--

CREATE TABLE `bills` (
  `bill_no` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `patient_type` varchar(10) DEFAULT NULL,
  `doctor_charge` int(11) DEFAULT '0',
  `medicine_charge` int(11) NOT NULL DEFAULT '0',
  `room_charge` int(11) DEFAULT '0',
  `oprtn_charge` int(11) DEFAULT '0',
  `no_of_days` int(11) DEFAULT '0',
  `nursing_charge` int(11) DEFAULT '0',
  `advance` int(11) DEFAULT '0',
  `health_card` varchar(50) DEFAULT NULL,
  `lab_charge` int(11) DEFAULT '0',
  `bill` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `doctorid` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `dept` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`doctorid`, `first_name`, `last_name`, `dept`) VALUES
(1, 'MD. Abdul', 'Hafiz', 'Cardiology'),
(2, 'Lina', 'Khandakar', 'medicine'),
(3, 'John', 'Smith', 'cardiology'),
(4, 'John', 'Doe', 'child_sp'),
(5, 'Dr. Abu ', 'Jafar', ' Adult Hematology/HSCT'),
(6, 'Prof. (Dr.) Md.', 'Moniruzzaman ', 'Adult Hematology/HSCT'),
(7, 'Dr. Shams ', ' Munwar ', ' Cardiology'),
(8, 'Dr. A. Q. M.', ' Reza ', 'Cardiology'),
(9, 'Dr. Tamzeed', ' Ahmed', 'Cardiology'),
(10, 'Dr. Md. Zulfiqur ', ' Haider', 'Cardiothoracic & Vascular Surgery'),
(11, 'Dr. Sohail ', 'Ahmed', 'Cardiothoracic & Vascular Surgery'),
(12, 'Dr. Farzana ', ' Islam', 'Child Development Centre'),
(13, 'Dr.Tarana ', 'Anis', 'Child Development Centre'),
(14, 'Dr. Kazi', 'Hasinur', 'Dental Surgeon'),
(15, 'Dr. Golam ', ' Mohiuddin ', 'Dental Surgeon'),
(16, 'Dr. Md. Golam ', 'Rubby', 'Dental Surgeon'),
(17, 'Dr. Rubaiya ', 'Ali', 'Dermatology'),
(18, 'Prof.(Dr.) Hasibur', 'Rahman', 'Dermatology'),
(19, 'Dr. Jasmin', 'Manzoor', 'Dermatology'),
(20, 'Dr. Lutful L.', 'Chowdhury ', ' Gastroenterology'),
(21, 'Dr. Iqbal', 'Murshed', 'Gastroenterology'),
(22, 'Dr. Hafeza', 'Aftab ', 'Gastroenterology'),
(23, 'Dr. Md. Nabiul ', 'Hassan', 'Nephrology'),
(24, 'Dr. Fahmida', 'Begum', 'Nephrology'),
(25, 'Dr. Sandip', 'Kumar', 'Neurology'),
(26, 'Dr. Alim', 'Akhtar ', 'Neurology'),
(27, 'Dr. Khandker', ' Mahbubar', ' Neurology'),
(28, 'Dr. Md. Aliuzzaman ', ' Joarder', 'Neurosurgery'),
(29, 'Prof. (Dr.) Mathew J.', 'Chandy', 'Neurosurgery'),
(30, 'Dr. M.', 'Ali', 'Orthopaedics'),
(31, 'Dr. Nandkumar', 'Katakdhond', 'Orthopaedics');

-- --------------------------------------------------------

--
-- Table structure for table `inpatient`
--

CREATE TABLE `inpatient` (
  `room_no` varchar(50) NOT NULL,
  `date_of_adm` datetime DEFAULT NULL,
  `date_of_dis` datetime DEFAULT NULL,
  `advance` int(11) DEFAULT NULL,
  `labno` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inpatient`
--

INSERT INTO `inpatient` (`room_no`, `date_of_adm`, `date_of_dis`, `advance`, `labno`) VALUES
('', NULL, NULL, NULL, 101);

-- --------------------------------------------------------

--
-- Table structure for table `lab`
--

CREATE TABLE `lab` (
  `labno` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `weight` int(11) NOT NULL,
  `doctorid` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `category` varchar(15) NOT NULL,
  `patient_type` varchar(15) NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lab`
--

INSERT INTO `lab` (`labno`, `pid`, `weight`, `doctorid`, `date`, `category`, `patient_type`, `amount`) VALUES
(88, 6, 62, 2, '2017-04-09 23:18:46', 'Blood', 'outpatient', 100),
(89, 5, 24, 22, '2017-04-09 23:19:41', 'Dental', 'outpatient', 1000),
(101, 7, 80, 23, '2017-04-10 00:08:11', 'blood', 'inpatient', 2000),
(103, 8, 30, 2, '2017-04-10 00:51:36', 'blood', 'outpatient', 300),
(104, 8, 30, 2, '2017-04-10 00:53:53', 'blood', 'inpatient', 300);

-- --------------------------------------------------------

--
-- Table structure for table `outpatient`
--

CREATE TABLE `outpatient` (
  `pid` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  `labno` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `outpatient`
--

INSERT INTO `outpatient` (`pid`, `date`, `labno`) VALUES
(5, '2017-04-09 23:19:41', 89),
(6, '2017-04-09 23:18:46', 88),
(8, '2017-04-10 00:51:36', 103);

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `pid` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `age` int(150) NOT NULL,
  `weight` int(255) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phoneno` int(20) NOT NULL,
  `disease` text NOT NULL,
  `doctorid` int(255) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`pid`, `first_name`, `last_name`, `age`, `weight`, `gender`, `address`, `phoneno`, `disease`, `doctorid`, `date`, `time`) VALUES
(4, 'Farhan', 'Ahmed', 24, 65, 'Male', 'Basha bari at basha 24', 1625428725, 'Headache', 2, '2017-04-12', '19:00:00'),
(5, 'Pius', 'Chowdhury', 50, 24, 'Male', 'House 24, road 2', 123456789, 'Too Skinny', 22, '2017-04-29', '16:00:00'),
(6, 'Abdul', 'Ahad', 60, 62, 'Male', 'basha bari', 2147483647, 'Joint pain', 2, '2017-04-21', '21:00:00'),
(7, 'Hello', 'World', 30, 80, 'Female', 'basha', 2147483647, 'Blah blah', 23, '2017-04-29', '15:00:00'),
(8, 'Sharmin', 'Shultana', 21, 30, 'Female', 'Basha at basha', 2147483647, 'Cold', 2, '2017-04-12', '13:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `room_no` int(11) NOT NULL,
  `room_type` varchar(10) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `staff_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `age` int(4) NOT NULL,
  `qualification` varchar(50) NOT NULL,
  `phoneno` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staff_id`, `first_name`, `last_name`, `age`, `qualification`, `phoneno`) VALUES
(1, 'Youshuf', 'Khan', 35, 'Cashier', 123456),
(2, 'Halima', 'Akter', 33, 'Cleaner', 987654),
(3, 'Jamal', 'Hossen', 23, 'Cleaner', 923456),
(4, 'Karim', 'Abdulla', 36, 'Helper', 823456),
(5, 'Jashim', 'Khan', 45, 'Medicine_checker', 93456),
(6, 'Jobaida', 'Khanom', 43, 'Cleaner', 673456);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `gender` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `first_name`, `last_name`, `username`, `password`, `gender`) VALUES
(1, 'Nurse', 'Joy', 'joy86', '12345678', 'female');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`bill_no`),
  ADD KEY `pid` (`pid`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`doctorid`),
  ADD UNIQUE KEY `doctorid` (`doctorid`);

--
-- Indexes for table `inpatient`
--
ALTER TABLE `inpatient`
  ADD PRIMARY KEY (`room_no`),
  ADD UNIQUE KEY `labno_2` (`labno`),
  ADD KEY `labno` (`labno`);

--
-- Indexes for table `lab`
--
ALTER TABLE `lab`
  ADD PRIMARY KEY (`labno`),
  ADD UNIQUE KEY `labno` (`labno`),
  ADD KEY `doctorid` (`doctorid`),
  ADD KEY `pid_fk` (`pid`);

--
-- Indexes for table `outpatient`
--
ALTER TABLE `outpatient`
  ADD PRIMARY KEY (`pid`),
  ADD UNIQUE KEY `pid` (`pid`),
  ADD UNIQUE KEY `labno_2` (`labno`),
  ADD UNIQUE KEY `labno_4` (`labno`),
  ADD KEY `labno` (`labno`),
  ADD KEY `labno_3` (`labno`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`pid`),
  ADD UNIQUE KEY `pid` (`pid`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`room_no`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`staff_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bills`
--
ALTER TABLE `bills`
  MODIFY `bill_no` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `doctorid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT for table `lab`
--
ALTER TABLE `lab`
  MODIFY `labno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;
--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `room_no` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `staff_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `bills`
--
ALTER TABLE `bills`
  ADD CONSTRAINT `pid_bill_fk` FOREIGN KEY (`pid`) REFERENCES `patients` (`pid`);

--
-- Constraints for table `inpatient`
--
ALTER TABLE `inpatient`
  ADD CONSTRAINT `labno_inpatient_fk` FOREIGN KEY (`labno`) REFERENCES `lab` (`labno`);

--
-- Constraints for table `lab`
--
ALTER TABLE `lab`
  ADD CONSTRAINT `pid_fk` FOREIGN KEY (`pid`) REFERENCES `patients` (`pid`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
