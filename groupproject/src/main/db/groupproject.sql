
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


CREATE DATABASE IF NOT EXISTS enterprise;

use enterprise;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;


-- Database: `enterprise`


-- --------------------------------------------------------


-- Table structure for table `address`


CREATE TABLE `address` (
  `id` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------


-- Table structure for table `orders`


CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `order_date` datetime DEFAULT NULL,
  `total_price` float DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------


-- Table structure for table `order_items`


CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `total_price` float DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `orders_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------


-- Table structure for table `products`


CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `partnumber` varchar(255) DEFAULT NULL,
  `plot` longtext,
  `price` float DEFAULT NULL,
  `rated` varchar(255) DEFAULT NULL,
  `year` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Dumping data for table `products`


INSERT INTO `products` (`id`, `image`, `name`, `partnumber`, `plot`, `price`, `rated`, `year`) VALUES
(1, 'https://m.media-amazon.com/images/M/MV5BMTU1MzM0MjcxMF5BMl5BanBnXkFtZTgwODQ0MzcxMTE@._V1_SX300.jpg', 'The Aristocats', 'tt0065421', 'With the help of a smooth talking tomcat, a family of Parisian felines set to inherit a fortune from their owner try to make it back home after a jealous butler kidnaps them and leaves them in the country.', 1.99, 'G', '1970'),
(2, 'https://m.media-amazon.com/images/M/MV5BMTMxMTU5MTY4MV5BMl5BanBnXkFtZTcwNzgyNjg2NQ@@._V1_SX300.jpg', 'Puss in Boots', 'tt0448694', 'An outlaw cat, his childhood egg-friend and a seductive thief kitty set out in search for the eggs of the fabled Golden Goose to clear his name, restore his lost honor and regain the trust of his mother and town.', 1.99, 'PG', '2011'),
(3, 'https://m.media-amazon.com/images/M/MV5BMTI5NTE2OTQtN2YyZi00OTI5LTljMmEtMDZlMTk0MzNmZmY5L2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg', 'Oliver & Company', 'tt0095776', 'A lost and alone kitten joins a gang of dogs engaged in petty larceny in New York City.', 1.99, 'G', '1988'),
(4, 'https://m.media-amazon.com/images/M/MV5BYWQ0MGNjOTYtMWJlNi00YWMxLWFmMzktYjAyNTVkY2U1NWNhL2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyNjc1NTYyMjg@._V1_SX300.jpg', 'Brief Encounter', 'tt0037558', 'Meeting a stranger in a railway station, a woman is tempted to cheat on her husband.', 1.99, 'NOT RATED', '1945'),
(5, 'https://m.media-amazon.com/images/M/MV5BY2IzZGY2YmEtYzljNS00NTM5LTgwMzUtMzM1NjQ4NGI0OTk0XkEyXkFqcGdeQXVyNDYyMDk5MTU@._V1_SX300.jpg', 'Casablanca', 'tt0034583', 'A cynical nightclub owner protects an old flame and her husband from Nazis in Morocco.', 1.99, 'PG', '1942'),
(6, 'https://m.media-amazon.com/images/M/MV5BZDdiZTAwYzAtMDI3Ni00OTRjLTkzN2UtMGE3MDMyZmU4NTU4XkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SX300.jpg', 'Before Sunrise', 'tt0112471', 'A young man and woman meet on a train in Europe, and wind up spending one evening together in Vienna. Unfortunately, both know that this will probably be their only night together.', 1.99, 'R', '1995'),
(7, 'https://m.media-amazon.com/images/M/MV5BMTQ1MjAwNTM5Ml5BMl5BanBnXkFtZTYwNDM0MTc3._V1_SX300.jpg', 'Before Sunset', 'tt0381681', 'Nine years after Jesse and Celine first met, they encounter each other again on the French leg of Jesse\'s book tour.', 1.99, 'R', '2004'),
(8, 'https://m.media-amazon.com/images/M/MV5BNzk5MDk2MjktY2I3NS00ODZkLTk3OTktY2Q3ZDE2MmQ2M2ZmXkEyXkFqcGdeQXVyNjc1NTYyMjg@._V1_SX300.jpg', 'Breathless', 'tt0053472', 'A small-time thief steals a car and impulsively murders a motorcycle policeman. Wanted by the authorities, he reunites with a hip American journalism student and attempts to persuade her to run away with him to Italy.', 1.99, 'NOT RATED', '1960'),
(9, 'https://m.media-amazon.com/images/M/MV5BYjVhMTE3YzEtOGEwYS00NjFmLWFjYzAtMGVjNjY3YWY4OTJhL2ltYWdlXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SX300.jpg', 'In the Mood for Love', 'tt0118694', 'Two neighbors, a woman and a man, form a strong bond after both suspect extramarital activities of their spouses. However, they agree to keep their bond platonic so as not to commit similar wrongs.', 1.99, 'PG', '2000'),
(10, 'https://m.media-amazon.com/images/M/MV5BNzkwODFjNzItMmMwNi00MTU5LWE2MzktM2M4ZDczZGM1MmViXkEyXkFqcGdeQXVyNDY2MTk1ODk@._V1_SX300.jpg', 'The Apartment', 'tt0053604', 'A man tries to rise in his company by letting its executives use his apartment for trysts, but complications and a romance of his own ensue.', 1.99, 'NOT RATED', '1960'),
(11, 'https://m.media-amazon.com/images/M/MV5BMjIwMTk0Njc4Nl5BMl5BanBnXkFtZTcwODc5MjkzNA@@._V1_SX300.jpg', 'Hannah and Her Sisters', 'tt0091167', 'Between two Thanksgivings two years apart, Hannah\'s husband falls in love with her sister Lee, while her hypochondriac ex-husband rekindles his relationship with her sister Holly.', 1.99, 'PG-13', '1986'),
(12, 'https://m.media-amazon.com/images/M/MV5BMTY4NzcwODg3Nl5BMl5BanBnXkFtZTcwNTEwOTMyMw@@._V1_SX300.jpg', 'Eternal Sunshine of the Spotless Mind', 'tt0338013', 'When their relationship turns sour, a couple undergoes a medical procedure to have each other erased from their memories.', 1.99, 'R', '2004'),
(13, 'https://m.media-amazon.com/images/M/MV5BYTEyYmE0M2MtZDQ1OC00MGUxLWI4OGMtM2M1ZjIyNDI0Y2Q4XkEyXkFqcGdeQXVyNjQ2MjQ5NzM@._V1_SX300.jpg', 'A Room with a View', 'tt0091867', 'When Lucy Honeychurch and chaperone Charlotte Bartlett find themselves in Florence with rooms without views, fellow guests Mr Emerson and son George step in to remedy the situation. Meeting...', 1.99, 'NOT RATED', '1985'),
(14, 'https://m.media-amazon.com/images/M/MV5BZTM1MTRiNDctMTFiMC00NGM1LTkyMWQtNTY1M2JjZDczOWQ3XkEyXkFqcGdeQXVyMDI3OTIzOA@@._V1_SX300.jpg', 'Jules and Jim', 'tt0055032', 'Decades of a love triangle concerning two friends and an impulsive woman.', 1.99, 'NOT RATED', '1962'),
(15, 'https://m.media-amazon.com/images/M/MV5BOTAzZmI5ODgtYzYzZS00ZDQxLTk5NDItNzY3YjdhYjE3Nzk3XkEyXkFqcGdeQXVyNjc1NTYyMjg@._V1_SX300.jpg', 'All That Heaven Allows', 'tt0047811', 'An upper-class widow falls in love with a much younger, down-to-earth nurseryman, much to the disapproval of her children and criticism of her country club peers.', 1.99, 'NOT RATED', '1955'),
(16, 'https://m.media-amazon.com/images/M/MV5BYjUyZWZkM2UtMzYxYy00ZmQ3LWFmZTQtOGE2YjBkNjA3YWZlXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_SX300.jpg', 'Gone with the Wind', 'tt0031381', 'A manipulative woman and a roguish man conduct a turbulent romance during the American Civil War and Reconstruction periods.', 1.99, 'G', '1939'),
(17, 'https://ia.media-imdb.com/images/M/MV5BN2M3YjI1YTUtNDFlOS00MGNiLWExZjctNjY1ODFhYjYxMWMwXkEyXkFqcGdeQXVyMDI2NDg0NQ@@._V1_SX300.jpg', 'An Affair to Remember', 'tt0050105', 'A couple falls in love and agrees to meet in six months at the Empire State Building - but will it happen?', 1.99, 'NOT RATED', '1957'),
(18, 'https://m.media-amazon.com/images/M/MV5BZmMyNzg3MGYtZTllNS00MjVjLWI0NmQtMTZlNzBmZjBjZTZmXkEyXkFqcGdeQXVyMjgyNjk3MzE@._V1_SX300.jpg', 'The Umbrellas of Cherbourg', 'tt0058450', 'A young woman separated from her lover by war faces a life-altering decision.', 1.99, 'NOT RATED', '1964'),
(19, 'https://m.media-amazon.com/images/M/MV5BMTI2NDI5ODk4N15BMl5BanBnXkFtZTYwMTI3NTE3._V1_SX300.jpg', 'Lost in Translation', 'tt0335266', 'A faded movie star and a neglected young woman form an unlikely bond after crossing paths in Tokyo.', 1.99, 'R', '2003'),
(20, 'https://m.media-amazon.com/images/M/MV5BMTE2MDM4MTMtZmNkZC00Y2QyLWE0YjUtMTAxZGJmODMxMDM0XkEyXkFqcGdeQXVyNjc1NTYyMjg@._V1_SX300.jpg', 'Roman Holiday', 'tt0046250', 'A bored and sheltered princess escapes her guardians and falls in love with an American newsman in Rome.', 1.99, 'NOT RATED', '1953'),
(21, 'https://m.media-amazon.com/images/M/MV5BMjExMTg5OTU0NF5BMl5BanBnXkFtZTcwMjMxMzMzMw@@._V1_SX300.jpg', 'WALL·E', 'tt0910970', 'In the distant future, a small waste-collecting robot inadvertently embarks on a space journey that will ultimately decide the fate of mankind.', 1.99, 'G', '2008'),
(22, 'https://images-na.ssl-images-amazon.com/images/M/MV5BYjEyYjFmZDgtMzg2Yy00ZDgxLTkxYzUtY2QzNDJiZjg5OTIyXkEyXkFqcGdeQXVyNDkzNTM2ODg@._V1_SX300.jpg', 'My Night at Maud\'s', 'tt0064612', 'The rigid principles of a devout Catholic man are challenged during a one-night stay with Maud, a divorced woman with an outsize personality.', 1.99, 'PG', '1969'),
(23, 'https://m.media-amazon.com/images/M/MV5BNTRiM2E4MGUtOGVkOS00OTIwLTg4MzEtMDEzOThiNTQ2YjY4XkEyXkFqcGdeQXVyNjI5NTk0MzE@._V1_SX300.jpg', 'Journey to Italy', 'tt0046511', 'An unhappily married couple attempts to find direction and insight while vacationing in Naples.', 1.99, 'NOT RATED', '1954'),
(24, 'https://m.media-amazon.com/images/M/MV5BNzdmZTk4MTktZmExNi00OWEwLTgxZDctNTE4NWMwNjc1Nzg2XkEyXkFqcGdeQXVyNjc1NTYyMjg@._V1_SX300.jpg', 'Doctor Zhivago', 'tt0059113', 'The life of a Russian physician and poet who, although married to another, falls in love with a political activist\'s wife and experiences hardship during the First World War and then the October Revolution.', 1.99, 'PG-13', '1965'),
(25, 'https://images-na.ssl-images-amazon.com/images/M/MV5BY2M5Mzg3NjctZTlkNy00MTU0LWFlYTQtY2E2Y2M4NjNiNzllXkEyXkFqcGdeQXVyMTAwMzUyOTc@._V1_SX300.jpg', 'Harold and Maude', 'tt0067185', 'Young, rich, and obsessed with death, Harold finds himself changed forever when he meets lively septuagenarian Maude at a funeral.', 1.99, 'PG', '1971'),
(26, 'https://m.media-amazon.com/images/M/MV5BMjE0ODEwNjM2NF5BMl5BanBnXkFtZTcwMjU2Mzg3NA@@._V1_SX300.jpg', 'When Harry Met Sally...', 'tt0098635', 'Harry and Sally have known each other for years, and are very good friends, but they fear sex would ruin the friendship.', 1.99, 'R', '1989'),
(27, 'https://m.media-amazon.com/images/M/MV5BMTg5OTk1NjczNl5BMl5BanBnXkFtZTgwNTE3NjkzMTE@._V1_SX300.jpg', 'Say Anything...', 'tt0098258', 'A noble underachiever and a beautiful valedictorian fall in love the summer before she goes off to college.', 1.99, 'PG-13', '1989'),
(28, 'https://m.media-amazon.com/images/M/MV5BMWE1ZTZiZGEtYmYwNS00NWI0LTk0YzYtYmJjMjBkZTc2NjRjXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg', 'The Fabulous Baker Boys', 'tt0097322', 'The lives of two struggling musicians, who happen to be brothers, inevitably change when they team up with a beautiful, up-and-coming singer.', 1.99, 'R', '1989'),
(29, 'https://m.media-amazon.com/images/M/MV5BNjRlNzNhMDYtZmYxNC00ZDVlLTlkNGMtYTYxNDI5MjcxNWYzL2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyNjc1NTYyMjg@._V1_SX300.jpg', 'A Matter of Life and Death', 'tt0038733', 'A British wartime aviator who cheats death must argue for his life before a celestial court.', 1.99, 'PG', '1946');

-- --------------------------------------------------------


-- Table structure for table `user`


CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `login_id` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `address_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- Indexes for dumped tables



-- Indexes for table `address`

ALTER TABLE `address`
  ADD PRIMARY KEY (`id`);


-- Indexes for table `orders`

ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKel9kyl84ego2otj2accfd8mr7` (`user_id`);


-- Indexes for table `order_items`

ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKocimc7dtr037rh4ls4l95nlfi` (`product_id`),
  ADD KEY `FKqmxbj1e77sls50umaww7pkpnx` (`orders_id`);


-- Indexes for table `products`

ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);


-- Indexes for table `user`

ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKddefmvbrws3hvl5t0hnnsv8ox` (`address_id`);


-- AUTO_INCREMENT for dumped tables



-- AUTO_INCREMENT for table `address`

ALTER TABLE `address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;


-- AUTO_INCREMENT for table `orders`

ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;


-- AUTO_INCREMENT for table `order_items`

ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;


-- AUTO_INCREMENT for table `products`

ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;


-- AUTO_INCREMENT for table `user`

ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;


-- Constraints for dumped tables


--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `FKel9kyl84ego2otj2accfd8mr7` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `FKocimc7dtr037rh4ls4l95nlfi` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `FKqmxbj1e77sls50umaww7pkpnx` FOREIGN KEY (`orders_id`) REFERENCES `orders` (`id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `FKddefmvbrws3hvl5t0hnnsv8ox` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
