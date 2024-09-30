-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2024. Sze 30. 08:44
-- Kiszolgáló verziója: 10.4.20-MariaDB
-- PHP verzió: 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `shop`
--
CREATE DATABASE IF NOT EXISTS `shop` DEFAULT CHARACTER SET utf8 COLLATE utf8_hungarian_ci;
USE `shop`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `products`
--

CREATE TABLE `products` (
  `ID` varchar(36) COLLATE utf8_hungarian_ci NOT NULL,
  `Name` varchar(50) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `Price` int(11) DEFAULT NULL,
  `CreatedTime` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `products`
--

INSERT INTO `products` (`ID`, `Name`, `Price`, `CreatedTime`) VALUES
('005bcd8d-7e4d-4ac9-884d-a6f7217dbb75', 'Rice Pilaf, Dry,package', 2627, '2024-09-02'),
('036e029c-9abb-420f-8aa7-6fa224252a82', 'External Supplier', 9066, '2024-07-28'),
('06128ac6-1e59-494b-bbf2-8ea261b0d8cc', 'Mushrooms - Honey', 6093, '2024-04-11'),
('09e9b8c0-a838-4469-a830-63263848b848', 'Oil - Cooking Spray', 906, '2024-09-29'),
('0b874d04-f833-4678-92bb-232c67f600cf', 'Pail - 4l White, With Handle', 3730, '2024-04-16'),
('0bf03ff0-7973-48d3-84d3-de0dcee9c3e0', 'Cheese - La Sauvagine', 1745, '2023-10-08'),
('0c78a466-28f1-47ba-8725-58d02a435465', 'Beef - Kobe Striploin', 3668, '2024-09-22'),
('0df5a1f2-e009-4ee8-946d-21caf9fa22fa', 'Ostrich - Fan Fillet', 794, '2023-10-13'),
('0ffd64ee-e191-48f8-9dbc-b354fd633803', 'Nectarines', 6562, '2024-04-02'),
('1006bdff-f9f5-49af-b8fa-02b15e3dc9e7', 'Bread - Burger', 3740, '2024-02-10'),
('12e2da60-94ed-41cd-90cf-33d2a84566a3', 'Bread Sour Rolls', 7126, '2024-09-10'),
('1811b3dc-48ee-46cc-a5b5-06950b1173a6', 'Truffle Cups - Brown', 8150, '2024-07-31'),
('18123383-fd13-4d8c-8c63-907996d86185', 'Juice - Tomato, 48 Oz', 1004, '2024-04-06'),
('1865e638-9127-422d-af19-84abae3e0e74', 'Zucchini - Green', 4906, '2024-05-06'),
('1be4e998-3468-4a28-be91-a5e3c2889533', 'Muffins - Assorted', 685, '2023-10-24'),
('1d3bad88-99ca-4abf-9640-2935363564a3', 'Carbonated Water - Strawberry', 1980, '2024-04-24'),
('20366093-9c74-4df6-8b42-67ce61dca39b', 'Truffle Shells - White Chocolate', 860, '2024-09-11'),
('2168eb42-7c82-4e98-9532-71529303c76b', 'Spice - Paprika', 5234, '2024-07-10'),
('241fc970-9585-40a4-9385-ad419b10c00e', 'Tea - Herbal Orange Spice', 778, '2023-10-01'),
('25ed9af4-5b3e-45ea-878f-242950215c54', 'Uniform Linen Charge', 7641, '2024-01-27'),
('295f266c-4f61-4583-931e-e86904f5c976', 'Muffin Mix - Oatmeal', 7721, '2023-10-05'),
('2a37336b-3968-42a4-a2c3-91d9efde2f1e', 'Shrimp - Black Tiger 13/15', 1382, '2024-05-30'),
('322c16bd-eadc-466f-bde4-5e0b21504f91', 'Anchovy Paste - 56 G Tube', 6042, '2024-03-29'),
('366736fa-ba66-4b7f-a685-d70b58487d2c', 'Tea - Apple Green Tea', 7070, '2024-06-18'),
('3987ec56-1989-46d5-8bd7-35c2cadedebd', 'Dasheen', 4720, '2023-12-04'),
('39e0b6f4-d3eb-4681-9e06-f01d930407b3', 'Soup - Campbells, Classic Chix', 9325, '2023-12-18'),
('3b330ae7-5b28-4b9a-ad7e-6a9be4604326', 'Coconut - Shredded, Sweet', 5901, '2024-03-27'),
('3c5db719-d6cc-44c0-af53-dd3e4ff98d84', 'Coffee Beans - Chocolate', 3172, '2024-03-25'),
('3d240981-ee11-4b59-8b5f-11813b52de02', 'Extract - Vanilla,artificial', 8847, '2024-06-23'),
('3e77d442-0308-4834-a216-26f5e46d02c5', 'Syrup - Monin - Blue Curacao', 6832, '2024-06-24'),
('3e786522-b7e2-4006-afde-938b872b35f5', 'Wine - Red, Concha Y Toro', 3330, '2023-11-21'),
('415011aa-eafa-45df-a58a-4cec6e3319f3', 'Potatoes - Pei 10 Oz', 3227, '2024-02-06'),
('4226f1de-b766-4aa7-88cb-5b3162881f53', 'Gin - Gilbeys London, Dry', 1911, '2024-03-29'),
('454f2b90-c534-4fb7-9ffe-d3785278b568', 'Hagen Daza - Dk Choocolate', 6217, '2024-07-10'),
('46376df3-5221-4744-927b-c499c629d291', 'Glycerine', 1240, '2024-03-24'),
('47f59d3e-d488-48b2-b7ab-48435f1e4c27', 'Chick Peas - Dried', 3061, '2024-08-04'),
('495dd491-42bf-40da-9816-580f08db045b', 'Salt And Pepper Mix - White', 7609, '2024-03-18'),
('4a6d86c4-5362-48b6-a72f-102090ba4121', 'Wine - Winzer Krems Gruner', 9287, '2023-11-03'),
('4d941abf-9f61-4a36-a799-f367ef9a1874', 'Compound - Rum', 3646, '2023-10-04'),
('4d99c8d7-8e5d-4d28-876b-06308bf84012', 'Jagermeister', 7126, '2024-08-13'),
('4e5569de-2a54-432f-aabc-979a033ee468', 'Cheese - Bakers Cream Cheese', 3005, '2024-08-26'),
('4fb1c711-c77f-440d-8a3b-8de1df6979c2', 'Sugar Thermometer', 8829, '2024-06-02'),
('5142da1c-654e-4ec4-b0fa-a56fed547b23', 'Table Cloth 72x144 White', 5339, '2024-01-23'),
('518b6f67-793c-40e5-bd69-40591cd5c5ff', 'Lettuce - Arugula', 6094, '2024-09-13'),
('57d87713-0bef-46b3-a31b-b7c2276ddd4c', 'Grouper - Fresh', 9142, '2024-04-24'),
('588b495e-7793-45de-8626-2d9e21b450b9', 'Tomatoes - Orange', 4511, '2024-08-21'),
('5bc2c885-45ac-42c1-865d-2ca179aee31a', 'Strawberries - California', 6373, '2023-12-16'),
('5d988412-4ba2-4961-a5c6-642475c6423d', 'Pastry - Apple Muffins - Mini', 9637, '2023-11-10'),
('5e4a3442-95d3-433c-bb99-0f5676677e89', 'Cups 10oz Trans', 894, '2024-05-11'),
('5efe151a-b8e2-485e-ad94-1bb71777b9a2', 'Garlic - Primerba, Paste', 8817, '2024-04-04'),
('60f5f997-0cc5-4b6a-91e3-d66987dda7e4', 'Vegetable - Base', 6066, '2024-04-27'),
('63df6152-218f-4ec9-a23d-c9aed6d76cc0', 'Lobster - Baby, Boiled', 3510, '2023-12-11'),
('6555260f-fc51-4628-9eed-8648c7a834ab', 'Basil - Primerba, Paste', 5900, '2024-08-07'),
('65e02897-2fe3-4594-a254-c84d5547917d', 'Turkey - Whole, Fresh', 6422, '2024-06-23'),
('6c9199a4-b4e2-4b4e-ba4d-8599b460bf93', 'Anisette - Mcguiness', 8093, '2023-12-05'),
('6dd6b1bc-f00d-4723-ac3b-b80cd5e1fbdc', 'Sugar - White Packet', 2671, '2024-01-30'),
('73b548a2-5d41-4d30-8b3b-60805169215e', 'Wine - Red, Concha Y Toro', 6273, '2024-06-06'),
('7c8f1a4f-8785-4f9a-ac58-1e75852b5848', 'Venison - Striploin', 8076, '2024-03-03'),
('7fc8b2c4-278c-4cac-9997-35748da9c2bc', 'Soup - French Can Pea', 8326, '2024-07-26'),
('800b3434-68ee-4442-a2c8-3ca6a143ca0f', 'Lamb Tenderloin Nz Fr', 9203, '2023-10-29'),
('8027a302-b6d9-416b-9c32-0ea22a1047d1', 'Tea - Honey Green Tea', 8242, '2024-07-22'),
('825c5f2a-b541-4134-a7cc-e650733699f8', 'Napkin - Beverage 1 Ply', 2393, '2023-12-24'),
('82e25e22-b042-4e52-b25b-60934e1ad1f8', 'Salmon Steak - Cohoe 6 Oz', 1245, '2023-12-16'),
('86aee78e-b1f7-46cb-b801-cff972be8796', 'Peas - Pigeon, Dry', 2877, '2024-09-24'),
('8cad720a-e2d8-4b9c-be85-2010f942133a', 'Milk - 2%', 8211, '2024-01-27'),
('8faaf6f9-de60-426a-b2d4-7a8357cfe8dd', 'Glove - Cutting', 8399, '2024-08-14'),
('997aa7ba-bcd8-40ad-82ba-a02703ddec64', 'Turkey - Oven Roast Breast', 999, '2024-08-04'),
('9a55b5aa-e440-4b3e-997b-237c376452d7', 'Paste - Black Olive', 3019, '2024-03-03'),
('9ac56833-dd0e-4885-86ed-e6204f782626', 'Table Cloth 120 Round White', 6955, '2024-08-20'),
('9d66b42c-bbe2-4d43-bec3-cc641949d36a', 'Wine - Magnotta - Cab Franc', 9674, '2023-10-01'),
('a6bb7821-5bfd-457a-9ec7-e50b34c760d8', 'Vinegar - White', 7466, '2024-01-09'),
('a84142e2-a2fd-4665-87ac-1dec8dd072cc', 'Foil Wrap', 891, '2024-03-31'),
('a84d143a-046f-449a-aed8-81f2b9be1677', 'Wine - Riesling Alsace Ac 2001', 3660, '2023-10-10'),
('acaef395-6051-40f8-8471-9812d2391036', 'Vinegar - Rice', 7767, '2024-05-23'),
('ae7ac7d4-98a1-483c-b166-2973611c50b7', 'Cheese - Gorgonzola', 9046, '2024-09-03'),
('b11c35e0-4c04-43ba-9a8a-3c03cb85edc1', 'Ice Cream - Fudge Bars', 1620, '2023-11-14'),
('b31d2a75-1017-4f20-ab54-e3a2cbc3f635', 'Chocolate - Pistoles, White', 4117, '2023-12-23'),
('b399f163-7772-4b1b-bb76-d31e526bdd12', 'Shichimi Togarashi Peppeers', 3221, '2024-06-20'),
('b5bd0d6b-4022-4b66-b819-742359b114d1', 'Blueberries', 8300, '2023-11-30'),
('b7ef7b28-cafb-4abc-898a-27a46c7a124f', 'Flour - Fast / Rapid', 8362, '2024-09-13'),
('ba397c38-d2ce-4f4b-aac6-4c66b6260608', 'Rice - Wild', 8744, '2023-10-17'),
('bb37e056-026a-4e0b-a237-aa3c797ae38b', 'Durian Fruit', 6524, '2023-10-24'),
('bb3e3909-fbbc-4735-b26e-d82cca0a61f1', 'Cookie Dough - Oatmeal Rasin', 1604, '2023-10-05'),
('bba9be42-d23e-4864-aae5-7204ad5bc5ad', 'Oil - Pumpkinseed', 4407, '2024-03-08'),
('bd3dd588-d7c7-4659-a340-575b2aada8c0', 'Cheese - Parmigiano Reggiano', 760, '2024-02-22'),
('bf2808fd-96c8-436b-ba6f-ce3a68827322', 'Wine - Ruffino Chianti', 9362, '2024-09-21'),
('c7a28260-8833-4e87-ad6c-2cd7ac5afc16', 'Beef - Prime Rib Aaa', 5331, '2024-06-02'),
('c7e4c676-0240-4201-aba3-fe0578848909', 'Veal - Provimi Inside', 2601, '2024-04-26'),
('cb1aafd4-1331-4f81-8d35-8323c8e4329f', 'Juice - Happy Planet', 8351, '2023-11-20'),
('cbf40d2c-62fd-493f-bd64-ed561e2dbd50', 'Wine - Sauvignon Blanc', 5530, '2023-12-23'),
('cf3bc939-40e8-4e13-b3e1-fd48992c4c2b', 'Sprite, Diet - 355ml', 7458, '2024-03-14'),
('d0111f6c-6757-4bfb-9582-42ec4203fc7f', 'Soup Campbells Beef With Veg', 3720, '2023-10-08'),
('d633eee3-f16d-491c-aac9-4aa6073f2951', 'Plate Pie Foil', 3509, '2024-04-04'),
('d8ee0c0b-6619-409f-abbe-dafc4156e86f', 'Soup - Campbells Broccoli', 8977, '2023-12-01'),
('daac2f77-22ae-4b79-9422-499385832cc2', 'Star Anise, Whole', 5175, '2024-04-20'),
('e43c81c1-e45d-42f7-acc3-5e0c8957c99b', 'Pastry - Apple Large', 7122, '2023-10-04'),
('eb58142e-b16c-4254-bbd1-98e055a8a153', 'Oil - Truffle, White', 7005, '2024-08-27'),
('f0b893c4-8fbb-43bf-a4ae-532f8e764570', 'Curry Paste - Madras', 8555, '2024-06-16'),
('f5724ef0-0200-4d6a-b025-c77cc36b494c', 'Table Cloth 72x144 White', 7960, '2024-05-31'),
('f8e044a0-9173-481b-996b-bd385d3e8003', 'Artichokes - Jerusalem', 8658, '2023-11-28');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
