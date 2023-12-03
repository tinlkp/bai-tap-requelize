/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE TABLE `food` (
  `food_id` int NOT NULL AUTO_INCREMENT,
  `food_name` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `desciption` varchar(255) DEFAULT NULL,
  `type_id` int DEFAULT NULL,
  PRIMARY KEY (`food_id`),
  KEY `type_id` (`type_id`),
  CONSTRAINT `food_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `food_type` (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `food_type` (
  `type_id` int NOT NULL AUTO_INCREMENT,
  `type_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `like_res` (
  `user_id` int DEFAULT NULL,
  `res_id` int DEFAULT NULL,
  `date_like` datetime DEFAULT NULL,
  `like_id` int NOT NULL AUTO_INCREMENT,
  `set_like` tinyint(1) NOT NULL,
  PRIMARY KEY (`like_id`),
  KEY `user_id` (`user_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `like_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `like_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `orders` (
  `user_id` int DEFAULT NULL,
  `food_id` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `arr_sub_id` varchar(255) DEFAULT NULL,
  `order_id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`order_id`),
  KEY `user_id` (`user_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `rate_res` (
  `user_id` int DEFAULT NULL,
  `res_id` int DEFAULT NULL,
  `amount` int DEFAULT NULL,
  `date_rate` datetime DEFAULT NULL,
  `rate_id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`rate_id`),
  KEY `user_id` (`user_id`),
  KEY `res_id` (`res_id`),
  CONSTRAINT `rate_res_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `rate_res_ibfk_2` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `restaurant` (
  `res_id` int NOT NULL AUTO_INCREMENT,
  `res_name` varchar(255) DEFAULT NULL,
  `Image` varchar(255) DEFAULT NULL,
  `desciption` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`res_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `sub_food` (
  `sub_id` int NOT NULL AUTO_INCREMENT,
  `sub_name` varchar(255) DEFAULT NULL,
  `sub_price` float DEFAULT NULL,
  `food_id` int DEFAULT NULL,
  PRIMARY KEY (`sub_id`),
  KEY `food_id` (`food_id`),
  CONSTRAINT `sub_food_ibfk_1` FOREIGN KEY (`food_id`) REFERENCES `food` (`food_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `full_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `desciption`, `type_id`) VALUES
(1, 'Sushi Platter', 'sushi_platter.jpg', 25.99, 'A delightful assortment of sushi rolls, sashimi, and nigiri.', 1);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `desciption`, `type_id`) VALUES
(2, 'Noodles with Chicken', 'noodles_with_chicken.jpg', 12.99, 'A savory dish of tender chicken stir-fried with noodles and vegetables.', 1);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `desciption`, `type_id`) VALUES
(3, 'Margherita Pizza', 'margherita_pizza.jpg', 14.99, 'A classic Neapolitan pizza with a simple yet delicious combination of tomato sauce, mozzarella cheese, and fresh basil.', 1);
INSERT INTO `food` (`food_id`, `food_name`, `image`, `price`, `desciption`, `type_id`) VALUES
(4, 'Cheeseburger', 'cheeseburger.jpg', 9.99, 'A juicy beef patty topped with melted cheddar cheese, lettuce, tomato, and onion, served on a toasted bun.', 1),
(5, 'Chicken Salad Sandwich', 'chicken_salad_sandwich.jpg', 8.99, 'A creamy and flavorful sandwich made with shredded rotisserie chicken, mayonnaise, celery, and grapes.', 1),
(6, 'Tempura Udon', 'tempura_udon.jpg', 16.99, 'A hearty dish of udon noodles topped with a medley of tempura-fried vegetables.', 1),
(7, 'Pad Thai', 'pad_thai.jpg', 14.99, 'A stir-fried noodle dish with tamarind sauce, peanuts, bean sprouts, and your choice of protein.', 1),
(8, 'Creamy Tomato Soup', 'creamy_tomato_soup.jpg', 5.99, 'A warm and comforting soup made with fresh tomatoes, cream, and a touch of herbs.', 2),
(9, 'Caesar Salad', 'caesar_salad.jpg', 8.99, 'A classic salad made with romaine lettuce, croutons, Parmesan cheese, and a creamy Caesar dressing.', 2),
(10, 'French Fries', 'french_fries.jpg', 3.99, 'A crispy and golden side dish of deep-fried potatoes.', 2),
(11, 'Chocolate Chip Cookies', 'chocolate_chip_cookies.jpg', 2.99, 'Freshly baked cookies with a gooey center and a sprinkle of chocolate chips.', 3),
(12, 'Vanilla Ice Cream', 'vanilla_ice_cream.jpg', 3.99, 'A rich and creamy scoop of vanilla ice cream.', 3),
(13, 'Mango Smoothie', 'mango_smoothie.jpg', 5.99, 'A refreshing and revitalizing smoothie made with fresh mangoes, yogurt, and a touch of honey.', 4),
(14, 'Iced Coffee', 'iced_coffee.jpg', 4.99, 'A cool and caffeinated beverage made with brewed coffee, milk, and ice.', 4),
(15, 'Hot Chocolate', 'hot_chocolate.jpg', 3.99, 'A warm and indulgent drink made with melted chocolate, milk, and whipped cream.', 4);

INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(1, 'Main Dishes');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(2, 'Appetizers');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(3, 'Desserts');
INSERT INTO `food_type` (`type_id`, `type_name`) VALUES
(4, 'Beverages'),
(5, 'Sides');

INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`, `like_id`, `set_like`) VALUES
(5, 1, '2023-11-24 01:59:37', 26, 0);
INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`, `like_id`, `set_like`) VALUES
(1, 1, '2023-11-24 02:44:11', 27, 1);
INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`, `like_id`, `set_like`) VALUES
(1, 2, '2023-11-27 01:32:43', 28, 1);
INSERT INTO `like_res` (`user_id`, `res_id`, `date_like`, `like_id`, `set_like`) VALUES
(1, 3, '2023-11-27 01:32:47', 29, 1),
(2, 3, '2023-11-27 01:32:50', 30, 0);

INSERT INTO `orders` (`user_id`, `food_id`, `amount`, `code`, `arr_sub_id`, `order_id`) VALUES
(1, 3, 1, 'ORDER123', '10,11', 1);
INSERT INTO `orders` (`user_id`, `food_id`, `amount`, `code`, `arr_sub_id`, `order_id`) VALUES
(2, 5, 2, 'ORDER456', '12,13', 2);
INSERT INTO `orders` (`user_id`, `food_id`, `amount`, `code`, `arr_sub_id`, `order_id`) VALUES
(3, 1, 1, 'ORDER789', '1,2', 3);
INSERT INTO `orders` (`user_id`, `food_id`, `amount`, `code`, `arr_sub_id`, `order_id`) VALUES
(4, 6, 1, 'ORDER012', '5,6', 4),
(5, 2, 3, 'ORDER345', '3,4,9', 5),
(6, 4, 2, 'ORDER678', '7,8', 6),
(2, 5, 2, 'ORDER901', '10,11', 7),
(1, 1, 2, 'ORDER234', '1,2', 8),
(2, 2, 1, 'ORDER567', '3,4', 9),
(3, 4, 3, 'ORDER890', '5,6,7', 10),
(1, 1, 20, 'code123', 'arr123', 11),
(1, 1, 20, 'code123', 'arr123', 12),
(1, 1, 20, 'code123', 'arr123', 13),
(1, 1, 20, 'code123', 'arr123', 14),
(2, 1, 20, 'code123', 'arr123', 15),
(2, 4, 20, 'code123', 'arr123', 16),
(1, 4, 20, 'code123', 'arr123', 17);

INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`, `rate_id`) VALUES
(1, 1, 5, '2023-11-05 10:00:00', 1);
INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`, `rate_id`) VALUES
(1, 3, 4, '2023-10-25 15:30:00', 2);
INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`, `rate_id`) VALUES
(2, 2, 5, '2023-10-12 12:45:00', 3);
INSERT INTO `rate_res` (`user_id`, `res_id`, `amount`, `date_rate`, `rate_id`) VALUES
(2, 4, 3, '2023-09-18 18:20:00', 4),
(3, 5, 4, '2023-08-24 21:10:00', 5),
(2, 1, 5, '2023-11-24 02:44:25', 7),
(3, 1, 5, '2023-11-27 00:42:32', 8),
(1, 5, 4, '2023-11-27 01:34:07', 9),
(5, 1, 5, '2023-12-01 02:14:49', 10),
(5, 2, 5, '2023-12-01 02:14:53', 11);

INSERT INTO `restaurant` (`res_id`, `res_name`, `Image`, `desciption`) VALUES
(1, 'Sushi Q', 'sushi-q.jpg', 'Authentic Japanese cuisine');
INSERT INTO `restaurant` (`res_id`, `res_name`, `Image`, `desciption`) VALUES
(2, 'Noodles & Co.', 'noodles-co.jpg', 'Asian fusion noodle dishes');
INSERT INTO `restaurant` (`res_id`, `res_name`, `Image`, `desciption`) VALUES
(3, 'Pizza Hut', 'pizza-hut.jpg', 'Classic American pizza');
INSERT INTO `restaurant` (`res_id`, `res_name`, `Image`, `desciption`) VALUES
(4, 'McDonald\'s', 'mcdonalds.jpg', 'Fast food burgers, fries, and shakes'),
(5, 'Starbucks', 'starbucks.jpg', 'Coffeehouse chain with espresso drinks, pastries, and sandwiches');

INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(1, 'Salmon Nigiri', 2.5, 1);
INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(2, 'Californian Roll', 2, 1);
INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(3, 'Vegetable Tempura', 3.5, 6);
INSERT INTO `sub_food` (`sub_id`, `sub_name`, `sub_price`, `food_id`) VALUES
(4, 'Chicken Tempura', 4, 6),
(5, 'Shrimp Tempura', 4.5, 6),
(6, 'Pad Thai with Chicken', 15.99, 7),
(7, 'Pad Thai with Tofu', 14.99, 7),
(8, 'Pad Thai with Shrimp', 16.99, 7),
(9, 'House Salad', 5.99, 2),
(10, 'Caesar Salad with Grilled Chicken', 12.99, 2),
(11, 'Chocolate Chip Cookie', 1.5, 12),
(12, 'Double Chocolate Chip Cookie', 2, 12),
(13, 'Vanilla Ice Cream Cone', 2.99, 13),
(14, 'Vanilla Ice Cream Cup', 3.99, 13),
(15, 'Iced Coffee with Milk', 4.99, 14),
(16, 'Iced Coffee with Black Coffee', 4.5, 14),
(17, 'Hot Chocolate with Whipped Cream', 4.25, 14),
(18, 'Hot Chocolate with Marshmallows', 4.5, 14);

INSERT INTO `users` (`user_id`, `full_name`, `email`, `password`) VALUES
(1, 'John Doe', 'johndoe@example.com', 'password123');
INSERT INTO `users` (`user_id`, `full_name`, `email`, `password`) VALUES
(2, 'Jane Smith', 'janesmith@example.com', 'password456');
INSERT INTO `users` (`user_id`, `full_name`, `email`, `password`) VALUES
(3, 'Peter Jones', 'peterjones@example.com', 'password789');
INSERT INTO `users` (`user_id`, `full_name`, `email`, `password`) VALUES
(4, 'Mary Williams', 'marywilliams@example.com', 'password012'),
(5, 'Mary Jones', 'marywilliams@example.com', 'password012'),
(6, 'Brown Jones', 'marywilliams@example.com', 'password012'),
(7, 'David Brown', 'davidbrown@example.com', 'password345'),
(8, 'David John', 'ass@example.com', 'password345'),
(9, 'David 123', 'ass@example.com', 'password345'),
(10, 'tin', 'zbc@gmail.com', 'abc'),
(11, 'tin1', 'zbc1@gmail.com', 'abc');


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;