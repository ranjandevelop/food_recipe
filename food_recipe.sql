-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 07, 2022 at 10:26 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `food_recipe`
--

-- --------------------------------------------------------

--
-- Table structure for table `ingredients`
--

CREATE TABLE `ingredients` (
  `id` int(11) NOT NULL,
  `items` varchar(50) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `unit` varchar(10) DEFAULT NULL,
  `recipe_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ingredients`
--

INSERT INTO `ingredients` (`id`, `items`, `amount`, `unit`, `recipe_id`) VALUES
(301, 'rice', 250, 'gram', 201),
(302, 'pasta', 100, 'gram', 202),
(303, 'wheat flour', 250, 'gram', 203),
(304, 'chicken', 250, 'gram', 204),
(305, 'potato', 5, 'piece', 205);

-- --------------------------------------------------------

--
-- Table structure for table `process`
--

CREATE TABLE `process` (
  `id` int(11) NOT NULL,
  `steps` varchar(500) DEFAULT NULL,
  `recipe_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `process`
--

INSERT INTO `process` (`id`, `steps`, `recipe_id`) VALUES
(401, 'Melt the vegetable shortening in a large pot over medium-high heat. Stir in the onions, and cook until golden, about 5 minutes. Season with cinnamon sticks, cloves, ginger, cumin, garlic powder, and cardamom seeds.', 201),
(402, 'The recipe is simple and easy to make with curry powder and yogurt. Which means you now have to only buy one spicemix! Most of the other ingredients are easy to find or simple pantry staples. Unlike other curries you can make this one in less than 20 minutes. In the meantime make a side of basmati rice and veggies. Who doesn\'t love chicken curry with rice for lunch? Alternatively, if you have some time make a few chapatis or naan to enjoy a good chicken curry with chapati for dinner.', 204),
(403, 'To prepare the dough, take a mixing bowl and add wheat flour, mustard oil and a pinch of salt. Add some water and knead a soft dough. To prepare the filling, take a bowl and mix sattu (black gram flour), pickle masala, mustard oil, lemon juice, kalonji, ginger, coriander leaves, green chillies, and salt together. Preheat oven to 180 degrees Celsius. Now divide the dough, flatten to the desired size and place a spoonful of the filling. Close the dough by the edges and roll it into a ball.\r\nPut th', 205),
(404, 'Egg pasta is super simple ingredient wise: flour, salt, eggs and olive oil. Begin by whisking together 2 cups of flour and 1/2 teaspoon of salt in a large bowl. Make a well in the center of the flour and add three large eggs and one tablespoon of extra virgin olive oil.', 202),
(405, 'To make one dozen parathas, mix 2 cups of whole wheat flour in a bowl with water and salt (to taste). Have 1 cup of vegetable oil on hands. You\'ll need 2 tablespoons of oil for when you knead the dough. Use the rest of the oil for frying. Once you\'ve prepared it, divide the dough into equal portions, roughly the size of golf balls.', 203);

-- --------------------------------------------------------

--
-- Table structure for table `recipe`
--

CREATE TABLE `recipe` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `image_url` varchar(100) DEFAULT NULL,
  `creator_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `recipe`
--

INSERT INTO `recipe` (`id`, `name`, `description`, `image_url`, `creator_id`) VALUES
(201, 'Pulao', 'Pulao or pilaf , is comfort food at its best and I make it when I want to cook something quick, easy and satisfying.', 'images/pulao.jpg', 102),
(202, 'Pasta', 'Pasta is a type of food typically made from an unleavened dough of wheat flour mixed with water or eggs, and formed into sheets or other shapes, then cooked by boiling or baking', 'images/pasta.jpg', 101),
(203, 'Paratha', 'Paratha are unleavened layered flatbreads made with whole wheat flour (atta), salt, water & ghee or oil.', 'images/paratha.jpg', 103),
(204, 'Chiken Curry', 'Chicken curry or curry chicken is a dish originating from the Indian subcontinent. It is common in the Indian subcontinent, Southeast Asia, Great Britain, and the Caribbean.', 'images/chikencurry.jpg', 104),
(205, 'Litti Chokha', 'Litti Chokha is a Bihari delicacy where the Litti is made of whole wheat flour, stuffed with sattu (powder made out of black chana), herbs and spices and baked over coal or cow dung cakes and then finally drizzled with desi ghee.', 'images/littichokha.jpg', 105);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `user_id` varchar(15) DEFAULT NULL,
  `password` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `user_id`, `password`) VALUES
(101, 'Mr. A', 'mra', '123'),
(102, 'Mrs. B', 'mrsb', 'xyz'),
(103, 'Ms. C', 'msc', 'a@1'),
(104, 'ranjan', 'ranjan', 'ranjan123'),
(105, 'kumar', 'kumar', 'kumar123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ingredients`
--
ALTER TABLE `ingredients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recipe_id` (`recipe_id`);

--
-- Indexes for table `process`
--
ALTER TABLE `process`
  ADD PRIMARY KEY (`id`),
  ADD KEY `recipe_id` (`recipe_id`);

--
-- Indexes for table `recipe`
--
ALTER TABLE `recipe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `creator_id` (`creator_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `recipe`
--
ALTER TABLE `recipe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=206;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ingredients`
--
ALTER TABLE `ingredients`
  ADD CONSTRAINT `ingredients_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`id`);

--
-- Constraints for table `process`
--
ALTER TABLE `process`
  ADD CONSTRAINT `process_ibfk_1` FOREIGN KEY (`recipe_id`) REFERENCES `recipe` (`id`);

--
-- Constraints for table `recipe`
--
ALTER TABLE `recipe`
  ADD CONSTRAINT `recipe_ibfk_1` FOREIGN KEY (`creator_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
