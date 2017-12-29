-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 29, 2017 at 08:45 PM
-- Server version: 5.6.24
-- PHP Version: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `foodstore`
--

-- --------------------------------------------------------

--
-- Table structure for table `abs_settings`
--

CREATE TABLE IF NOT EXISTS `abs_settings` (
  `id` int(11) NOT NULL,
  `config_type` varchar(256) NOT NULL,
  `config_val` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `abs_settings`
--

INSERT INTO `abs_settings` (`id`, `config_type`, `config_val`) VALUES
(1, 'admin_email', 'proitplus@proitplus.com'),
(2, 'facebook_link', 'https://www.facebook.com'),
(3, 'twitter_link', 'http://twitter.com'),
(6, 'youtube_link', 'http://youtube.com'),
(17, 'googleplus_link', 'http://google.com'),
(22, 'linkedin_link', 'http://linkedin.com'),
(23, 'contact_email', ''),
(24, 'corporate_office_address', ''),
(25, 'contact_no_1', ''),
(26, 'contact_no_2', ''),
(27, 'product_bigthmb_width', ''),
(28, 'product_bigthmb_height', ''),
(29, 'product_smallthmb_width', ''),
(30, 'product_smallthmb_height', ''),
(31, 'banner_width', ''),
(32, 'banner_height', ''),
(33, 'additionalbanner_width', ''),
(34, 'additionalbanner_height', ''),
(35, 'landline_no', ''),
(36, 'slogan', '');

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

CREATE TABLE IF NOT EXISTS `ci_sessions` (
  `session_id` varchar(40) NOT NULL DEFAULT '0',
  `ip_address` varchar(45) NOT NULL DEFAULT '0',
  `user_agent` varchar(120) NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ci_sessions`
--

INSERT INTO `ci_sessions` (`session_id`, `ip_address`, `user_agent`, `last_activity`, `user_data`) VALUES
('3612462e85590814b2038ad0c1f0f726', '::1', 'Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.101 Safari/537.36', 1503739125, 'a:5:{s:9:"user_data";s:0:"";s:2:"id";s:1:"1";s:8:"username";s:4:"food";s:14:"is_admin_login";b:1;s:9:"user_type";s:2:"SA";}');

-- --------------------------------------------------------

--
-- Table structure for table `foodstore_addtocompare`
--

CREATE TABLE IF NOT EXISTS `foodstore_addtocompare` (
  `id` int(10) NOT NULL,
  `prd_id` int(10) NOT NULL,
  `prd_name` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `session_id` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `foodstore_addtocompare`
--

INSERT INTO `foodstore_addtocompare` (`id`, `prd_id`, `prd_name`, `date`, `session_id`) VALUES
(1, 7, '', '2017-01-03', 'm1wVy3sb'),
(2, 8, '', '2017-01-05', '2YLLeCrM'),
(3, 7, '', '2017-01-05', '2YLLeCrM'),
(4, 9, '', '2017-01-05', '2YLLeCrM'),
(5, 6, '', '2017-01-05', '2YLLeCrM'),
(6, 6, '', '2017-01-06', '0Gm6EeRV');

-- --------------------------------------------------------

--
-- Table structure for table `foodstore_banner`
--

CREATE TABLE IF NOT EXISTS `foodstore_banner` (
  `id` int(11) NOT NULL,
  `b_name` varchar(255) NOT NULL,
  `b_alt` varchar(255) NOT NULL,
  `b_path` varchar(255) NOT NULL,
  `b_thumb` varchar(255) NOT NULL,
  `status` enum('A','IA') NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `foodstore_banner`
--

INSERT INTO `foodstore_banner` (`id`, `b_name`, `b_alt`, `b_path`, `b_thumb`, `status`) VALUES
(4, 'food', 'banner 2', 'upload/banner_image/8c2200c2bd899dc8c911d0935210bb0f.jpg', 'upload/banner_image/thumb/8c2200c2bd899dc8c911d0935210bb0f_thumb.jpg', 'A'),
(5, 'food', 'banner 1', 'upload/banner_image/0e3b04292b350f0b34f6f61682069212.jpg', 'upload/banner_image/thumb/0e3b04292b350f0b34f6f61682069212_thumb.jpg', 'A'),
(6, 'Banner3', 'Banner3', 'upload/banner_image/acbbac3ad0de6ed3a0e2a61e0ef1aaf4.jpg', 'upload/banner_image/thumb/acbbac3ad0de6ed3a0e2a61e0ef1aaf4_thumb.jpg', 'A');

-- --------------------------------------------------------

--
-- Table structure for table `foodstore_blog`
--

CREATE TABLE IF NOT EXISTS `foodstore_blog` (
  `blog_id` int(11) NOT NULL,
  `blog_title` varchar(255) NOT NULL,
  `blog_url` varchar(255) NOT NULL,
  `blog_image` varchar(255) NOT NULL,
  `blog_cat` int(11) NOT NULL,
  `blog_author` varchar(255) NOT NULL,
  `blog_desc` text NOT NULL,
  `blog_publish` varchar(255) NOT NULL,
  `blog_img_thumb` varchar(255) NOT NULL,
  `put_it_archive` enum('Y','N') NOT NULL DEFAULT 'N',
  `b_status` enum('A','IA') NOT NULL DEFAULT 'IA'
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `foodstore_blog`
--

INSERT INTO `foodstore_blog` (`blog_id`, `blog_title`, `blog_url`, `blog_image`, `blog_cat`, `blog_author`, `blog_desc`, `blog_publish`, `blog_img_thumb`, `put_it_archive`, `b_status`) VALUES
(4, 'how to do eyewear right', 'how-to-do-eyewear-right', 'upload/blog_images/8de1e812b074e0323a943f46c762dc3b.png', 3, 'admin', '<p>&nbsp;This is a designer embroidered cushion cover with aari stitch pattern at the centre, which has brown/red border and plain white/cream base at the centre. These cushion covers also has a thin layer of foam pad stitch to it with a zip opening at the back.</p>\r\n<p>&nbsp;This is a designer embroidered cushion cover with aari stitch pattern at the centre, which has brown/red border and plain white/cream base at the centre. These cushion covers also has a thin layer of foam pad stitch to it with a zip opening at the back.</p>\r\n<p>&nbsp;This is a designer embroidered cushion cover with aari stitch pattern at the centre, which has brown/red border and plain white/cream base at the centre. These cushion covers also has a thin layer of foam pad stitch to it with a zip opening at the back.</p>', '2017-05-18', 'upload/blog_images/thumb/8de1e812b074e0323a943f46c762dc3b_thumb.png', 'N', 'A'),
(5, 'Marble frames would rock this summer', 'marble-frames-would-rock-this-summer', 'upload/blog_images/a2090adc59e1833428ce59f7095adc6c.jpg', 1, 'admin', '<p>&nbsp;This is a designer embroidered cushion cover with aari stitch pattern at the centre, which has brown/red border and plain white/cream base at the centre. These cushion covers also has a thin layer of foam pad stitch to it with a zip opening at the back.&nbsp;This is a designer embroidered cushion cover with aari stitch pattern at the centre, which has brown/red border and plain white/cream base at the centre. These cushion covers also has a thin layer of foam pad stitch to it with a zip opening at the back.&nbsp;This is a designer embroidered cushion cover with aari stitch pattern at the centre, which has brown/red border and plain white/cream base at the centre. These cushion covers also has a thin layer of foam pad stitch to it with a zip opening at the back.&nbsp;This is a designer embroidered cushion cover with aari stitch pattern at the centre, which has brown/red border and plain white/cream base at the centre. These cushion covers also has a thin layer of foam pad stitch to it with a zip opening at the back.&nbsp;This is a designer embroidered cushion cover with aari stitch pattern at the centre, which has brown/red border and plain white/cream base at the centre. These cushion covers also has a thin layer of foam pad stitch to it with a zip opening at the back.</p>', '2017-05-18', 'upload/blog_images/thumb/a2090adc59e1833428ce59f7095adc6c_thumb.jpg', 'N', ''),
(6, 'Oh Snap! These ‘Spectacles’ are ridiculously fun', 'oh-snap-these-spectacles-are-ridiculously-fun', 'upload/blog_images/dde0dd4be5e0363803bbda34de6eb713.jpg', 3, 'admin', '<p>&nbsp;This is a designer embroidered cushion cover with aari stitch pattern at the centre, which has brown/red border and plain white/cream base at the centre. These cushion covers also has a thin layer of foam pad stitch to it with a zip opening at the back.&nbsp;This is a designer embroidered cushion cover with aari stitch pattern at the centre, which has brown/red border and plain white/cream base at the centre. These cushion covers also has a thin layer of foam pad stitch to it with a zip opening at the back.&nbsp;This is a designer embroidered cushion cover with aari stitch pattern at the centre, which has brown/red border and plain white/cream base at the centre. These cushion covers also has a thin layer of foam pad stitch to it with a zip opening at the back.&nbsp;This is a designer embroidered cushion cover with aari stitch pattern at the centre, which has brown/red border and plain white/cream base at the centre. These cushion covers also has a thin layer of foam pad stitch to it with a zip opening at the back.&nbsp;This is a designer embroidered cushion cover with aari stitch pattern at the centre, which has brown/red border and plain white/cream base at the centre. These cushion covers also has a thin layer of foam pad stitch to it with a zip opening at the back.&nbsp;This is a designer embroidered cushion cover with aari stitch pattern at the centre, which has brown/red border and plain white/cream base at the centre. These cushion covers also has a thin layer of foam pad stitch to it with a zip opening at the back.&nbsp;This is a designer embroidered cushion cover with aari stitch pattern at the centre, which has brown/red border and plain white/cream base at the centre. These cushion covers also has a thin layer of foam pad stitch to it with a zip opening at the back.</p>', '2017-05-18', 'upload/blog_images/thumb/dde0dd4be5e0363803bbda34de6eb713_thumb.jpg', 'N', '');

-- --------------------------------------------------------

--
-- Table structure for table `foodstore_blog_category`
--

CREATE TABLE IF NOT EXISTS `foodstore_blog_category` (
  `b_catid` int(11) NOT NULL,
  `b_catname` varchar(255) NOT NULL,
  `b_caturl` varchar(255) NOT NULL,
  `b_catstatus` enum('A','IA') NOT NULL DEFAULT 'A'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `foodstore_blog_category`
--

INSERT INTO `foodstore_blog_category` (`b_catid`, `b_catname`, `b_caturl`, `b_catstatus`) VALUES
(1, 'Eyeglass', 'eyeglass', 'A'),
(3, 'Sunglass', 'sunglass', 'A');

-- --------------------------------------------------------

--
-- Table structure for table `foodstore_blog_comment`
--

CREATE TABLE IF NOT EXISTS `foodstore_blog_comment` (
  `comment_id` int(11) NOT NULL,
  `blog_id` int(11) NOT NULL,
  `c_email` varchar(255) NOT NULL,
  `c_name` varchar(255) NOT NULL,
  `comment` text NOT NULL,
  `com_stattus` enum('A','IA') NOT NULL DEFAULT 'IA',
  `date` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `foodstore_category`
--

CREATE TABLE IF NOT EXISTS `foodstore_category` (
  `cat_id` int(11) NOT NULL,
  `cat_name` varchar(255) NOT NULL,
  `cat_short_des` text NOT NULL,
  `cat_url` varchar(255) NOT NULL,
  `cat_img` varchar(255) NOT NULL,
  `cat_thumb` varchar(255) NOT NULL,
  `cat_status` enum('A','IA') NOT NULL DEFAULT 'A'
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `foodstore_category`
--

INSERT INTO `foodstore_category` (`cat_id`, `cat_name`, `cat_short_des`, `cat_url`, `cat_img`, `cat_thumb`, `cat_status`) VALUES
(2, 'Contact Lences', '', 'contact-lences', 'upload/category_image/f66c28d9c4509f9d0ff56dd6afdb0b9e.png', 'upload/category_image/thumb/f66c28d9c4509f9d0ff56dd6afdb0b9e_thumb.png', 'A'),
(3, 'Women Sunglasses', '', 'women-sunglasses', 'upload/category_image/b63189192e41899eaf5999e5bcf49037.png', 'upload/category_image/thumb/b63189192e41899eaf5999e5bcf49037_thumb.png', 'A'),
(4, 'Kids Sunglass', '', 'kids-sunglass', 'upload/category_image/d71fd7ba18a0be47817ce24afd6a696c.jpg', 'upload/category_image/thumb/d71fd7ba18a0be47817ce24afd6a696c_thumb.jpg', 'A'),
(5, 'Eyeglasses', '', 'eyeglasses', 'upload/category_image/99e91c90cafef0d6bbfd078dccd61930.jpg', 'upload/category_image/thumb/99e91c90cafef0d6bbfd078dccd61930_thumb.jpg', 'A'),
(6, 'Accessories', '', 'accessories', 'upload/category_image/9bd0adbc9bccc128c52d43f3ee1dd06a.jpg', 'upload/category_image/thumb/9bd0adbc9bccc128c52d43f3ee1dd06a_thumb.jpg', 'A'),
(7, 'Men Sunglasses', '', 'men-sunglasses', 'upload/category_image/b08493657ac2d015215454072bd87f32.jpg', 'upload/category_image/thumb/b08493657ac2d015215454072bd87f32_thumb.jpg', 'A');

-- --------------------------------------------------------

--
-- Table structure for table `foodstore_cms`
--

CREATE TABLE IF NOT EXISTS `foodstore_cms` (
  `id` int(11) NOT NULL,
  `cms_pagetitle` varchar(256) NOT NULL,
  `cms_description` text NOT NULL,
  `status` enum('A','IA') NOT NULL DEFAULT 'A'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `foodstore_cms`
--

INSERT INTO `foodstore_cms` (`id`, `cms_pagetitle`, `cms_description`, `status`) VALUES
(1, 'About us', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'IA'),
(2, 'Privacy Policy', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'A');

-- --------------------------------------------------------

--
-- Table structure for table `foodstore_feedback`
--

CREATE TABLE IF NOT EXISTS `foodstore_feedback` (
  `id` int(10) NOT NULL,
  `title` varchar(255) NOT NULL,
  `category_id` int(10) NOT NULL,
  `client_name` varchar(255) NOT NULL,
  `product_id` int(10) NOT NULL,
  `date` date NOT NULL,
  `rating` int(5) NOT NULL,
  `review_summary` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `foodstore_feedback`
--

INSERT INTO `foodstore_feedback` (`id`, `title`, `category_id`, `client_name`, `product_id`, `date`, `rating`, `review_summary`, `description`, `status`) VALUES
(7, '', 0, 'Tapan', 11, '2017-01-16', 10, 'kjyjhgkj', '', ''),
(8, '', 0, 'test', 16, '2017-01-17', 50, 'ffff', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `foodstore_mywishlist`
--

CREATE TABLE IF NOT EXISTS `foodstore_mywishlist` (
  `id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `prod_id` int(10) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `foodstore_mywishlist`
--

INSERT INTO `foodstore_mywishlist` (`id`, `user_id`, `prod_id`) VALUES
(8, 19, 1),
(10, 17, 16),
(11, 17, 10),
(12, 18, 15);

-- --------------------------------------------------------

--
-- Table structure for table `foodstore_newslettersubscriber`
--

CREATE TABLE IF NOT EXISTS `foodstore_newslettersubscriber` (
  `subs_id` int(11) NOT NULL,
  `subs_email` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `foodstore_newslettersubscriber`
--

INSERT INTO `foodstore_newslettersubscriber` (`subs_id`, `subs_email`) VALUES
(1, 'test@test.com');

-- --------------------------------------------------------

--
-- Table structure for table `foodstore_orderfinal`
--

CREATE TABLE IF NOT EXISTS `foodstore_orderfinal` (
  `id` int(10) NOT NULL,
  `order_id` varchar(255) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `tax_invoice_no` varchar(255) NOT NULL,
  `prd_id` int(5) NOT NULL,
  `prd_type` varchar(255) NOT NULL,
  `prd_name` varchar(255) NOT NULL,
  `per_item_price` float(10,2) NOT NULL,
  `quantity` int(5) NOT NULL,
  `tot_price` float(10,2) NOT NULL,
  `date` date NOT NULL,
  `size` varchar(255) NOT NULL,
  `media` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `frame_id` int(10) NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `foodstore_orderfinal`
--

INSERT INTO `foodstore_orderfinal` (`id`, `order_id`, `user_id`, `tax_invoice_no`, `prd_id`, `prd_type`, `prd_name`, `per_item_price`, `quantity`, `tot_price`, `date`, `size`, `media`, `image`, `frame_id`, `status`) VALUES
(8, '3BM95375PM246632D', '19', '43452996', 16, '3', 'OSH Combo of Premium California Almond Kernel 250 Gms', 60.99, 1, 60.99, '2017-01-13', '', '', 'upload/product_image/gallery/thumb/94bc95c5988e739d28644beb7dc19164_thumb.jpg', 0, 'Completed'),
(9, '3BM95375PM246632D', '19', '43452996', 15, '4', 'OOSH California Walnut Kernel Halves 200 Gms', 50.00, 1, 50.00, '2017-01-13', '', '', 'upload/product_image/gallery/thumb/605e14c97ed2d4e4e32ab6125cba859f_thumb.jpg', 0, 'Completed');

-- --------------------------------------------------------

--
-- Table structure for table `foodstore_ordertemp`
--

CREATE TABLE IF NOT EXISTS `foodstore_ordertemp` (
  `id` int(10) NOT NULL,
  `order_id` varchar(255) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `prd_id` int(5) NOT NULL,
  `prd_type` varchar(255) NOT NULL,
  `cat_id` int(5) NOT NULL,
  `sub_cat_id` int(5) NOT NULL,
  `prd_name` varchar(255) NOT NULL,
  `per_item_price` float(10,2) NOT NULL,
  `quantity` int(5) NOT NULL,
  `tot_price` float(10,2) NOT NULL,
  `date` date NOT NULL,
  `size` varchar(255) NOT NULL,
  `media` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `frame_id` int(10) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `foodstore_ordertemp`
--

INSERT INTO `foodstore_ordertemp` (`id`, `order_id`, `user_id`, `prd_id`, `prd_type`, `cat_id`, `sub_cat_id`, `prd_name`, `per_item_price`, `quantity`, `tot_price`, `date`, `size`, `media`, `image`, `frame_id`) VALUES
(72, 'Le0Eo3Sr', '', 17, '', 2, 0, 'OOSH Black Raisin Afgani 500 Gms', 66.00, 1, 66.00, '0000-00-00', '', '', 'upload/product_image/gallery/thumb/ae308560f9e57c41dcdbd11b13b821ff_thumb.jpg', 0),
(73, 'Le0Eo3Sr', '', 16, '', 3, 0, 'OSH Combo of Premium California Almond Kernel 250 Gms', 60.99, 1, 60.99, '0000-00-00', '', '', 'upload/product_image/gallery/thumb/94bc95c5988e739d28644beb7dc19164_thumb.jpg', 0),
(74, 'POVEh0ct', '', 17, '', 2, 0, 'OOSH Black Raisin Afgani 500 Gms', 66.00, 1, 66.00, '0000-00-00', '', '', 'upload/product_image/gallery/thumb/ae308560f9e57c41dcdbd11b13b821ff_thumb.jpg', 0),
(75, '4cQD8rj9', '', 16, '', 3, 0, 'OSH Combo of Premium California Almond Kernel 250 Gms', 60.99, 1, 60.99, '0000-00-00', '', '', 'upload/product_image/gallery/thumb/94bc95c5988e739d28644beb7dc19164_thumb.jpg', 0),
(76, 'BpLMlpWz', '', 16, '', 3, 0, 'Mask sand & sun ms s10699 grey transparent blue green mirror c2 women sunglasses', 350.00, 1, 350.00, '0000-00-00', '', '', 'upload/product_image/gallery/thumb/c48c603321974025b02ba2314518536c_thumb.jpg', 0);

-- --------------------------------------------------------

--
-- Table structure for table `foodstore_orderuserinfo`
--

CREATE TABLE IF NOT EXISTS `foodstore_orderuserinfo` (
  `id` int(10) NOT NULL,
  `order_id` varchar(100) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `bl_name` varchar(255) NOT NULL,
  `bl_email` varchar(255) NOT NULL,
  `bl_phone` varchar(255) NOT NULL,
  `bl_address` varchar(255) NOT NULL,
  `bl_state` varchar(255) NOT NULL,
  `bl_city` varchar(255) NOT NULL,
  `bl_zip` varchar(255) NOT NULL,
  `bl_country` varchar(255) NOT NULL,
  `sp_name` varchar(255) NOT NULL,
  `sp_email` varchar(255) NOT NULL,
  `sp_phone` varchar(255) NOT NULL,
  `sp_address` varchar(255) NOT NULL,
  `shipping_landmark` varchar(255) NOT NULL,
  `sp_state` varchar(255) NOT NULL,
  `sp_city` varchar(255) NOT NULL,
  `sp_zip` varchar(255) NOT NULL,
  `sp_country` varchar(255) NOT NULL,
  `delivery_notes` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `foodstore_orderuserinfo`
--

INSERT INTO `foodstore_orderuserinfo` (`id`, `order_id`, `user_id`, `bl_name`, `bl_email`, `bl_phone`, `bl_address`, `bl_state`, `bl_city`, `bl_zip`, `bl_country`, `sp_name`, `sp_email`, `sp_phone`, `sp_address`, `shipping_landmark`, `sp_state`, `sp_city`, `sp_zip`, `sp_country`, `delivery_notes`) VALUES
(10, '3BM95375PM246632D', '19', 'avishek dului', 'tapan.jrtechnologies@gmail.com', '7890456123', 'Bhawanipur, Kolkata, West Bengal, India', 'West Bengal', 'Kolkata', '712139', 'India', 'avishek dului', 'tapan.jrtechnologies@gmail.com', '7890456123', 'Bhawanipur, Kolkata, West Bengal, India', 'ner bokshi goli', 'West Bengal', 'Kolkata', '712139', 'India', '');

-- --------------------------------------------------------

--
-- Table structure for table `foodstore_product`
--

CREATE TABLE IF NOT EXISTS `foodstore_product` (
  `p_id` int(11) NOT NULL,
  `p_cat` int(11) NOT NULL,
  `available_for` varchar(25) DEFAULT NULL COMMENT '''M''=>''Men'' ,''W''=>''Women'' ,''K''=>''Kids''',
  `lens_free` enum('y','n') NOT NULL COMMENT '''y''=>''Yes'' ,''n''=>''no''',
  `p_name` varchar(255) NOT NULL,
  `size` enum('s','m','l') NOT NULL DEFAULT 'm' COMMENT '''s''=>''small'' ,''m''=>''medium'' ,''l''=>''large''',
  `pro_id` varchar(255) NOT NULL,
  `p_url` varchar(255) NOT NULL,
  `reg_price` float NOT NULL,
  `sale_price` float NOT NULL,
  `cod_available` enum('y','n') NOT NULL DEFAULT 'n',
  `p_image` varchar(255) NOT NULL,
  `p_image_cat` varchar(255) NOT NULL,
  `p_image_gallery` varchar(255) NOT NULL,
  `p_image_thumb_gallery` varchar(255) NOT NULL,
  `p_img_thumb_hot` varchar(255) NOT NULL,
  `p_feture_thumb` varchar(255) NOT NULL,
  `p_shortdesc` text NOT NULL,
  `description` text NOT NULL,
  `nutrition_details` text NOT NULL,
  `quantity` int(11) NOT NULL,
  `stock` enum('A','NA') DEFAULT 'A' COMMENT '''A''->''Available'' , ''NA''->''Not Available''',
  `featured_product` enum('Y','N') NOT NULL DEFAULT 'N',
  `hot_product` enum('Y','N') NOT NULL DEFAULT 'N',
  `date_of_uploaded` varchar(255) NOT NULL,
  `date_of_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `meta_title` text NOT NULL,
  `meta_description` text NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  `other_seo` varchar(255) NOT NULL,
  `p_stat` enum('A','IA') NOT NULL DEFAULT 'A'
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `foodstore_product`
--

INSERT INTO `foodstore_product` (`p_id`, `p_cat`, `available_for`, `lens_free`, `p_name`, `size`, `pro_id`, `p_url`, `reg_price`, `sale_price`, `cod_available`, `p_image`, `p_image_cat`, `p_image_gallery`, `p_image_thumb_gallery`, `p_img_thumb_hot`, `p_feture_thumb`, `p_shortdesc`, `description`, `nutrition_details`, `quantity`, `stock`, `featured_product`, `hot_product`, `date_of_uploaded`, `date_of_modified`, `meta_title`, `meta_description`, `meta_keyword`, `other_seo`, `p_stat`) VALUES
(10, 5, NULL, 'y', 'Oakley', 'm', '', 'oakley', 5790, 0, 'n', 'upload/product_image/9f4d37919aea348ce5525429f496bf4f.jpg', 'upload/product_image/category/9f4d37919aea348ce5525429f496bf4f_thumb.jpg', 'upload/product_image/gallery/9f4d37919aea348ce5525429f496bf4f_thumb.jpg', 'upload/product_image/gallery/thumb/9f4d37919aea348ce5525429f496bf4f_thumb.jpg', 'upload/product_image/hot/9f4d37919aea348ce5525429f496bf4f_thumb.jpg', 'upload/product_image/featured/9f4d37919aea348ce5525429f496bf4f_thumb.jpg', '<p>OX1100 Crosslink Pitch Size:51 O2 Black Silver Eyeglasses</p>', '<div class="std">Oakley OX1100 Crosslink Pitch Size:51 O2 Black Silver Eyeglasses</div>\r\n<p>Oakley OX1100 Size:51 O2 Black Silver Eyeglasses</p>', '', 50, 'A', 'Y', 'Y', '2017-05-18', '2017-01-12 22:44:56', '', '', '', '', 'A'),
(11, 6, NULL, 'y', 'Aqualens  Antifog Lens Cleaner 50 ml', 'm', '', 'aqualens--antifog-lens-cleaner', 200, 115, 'n', 'upload/product_image/ee81fa0780f97101d31c3a09cb9ac338.jpg', 'upload/product_image/category/ee81fa0780f97101d31c3a09cb9ac338_thumb.jpg', 'upload/product_image/gallery/ee81fa0780f97101d31c3a09cb9ac338_thumb.jpg', 'upload/product_image/gallery/thumb/ee81fa0780f97101d31c3a09cb9ac338_thumb.jpg', 'upload/product_image/hot/ee81fa0780f97101d31c3a09cb9ac338_thumb.jpg', 'upload/product_image/featured/ee81fa0780f97101d31c3a09cb9ac338_thumb.jpg', '<p>Aqualens Antifog Lens Cleaner 50 ml</p>', '<p class="f13">Aqualens Antifog Lens Cleaner 50 ml</p>\r\n<p style="width: 100%; word-wrap: break-word;">&nbsp;</p>\r\n<p style="width: 100%; word-wrap: break-word;"><strong>Aqualens Antifog Lens Cleaner</strong></p>\r\n<p>Instant shift in the temperature is one of the biggest reasons behind fogging. May it be during rains or travelling to higher altitudes or simply entering a room after a long walk; fogging is a common phenomenon that occurs every now and then. It is also a constant distraction and source of irritation for the ones with glasses. Not only does it hinder the visibility extremely but can even result in serious consequences.</p>\r\n<p>&nbsp;</p>\r\n<p><strong>Aqualens Antifog Lens Cleaner</strong>not only protects eyeglass lenses from fogging but does it a very effectively manner -</p>\r\n<p>&nbsp;</p>\r\n<p><strong>DEFOGS INSTANTLY: </strong>The spray instantly defogs your lenses and leaves them with a clean finish that stays on for many hours.</p>\r\n<p>&nbsp;</p>\r\n<p><strong>ANTI-FOG formula with Nano Technology: </strong>Aqualens Antifog Lens Cleaner is made with a very specific formula. Its de-fogging power not only lasts long but gives you a streak free finish.</p>\r\n<p>&nbsp;</p>', '', 30, 'A', 'Y', 'Y', '2017-05-18', '2017-01-12 22:53:42', '', '', '', '', 'A'),
(12, 6, NULL, 'y', 'Screw Driver for Eyewear Adjustment', 'm', '', 'screw-driver-for-eyewear-adjustment', 299, 99, 'n', 'upload/product_image/f6cee217c7f47333d69ded5fb8460041.jpg', 'upload/product_image/category/f6cee217c7f47333d69ded5fb8460041_thumb.jpg', 'upload/product_image/gallery/f6cee217c7f47333d69ded5fb8460041_thumb.jpg', 'upload/product_image/gallery/thumb/f6cee217c7f47333d69ded5fb8460041_thumb.jpg', 'upload/product_image/hot/f6cee217c7f47333d69ded5fb8460041_thumb.jpg', 'upload/product_image/featured/f6cee217c7f47333d69ded5fb8460041_thumb.jpg', '<p class="f13">Screw Driver for Eyewear Adjustment</p>\r\n<p style="width: 100%; word-wrap: break-word;">&nbsp;</p>', '<p>Screw Driver for Eyewear Adjustment</p>', '', 60, 'A', 'Y', 'Y', '2017-05-18', '2017-01-12 22:57:32', '', '', '', '', 'A'),
(13, 4, NULL, 'y', 'Vincent Chase', 'm', '', '-vincent-chase', 500, 0, 'n', 'upload/product_image/5ca7d748114608799ac93965bac746ac.jpg', 'upload/product_image/category/5ca7d748114608799ac93965bac746ac_thumb.jpg', 'upload/product_image/gallery/5ca7d748114608799ac93965bac746ac_thumb.jpg', 'upload/product_image/gallery/thumb/5ca7d748114608799ac93965bac746ac_thumb.jpg', 'upload/product_image/hot/5ca7d748114608799ac93965bac746ac_thumb.jpg', 'upload/product_image/featured/5ca7d748114608799ac93965bac746ac_thumb.jpg', '<p>&nbsp;Matte Red Grey Wayfarer Sunglasses Rockstars VC S10741 - C2</p>', '<p class="f13">Matte Red Grey Wayfarer Sunglasses Vincent Chase Rockstars VC S10741 - C2</p>\r\n<p style="width: 100%; word-wrap: break-word;">&nbsp;Matte Red Grey Wayfarer Sunglasses Vincent Chase Rockstars VC S10741 - C2</p>', '', 100, 'A', 'Y', 'Y', '2017-05-18', '2017-01-12 23:00:31', '', '', '', '', 'A'),
(14, 2, NULL, 'y', 'Aqualens ( Comfort Contact Lens Solution 180 ML)', 'm', '', 'aqualens-(-comfort-contact-lens-solution-180-ml)', 250, 198, 'n', 'upload/product_image/91f1623d503165e30146eec44b45d97f.jpg', 'upload/product_image/category/91f1623d503165e30146eec44b45d97f_thumb.jpg', 'upload/product_image/gallery/91f1623d503165e30146eec44b45d97f_thumb.jpg', 'upload/product_image/gallery/thumb/91f1623d503165e30146eec44b45d97f_thumb.jpg', 'upload/product_image/hot/91f1623d503165e30146eec44b45d97f_thumb.jpg', 'upload/product_image/featured/91f1623d503165e30146eec44b45d97f_thumb.jpg', '<p>AQUALENS COMFORT SOLUTION is a multipurpose solution for cleaning, Rinsing, Disinfecting, lubricating, Double Moisturising and stores soft contact lenses. AQUALENS COMFORT SOLUTION is also indicated for daily protein removal from lenses. AQUALENS COMFORT SOLUTION multi purpose solution is a combination of Special agents , that cleans lenses better , removes protein more effectively , makes lenses germ free and keep them double moist so that they are more comfortable on eye. pH and isotonicity are adjusted to lacrimal fluid</p>\r\n<p>&nbsp;</p>', '<p class="f13">Aqualens Comfort Contact Lens Solution 180 ML</p>\r\n<p style="width: 100%; word-wrap: break-word;">&nbsp;</p>\r\n<p style="width: 100%; word-wrap: break-word;">&nbsp;</p>\r\n<p>AQUALENS COMFORT SOLUTION is a multipurpose solution for cleaning, Rinsing, Disinfecting, lubricating, Double Moisturising and stores soft contact lenses. AQUALENS COMFORT SOLUTION is also indicated for daily protein removal from lenses. AQUALENS COMFORT SOLUTION multi purpose solution is a combination of Special agents , that cleans lenses better , removes protein more effectively , makes lenses germ free and keep them double moist so that they are more comfortable on eye. pH and isotonicity are adjusted to lacrimal fluid</p>\r\n<h3>Aqua Seal /Double Moisturizing effect :</h3>\r\n<p>Sodium Hyaluronate with HPMC forms a lubricating shield on the lens. Keeps in moisture, lubricate and coats the surface of lens which conditions lens and seals in moisture and slowly releases it through - out the day.</p>\r\n<p>1.Locks in moisture and retains it in dry environments. <br /> 2.Fights lens dehydration due to pollution &amp; varying environmental conditions <br /> 3.Protects from moisture loss all day long <br /> 4.Formulated for patients with dry and sensitive eyes. <br /> 5.Ideal solution for patients that find lenses dry out at the end of the day</p>', '', 50, 'A', 'Y', 'Y', '2017-05-18', '2017-01-12 23:04:50', '', '', '', '', 'A'),
(15, 5, NULL, 'y', 'Black Rectangle Eyeglasses Vagabond VC E10620 - C1', 'm', '', 'black-rectangle-eyeglasses-vagabond-vc-e10620-c1', 500, 400, 'n', 'upload/product_image/de73c60c9d8032ae553747b59bc44f9a.jpg', 'upload/product_image/category/de73c60c9d8032ae553747b59bc44f9a_thumb.jpg', 'upload/product_image/gallery/de73c60c9d8032ae553747b59bc44f9a_thumb.jpg', 'upload/product_image/gallery/thumb/de73c60c9d8032ae553747b59bc44f9a_thumb.jpg', 'upload/product_image/hot/de73c60c9d8032ae553747b59bc44f9a_thumb.jpg', 'upload/product_image/featured/de73c60c9d8032ae553747b59bc44f9a_thumb.jpg', '<div id="product_tabs_description_contents" class="product-tabs-content" style="display: block;">\r\n<div class="std">Black Rectangle Eyeglasses Vincent Chase Vagabond VC E10620 - C1</div>\r\n<div class="std">Vincent Chase Vagabond VC E10620 Black C1 Eyeglasses</div>\r\n</div>', '<div id="product_tabs_description_contents" class="product-tabs-content" style="display: block;">\r\n<div class="std">Black Rectangle Eyeglasses Vincent Chase Vagabond VC E10620 - C1</div>\r\n<div class="std">Vincent Chase Vagabond VC E10620 Black C1 Eyeglasses</div>\r\n</div>', '', 80, 'A', 'Y', 'Y', '2017-05-18', '2017-01-12 23:09:36', '', '', '', '', 'A'),
(16, 3, NULL, 'y', 'Mask sand & sun ms s10699 grey transparent blue green mirror c2 women sunglasses', 'm', '', 'mask-sand-grey-sunglass', 450, 350, 'n', 'upload/product_image/c48c603321974025b02ba2314518536c.jpg', 'upload/product_image/category/c48c603321974025b02ba2314518536c_thumb.jpg', 'upload/product_image/gallery/c48c603321974025b02ba2314518536c_thumb.jpg', 'upload/product_image/gallery/thumb/c48c603321974025b02ba2314518536c_thumb.jpg', 'upload/product_image/hot/c48c603321974025b02ba2314518536c_thumb.jpg', 'upload/product_image/featured/c48c603321974025b02ba2314518536c_thumb.jpg', '<p class="f13">Mask Sand &amp; Sun MS S10699 Grey Transparent Blue Green Mirror C2 Women Sunglasses</p>\r\n<p style="width: 100%; word-wrap: break-word;">Mask Sand &amp; Sun MS S10699 Grey Transparent Blue Green Mirror C2 Women Sunglasses</p>', '<p class="f13">Mask Sand &amp; Sun MS S10699 Grey Transparent Blue Green Mirror C2 Women Sunglasses</p>\r\n<p style="width: 100%; word-wrap: break-word;">Mask Sand &amp; Sun MS S10699 Grey Transparent Blue Green Mirror C2 Women Sunglasses</p>', '', 100, 'A', 'N', 'Y', '2017-05-18', '2017-01-12 23:13:20', '', '', '', '', 'A'),
(17, 7, NULL, 'y', 'Vincent Chase  Top Guns VC 5158/P Silver Blue Gradient AO12/21 Aviator Polarized Sunglasses', 'm', '', 'vincent-chase-top-guns-vc-p-silver-blue-gradient-ao12-21-aviator-polarized-sunglasses', 999, 0, 'y', 'upload/product_image/0cbbec7dce6d72d8e877f4daf2df6aea.jpg', 'upload/product_image/category/0cbbec7dce6d72d8e877f4daf2df6aea_thumb.jpg', 'upload/product_image/gallery/0cbbec7dce6d72d8e877f4daf2df6aea_thumb.jpg', 'upload/product_image/gallery/thumb/0cbbec7dce6d72d8e877f4daf2df6aea_thumb.jpg', 'upload/product_image/hot/0cbbec7dce6d72d8e877f4daf2df6aea_thumb.jpg', 'upload/product_image/featured/0cbbec7dce6d72d8e877f4daf2df6aea_thumb.jpg', '<p class="f13">Vincent Chase Top Guns VC 5158/P Silver Blue Gradient AO12/21 Aviator Polarized Sunglasses</p>\r\n<p style="width: 100%; word-wrap: break-word;">&nbsp;Vincent Chase VC 5158/P Silver Blue Gradient AO12/21 Aviator Polarized Sunglasses</p>', '<p class="f13">Vincent Chase Top Guns VC 5158/P Silver Blue Gradient AO12/21 Aviator Polarized Sunglasses</p>\r\n<p style="width: 100%; word-wrap: break-word;">&nbsp;Vincent Chase VC 5158/P Silver Blue Gradient AO12/21 Aviator Polarized Sunglasses</p>', '', 50, 'A', 'Y', 'N', '2017-05-18', '2017-01-12 23:17:13', 'ddd', 'ddd', 'ffff', 'ddddd', 'A'),
(18, 3, NULL, 'y', 'erwrwewerwer', 'm', '132344', 'erwrwewerwer', 12, 10, 'n', 'upload/product_image/', 'upload/product_image/category/_thumb', 'upload/product_image/gallery/_thumb', 'upload/product_image/gallery/thumb/_thumb', '', 'upload/product_image/featured/_thumb', '<p>sdffdsdsf</p>', '<p>sdffsdfds</p>', '', 10, 'A', 'Y', 'N', '2017-08-21', '2017-08-21 12:54:23', '', '', '', '', 'A'),
(19, 5, '1,2,3', 'y', 'erwrwewerweffr', 'm', '132344', 'erwrwewerweffr', 12, 10, 'n', 'upload/product_image/', 'upload/product_image/category/_thumb', 'upload/product_image/gallery/_thumb', 'upload/product_image/gallery/thumb/_thumb', 'upload/product_image/hot/_thumb', 'upload/product_image/featured/_thumb', '<p>hghg</p>', '<p>ghfgg</p>', '', 10, 'A', 'Y', 'Y', '2017-08-21', '2017-08-21 14:08:20', '', '', '', '', 'A');

-- --------------------------------------------------------

--
-- Table structure for table `foodstore_product_nutrition`
--

CREATE TABLE IF NOT EXISTS `foodstore_product_nutrition` (
  `ing_id` int(11) NOT NULL,
  `pro_id` int(11) NOT NULL,
  `ing_name` varchar(255) NOT NULL,
  `quantity` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `foodstore_product_nutrition`
--

INSERT INTO `foodstore_product_nutrition` (`ing_id`, `pro_id`, `ing_name`, `quantity`) VALUES
(1, 18, '#d89a27', 'y'),
(2, 18, '#24bb3a', 'n'),
(4, 19, '#000000', 'y');

-- --------------------------------------------------------

--
-- Table structure for table `foodstore_product_otherimg`
--

CREATE TABLE IF NOT EXISTS `foodstore_product_otherimg` (
  `ing_id` int(11) NOT NULL,
  `pro_id` int(11) NOT NULL,
  `img_name` varchar(255) NOT NULL,
  `img_path` varchar(255) NOT NULL,
  `img_thumb` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `foodstore_product_otherimg`
--

INSERT INTO `foodstore_product_otherimg` (`ing_id`, `pro_id`, `img_name`, `img_path`, `img_thumb`) VALUES
(32, 19, 'eaebdbea2bf3810515700d99089505e3.png', 'upload/product_image/gallery/eaebdbea2bf3810515700d99089505e3.png', 'upload/product_image/gallery/thumb/eaebdbea2bf3810515700d99089505e3_thumb.png'),
(37, 16, 'ce53609d88680a30e1e3b4d642c383f8.jpg', 'upload/product_image/gallery/ce53609d88680a30e1e3b4d642c383f8.jpg', 'upload/product_image/gallery/thumb/ce53609d88680a30e1e3b4d642c383f8_thumb.jpg'),
(38, 16, '85ae2cf298f8d79492fdc4ad8182de8c.jpg', 'upload/product_image/gallery/85ae2cf298f8d79492fdc4ad8182de8c.jpg', 'upload/product_image/gallery/thumb/85ae2cf298f8d79492fdc4ad8182de8c_thumb.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `foodstore_settings`
--

CREATE TABLE IF NOT EXISTS `foodstore_settings` (
  `id` int(11) NOT NULL,
  `config_type` varchar(256) NOT NULL,
  `config_val` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `foodstore_settings`
--

INSERT INTO `foodstore_settings` (`id`, `config_type`, `config_val`) VALUES
(1, 'admin_email', 'proitplus@proitplus.com'),
(2, 'facebook_link', 'https://www.facebook.com'),
(3, 'twitter_link', 'http://twitter.com'),
(6, 'youtube_link', 'http://youtube.com'),
(17, 'googleplus_link', 'http://google.com'),
(22, 'linkedin_link', 'http://linkedin.com'),
(23, 'contact_email', ''),
(24, 'corporate_office_address', ''),
(25, 'contact_no_1', ''),
(26, 'contact_no_2', ''),
(27, 'product_bigthmb_width', ''),
(28, 'product_bigthmb_height', ''),
(29, 'product_smallthmb_width', ''),
(30, 'product_smallthmb_height', ''),
(31, 'banner_width', ''),
(32, 'banner_height', ''),
(33, 'additionalbanner_width', ''),
(34, 'additionalbanner_height', ''),
(35, 'landline_no', ''),
(36, 'cat_nav_limit', '');

-- --------------------------------------------------------

--
-- Table structure for table `foodstore_user`
--

CREATE TABLE IF NOT EXISTS `foodstore_user` (
  `id` int(10) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `phone_no` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `cu_date` date NOT NULL,
  `new_flag` int(5) NOT NULL,
  `news_subscriber` varchar(255) NOT NULL,
  `state` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `zip` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fp_testing` varchar(255) NOT NULL,
  `last_login_time` datetime NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('A','IA') NOT NULL DEFAULT 'IA',
  `email_varified` enum('Y','N') NOT NULL DEFAULT 'N',
  `email_token` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `foodstore_user`
--

INSERT INTO `foodstore_user` (`id`, `fname`, `lname`, `name`, `email`, `image`, `phone_no`, `address`, `cu_date`, `new_flag`, `news_subscriber`, `state`, `city`, `zip`, `country`, `username`, `password`, `fp_testing`, `last_login_time`, `date`, `status`, `email_varified`, `email_token`) VALUES
(16, 'adam', 'griffith', 'adam griffith', 'tusharrouth001@gmail.com', '', '784569321', '', '0000-00-00', 0, 'Y', '', '', '', '', '', '05a671c66aefea124cc08b76ea6d30bb', 'testtest', '0000-00-00 00:00:00', '2016-12-28 20:32:44', 'A', 'N', ''),
(17, 'Tapan', 'Barik', 'Tapan Barik', 'tapan.jrtechnologies@gmail.com', 'upload/user_image/611a4cc169463b1dd0d49e5633929b8c.jpg', '9007312084', '', '0000-00-00', 0, 'Y', '', '', '', '', '', 'b1591da5033a9e9d1a64ef408cfe921e', '0d67b79c', '0000-00-00 00:00:00', '2017-01-01 23:44:53', 'A', 'Y', ''),
(18, 'tushar', 'routh', 'tushar routh', 'tushar.jrtechnologies@gmail.com', 'upload/user_image/1aed525543e95847c4dd8016c53661a6.jpg', '9231232165', '', '0000-00-00', 0, 'Y', '', '', '', '', '', '6469ed41d1b26200f80b6c11166dfbb9', 'tushar007', '0000-00-00 00:00:00', '2017-01-02 19:33:32', 'A', 'Y', 'hpdi57mw'),
(19, 'abhishek ', 'santra', 'abhishek  santra', 'abhishek.jrtechnologies@gmail.com', 'upload/user_image/07da9d1bc3ec4787849dfe5ef6ce2a1e.jpg', '9231232165', '', '0000-00-00', 0, 'Y', '', '', '', '', '', '45d449aa41f8d1b520c7a084ea647f9a', 'ec7b2350', '0000-00-00 00:00:00', '2017-01-02 19:37:50', 'A', 'Y', 'DhqIaRt5'),
(20, 'Tapan', 'Barik', 'Tapan Barik', 'tapanbarik333@gmail.com', '', '12345', '', '0000-00-00', 0, 'Y', '', '', '', '', '', '827ccb0eea8a706c4c34a16891f84e7b', '12345', '0000-00-00 00:00:00', '2017-01-12 17:02:32', 'IA', 'N', 'FfGu5mPL'),
(22, 'Rakesh', 'Bose', 'Rakesh Bose', 'boserakesh61@gmail.com', 'upload/user_image/14845512538290.jpeg', '', '', '0000-00-00', 1, '', '', '', '', '', '', '33814acc0b112f9c4a7d49a407321729', '100200', '0000-00-00 00:00:00', '2017-01-15 18:50:53', 'IA', 'N', ''),
(23, 'Shahzad', 'Nezam', 'Shahzad Nezam', 'shahzadnezam1990@gmail.com', 'upload/user_image/14845563634264.jpeg', '', '', '0000-00-00', 2, '', '', '', '', '', '', '', '', '0000-00-00 00:00:00', '2017-01-15 20:16:04', 'IA', 'N', ''),
(24, 'Mohammed', 'Eisan', 'Mohammed Eisan', 'mdeisan16@gmail.com', 'upload/user_image/14845580345839.jpeg', '', '', '0000-00-00', 1, '', '', '', '', '', '', '', '', '0000-00-00 00:00:00', '2017-01-15 20:43:54', 'IA', 'N', '');

-- --------------------------------------------------------

--
-- Table structure for table `foodstore_userbilling_address`
--

CREATE TABLE IF NOT EXISTS `foodstore_userbilling_address` (
  `shipping_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `billing_name` varchar(255) NOT NULL,
  `billing_address` text NOT NULL,
  `billing_pincode` varchar(255) NOT NULL,
  `billing_city` varchar(255) NOT NULL,
  `billing_state` varchar(255) NOT NULL,
  `billing_country` varchar(255) NOT NULL,
  `billing_email` varchar(255) NOT NULL,
  `billing_mobile` varchar(255) NOT NULL,
  `status` enum('Y','N') NOT NULL DEFAULT 'Y'
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `foodstore_usershipping_address`
--

CREATE TABLE IF NOT EXISTS `foodstore_usershipping_address` (
  `shipping_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `shipping_name` varchar(255) NOT NULL,
  `shipping_address` varchar(255) NOT NULL,
  `shipping_landmark` varchar(255) NOT NULL,
  `shipping_pincode` varchar(255) NOT NULL,
  `shipping_city` varchar(255) NOT NULL,
  `shipping_state` varchar(255) NOT NULL,
  `shipping_country` varchar(255) NOT NULL,
  `shipping_email` varchar(255) NOT NULL,
  `shipping_mobile` varchar(255) NOT NULL,
  `status` enum('Y','N') NOT NULL DEFAULT 'Y',
  `make_it_default` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `foodstore_usershipping_address`
--

INSERT INTO `foodstore_usershipping_address` (`shipping_id`, `user_id`, `shipping_name`, `shipping_address`, `shipping_landmark`, `shipping_pincode`, `shipping_city`, `shipping_state`, `shipping_country`, `shipping_email`, `shipping_mobile`, `status`, `make_it_default`) VALUES
(3, 14, 'avishek santra', 'Adisaptagram, Hooghly, West Bengal, India', '', '712502', 'Hooghly', 'West Bengal', 'India', '', '7890006549', 'Y', 'Y'),
(10, 19, 'mr don', 'Adisaptagram, Hooghly, West Bengal, India', 'golabri', '712502', 'Hooghly', 'West Bengal', 'India', '', '789456123', 'Y', 'Y'),
(12, 19, 'avishek dului', 'Bhawanipur, Kolkata, West Bengal, India', 'ner bokshi goli', '712139', 'Kolkata', 'West Bengal', 'India', '', '7890456123', 'Y', 'N');

-- --------------------------------------------------------

--
-- Table structure for table `product_technical_information`
--

CREATE TABLE IF NOT EXISTS `product_technical_information` (
  `te_id` int(11) NOT NULL,
  `p_id` int(11) NOT NULL,
  `br_name` varchar(255) NOT NULL,
  `fr_type` varchar(255) NOT NULL,
  `fr_shape` varchar(255) NOT NULL,
  `gender` enum('m','wm','us') NOT NULL,
  `model_no` varchar(255) NOT NULL,
  `power` enum('y','n') NOT NULL,
  `frame_size` enum('m','s','l') NOT NULL,
  `frame_colour` varchar(255) NOT NULL,
  `glass_colur` varchar(255) NOT NULL,
  `size` varchar(255) NOT NULL,
  `height` varchar(255) NOT NULL,
  `weight` int(11) NOT NULL,
  `weight_group` enum('feather light','light','average','above average') NOT NULL,
  `material` varchar(255) NOT NULL,
  `frame_meterial` varchar(255) NOT NULL,
  `temple_meterial` varchar(255) NOT NULL,
  `temple_colur` varchar(255) NOT NULL,
  `lens_meterial` varchar(255) NOT NULL,
  `lens_technology` varchar(255) NOT NULL,
  `prescription_type` varchar(255) NOT NULL,
  `product_warranty` varchar(255) NOT NULL,
  `frame_style` varchar(255) NOT NULL,
  `frame_style_secondary` varchar(255) NOT NULL,
  `collection` varchar(255) NOT NULL,
  `condition` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_technical_information`
--

INSERT INTO `product_technical_information` (`te_id`, `p_id`, `br_name`, `fr_type`, `fr_shape`, `gender`, `model_no`, `power`, `frame_size`, `frame_colour`, `glass_colur`, `size`, `height`, `weight`, `weight_group`, `material`, `frame_meterial`, `temple_meterial`, `temple_colur`, `lens_meterial`, `lens_technology`, `prescription_type`, `product_warranty`, `frame_style`, `frame_style_secondary`, `collection`, `condition`, `type`) VALUES
(2, 17, 'Vincent Chase', 'Cat Eye', 'Full Rim', 'us', 'VC-2007', 'n', 'm', '', 'No', '52-18-140', '36 mm', 24, 'average', 'Acetate (Vintage Regular)', 'Acetate', 'Acetate', 'Blue', 'No', 'No', 'Bifocal / Progressive', '1 Year Manufacturer Warranty', 'Standard', 'Youth', 'EVIL EYE', 'New', 'No'),
(3, 16, 'Mask', 'Full Rim', '', 'us', 'MS 1452', 'n', 's', '', 'No', '', '', 25, 'average', '', '', '', '', '', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin_users`
--

CREATE TABLE IF NOT EXISTS `tbl_admin_users` (
  `id` int(11) NOT NULL,
  `username` varchar(150) NOT NULL,
  `admin_name` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `contact` varchar(255) NOT NULL,
  `password` varchar(100) NOT NULL,
  `fresh_password` varchar(255) NOT NULL,
  `block` tinyint(4) NOT NULL DEFAULT '0',
  `user_type` enum('SA','A') DEFAULT 'SA' COMMENT 'SA: Super Admin,A:  Admin',
  `status` enum('A','IA','D') NOT NULL DEFAULT 'IA' COMMENT '''A'' =>''ACTIVE'' ,''IA''=>''INACTIVE'',''D''=>''DELETED''''',
  `role_associate` varchar(255) NOT NULL,
  `first_login` enum('Y','N') NOT NULL COMMENT '''Y'':''YES'',''N'':''NO''',
  `sender_email` varchar(30) NOT NULL,
  `reciptent_email` varchar(30) NOT NULL,
  `fb_link` varchar(100) NOT NULL,
  `tw_link` varchar(100) NOT NULL,
  `paypal_id` varchar(100) NOT NULL,
  `admin_sig` varchar(80) NOT NULL,
  `email_signature` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_admin_users`
--

INSERT INTO `tbl_admin_users` (`id`, `username`, `admin_name`, `first_name`, `middle_name`, `last_name`, `email`, `contact`, `password`, `fresh_password`, `block`, `user_type`, `status`, `role_associate`, `first_login`, `sender_email`, `reciptent_email`, `fb_link`, `tw_link`, `paypal_id`, `admin_sig`, `email_signature`) VALUES
(1, 'food', 'tushar kanti routh', 'tushar', 'kanti', 'routh', 'tusharrouth001@gmail.com', '9231232165', 'bc48cad06f04a4911e739363e6f66423', 'food@123', 0, 'SA', 'A', '', 'N', 'tushar@thewebspidy.com', '', 'http://www.fb.com', 'http://www.tw.com', 'p10', 'upload/sig_1.jpg', '<p><em><strong>Tushar Routh</strong></em></p>\r\n\r\n<h2 style="font-style:italic">Developer, Www.Thewebspidy.Com p:033-40081001 | m:9231232165 | e:tushar@thewebspidy.com| w:www.thewebspidy.com/ | a: Sector-1 Saltlake Kolkata &quot;</h2>\r\n\r\n<p>&nbsp;</p>\r\n');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `abs_settings`
--
ALTER TABLE `abs_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `foodstore_addtocompare`
--
ALTER TABLE `foodstore_addtocompare`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `foodstore_banner`
--
ALTER TABLE `foodstore_banner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `foodstore_blog`
--
ALTER TABLE `foodstore_blog`
  ADD PRIMARY KEY (`blog_id`);

--
-- Indexes for table `foodstore_blog_category`
--
ALTER TABLE `foodstore_blog_category`
  ADD PRIMARY KEY (`b_catid`);

--
-- Indexes for table `foodstore_blog_comment`
--
ALTER TABLE `foodstore_blog_comment`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `foodstore_category`
--
ALTER TABLE `foodstore_category`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `foodstore_cms`
--
ALTER TABLE `foodstore_cms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `foodstore_feedback`
--
ALTER TABLE `foodstore_feedback`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `foodstore_mywishlist`
--
ALTER TABLE `foodstore_mywishlist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `foodstore_newslettersubscriber`
--
ALTER TABLE `foodstore_newslettersubscriber`
  ADD PRIMARY KEY (`subs_id`);

--
-- Indexes for table `foodstore_orderfinal`
--
ALTER TABLE `foodstore_orderfinal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `foodstore_ordertemp`
--
ALTER TABLE `foodstore_ordertemp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `foodstore_orderuserinfo`
--
ALTER TABLE `foodstore_orderuserinfo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `foodstore_product`
--
ALTER TABLE `foodstore_product`
  ADD PRIMARY KEY (`p_id`);

--
-- Indexes for table `foodstore_product_nutrition`
--
ALTER TABLE `foodstore_product_nutrition`
  ADD PRIMARY KEY (`ing_id`);

--
-- Indexes for table `foodstore_product_otherimg`
--
ALTER TABLE `foodstore_product_otherimg`
  ADD PRIMARY KEY (`ing_id`);

--
-- Indexes for table `foodstore_user`
--
ALTER TABLE `foodstore_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `foodstore_userbilling_address`
--
ALTER TABLE `foodstore_userbilling_address`
  ADD PRIMARY KEY (`shipping_id`);

--
-- Indexes for table `foodstore_usershipping_address`
--
ALTER TABLE `foodstore_usershipping_address`
  ADD PRIMARY KEY (`shipping_id`);

--
-- Indexes for table `product_technical_information`
--
ALTER TABLE `product_technical_information`
  ADD PRIMARY KEY (`te_id`);

--
-- Indexes for table `tbl_admin_users`
--
ALTER TABLE `tbl_admin_users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `foodstore_addtocompare`
--
ALTER TABLE `foodstore_addtocompare`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `foodstore_banner`
--
ALTER TABLE `foodstore_banner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `foodstore_blog`
--
ALTER TABLE `foodstore_blog`
  MODIFY `blog_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `foodstore_blog_category`
--
ALTER TABLE `foodstore_blog_category`
  MODIFY `b_catid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `foodstore_blog_comment`
--
ALTER TABLE `foodstore_blog_comment`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `foodstore_category`
--
ALTER TABLE `foodstore_category`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `foodstore_cms`
--
ALTER TABLE `foodstore_cms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `foodstore_feedback`
--
ALTER TABLE `foodstore_feedback`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `foodstore_mywishlist`
--
ALTER TABLE `foodstore_mywishlist`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `foodstore_newslettersubscriber`
--
ALTER TABLE `foodstore_newslettersubscriber`
  MODIFY `subs_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `foodstore_orderfinal`
--
ALTER TABLE `foodstore_orderfinal`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `foodstore_ordertemp`
--
ALTER TABLE `foodstore_ordertemp`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=77;
--
-- AUTO_INCREMENT for table `foodstore_orderuserinfo`
--
ALTER TABLE `foodstore_orderuserinfo`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `foodstore_product`
--
ALTER TABLE `foodstore_product`
  MODIFY `p_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT for table `foodstore_product_nutrition`
--
ALTER TABLE `foodstore_product_nutrition`
  MODIFY `ing_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `foodstore_product_otherimg`
--
ALTER TABLE `foodstore_product_otherimg`
  MODIFY `ing_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT for table `foodstore_user`
--
ALTER TABLE `foodstore_user`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `foodstore_userbilling_address`
--
ALTER TABLE `foodstore_userbilling_address`
  MODIFY `shipping_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `foodstore_usershipping_address`
--
ALTER TABLE `foodstore_usershipping_address`
  MODIFY `shipping_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `product_technical_information`
--
ALTER TABLE `product_technical_information`
  MODIFY `te_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
