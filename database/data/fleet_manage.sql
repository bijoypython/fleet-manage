-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 16, 2023 at 05:04 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fleet_manage`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(100) NOT NULL,
  `role` enum('admin','driver','users') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `email`, `password`, `role`) VALUES
(13, 'nasim', 'nasim@email.com', '827ccb0eea8a706c4c34a16891f84e7b', 'admin'),
(14, 'bijoy', 'bijoy@email.com', '827ccb0eea8a706c4c34a16891f84e7b', 'admin'),
(15, 'habib', 'habib@email.com', '827ccb0eea8a706c4c34a16891f84e7b', 'admin'),
(16, 'sifat', 'sifat@email.com', '827ccb0eea8a706c4c34a16891f84e7b', 'admin'),
(17, 'Sifat ahmed', 'sifat@gmail.com', '12345', 'driver'),
(18, 'sifat ahmed', 'sifat@gmail.com', '12345', 'driver'),
(19, 'nasim ahmed', 'ns@gmail.com', '12345', 'driver'),
(20, 'Shamsul Huq', 's@gmail.com', '12345', 'driver'),
(21, 'Mamun', 'm@email.com', '12345', 'users'),
(22, 'Kaniz Fatema', 'fatema@gmail.com', '12345', 'users'),
(23, 'Al-Amin Moktadir', 'al@gmail.com', '12345', 'driver');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `vehicle_id` int(11) NOT NULL,
  `driver_id` int(11) NOT NULL,
  `type` enum('single','round') NOT NULL,
  `start_location` char(50) NOT NULL,
  `end_location` char(50) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `aprox_km` char(50) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` enum('yet to start','completed','on going','cancelled') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `customer_id`, `vehicle_id`, `driver_id`, `type`, `start_location`, `end_location`, `start_date`, `end_date`, `aprox_km`, `amount`, `status`) VALUES
(1, 1, 1, 17, 'single', 'Zigatola', 'Chittagong', '2023-05-10 10:11:00', '2023-05-11 10:12:00', '200', '7000.00', 'yet to start'),
(2, 1, 3, 19, 'round', 'Dhaka', 'Shylhet', '2023-05-04 11:31:00', '2023-05-06 11:31:00', '450', '16000.00', 'yet to start');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `name` char(50) NOT NULL,
  `phone` char(50) NOT NULL,
  `email` char(50) NOT NULL,
  `address` char(50) NOT NULL,
  `status` enum('active','inactive') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `admin_id`, `name`, `phone`, `email`, `address`, `status`) VALUES
(1, 21, 'Mamun', '01211111', 'm@email.com', 'ga/ka, mahammadpur', 'active'),
(2, 22, 'Kaniz Fatema', '01511111111', 'fatema@gmail.com', '12/7, Mohammadpur', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `drivers`
--

CREATE TABLE `drivers` (
  `id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `phone` char(50) NOT NULL,
  `age` char(50) NOT NULL,
  `license_no` char(50) NOT NULL,
  `license_expire_date` char(50) NOT NULL,
  `experience` char(50) NOT NULL,
  `joining_date` char(50) NOT NULL,
  `reference` char(50) NOT NULL,
  `address` char(50) NOT NULL,
  `status` enum('active','inactive') NOT NULL,
  `photo` char(50) NOT NULL,
  `documents` char(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `drivers`
--

INSERT INTO `drivers` (`id`, `admin_id`, `phone`, `age`, `license_no`, `license_expire_date`, `experience`, `joining_date`, `reference`, `address`, `status`, `photo`, `documents`) VALUES
(1, 20, '01711111111', '28', 'fd-2345', '2023-05-31', '3', '2023-05-01', 'Shahin', '12, eskaton', '', '', ''),
(2, 23, '01311111111', '29', 'fd-2340', '2026-01-10', '3', '2023-01-10', 'Salimullah', '12/7 Zigatola', 'active', 'istockphoto-916534092-612x6123.jpg', 'Untitled_12.pdf');

-- --------------------------------------------------------

--
-- Table structure for table `driver_payments`
--

CREATE TABLE `driver_payments` (
  `id` int(11) NOT NULL,
  `driver_id` int(11) NOT NULL,
  `trans_date` date NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `remarks` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `driver_payments`
--

INSERT INTO `driver_payments` (`id`, `driver_id`, `trans_date`, `amount`, `remarks`) VALUES
(1, 17, '2023-05-02', '5000.00', 'Single Trip');

-- --------------------------------------------------------

--
-- Table structure for table `fuels`
--

CREATE TABLE `fuels` (
  `id` int(11) NOT NULL,
  `vehicle_id` int(11) NOT NULL,
  `driver_id` int(11) NOT NULL,
  `fill_date` date NOT NULL,
  `qty` decimal(10,2) NOT NULL,
  `odometer` decimal(10,2) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `remarks` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fuels`
--

INSERT INTO `fuels` (`id`, `vehicle_id`, `driver_id`, `fill_date`, `qty`, `odometer`, `amount`, `remarks`) VALUES
(1, 1, 17, '2023-05-02', '2.00', '1.00', '220.00', 'Okay'),
(2, 2, 19, '2023-05-03', '4.00', '6.00', '440.00', 'Okay'),
(3, 3, 17, '2023-05-04', '4.00', '2.00', '440.00', 'Suspicious');

-- --------------------------------------------------------

--
-- Table structure for table `income_expense`
--

CREATE TABLE `income_expense` (
  `id` int(11) NOT NULL,
  `vehicle_id` int(11) NOT NULL,
  `trans_date` date NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `remarks` text NOT NULL,
  `type` enum('income','expense') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `income_expense`
--

INSERT INTO `income_expense` (`id`, `vehicle_id`, `trans_date`, `amount`, `remarks`, `type`) VALUES
(1, 2, '2023-05-03', '5000.00', 'Tire tube repair', 'expense'),
(2, 1, '2023-05-02', '400.00', 'Looking glass repair', 'expense');

-- --------------------------------------------------------

--
-- Table structure for table `maintenances`
--

CREATE TABLE `maintenances` (
  `id` int(11) NOT NULL,
  `vehicle_id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `details` text NOT NULL,
  `cost` decimal(10,2) NOT NULL,
  `status` enum('planned','ongoing','completed') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `maintenances`
--

INSERT INTO `maintenances` (`id`, `vehicle_id`, `vendor_id`, `start_date`, `end_date`, `details`, `cost`, `status`) VALUES
(4, 1, 3, '2023-05-02', '2023-05-03', 'Chesis change', '5000.00', 'ongoing'),
(5, 0, 1, '2023-05-04', '2023-05-05', 'Battery change', '5000.00', 'planned');

-- --------------------------------------------------------

--
-- Table structure for table `parts`
--

CREATE TABLE `parts` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `details` text NOT NULL,
  `status` enum('active','inactive') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `parts`
--

INSERT INTO `parts` (`id`, `name`, `details`, `status`) VALUES
(1, 'Battery', 'Rahimafrooz IPB-150 IPS Battery ', 'active'),
(2, 'Radiator', 'Annex Coolant for Motor Vehicle', 'active'),
(4, 'Head Light', 'Tristone Flowtech INDIA Pvt Ltd', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `parts_in_maintenance`
--

CREATE TABLE `parts_in_maintenance` (
  `id` int(11) NOT NULL,
  `maintenance_id` int(11) NOT NULL,
  `parts_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `maintain_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `parts_in_maintenance`
--

INSERT INTO `parts_in_maintenance` (`id`, `maintenance_id`, `parts_id`, `qty`, `maintain_date`) VALUES
(3, 4, 4, 2, '2023-05-03'),
(4, 4, 1, 1, '2023-05-03'),
(5, 5, 1, 1, '2023-05-05');

-- --------------------------------------------------------

--
-- Table structure for table `parts_stock_in`
--

CREATE TABLE `parts_stock_in` (
  `id` int(11) NOT NULL,
  `parts_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `purchase_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `parts_stock_in`
--

INSERT INTO `parts_stock_in` (`id`, `parts_id`, `price`, `qty`, `purchase_date`) VALUES
(3, 1, 5000, 11, '2023-05-01'),
(4, 2, 400, 10, '2023-05-10'),
(5, 4, 250, 5, '2023-05-11'),
(6, 4, 250, 8, '2023-05-01'),
(7, 2, 12000, 10, '2023-05-02');

-- --------------------------------------------------------

--
-- Table structure for table `parts_stock_out`
--

CREATE TABLE `parts_stock_out` (
  `id` int(11) NOT NULL,
  `parts_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `out_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `parts_stock_out`
--

INSERT INTO `parts_stock_out` (`id`, `parts_id`, `qty`, `out_date`) VALUES
(2, 2, 4, '2023-03-24'),
(6, 1, 3, '2023-03-26'),
(8, 2, 5, '2023-03-25'),
(11, 1, 4, '2023-04-02'),
(13, 4, 2, '2023-05-03'),
(14, 4, 2, '2023-05-01'),
(15, 2, 5, '2023-05-02');

-- --------------------------------------------------------

--
-- Table structure for table `vehicles`
--

CREATE TABLE `vehicles` (
  `id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `registration_no` char(255) NOT NULL,
  `name` char(255) NOT NULL,
  `model` char(255) NOT NULL,
  `chesis_no` char(255) NOT NULL,
  `manufacturer` char(255) NOT NULL,
  `color` char(255) NOT NULL,
  `expire_date` date NOT NULL,
  `photo` char(255) NOT NULL,
  `documents` char(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vehicles`
--

INSERT INTO `vehicles` (`id`, `type_id`, `registration_no`, `name`, `model`, `chesis_no`, `manufacturer`, `color`, `expire_date`, `photo`, `documents`) VALUES
(1, 1, 'AGl003', 'Toyota', 'Corolla', 'hg787', 'Toyota', 'Red', '2024-05-31', 'asa', 'asa'),
(2, 3, 'Ag-L330', 'Hiace', 'Toyota Hiace 2023', 'Che-123', 'Toyota', 'White', '2025-01-01', 'hiace.jpg', 'Untitled_1.pdf'),
(3, 1, 'AG-L23', 'Nisan', 'Nisan 2022', 'Hg234', 'Nisan', 'Sliver', '2025-01-03', 'nisan.jpg', 'Untitled_11.pdf'),
(4, 1, 'Ag-l430', 'Skoda', 'Slavia', 'jk444444', 'Skoda', 'Red', '2025-11-22', 'skoda.jpg', '');

-- --------------------------------------------------------

--
-- Table structure for table `vehicle_type`
--

CREATE TABLE `vehicle_type` (
  `id` int(11) NOT NULL,
  `title` char(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vehicle_type`
--

INSERT INTO `vehicle_type` (`id`, `title`) VALUES
(1, 'Sedan'),
(2, 'Suv'),
(3, 'Micro');

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

CREATE TABLE `vendors` (
  `id` int(11) NOT NULL,
  `name` char(255) NOT NULL,
  `address` char(255) NOT NULL,
  `phone` char(255) NOT NULL,
  `email` char(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vendors`
--

INSERT INTO `vendors` (`id`, `name`, `address`, `phone`, `email`) VALUES
(1, 'Mahadi', '12/9 zigatola', '01311111111', 'mahadi@email.com'),
(2, 'Nobel', '12/7 Kollanpur', '01511111111', 'nobel@gmail.com'),
(3, 'Monir', '12/7 Azimpur', '0161111111', 'monir@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `vendor_payments`
--

CREATE TABLE `vendor_payments` (
  `id` int(11) NOT NULL,
  `maintenance_id` int(11) NOT NULL,
  `vendor_id` int(11) NOT NULL,
  `paid_amount` decimal(10,2) NOT NULL,
  `payment_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `vehicle_id` (`vehicle_id`),
  ADD KEY `driver_id` (`driver_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_id` (`admin_id`);

--
-- Indexes for table `drivers`
--
ALTER TABLE `drivers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admin_id` (`admin_id`);

--
-- Indexes for table `driver_payments`
--
ALTER TABLE `driver_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `driver_id` (`driver_id`);

--
-- Indexes for table `fuels`
--
ALTER TABLE `fuels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vehicle_id` (`vehicle_id`),
  ADD KEY `driver_id` (`driver_id`);

--
-- Indexes for table `income_expense`
--
ALTER TABLE `income_expense`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vehicle_id` (`vehicle_id`);

--
-- Indexes for table `maintenances`
--
ALTER TABLE `maintenances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `vehicle_id` (`vehicle_id`),
  ADD KEY `vendor_id` (`vendor_id`);

--
-- Indexes for table `parts`
--
ALTER TABLE `parts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `parts_in_maintenance`
--
ALTER TABLE `parts_in_maintenance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parts_id` (`parts_id`),
  ADD KEY `maintenance_id` (`maintenance_id`);

--
-- Indexes for table `parts_stock_in`
--
ALTER TABLE `parts_stock_in`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parts_id` (`parts_id`);

--
-- Indexes for table `parts_stock_out`
--
ALTER TABLE `parts_stock_out`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parts_id` (`parts_id`);

--
-- Indexes for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type_id` (`type_id`);

--
-- Indexes for table `vehicle_type`
--
ALTER TABLE `vehicle_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendors`
--
ALTER TABLE `vendors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vendor_payments`
--
ALTER TABLE `vendor_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `maintenance_id` (`maintenance_id`),
  ADD KEY `vendor_id` (`vendor_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `drivers`
--
ALTER TABLE `drivers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `driver_payments`
--
ALTER TABLE `driver_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `fuels`
--
ALTER TABLE `fuels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `income_expense`
--
ALTER TABLE `income_expense`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `maintenances`
--
ALTER TABLE `maintenances`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `parts`
--
ALTER TABLE `parts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `parts_in_maintenance`
--
ALTER TABLE `parts_in_maintenance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `parts_stock_in`
--
ALTER TABLE `parts_stock_in`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `parts_stock_out`
--
ALTER TABLE `parts_stock_out`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `vehicles`
--
ALTER TABLE `vehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `vehicle_type`
--
ALTER TABLE `vehicle_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `vendors`
--
ALTER TABLE `vendors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `vendor_payments`
--
ALTER TABLE `vendor_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`driver_id`) REFERENCES `admin` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bookings_ibfk_3` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `drivers`
--
ALTER TABLE `drivers`
  ADD CONSTRAINT `drivers_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `driver_payments`
--
ALTER TABLE `driver_payments`
  ADD CONSTRAINT `driver_payments_ibfk_1` FOREIGN KEY (`driver_id`) REFERENCES `admin` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `fuels`
--
ALTER TABLE `fuels`
  ADD CONSTRAINT `fuels_ibfk_1` FOREIGN KEY (`driver_id`) REFERENCES `admin` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fuels_ibfk_2` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `income_expense`
--
ALTER TABLE `income_expense`
  ADD CONSTRAINT `income_expense_ibfk_1` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `parts_in_maintenance`
--
ALTER TABLE `parts_in_maintenance`
  ADD CONSTRAINT `parts_in_maintenance_ibfk_1` FOREIGN KEY (`parts_id`) REFERENCES `parts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `parts_in_maintenance_ibfk_2` FOREIGN KEY (`maintenance_id`) REFERENCES `maintenances` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `vehicles`
--
ALTER TABLE `vehicles`
  ADD CONSTRAINT `vehicles_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `vehicle_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
