-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 22, 2021 at 02:51 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `elms`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `UserName` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `updationDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `UserName`, `Password`, `updationDate`) VALUES
(1, 'admin', '827ccb0eea8a706c4c34a16891f84e7b', '2020-07-07 09:30:42'),
(2, 'vedant', '827ccb0eea8a706c4c34a16891f84e7b', '2020-07-07 09:30:42'),
(3, 'darshini', '827ccb0eea8a706c4c34a16891f84e7b', '2020-07-07 09:30:42');

-- --------------------------------------------------------

--
-- Table structure for table `tbldepartments`
--

CREATE TABLE `tbldepartments` (
  `id` int(11) NOT NULL,
  `DepartmentName` varchar(150) DEFAULT NULL,
  `DepartmentShortName` varchar(100) NOT NULL,
  `DepartmentCode` varchar(50) DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbldepartments`
--

INSERT INTO `tbldepartments` (`id`, `DepartmentName`, `DepartmentShortName`, `DepartmentCode`, `CreationDate`) VALUES
(1, 'Computer Science', 'CSE', '101', '2020-11-01 07:16:25'),
(2, 'Information SCience', 'ISE', '102', '2020-11-01 07:19:37'),
(3, 'ELE Communication', 'EC', '103', '2020-12-02 21:28:56'),
(4, 'Mechanical Engineering', 'ME', '104', '2020-12-02 21:28:56'),
(5, 'Civil Engineering\r\n', 'CIV\r\n', '105', '2020-12-02 21:28:56'),
(6, 'Industrial engineering management', 'IEM', '106', '2021-01-11 16:29:12');

-- --------------------------------------------------------

--
-- Table structure for table `tblemployees`
--

CREATE TABLE `tblemployees` (
  `id` int(11) NOT NULL,
  `EmpId` varchar(100) NOT NULL,
  `FirstName` varchar(150) NOT NULL,
  `LastName` varchar(150) NOT NULL,
  `EmailId` varchar(200) NOT NULL,
  `Password` varchar(180) NOT NULL,
  `Gender` varchar(100) NOT NULL,
  `Dob` varchar(100) NOT NULL,
  `Department` varchar(255) NOT NULL,
  `Address` varchar(255) NOT NULL,
  `City` varchar(200) NOT NULL,
  `Country` varchar(150) NOT NULL,
  `Phonenumber` char(11) NOT NULL,
  `Status` int(1) NOT NULL,
  `RegDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblemployees`
--

INSERT INTO `tblemployees` (`id`, `EmpId`, `FirstName`, `LastName`, `EmailId`, `Password`, `Gender`, `Dob`, `Department`, `Address`, `City`, `Country`, `Phonenumber`, `Status`, `RegDate`) VALUES
(1, '18400', 'Malini ', 'M Patil', 'drmalinimpatil@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 'Female', '29 JUN 1970', 'Information Science', 'Bangalore', 'RR Nagar', 'India', '9845673467', 1, '2020-07-07 11:29:59'),
(2, '18402', 'Ashok', 'D V', 'ashokdv@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 'Male', '12 NOV 1970', 'Information Science', 'Bangalore ', 'HSR Layout', 'India', '9532458634', 1, '2020-11-10 13:40:02'),
(3, '18300', 'Naveen ', 'K', 'naveeen3@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 'Male', '04 JUL 1970', 'Computer Science', 'Bangalore ', 'Jayangar', 'India', '8956789541', 1, '2020-11-10 13:40:02'),
(4, '18200', 'Latha', 'S', 'latha45@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 'Female', '23 APR 1975', 'ELE Communication', 'Bangalore ', 'JP Nagar', 'India', '8587944255', 1, '2020-11-10 13:40:02'),
(5, '18600', 'Yogesh', 'K B', 'yogeshkb@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 'Male', '25 FEB 1971', 'Mechanical Engineering', 'Bangalore', 'Nagarabhavi', 'India', '9885632244', 1, '2020-11-10 13:40:02'),
(6, '18700', 'Pramukh', 'V', 'pramukhv@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 'Male', '1 November, 2021', 'Industrial engineering management', 'Bangalore', 'Malleshwaram', 'India', '7760546982', 1, '2021-01-11 16:34:35');

CREATE TRIGGER `insert_log` AFTER INSERT ON `tblemployees`
 FOR EACH ROW INSERT INTO LOGS VALUES(null,NEW.id,'inserted',NOW())
-- --------------------------------------------------------

--
-- Table structure for table `tblleaves`
--

CREATE TABLE `tblleaves` (
  `id` int(11) NOT NULL,
  `LeaveType` varchar(110) NOT NULL,
  `ToDate` varchar(120) NOT NULL,
  `FromDate` varchar(120) NOT NULL,
  `Description` mediumtext NOT NULL,
  `PostingDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `AdminRemark` mediumtext DEFAULT NULL,
  `AdminRemarkDate` varchar(120) DEFAULT NULL,
  `Status` int(1) NOT NULL,
  `IsRead` int(1) NOT NULL,
  `empid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblleaves`
--

INSERT INTO `tblleaves` (`id`, `LeaveType`, `ToDate`, `FromDate`, `Description`, `PostingDate`, `AdminRemark`, `AdminRemarkDate`, `Status`, `IsRead`, `empid`) VALUES
(1, 'Casual Leave', '1 NOV 2020', '3 NOV 2020', 'Out of Station', '2020-10-30 05:49:40', ' Okay', '2020-11-01 23:26:27 ', 2, 1, 1),
(2, 'Medical Leave test', '10 NOV 2020', '11 NOV 2020', 'Not well', '2020-11-01 11:14:14', 'OKAY', '2020-11-05 23:24:39 ', 1, 1, 4),
(3, 'Casual leave', '12 NOV 2020', '13 NOV 2020', 'Personal Work', '2020-11-05 18:26:01', 'ok', '2020-11-07 16:13:33 ', 2, 1, 3),
(5, 'MEDICAL LEAVE', '03 DEC 2020', '06 DEC 2020', 'Medical Emergency', '2020-12-01 10:51:37', 'Okay', '2020-12-05 16:30:52 ', 1, 1, 5),
(12, 'Restricted Holiday(RH)', '04/07/2075', '24/05/2011', 'hgjj', '2021-01-06 20:53:33', NULL, NULL, 0, 1, 1),
(13, 'Restricted Holiday(RH)', '15/01/2021', '14/01/2021', 'Trip', '2021-01-11 16:21:47', 'disapproved', '2021-01-11 21:55:11 ', 2, 1, 1),
(14, 'Casual leave (Half day)', '26/01/2021', '26/01/2021', 'personal work', '2021-01-11 16:41:24', 'okay', '2021-01-11 22:13:18 ', 1, 1, 6);

-- --------------------------------------------------------

--
-- Table structure for table `tblleavetype`
--

CREATE TABLE `tblleavetype` (
  `id` int(11) NOT NULL,
  `LeaveType` varchar(200) DEFAULT NULL,
  `Description` mediumtext DEFAULT NULL,
  `CreationDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblleavetype`
--

INSERT INTO `tblleavetype` (`id`, `LeaveType`, `Description`, `CreationDate`) VALUES
(1, 'Casual Leave', 'Casual Leave ', '2020-11-01 12:07:56'),
(2, 'Medical Leave test', 'Medical Leave  test', '2020-11-06 13:16:09'),
(3, 'Restricted Holiday(RH)', 'Restricted Holiday(RH)', '2020-11-06 13:16:38'),
(4, 'Casual Leave( half day)', 'Morning/Afternoon', '2020-11-06 13:16:38');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbldepartments`
--
ALTER TABLE `tbldepartments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblemployees`
--
ALTER TABLE `tblemployees`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblleaves`
--
ALTER TABLE `tblleaves`
  ADD PRIMARY KEY (`id`),
  ADD KEY `UserEmail` (`empid`);

--
-- Indexes for table `tblleavetype`
--
ALTER TABLE `tblleavetype`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbldepartments`
--
ALTER TABLE `tbldepartments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT for table `tblemployees`
--
ALTER TABLE `tblemployees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tblleaves`
--
ALTER TABLE `tblleaves`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tblleavetype`
--
ALTER TABLE `tblleavetype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;






/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
