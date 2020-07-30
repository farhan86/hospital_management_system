-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 30, 2017 at 02:52 PM
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
  `doctor_charge` int(11) DEFAULT NULL,
  `medicine_charge` int(11) DEFAULT NULL,
  `room_charge` int(11) DEFAULT NULL,
  `oprtn_charge` int(11) DEFAULT NULL,
  `no_of_days` int(11) DEFAULT NULL,
  `nursing_charge` int(11) DEFAULT NULL,
  `advance` int(11) DEFAULT '0',
  `lab_charge` int(11) DEFAULT NULL,
  `bill` int(11) DEFAULT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bills`
--

INSERT INTO `bills` (`bill_no`, `pid`, `patient_type`, `doctor_charge`, `medicine_charge`, `room_charge`, `oprtn_charge`, `no_of_days`, `nursing_charge`, `advance`, `lab_charge`, `bill`, `date`) VALUES
(1, 90, 'inpatient', 8000, 6000, 8000, 600000, 5, 4000, 9000, 8000, 625000, '2017-04-12 09:49:08');

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
  `pid` int(11) NOT NULL,
  `room_no` varchar(50) NOT NULL,
  `date_of_adm` datetime DEFAULT NULL,
  `date_of_dis` datetime DEFAULT NULL,
  `advance` int(11) DEFAULT '0',
  `labno` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inpatient`
--

INSERT INTO `inpatient` (`pid`, `room_no`, `date_of_adm`, `date_of_dis`, `advance`, `labno`) VALUES
(90, '1200', '2017-04-12 09:48:02', '2017-04-12 09:49:08', 1000000, 1),
(91, '1200', '2017-04-12 11:53:41', NULL, 1000000, 2);

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
(1, 90, 50, 27, '2017-04-12 09:48:02', 'CT scan', 'inpatient', 8000),
(2, 91, 86, 21, '2017-04-12 11:53:41', 'Semen', 'inpatient', 50000);

-- --------------------------------------------------------

--
-- Table structure for table `outpatient`
--

CREATE TABLE `outpatient` (
  `pid` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  `labno` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(86, 'Sohel', 'Rana', 22, 50, 'Male', 'Basha', 2147483647, 'Vision problem', 12, '2017-04-28', '17:00:00'),
(87, 'Abu', 'Saleh', 30, 90, 'Male', 'Bari house road', 2147483647, 'Overweight', 14, '2017-04-28', '14:00:00'),
(88, 'Shourov', 'Hossain', 23, 50, 'Male', 'House building', 2154646, 'Blah Blah', 21, '2017-04-28', '08:00:00'),
(89, 'Abul ', 'kabul', 40, 45, 'Male', 'blah blah', 2121212121, 'balah', 31, '2017-04-21', '21:25:00'),
(90, 'Farhan', 'Hossain', 23, 50, 'Male', 'House ', 555454545, 'Brain damage', 27, '2017-04-20', '18:00:00'),
(91, 'Arnab', 'Rizvi', 22, 86, 'Male', 'BAsha bari', 2147483647, 'AIDS', 21, '2017-04-27', '03:00:00'),
(92, 'Salman', 'Rahman', 28, 60, 'Male', 'Blah blah', 2147483647, 'Headache', 2, '2017-04-27', '08:00:00');

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
  ADD PRIMARY KEY (`pid`),
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
  MODIFY `bill_no` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `doctorid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT for table `lab`
--
ALTER TABLE `lab`
  MODIFY `labno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;
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
