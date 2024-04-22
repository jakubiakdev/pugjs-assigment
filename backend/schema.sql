-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 14, 2024 at 06:13 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kuchnia`
--

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `description` text DEFAULT NULL,
  `image` text DEFAULT NULL,
  `price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `name`, `description`, `image`, `price`) VALUES
(2, 'Pierogi', 'Prawdziwe polskie pierogi! Nadzienie mięsne', 'img/image-1.jpg', 25.1),
(3, 'Musztarda', 'nie wiem dlaczego ją sprzedajemy', 'img/image-2.jpg', 26),
(4, 'Pho', 'Ryżowy makaron z pysznymi dodatkami', 'img/image-5.jpg', 42.99),
(5, 'Taco', 'Prawdziwe meksykańskie taco z mięsem i warzywkami', 'img/image-7.jpg', 39.99);

-- --------------------------------------------------------

--
-- Table structure for table `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `title` varchar(256) NOT NULL,
  `image` text NOT NULL,
  `content` text NOT NULL,
  `date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `title`, `image`, `content`, `date`) VALUES
(1, 'Tymczasowe utrudnienia na dzień 29.02.2025', 'img/image-10.jpg', 'W dniu 29.02.2025 lokal będzie zamknięty ze względu na zaplanowany remont. Zapraszamy następnego dnia!', '2025-01-01'),
(2, 'Nowe menu w naszej restauracji!', 'img/image-4.jpg', 'Zapraszamy do naszej restauracji na nowe dania!', '2024-04-14'),
(3, 'Azjatyckie smaki: Bogactwo Kuchni Kontynentu', '', 'Azjatyckie jedzenie to fascynujący kalejdoskop smaków, aromatów i technik kulinarnych, które odzwierciedlają bogactwo kultury i historii kontynentu. Od pikantnych potraw z Tajlandii po delikatne sushi z Japonii, azjatyckie jedzenie wzbudza zainteresowanie i zachwyt na całym świecie. W tym artykule przyjrzymy się różnorodności azjatyckich kuchni, ich wpływom oraz najbardziej znaczącym daniom.\r\n \r\nHistoria i Wpływy\r\n \r\nHistoria azjatyckiej kuchni sięga tysięcy lat wstecz i jest związana z różnorodnymi kulturami i tradycjami kulinarnej sztuki. Każdy kraj Azji ma swoje unikatowe składniki, techniki gotowania i preferowane smaki, które kształtowały się na przestrzeni wieków.\r\n \r\nChińska kuchnia, jedna z najstarszych i najbardziej wpływowych na świecie, znana jest z wykorzystywania świeżych składników, woków do smażenia i różnorodnych smaków, od kwaśnych po słodkie. Japońska kuchnia, z kolei, słynie z prostych, ale eleganckich potraw, często opartych na rybach surowych lub delikatnie gotowanych, oraz wyrafinowanych technikach prezentacji, takich jak sushi i sashimi.\r\n \r\nIndyjska kuchnia to z kolei festiwal przypraw, gdzie curry, cynamon, kardamon i inne aromatyczne składniki nadają potrawom niezrównany smak i zapach. Kuchnia tajska jest znana z połączenia pikantnych, słodkich, kwaśnych i słonych smaków, które tworzą niezapomniane doznania kulinarne.\r\n \r\nNajbardziej Znane Potrawy\r\n \r\nAzjatyckie jedzenie oferuje wiele ikonicznych dań, które podbijają serca smakoszy na całym świecie. Wśród nich można wymienić:\r\n \r\nSushi: Surowa ryba i kwaśny ryż stanowią podstawę tego japońskiego przysmaku, który zdobył popularność na całym świecie.\r\n \r\nPad Thai: Tajski klasyk, składający się z makaronu ryżowego smażonego z jajkiem, krewetkami, tofu, orzeszkami ziemnymi i aromatycznymi przyprawami.\r\n \r\nKung Pao Chicken: Chińska potrawa z kurczakiem, orzeszkami ziemnymi, papryką i pikantnym sosem.\r\n \r\nKimchi: Korejska fermentowana kapusta, która stanowi nieodłączny element koreańskich posiłków.\r\n \r\nCurry: Popularna w Indiach i Tajlandii potrawa z mięsa, ryby lub warzyw gotowanych w pikantnym sosie na bazie kurkumy, kolendry i innych przypraw.\r\n \r\nWpływ na Kuchnię Światową\r\n \r\nAzjatyckie jedzenie od dawna wywiera ogromny wpływ na kuchnię światową. Restauracje serwujące sushi, chińskie dania i tajskie curry są popularne na całym świecie, a składniki takie jak sos sojowy, ryż basmati, kokosowy mleczko i wiele innych stały się powszechnie dostępne w supermarketach na całym świecie.\r\n \r\nPonadto, azjatyckie techniki gotowania, takie jak smażenie na wokach, fermentacja czy sushi-making, stały się częścią globalnej kultury kulinarnej. Coraz więcej kucharzy eksperymentuje z azjatyckimi składnikami i smakami, tworząc nowoczesne interpretacje tradycyjnych dań.\r\n \r\nPodsumowanie\r\n \r\nAzjatyckie jedzenie to nie tylko jedzenie - to podróż przez smaki, aromaty i kultury kontynentu, które zachwycają i inspirują ludzi na całym świecie. Od delikatnych sushi po pikantne curry, azjatycka kuchnia oferuje coś dla każdego smakosza. Jej wpływ na kuchnię światową jest niezaprzeczalny, a jej bogactwo i różnorodność nigdy nie przestają zaskakiwać i fascynować.', '2026-04-08');

-- --------------------------------------------------------

--
-- Table structure for table `ordered_items`
--

CREATE TABLE `ordered_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `ordered_items`
--

INSERT INTO `ordered_items` (`id`, `order_id`, `menu_id`) VALUES
(1, 1, 2),
(2, 2, 3),
(3, 3, 2),
(4, 3, 4),
(5, 3, 3),
(6, 4, 5),
(7, 4, 3),
(8, 5, 5),
(9, 6, 5),
(10, 6, 2);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `address` text NOT NULL,
  `status` text NOT NULL DEFAULT 'W przygotowaniu',
  `creation_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `address`, `status`, `creation_date`) VALUES
(1, 'Jana Pawła 25/3 ', 'Dostarczone', '2024-04-14 00:00:00'),
(2, 'Tysiąclecia 11 mieszkania 5', 'W doręczeniu', '2024-04-14 00:00:00'),
(3, 'Lipowa 8', 'W przygotowaniu', '2024-04-14 16:09:57'),
(4, 'Lipowa 8', 'W przygotowaniu', '2024-04-14 16:16:55'),
(5, 'Jana Pawła 43 m 2', 'W przygotowaniu', '2024-04-14 16:51:22'),
(6, 'Czesława Miłosza 7', 'W doręczeniu', '2024-04-14 17:26:29');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ordered_items`
--
ALTER TABLE `ordered_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ordered_items`
--
ALTER TABLE `ordered_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
