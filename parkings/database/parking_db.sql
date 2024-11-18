

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "00:00";


CREATE TABLE `category` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `rate` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



INSERT INTO `category` (`id`, `name`, `rate`) VALUES
(1, 'Car', 50),
(2, 'Motorcycle', 35),
(3, 'Vehicle', 50),
(4, 'Any', 70);



CREATE TABLE `parked_list` (
  `id` int(30) NOT NULL,
  `category_id` int(30) NOT NULL,
  `location_id` int(30) NOT NULL,
  `ref_no` varchar(100) NOT NULL,
  `vehicle_brand` varchar(200) NOT NULL,
  `vehicle_registration` varchar(15) NOT NULL,
  `owner` text NOT NULL,
  `vehicle_description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=in, 2= out',
  `amount_due` double NOT NULL,
  `amount_tendered` double NOT NULL,
  `amount_change` double NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



INSERT INTO `parked_list` (`id`, `category_id`, `location_id`, `ref_no`, `vehicle_brand`, `vehicle_registration`, `owner`, `vehicle_description`, `status`, `amount_due`, `amount_tendered`, `amount_change`, `date_created`) VALUES
(3, 1, 1, '5020555486', 'Ford Mustang', 'CDM-0623', 'John Smith', 'Black', 1, 0, 0, 0, '2020-10-02 11:38:57'),
(5, 1, 1, '4970885858', 'Fortuner', 'GCN-1514', 'Claire Blake', 'White', 2, 137.5, 150, 12.5, '2020-10-02 12:09:10');




CREATE TABLE `parking_locations` (
  `id` int(30) NOT NULL,
  `location` text NOT NULL,
  `capacity` int(11) NOT NULL,
  `category_id` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



INSERT INTO `parking_locations` (`id`, `location`, `capacity`, `category_id`) VALUES
(1, 'NESCII Parking', 10, 1),
(2, 'Admin', 30, 2),
(3, 'Library Parking', 20, 3),
(4, 'TnP Parking', 10, 4);



CREATE TABLE `parking_movement` (
  `id` int(30) NOT NULL,
  `pl_id` int(30) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 = in ,2 = out',
  `created_timestamp` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



INSERT INTO `parking_movement` (`id`, `pl_id`, `status`, `created_timestamp`) VALUES
(1, 2, 1, '2020-10-02 11:13:19'),
(2, 3, 1, '2020-10-02 11:31:41'),
(3, 4, 1, '2020-10-02 11:39:37'),
(4, 5, 1, '2020-10-02 12:09:10');




CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `type` tinyint(4) NOT NULL DEFAULT 2 COMMENT '1 = Admin, 2= staff',
  `username` varchar(100) NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `users` (`id`, `name`, `type`, `username`, `password`) VALUES
(1, 'Admin', 1, 'admin', '0192023a7bbd73250516f069df18b500');


ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `parked_list`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `parking_locations`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `parking_movement`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);


ALTER TABLE `category`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;


ALTER TABLE `parked_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;


ALTER TABLE `parking_locations`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;


ALTER TABLE `parking_movement`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;


ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;
