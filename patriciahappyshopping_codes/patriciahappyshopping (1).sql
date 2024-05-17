-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 15, 2024 at 07:18 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `patriciahappyshopping`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `addressID` varchar(20) NOT NULL,
  `street` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `zipCode` varchar(10) NOT NULL,
  `country` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `categoryID` varchar(20) NOT NULL,
  `categoryName` varchar(20) NOT NULL,
  `Description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`categoryID`, `categoryName`, `Description`) VALUES
('1', 'Mens', 'Cool stuff for mens'),
('2', 'Womens', 'Trending outfits for womens');

-- --------------------------------------------------------

--
-- Table structure for table `delivery`
--

CREATE TABLE `delivery` (
  `deliveryID` varchar(50) NOT NULL,
  `userID` varchar(20) NOT NULL,
  `AddressID` varchar(50) NOT NULL,
  `deliveryDate` datetime NOT NULL,
  `deliveryStatus` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `message system`
--

CREATE TABLE `message system` (
  `MessageID` varchar(15) NOT NULL,
  `MessageContent` varchar(100) NOT NULL,
  `Date` date NOT NULL,
  `usernameID` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `productID` varchar(20) NOT NULL,
  `categoryID` varchar(50) NOT NULL,
  `productName` varchar(50) NOT NULL,
  `productPrice` double NOT NULL,
  `productQuantity` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`productID`, `categoryID`, `productName`, `productPrice`, `productQuantity`) VALUES
('1', '1', 'Box Shirt', 599, 5),
('2', '2', 'skirt', 399, 10);

-- --------------------------------------------------------

--
-- Table structure for table `rating`
--

CREATE TABLE `rating` (
  `usernameID` varchar(50) NOT NULL,
  `RatingID` double(5,1) NOT NULL,
  `productID` varchar(20) NOT NULL,
  `Score` int(50) NOT NULL,
  `Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `reviewsID` varchar(20) NOT NULL,
  `usernameID` varchar(20) NOT NULL,
  `reviewText` varchar(100) NOT NULL,
  `reviewDateAndTime` datetime NOT NULL,
  `productID` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `transactionID` varchar(20) NOT NULL,
  `userID` varchar(20) NOT NULL,
  `prodID` varchar(10) NOT NULL,
  `Month` varchar(15) NOT NULL,
  `Day` varchar(2) NOT NULL,
  `Yr` varchar(4) NOT NULL,
  `Time` varchar(10) NOT NULL,
  `TotalAmount` double NOT NULL,
  `paymentMethod` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`transactionID`, `userID`, `prodID`, `Month`, `Day`, `Yr`, `Time`, `TotalAmount`, `paymentMethod`) VALUES
('1', '1', '1', 'April', '15', '2024', '3AM', 500, 'COD'),
('2', '2', '2', 'April', '15', '2024', '3:32 AM', 399, 'onlineBanking');

-- --------------------------------------------------------

--
-- Table structure for table `transaction item`
--

CREATE TABLE `transaction item` (
  `transactionID` varchar(50) NOT NULL,
  `productID` varchar(50) NOT NULL,
  `quantity` int(255) NOT NULL,
  `totalPrice` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `usernameID` varchar(20) NOT NULL,
  `Fname` varchar(20) NOT NULL,
  `Lname` varchar(20) NOT NULL,
  `Mi` varchar(20) NOT NULL,
  `City` varchar(50) NOT NULL,
  `State` varchar(50) NOT NULL,
  `zipCode` varchar(20) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `passcode` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`usernameID`, `Fname`, `Lname`, `Mi`, `City`, `State`, `zipCode`, `Email`, `passcode`) VALUES
('1', 'john', 'pepito', 'd', 'cebu', 'cebu', '6000', 'johnluis@email.com', '111'),
('2', 'jade charmaine', 'lupo', 'd', 'cebu', 'ceu', '6000', 'jadelupo19@gmail.com', '1212');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`addressID`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`categoryID`);

--
-- Indexes for table `delivery`
--
ALTER TABLE `delivery`
  ADD PRIMARY KEY (`deliveryID`),
  ADD KEY `userID` (`userID`),
  ADD KEY `AddressID` (`AddressID`);

--
-- Indexes for table `message system`
--
ALTER TABLE `message system`
  ADD PRIMARY KEY (`MessageID`),
  ADD KEY `usernameID` (`usernameID`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`productID`),
  ADD KEY `categoryID` (`categoryID`);

--
-- Indexes for table `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`RatingID`),
  ADD KEY `fk_usernameID` (`usernameID`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`reviewsID`),
  ADD KEY `fk_usernameID1` (`usernameID`),
  ADD KEY `fk_productID1` (`productID`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`transactionID`),
  ADD KEY `fk_prodID` (`prodID`),
  ADD KEY `fk_userID` (`userID`);

--
-- Indexes for table `transaction item`
--
ALTER TABLE `transaction item`
  ADD PRIMARY KEY (`transactionID`),
  ADD KEY `productID` (`productID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`usernameID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `delivery`
--
ALTER TABLE `delivery`
  ADD CONSTRAINT `AddressID` FOREIGN KEY (`AddressID`) REFERENCES `address` (`addressID`),
  ADD CONSTRAINT `userID` FOREIGN KEY (`userID`) REFERENCES `user` (`usernameID`);

--
-- Constraints for table `message system`
--
ALTER TABLE `message system`
  ADD CONSTRAINT `usernameID` FOREIGN KEY (`usernameID`) REFERENCES `user` (`usernameID`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `categoryID` FOREIGN KEY (`categoryID`) REFERENCES `categories` (`categoryID`);

--
-- Constraints for table `rating`
--
ALTER TABLE `rating`
  ADD CONSTRAINT `fk_usernameID` FOREIGN KEY (`usernameID`) REFERENCES `user` (`usernameID`);

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `fk_productID1` FOREIGN KEY (`productID`) REFERENCES `products` (`productID`),
  ADD CONSTRAINT `fk_usernameID1` FOREIGN KEY (`usernameID`) REFERENCES `user` (`usernameID`);

--
-- Constraints for table `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `fk_prodID` FOREIGN KEY (`prodID`) REFERENCES `products` (`productID`),
  ADD CONSTRAINT `fk_userID` FOREIGN KEY (`userID`) REFERENCES `user` (`usernameID`);

--
-- Constraints for table `transaction item`
--
ALTER TABLE `transaction item`
  ADD CONSTRAINT `productID` FOREIGN KEY (`productID`) REFERENCES `products` (`productID`),
  ADD CONSTRAINT `transactionID` FOREIGN KEY (`transactionID`) REFERENCES `transaction` (`transactionID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
