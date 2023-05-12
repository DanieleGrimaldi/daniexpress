-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Creato il: Mag 12, 2023 alle 15:46
-- Versione del server: 8.0.26
-- Versione PHP: 8.0.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `my_dany04`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `cart`
--

CREATE TABLE `cart` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struttura della tabella `category`
--

CREATE TABLE `category` (
  `id` int NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Laptops'),
(2, 'Desktop PC'),
(3, 'Tablets'),
(4, 'Smart Phones');

-- --------------------------------------------------------

--
-- Struttura della tabella `details`
--

CREATE TABLE `details` (
  `id` int NOT NULL,
  `sales_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `details`
--

INSERT INTO `details` (`id`, `sales_id`, `product_id`, `quantity`) VALUES
(21, 11, 2, 1),
(22, 12, 19, 1),
(23, 12, 3, 1),
(24, 13, 1, 3),
(25, 13, 13, 1),
(26, 14, 19, 1),
(27, 14, 1, 3),
(28, 14, 13, 3),
(29, 14, 11, 4),
(30, 14, 2, 3),
(31, 14, 28, 2),
(32, 15, 1, 1),
(33, 18, 29, 3),
(36, 21, 13, 1),
(37, 21, 5, 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `products`
--

CREATE TABLE `products` (
  `id` int NOT NULL,
  `category_id` int NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `slug` varchar(200) NOT NULL,
  `price` double NOT NULL,
  `photo` varchar(200) NOT NULL,
  `available` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `description`, `slug`, `price`, `photo`, `available`) VALUES
(1, 1, 'DELL Inspiron 15 7000 15.6', '<p>15-inch laptop ideal for gamers. Featuring the latest Intel&reg; processors for superior gaming performance, and life-like NVIDIA&reg; GeForce&reg; graphics and an advanced thermal cooling design.</p>\r\n', 'dell-inspiron-15-7000-15-6', 899, 'dell-inspiron-15-7000-15-6.jpg', 1),
(2, 1, 'MICROSOFT Surface Pro 4 & Typecover - 128 GB', '<p>Surface Pro 4 powers through everything you need to do, while being lighter than ever before</p>\r\n\r\n<p>The 12.3 PixelSense screen has extremely high contrast and low glare so you can work through the day without straining your eyes</p>\r\n\r\n<p>keyboard is not included and needed to be purchased separately</p>\r\n\r\n<p>Features an Intel Core i5 6th Gen (Skylake) Core,Wireless: 802.11ac Wi-Fi wireless networking; IEEE 802.11a/b/g/n compatible Bluetooth 4.0 wireless technology</p>\r\n\r\n<p>Ships in Consumer packaging.</p>\r\n', 'microsoft-surface-pro-4-typecover-128-gb', 799, 'microsoft-surface-pro-4-typecover-128-gb.jpg', 1),
(3, 1, 'DELL Inspiron 15 5000 15.6', '<p>Dell&#39;s 15.6-inch, midrange notebook is a bland, chunky block. It has long been the case that the Inspiron lineup lacks any sort of aesthetic muse, and the Inspiron 15 5000 follows this trend. It&#39;s a plastic, silver slab bearing Dell&#39;s logo in a mirror sheen.</p>\r\n\r\n<p>Lifting the lid reveals the 15.6-inch, 1080p screen surrounded by an almost offensively thick bezel and a plastic deck with a faux brushed-metal look. There&#39;s a fingerprint reader on the power button, and the keyboard is a black collection of island-style keys.</p>\r\n', 'dell-inspiron-15-5000-15-6', 599, 'dell-inspiron-15-5000-15-6.jpg', 1),
(4, 1, 'LENOVO Ideapad 320s-14IKB 14\" Laptop - Grey', '<p>- Made for portability with a slim, lightweight chassis design&nbsp;<br />\r\n<br />\r\n- Powerful processing helps you create and produce on the go&nbsp;<br />\r\n<br />\r\n- Full HD screen ensures crisp visuals for movies, web pages, photos and more&nbsp;<br />\r\n<br />\r\n- Enjoy warm, sparkling sound courtesy of two Harman speakers and Dolby Audio&nbsp;<br />\r\n<br />\r\n- Fast data transfer and high-quality video connection with USB-C and HDMI ports&nbsp;<br />\r\n<br />\r\nThe Lenovo&nbsp;<strong>IdeaPad 320s-14IKB 14&quot; Laptop</strong>&nbsp;is part of our Achieve range, which has the latest tech to help you develop your ideas and work at your best. It&#39;s great for editing complex documents, business use, editing photos, and anything else you do throughout the day.</p>\r\n', 'lenovo-ideapad-320s-14ikb-14-laptop-grey', 399, 'lenovo-ideapad-320s-14ikb-14-laptop-grey.jpg', 1),
(5, 3, 'APPLE 9.7\" iPad - 32 GB, Gold', '<p>9.7 inch Retina Display, 2048 x 1536 Resolution, Wide Color and True Tone Display</p>\r\n\r\n<p>Apple iOS 9, A9X chip with 64bit architecture, M9 coprocessor</p>\r\n\r\n<p>12 MP iSight Camera, True Tone Flash, Panorama (up to 63MP), Four-Speaker Audio</p>\r\n\r\n<p>Up to 10 Hours of Battery Life</p>\r\n\r\n<p>iPad Pro Supports Apple Smart Keyboard and Apple Pencil</p>\r\n', 'apple-9-7-ipad-32-gb-gold', 339, 'apple-9-7-ipad-32-gb-gold.jpg', 1),
(6, 1, 'DELL Inspiron 15 5000 15', '<p>15-inch laptop delivering an exceptional viewing experience, a head-turning finish and an array of options designed to elevate your entertainment, wherever you go.</p>\r\n', 'dell-inspiron-15-5000-15', 449.99, 'dell-inspiron-15-5000-15.jpg', 1),
(7, 3, 'APPLE 10.5\" iPad Pro - 64 GB, Space Grey (2017)', '<p>4K video recording at 30 fps</p>\r\n\r\n<p>12-megapixel camera</p>\r\n\r\n<p>Fingerprint resistant coating</p>\r\n\r\n<p>Antireflective coating</p>\r\n\r\n<p>Face Time video calling</p>\r\n', 'apple-10-5-ipad-pro-64-gb-space-grey-2017', 619, 'apple-10-5-ipad-pro-64-gb-space-grey-2017.jpg', 1),
(8, 1, 'ASUS Transformer Mini T102HA 10.1\" 2 in 1 - Silver', '<p>Versatile Windows 10 device with keyboard and pen included, 2-in-1 functionality: use as both laptop and tablet.Update Windows periodically to ensure that your applications have the latest security settings.</p>\r\n\r\n<p>All day battery life, rated up to 11 hours of video playback; 128GB Solid State storage. Polymer Battery.With up to 11 hours between charges, you can be sure that Transformer Mini T102HA will be right there whenever you need it. You can charge T102HA via its micro USB port, so you can use a mobile charger or any power bank with a micro USB connector.</p>\r\n', 'asus-transformer-mini-t102ha-10-1-2-1-silver', 549.99, 'asus-transformer-mini-t102ha-10-1-2-1-silver.jpg', 1),
(9, 2, 'PC SPECIALIST Vortex Core Lite Gaming PC', '<p>- Top performance for playing eSports and more&nbsp;<br />\r\n<br />\r\n- NVIDIA GeForce GTX graphics deliver smooth visuals&nbsp;<br />\r\n<br />\r\n- GeForce Experience delivers updates straight to your PC&nbsp;<br />\r\n<br />\r\nThe PC Specialist&nbsp;<strong>Vortex Core Lite&nbsp;</strong>is part of our Gaming range, bringing you the most impressive PCs available today. It has spectacular graphics and fast processing performance to suit the most exacting players.</p>\r\n', 'pc-specialist-vortex-core-lite-gaming-pc', 599.99, 'pc-specialist-vortex-core-lite-gaming-pc.jpg', 1),
(10, 2, 'DELL Inspiron 5675 Gaming PC - Recon Blue', '<p>All-new gaming desktop featuring powerful AMD Ryzen&trade; processors, graphics ready for VR, LED lighting and a meticulous design for optimal cooling.</p>\r\n', 'dell-inspiron-5675-gaming-pc-recon-blue', 599.99, 'dell-inspiron-5675-gaming-pc-recon-blue.jpg', 1),
(11, 2, 'HP Barebones OMEN X 900-099nn Gaming PC', '<p>What&#39;s inside matters.</p>\r\n\r\n<p>Without proper cooling, top tierperformance never reaches its fullpotential.</p>\r\n\r\n<p>Nine lighting zones accentuate theaggressive lines and smooth blackfinish of this unique galvanized steelcase.</p>\r\n', 'hp-barebones-omen-x-900-099nn-gaming-pc', 489.98, 'hp-barebones-omen-x-900-099nn-gaming-pc.jpg', 1),
(12, 2, 'ACER Aspire GX-781 Gaming PC', '<p>- GTX 1050 graphics card lets you play huge games in great resolutions&nbsp;<br />\r\n<br />\r\n- Latest generation Core&trade; i5 processor can handle demanding media software&nbsp;<br />\r\n<br />\r\n- Superfast SSD storage lets you load programs in no time&nbsp;<br />\r\n<br />\r\nThe Acer&nbsp;<strong>Aspire&nbsp;GX-781 Gaming PC&nbsp;</strong>is part of our Gaming range, which offers the most powerful PCs available today. It has outstanding graphics and processing performance to suit the most demanding gamer.</p>\r\n', 'acer-aspire-gx-781-gaming-pc', 749.99, 'acer-aspire-gx-781-gaming-pc.jpg', 1),
(13, 2, 'HP Pavilion Power 580-015na Gaming PC', '<p>Features the latest quad core Intel i5 processor and discrete graphics. With this power, you&rsquo;re ready to take on any activity from making digital art to conquering new worlds in VR.</p>\r\n\r\n<p>Choose the performance and storage you need. Boot up in seconds with to 128 GB SSD.</p>\r\n\r\n<p>Ditch the dull grey box, this desktop comes infused with style. A new angular bezel and bold green and black design give your workspace just the right amount of attitude.</p>\r\n\r\n<p>Up to 3 times faster performance - GeForce GTX 10-series graphics cards are powered by Pascal to deliver twice the performance of previous-generation graphics cards.</p>\r\n', 'hp-pavilion-power-580-015na-gaming-pc', 799.99, 'hp-pavilion-power-580-015na-gaming-pc.jpg', 1),
(14, 2, 'LENOVO Legion Y520 Gaming PC', '<p>- Multi-task with ease thanks to Intel&reg; i5 processor&nbsp;<br />\r\n<br />\r\n- Prepare for battle with NVIDIA GeForce GTX graphics card&nbsp;<br />\r\n<br />\r\n- VR ready for the next-generation of immersive gaming and entertainment<br />\r\n<br />\r\n- Tool-less upgrade helps you personalise your system to your own demands&nbsp;<br />\r\n<br />\r\nPart of our Gaming range, which features the most powerful PCs available today, the Lenovo&nbsp;<strong>Legion Y520 Gaming PC</strong>&nbsp;has superior graphics and processing performance to suit the most demanding gamer.</p>\r\n', 'lenovo-legion-y520-gaming-pc', 899.99, 'lenovo-legion-y520-gaming-pc.jpg', 1),
(15, 2, 'PC SPECIALIST Vortex Minerva XT-R Gaming PC', '<p>- NVIDIA GeForce GTX graphics for stunning gaming visuals<br />\r\n<br />\r\n- Made for eSports with a speedy 7th generation Intel&reg; Core&trade; i5 processor<br />\r\n<br />\r\n- GeForce technology lets you directly update drivers, record your gaming and more<br />\r\n<br />\r\nThe PC Specialist&nbsp;<strong>Vortex Minerva XT-R Gaming PC</strong>&nbsp;is part of our Gaming range, which offers the most powerful PCs available. Its high-performance graphics and processing are made to meet the needs of serious gamers.</p>\r\n', 'pc-specialist-vortex-minerva-xt-r-gaming-pc', 999.99, 'pc-specialist-vortex-minerva-xt-r-gaming-pc.jpg', 1),
(16, 2, 'PC SPECIALIST Vortex Core II Gaming PC', '<p>Processor: Intel&reg; CoreTM i3-6100 Processor- Dual-core- 3.7 GHz- 3 MB cache</p>\r\n\r\n<p>Memory (RAM): 8 GB DDR4 HyperX, Storage: 1 TB HDD, 7200 rpm</p>\r\n\r\n<p>Graphics card: NVIDIA GeForce GTX 950 (2 GB GDDR5), Motherboard: ASUS H110M-R</p>\r\n\r\n<p>USB: USB 3.0 x 3- USB 2.0 x 5, Video interface: HDMI x 1- DisplayPort x 1- DVI x 2, Audio interface: 3.5 mm jack, Optical disc drive: DVD/RW, Expansion card slot PCIe: (x1) x 2</p>\r\n\r\n<p>Sound: 5.1 Surround Sound support PSU Corsair: VS350, 350W, Colour: Black- Green highlights, Box contents: PC Specialist Vortex Core- AC power cable</p>\r\n', 'pc-specialist-vortex-core-ii-gaming-pc', 649.99, 'pc-specialist-vortex-core-ii-gaming-pc.jpg', 1),
(17, 3, 'AMAZON Fire 7 Tablet with Alexa (2017) - 8 GB, Black', '<p>The next generation of our best-selling Fire tablet ever - now thinner, lighter, and with longer battery life and an improved display. More durable than the latest iPad</p>\r\n\r\n<p>Beautiful 7&quot; IPS display with higher contrast and sharper text, a 1.3 GHz quad-core processor, and up to 8 hours of battery life. 8 or 16 GB of internal storage and a microSD slot for up to 256 GB of expandable storage.</p>\r\n', 'amazon-fire-7-tablet-alexa-2017-8-gb-black', 49.99, 'amazon-fire-7-tablet-alexa-2017-8-gb-black.jpg', 1),
(18, 3, 'AMAZON Fire HD 8 Tablet with Alexa (2017) - 16 GB, Black', '<p>Take your personal assistant with you wherever you go with this Amazon Fire HD 8 tablet featuring Alexa voice-activated cloud service. The slim design of the tablet is easy to handle, and the ample 8-inch screen is ideal for work or play. This Amazon Fire HD 8 features super-sharp high-definition graphics for immersive streaming.</p>\r\n', 'amazon-fire-hd-8-tablet-alexa-2017-16-gb-black', 79.99, 'amazon-fire-hd-8-tablet-alexa-2017-16-gb-black.jpg', 1),
(19, 3, 'AMAZON Fire HD 8 Tablet with Alexa (2017) - 32 GB, Black', '<p>The next generation of our best-reviewed Fire tablet, with up to 12 hours of battery life, a vibrant 8&quot; HD display, a 1.3 GHz quad-core processor, 1.5 GB of RAM, and Dolby Audio. More durable than the latest iPad.</p>\r\n\r\n<p>16 or 32 GB of internal storage and a microSD slot for up to 256 GB of expandable storage.</p>\r\n', 'amazon-fire-hd-8-tablet-alexa-2017-32-gb-black', 99.99, 'amazon-fire-hd-8-tablet-alexa-2017-32-gb-black.jpg', 1),
(20, 3, 'APPLE 9.7\" iPad - 32 GB, Space Grey', '<p>9.7-inch Retina display, wide color and true tone</p>\r\n\r\n<p>A9 third-generation chip with 64-bit architecture</p>\r\n\r\n<p>M9 motion coprocessor</p>\r\n\r\n<p>1.2MP FaceTime HD camera</p>\r\n\r\n<p>8MP iSight camera</p>\r\n\r\n<p>Touch ID</p>\r\n\r\n<p>Apple Pay</p>\r\n', 'apple-9-7-ipad-32-gb-space-grey', 339, 'apple-9-7-ipad-32-gb-space-grey.jpg', 1),
(27, 1, 'Dell XPS 15 9560', '<p>The world&rsquo;s smallest 15.6-inch performance laptop packs powerhouse performance and a stunning InfinityEdge display &mdash; all in our most powerful XPS laptop. Featuring the latest Intel&reg; processors.</p>\r\n\r\n<h2>Operating system</h2>\r\n\r\n<p><strong>Available with Windows 10 Home&nbsp;</strong>- Get the best combination of Windows features you know and new improvements you&#39;ll love.</p>\r\n\r\n<h2>Innovation that inspires.</h2>\r\n\r\n<p>When you&rsquo;re at the forefront of ingenuity, you get noticed. That&rsquo;s why it&rsquo;s no surprise the XPS 15 was honored. The winning streak continues.</p>\r\n\r\n<h2>Meet the smallest 15.6-inch laptop on the planet.</h2>\r\n\r\n<p><strong>The world&rsquo;s only 15.6-inch InfinityEdge display*:</strong>&nbsp;The virtually borderless display maximizes screen space by accommodating a 15.6-inch display inside a laptop closer to the size of a 14-inch, thanks to a bezel measuring just 5.7mm.<br />\r\n&nbsp;<br />\r\n<strong>Operating System: Windows 10 Pro.</strong><br />\r\n<br />\r\n<strong>One-of-a-kind design:</strong>&nbsp;Measuring in at a slim 11-17mm and starting at just 4 pounds (1.8 kg) with a solid state drive, the XPS 15 is one of the world&rsquo;s lightest 15-inch performance-class laptop.</p>\r\n\r\n<h2>A stunning view, wherever you go.</h2>\r\n\r\n<p><strong>Dazzling detail:</strong>&nbsp;With the UltraSharp 4K Ultra HD display (3840 x 2160), you can see each detail of every pixel without needing to zoom in. And with 6 million more pixels than Full HD and 3 million more than the MacBook Pro, you can edit images with pinpoint accuracy without worrying about blurriness or jagged lines.<br />\r\n<br />\r\n<strong>Industry-leading color:</strong>&nbsp;The XPS 15 is the only laptop with 100% Adobe RGB color, covering a wider color gamut and producing shades of color outside conventional panels so you can see more of what you see in real life. And with over 1 billion colors, images appear smoother and color gradients are amazingly lifelike with more depth and dimension. Included is Dell PremierColor software, which automatically remaps content not already in Adobe RGB format for onscreen colors that appear amazingly accurate and true to life.<br />\r\n<br />\r\n<strong>Easy collaboration:</strong>&nbsp;See your screen from nearly every angle with an IGZO IPS panel, providing a wide viewing angle of up to 170&deg;.&nbsp;<br />\r\n<br />\r\n<strong>Brighten your day:</strong>&nbsp;With 350 nit brightness, it&rsquo;s brighter than a typical laptop.<br />\r\n<br />\r\n<strong>Touch-friendly:</strong>&nbsp;Tap, swipe and pinch your way around the screen. The optional touch display lets you interact naturally with your technology.</p>\r\n', 'dell-xps-15-9560', 1599, 'dell-xps-15-9560.jpg', 1),
(28, 4, 'Samsung Note 8', '<p>See the bigger picture and communicate in a whole new way. With the Galaxy Note8 in your hand, bigger things are just waiting to happen.&nbsp;</p>\r\n\r\n<h3>The Infinity Display that&#39;s larger than life.&nbsp;</h3>\r\n\r\n<p>More screen means more space to do great things. Go big with the Galaxy Note8&#39;s 6.3&quot; screen. It&#39;s the largest ever screen on a Note device and it still fits easily in your hand.</p>\r\n\r\n<p>*Infinity Display: a near bezel-less, full-frontal glass, edge-to-edge screen.</p>\r\n\r\n<p>*Screen measured diagonally as a full rectangle without accounting for the rounded corners.</p>\r\n\r\n<p>Use the S Pen to express yourself in ways that make a difference. Draw your own emojis to show how you feel or write a message on a photo and send it as a handwritten note. Do things that matter with the S Pen.</p>\r\n\r\n<p>*Image simulated for illustration purpose only.</p>\r\n', 'samsung-note-8', 829, 'samsung-note-8.jpg', 1),
(29, 4, 'Samsung Galaxy S9+ [128 GB]', '<h2>The revolutionary camera that adapts like the human eye.&nbsp;</h2>\r\n\r\n<h3>Capture stunning pictures in bright daylight and super low light.</h3>\r\n\r\n<p>Our category-defining Dual Aperture lens adapts like the human eye. It&#39;s able to automatically switch between various lighting conditions with ease&mdash;making your photos look great whether it&#39;s bright or dark, day or night.</p>\r\n\r\n<p>*Dual Aperture supports F1.5 and F2.4 modes. Installed on the rear camera (Galaxy S9)/rear wide camera (Galaxy S9+).</p>\r\n\r\n\r\n', 'samsung-galaxy-s9-128-gb', 889.99, 'samsung-galaxy-s9-128-gb.jpg', 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `reviews`
--

CREATE TABLE `reviews` (
  `id` int NOT NULL,
  `star` smallint NOT NULL DEFAULT '0',
  `text` text COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `reviews`
--

INSERT INTO `reviews` (`id`, `star`, `text`, `user_id`, `product_id`) VALUES
(2, 3, 'carino', 13, 1),
(3, 1, 'ciao', 13, 1),
(4, 4, 'star', 13, 13),
(19, 4, 'I love this product! It\'s sleek, stylish, and performs exceptionally well.', 9, 9),
(20, 3, 'I have mixed feelings about this product. It has some great aspects, but also some drawbacks.', 12, 12),
(21, 4, 'Great value for money! This product offers impressive features at an affordable price.', 13, 13),
(22, 5, 'I highly recommend this product to anyone in need of a reliable and high-performance device.', 14, 14),
(23, 1, 'I regret buying this product. It broke down within a week of use.', 15, 15),
(24, 4, 'I\'m amazed by the quality of this product. It\'s built to last and delivers outstanding results.', 16, 16),
(25, 3, 'This product is decent, but it could use some improvements in terms of functionality.', 17, 17),
(26, 5, 'Absolutely fantastic product! It has exceeded my expectations in every aspect.', 18, 18),
(27, 2, 'I wouldn\'t recommend this product. It has major performance issues and lacks durability.', 19, 19),
(47, 4, 'The quality of this product is impressive. It feels solid and well-built.', 13, 27),
(48, 5, 'I can confidently say that this is the best product in its category. It delivers exceptional performance.', 14, 28),
(49, 1, 'I regret purchasing this product. It stopped working after just a few days of use.', 15, 29),
(57, 4, 'The quality of this product is impressive. It feels solid and well-built.', 13, 27),
(58, 5, 'I can confidently say that this is the best product in its category. It delivers exceptional performance.', 14, 28),
(59, 1, 'I regret purchasing this product. It stopped working after just a few days of use.', 15, 29),
(67, 5, 'This product is amazing! It exceeded my expectations in every way.', 16, 1),
(68, 4, 'I\'m happy with this purchase. The product offers good value for the price.', 17, 2),
(69, 3, 'I have mixed feelings about this product. It has some flaws that need improvement.', 18, 3),
(70, 5, 'Highly recommended! This product is top-notch and performs exceptionally well.', 19, 4),
(71, 4, 'Great product! It\'s reliable and delivers excellent performance.', 1, 6),
(72, 2, 'I wouldn\'t recommend this product. It has major performance problems.', 9, 14),
(73, 5, 'I\'m extremely satisfied with this product. It\'s worth every penny.', 12, 17),
(74, 2, 'I\'m disappointed with this purchase. The product didn\'t live up to my expectations.', 13, 18),
(75, 4, 'Great value for money! This product has exceeded my expectations.', 14, 19),
(76, 5, 'This product is a lifesaver! It has made my daily tasks much easier.', 15, 20),
(87, 5, 'I\'m extremely satisfied with this product. It\'s a worthwhile investment.', 12, 28),
(88, 2, 'I\'m disappointed with this purchase. The product didn\'t live up to my expectations.', 13, 29),
(107, 2, 'I wouldn\'t recommend this product. It has major issues and lacks durability.', 9, 27),
(108, 5, 'I\'m extremely satisfied with this product. It\'s a worthwhile investment.', 12, 27),
(109, 2, 'I\'m disappointed with this purchase. The product didn\'t live up to my expectations.', 13, 27),
(110, 4, 'This product is fantastic! It offers excellent features and functionality.', 14, 28),
(111, 5, 'This product is a game-changer! It has greatly enhanced my productivity and efficiency.', 15, 28),
(112, 5, 'I\'m absolutely delighted with this product! It has exceeded all my expectations.', 16, 28),
(113, 4, 'This product offers great value for the price. It\'s reliable and performs well.', 17, 28),
(114, 3, 'I have mixed feelings about this product. It has some flaws that need improvement.', 18, 28),
(115, 5, 'Outstanding product! It has greatly improved my productivity and efficiency.', 19, 28),
(116, 4, 'I\'m really impressed with this product! It\'s well-designed and offers excellent performance.', 1, 29),
(163, 5, 'I\'m extremely satisfied with this product. It\'s a worthwhile investment.', 12, 1),
(164, 2, 'I\'m disappointed with this purchase. The product didn\'t live up to my expectations.', 13, 1),
(165, 4, 'This product is fantastic! It offers excellent features and functionality.', 14, 1),
(166, 5, 'This product is a game-changer! It has greatly enhanced my productivity and efficiency.', 15, 1),
(167, 2, 'I wouldn\'t recommend this product. It has major issues and lacks durability.', 9, 2),
(168, 5, 'I\'m extremely satisfied with this product. It\'s a worthwhile investment.', 12, 2),
(169, 2, 'I\'m disappointed with this purchase. The product didn\'t live up to my expectations.', 13, 2),
(170, 4, 'This product is fantastic! It offers excellent features and functionality.', 14, 2),
(171, 5, 'This product is a game-changer! It has greatly enhanced my productivity and efficiency.', 15, 3),
(172, 5, 'I\'m absolutely delighted with this product! It has exceeded all my expectations.', 16, 3),
(173, 4, 'This product offers great value for the price. It\'s reliable and performs well.', 17, 3),
(174, 3, 'I have mixed feelings about this product. It has some flaws that need improvement.', 18, 3),
(175, 5, 'Outstanding product! It has greatly improved my productivity and efficiency.', 19, 3),
(176, 4, 'Great product! It\'s reliable and delivers excellent performance.', 1, 4),
(177, 5, 'I\'m extremely satisfied with this product. It\'s a worthwhile investment.', 12, 5),
(178, 2, 'I\'m disappointed with this purchase. The product didn\'t live up to my expectations.', 13, 5),
(179, 4, 'This product is fantastic! It offers excellent features and functionality.', 14, 5),
(180, 5, 'This product is a game-changer! It has greatly enhanced my productivity and efficiency.', 15, 5),
(192, 2, 'I wouldn\'t recommend this product. It has major issues and lacks durability.', 9, 6),
(193, 5, 'I\'m extremely satisfied with this product. It\'s a worthwhile investment.', 12, 6),
(194, 2, 'I\'m disappointed with this purchase. The product didn\'t live up to my expectations.', 13, 6),
(195, 4, 'This product is fantastic! It offers excellent features and functionality.', 14, 7),
(196, 5, 'This product is a game-changer! It has greatly enhanced my productivity and efficiency.', 15, 7),
(197, 5, 'I\'m absolutely delighted with this product! It has exceeded all my expectations.', 16, 7),
(198, 4, 'This product offers great value for the price. It\'s reliable and performs well.', 17, 7),
(199, 3, 'I have mixed feelings about this product. It has some flaws that need improvement.', 18, 7),
(200, 5, 'Outstanding product! It has greatly improved my productivity and efficiency.', 19, 7),
(201, 4, 'I\'m really impressed with this product! It\'s well-designed and offers excellent performance.', 1, 8),
(202, 5, 'Outstanding product! It has greatly improved my productivity.', 9, 9),
(203, 3, 'Average product. It works, but there\'s nothing exceptional about it.', 12, 10),
(204, 5, 'I\'m extremely satisfied with this product. It\'s a worthwhile investment.', 13, 10),
(205, 2, 'I\'m disappointed with this purchase. The product didn\'t live up to my expectations.', 14, 10),
(206, 4, 'This product is fantastic! It offers excellent features and functionality.', 15, 10),
(207, 5, 'This product is a game-changer! It has greatly enhanced my productivity and efficiency.', 16, 11),
(208, 5, 'I\'m absolutely delighted with this product! It has exceeded all my expectations.', 17, 11),
(209, 4, 'This product offers great value for the price. It\'s reliable and performs well.', 18, 11),
(210, 3, 'I have mixed feelings about this product. It has some flaws that need improvement.', 19, 11),
(211, 2, 'I\'m not satisfied with this product. It didn\'t meet my expectations.', 1, 11),
(212, 4, 'I\'m really impressed with this product! It\'s well-designed and offers excellent performance.', 9, 13),
(213, 5, 'This product is a game-changer! It has revolutionized the way I work and has exceeded my expectations.', 12, 13),
(214, 2, 'I regret buying this product. It has too many flaws and lacks reliability.', 13, 13),
(215, 4, 'Great product! It\'s reliable and delivers excellent performance.', 14, 14),
(216, 3, 'Decent features, but the product could be more user-friendly.', 15, 14),
(217, 4, 'I\'m impressed with the quality of this product. It\'s durable and well-built.', 16, 14),
(218, 5, 'Outstanding product! It has greatly improved my productivity.', 17, 14),
(219, 2, 'I regret buying this product. It has too many issues and lacks reliability.', 18, 14),
(220, 4, 'I\'m thrilled with this purchase. The product meets all my needs and more.', 19, 14),
(221, 5, 'I\'m extremely satisfied with this product. It\'s a worthwhile investment.', 1, 15),
(222, 2, 'I\'m not satisfied with this product. It didn\'t meet my expectations.', 9, 16),
(223, 5, 'I\'m absolutely delighted with this product! It has exceeded all my expectations.', 12, 17),
(224, 4, 'This product offers great value for the price. It\'s reliable and performs well.', 13, 17),
(225, 3, 'I have mixed feelings about this product. It has some flaws that need improvement.', 14, 17),
(226, 5, 'Outstanding product! It has greatly improved my productivity and efficiency.', 15, 17),
(227, 2, 'I\'m not satisfied with this product. It didn\'t meet my expectations.', 16, 18),
(228, 4, 'I\'m really impressed with this product! It\'s well-designed and offers excellent performance.', 17, 18),
(229, 3, 'Decent product, but it could use some enhancements in terms of features and usability.', 18, 18),
(230, 4, 'I\'m amazed by the quality of this product. It\'s durable and built to last.', 19, 18),
(231, 2, 'I regret buying this product. It has too many flaws and lacks reliability.', 1, 18),
(232, 5, 'I\'m extremely satisfied with this product. It\'s a worthwhile investment.', 9, 20),
(234, 1, 'terrible', 13, 9);

-- --------------------------------------------------------

--
-- Struttura della tabella `sales`
--

CREATE TABLE `sales` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `sales_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `sales`
--

INSERT INTO `sales` (`id`, `user_id`, `sales_date`) VALUES
(11, 13, '2023-05-08'),
(12, 18, '2023-05-08'),
(13, 13, '2023-05-08'),
(14, 9, '2023-05-10'),
(15, 13, '2023-05-11'),
(16, 13, '2023-05-11'),
(17, 12, '2023-05-11'),
(18, 13, '2023-05-11'),
(19, 13, '2023-05-11'),
(20, 17, '2023-05-11'),
(21, 13, '2023-05-11'),
(22, 15, '2023-05-11');

-- --------------------------------------------------------

--
-- Struttura della tabella `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(60) NOT NULL,
  `type` int NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `photo` varchar(200) NOT NULL,
  `created_on` date NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dump dei dati per la tabella `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `type`, `firstname`, `lastname`, `photo`, `created_on`, `active`) VALUES
(1, 'admin@admin.com', '$2y$10$0SHFfoWzz8WZpdu9Qw//E.tWamILbiNCX7bqhy3od0gvK5.kSJ8N2', 1, 'Code', 'Projects', '', '2023-05-07', 1),
(9, 'harry@den.com', '$2y$10$Oongyx.Rv0Y/vbHGOxywl.qf18bXFiZOcEaI4ZpRRLzFNGKAhObSC', 0, 'Harry', 'Den', '', '2023-05-07', 1),
(12, 'christine@gmail.com', '$2y$10$ozW4c8r313YiBsf7HD7m6egZwpvoE983IHfZsPRxrO1hWXfPRpxHO', 0, 'Christine', 'becker', '', '2023-05-07', 1),
(13, 'dani.grimaldi2004@gmail.com', '$2y$10$fBW9pJQ5yK6z9f8DaxWkOe.tomKbS5itADfkEf4VjpYdkOvvr34ja', 0, 'DANIELE', 'GRIMALDI', '', '2023-05-07', 1),
(14, 'pietro.grimaldi@atm.it', '$2y$10$qarDIMaaKsm2WDFuJHhLEufp6yD.3zuAtfGKT4LwaG.6Y5xLuxHym', 0, 'PIETRO', 'GRIMALDI', '', '2023-05-07', 1),
(15, 'carl.mark@com.it', '$2y$10$vHxt.FYdDx7yEITb/ei6NuoqC/5i0P1wzfCwLx9pXYg0ua/9fTtZ2', 0, 'CARL', 'MARK', '', '2023-05-07', 1),
(16, 'giulio.cesare@gmail.com', '$2y$10$TvjQLzSThPZ8wffMkZ2e1OhRMl.WBsHtea9Cn0r6Hk1jgSAmKYVP.', 0, 'GIULIO', 'CESARE', '', '2023-05-07', 1),
(17, 'turbato.thomas@com.comi', '$2y$10$GePUpTgtokZNt/5P9suHNe54Y97X.4u8dDzLZYTrIS96uk4cSZCLS', 0, 'THOMAS', 'TURBATO', '', '2023-05-07', 1),
(18, 'frank@gmail.com', '$2y$10$1mL.jdEGDrhPP59CBRd/CuhSYmSBgciHcyHHTNFk.K3p4IOXVCGHq', 0, 'FRANK', 'BHO', '', '2023-05-08', 1),
(19, 'Julia@gmail.com', '$2y$10$1ZTqKO3zjHtriOcg5vk24u7tPJa.e0lE0BTJ62HNCok1Kix.HVxqG', 0, 'JULIA', 'ROBERTS', '', '2023-05-09', 1);

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk1` (`product_id`),
  ADD KEY `fk2` (`user_id`);

--
-- Indici per le tabelle `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `details`
--
ALTER TABLE `details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk4` (`product_id`),
  ADD KEY `fk5` (`sales_id`);

--
-- Indici per le tabelle `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk3` (`category_id`);

--
-- Indici per le tabelle `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk7` (`product_id`),
  ADD KEY `fk8` (`user_id`);

--
-- Indici per le tabelle `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk6` (`user_id`);

--
-- Indici per le tabelle `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT per la tabella `category`
--
ALTER TABLE `category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT per la tabella `details`
--
ALTER TABLE `details`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT per la tabella `products`
--
ALTER TABLE `products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT per la tabella `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=235;

--
-- AUTO_INCREMENT per la tabella `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT per la tabella `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `fk1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `details`
--
ALTER TABLE `details`
  ADD CONSTRAINT `fk4` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk5` FOREIGN KEY (`sales_id`) REFERENCES `sales` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk3` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

--
-- Limiti per la tabella `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `fk7` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk8` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `fk6` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
