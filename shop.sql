-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 16, 2018 at 03:58 PM
-- Server version: 10.1.9-MariaDB
-- PHP Version: 7.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shop`
--

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` int(10) UNSIGNED NOT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT '1',
  `status` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attribute_languages`
--

CREATE TABLE `attribute_languages` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribute_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent` int(11) NOT NULL DEFAULT '0',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alt` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT '1',
  `status` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent`, `image`, `alt`, `icon`, `priority`, `status`, `type`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 0, NULL, NULL, NULL, 0, 'publish', 'default', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `category_languages`
--

CREATE TABLE `category_languages` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `contents` longtext COLLATE utf8mb4_unicode_ci,
  `meta_seo` text COLLATE utf8mb4_unicode_ci,
  `language` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `category_languages`
--

INSERT INTO `category_languages` (`id`, `title`, `slug`, `description`, `contents`, `meta_seo`, `language`, `category_id`) VALUES
(1, 'Uncategorized', 'uncategorized', NULL, NULL, NULL, 'vi', 1),
(2, 'Uncategorized', 'uncategorized', NULL, NULL, NULL, 'en', 1);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent` int(11) NOT NULL DEFAULT '0',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `contents` longtext COLLATE utf8mb4_unicode_ci,
  `rating` tinyint(4) NOT NULL DEFAULT '1',
  `like` int(11) NOT NULL DEFAULT '0',
  `product_id` int(10) UNSIGNED DEFAULT NULL,
  `post_id` int(10) UNSIGNED DEFAULT NULL,
  `member_id` int(10) UNSIGNED DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT '1',
  `status` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `coupon_amount` int(11) NOT NULL DEFAULT '0',
  `number_of_uses` int(11) NOT NULL DEFAULT '0',
  `min_restriction_amount` int(11) NOT NULL DEFAULT '0',
  `max_restriction_amount` int(11) NOT NULL DEFAULT '0',
  `change_conditions_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `begin_at` timestamp NULL DEFAULT NULL,
  `end_at` timestamp NULL DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT '1',
  `status` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `used` int(11) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_permission` text COLLATE utf8mb4_unicode_ci,
  `priority` int(11) NOT NULL DEFAULT '1',
  `status` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `links`
--

CREATE TABLE `links` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `skype` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `youtube` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alt` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT '1',
  `status` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `link_languages`
--

CREATE TABLE `link_languages` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `language` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `media_libraries`
--

CREATE TABLE `media_libraries` (
  `id` int(10) UNSIGNED NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alt` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` int(11) NOT NULL DEFAULT '0',
  `editor` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT '1',
  `status` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `mime_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT '1',
  `status` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`id`, `username`, `password`, `name`, `phone`, `email`, `address`, `image`, `priority`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'voquochai', '$2y$10$LRur0lVtmlAuMCOyZ9T6vegsI.PCWegnIqM3z7hxp7kpkEnbQ7yYe', 'Võ Quốc Hải', NULL, 'quochai.coder@gmail.com', NULL, NULL, 1, 'publish', NULL, '2018-04-17 07:09:22', '2018-04-17 07:09:22');

-- --------------------------------------------------------

--
-- Table structure for table `member_password_resets`
--

CREATE TABLE `member_password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2017_03_16_000000_create_members_table', 1),
(4, '2017_03_16_030417_create_member_password_resets_table', 1),
(5, '2017_06_22_030237_create_categories_table', 1),
(6, '2017_06_22_041225_create_category_languages_table', 1),
(7, '2017_06_28_030237_create_suppliers_table', 1),
(8, '2017_07_12_074145_create_products_table', 1),
(9, '2017_07_13_022922_create_product_languages_table', 1),
(10, '2017_07_19_022148_create_attributes_table', 1),
(11, '2017_07_19_043215_create_attribute_languages_table', 1),
(12, '2017_08_05_022238_create_product_attribute_relation_table', 1),
(13, '2017_10_02_032249_create_media_libraries_table', 1),
(14, '2017_12_22_064219_create_posts_table', 1),
(15, '2017_12_22_064418_create_post_languages_table', 1),
(16, '2017_12_22_064447_create_post_attribute_table', 1),
(17, '2017_12_23_184911_create_pages_table', 1),
(18, '2017_12_23_185000_create_page_languages_table', 1),
(19, '2017_12_25_154609_create_photos_table', 1),
(20, '2017_12_25_154624_create_photo_languages_table', 1),
(21, '2017_12_26_092247_create_settings_table', 1),
(22, '2018_01_02_044342_entrust_setup_tables', 1),
(23, '2018_01_09_154609_create_links_table', 1),
(24, '2018_01_09_154624_create_link_languages_table', 1),
(25, '2018_01_10_165341_create_registers_table', 1),
(26, '2018_01_14_160014_create_comments_table', 1),
(27, '2018_02_05_045759_create_coupons_table', 1),
(28, '2018_02_09_082208_create_orders_table', 1),
(29, '2018_02_22_074012_create_wms_stores_table', 1),
(30, '2018_02_23_024649_create_wms_imports_table', 1),
(31, '2018_03_01_061244_create_wms_exports_table', 1),
(32, '2018_03_07_014847_create_groups_table', 1),
(33, '2018_03_08_013630_create_user_group_relation_table', 1),
(34, '2018_03_16_014803_create_jobs_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `coupon_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_amount` int(11) NOT NULL DEFAULT '0',
  `quantity` int(11) NOT NULL DEFAULT '0',
  `shipping` int(11) NOT NULL DEFAULT '0',
  `subtotal` int(11) NOT NULL DEFAULT '0',
  `total` int(11) NOT NULL DEFAULT '0',
  `product_id` text COLLATE utf8mb4_unicode_ci,
  `product_code` text COLLATE utf8mb4_unicode_ci,
  `product_size` text COLLATE utf8mb4_unicode_ci,
  `product_color` text COLLATE utf8mb4_unicode_ci,
  `product_qty` text COLLATE utf8mb4_unicode_ci,
  `product_price` text COLLATE utf8mb4_unicode_ci,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `district_id` int(11) NOT NULL DEFAULT '0',
  `province_id` int(11) NOT NULL DEFAULT '0',
  `payment` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `member_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `status_id` int(11) NOT NULL DEFAULT '1',
  `priority` int(11) NOT NULL DEFAULT '1',
  `status` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alt` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT '1',
  `status` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `viewed` int(11) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `link`, `image`, `alt`, `priority`, `status`, `type`, `viewed`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, NULL, 1, 'publish', 'gioi-thieu', 0, NULL, NULL, NULL),
(2, NULL, NULL, NULL, 1, 'publish', 'tuyen-dung', 0, NULL, NULL, NULL),
(3, NULL, NULL, NULL, 1, 'publish', 'lien-he', 0, NULL, NULL, NULL),
(4, NULL, NULL, NULL, 1, 'publish', 'footer', 0, NULL, NULL, '2018-05-11 16:51:29'),
(5, NULL, NULL, NULL, 1, 'publish', 'index', 0, NULL, '2018-05-07 17:13:19', '2018-05-07 17:13:56');

-- --------------------------------------------------------

--
-- Table structure for table `page_languages`
--

CREATE TABLE `page_languages` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `contents` longtext COLLATE utf8mb4_unicode_ci,
  `meta_seo` text COLLATE utf8mb4_unicode_ci,
  `language` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `page_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `page_languages`
--

INSERT INTO `page_languages` (`id`, `title`, `slug`, `description`, `contents`, `meta_seo`, `language`, `page_id`) VALUES
(1, 'Giới thiệu', 'gioi-thieu', NULL, NULL, NULL, 'vi', 1),
(2, 'Giới thiệu', 'gioi-thieu', NULL, NULL, NULL, 'en', 1),
(3, 'Tuyển dụng', 'tuyen-dung', NULL, NULL, NULL, 'vi', 2),
(4, 'Tuyển dụng', 'tuyen-dung', NULL, NULL, NULL, 'en', 2),
(5, 'Liên hệ', 'lien-he', NULL, NULL, NULL, 'vi', 3),
(6, 'Liên hệ', 'lien-he', NULL, NULL, NULL, 'en', 3),
(7, 'Footer', 'footer', NULL, '<p>Lorem ipsum dolor sit amet, consec tetura adipisicing elit, sed temporia incididunt.</p>', NULL, 'vi', 4),
(8, 'Footer', 'footer', NULL, NULL, NULL, 'en', 4),
(9, 'Trang chủ', 'trang-chu', NULL, NULL, '{"title":"Trang ch\\u1ee7","keywords":null,"description":null}', 'vi', 5),
(10, 'Trang chủ', 'trang-chu', NULL, NULL, '{"title":null,"keywords":null,"description":null}', 'en', 5);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT '1',
  `status` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `photos`
--

CREATE TABLE `photos` (
  `id` int(10) UNSIGNED NOT NULL,
  `link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alt` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT '1',
  `status` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `photo_languages`
--

CREATE TABLE `photo_languages` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `language` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(10) UNSIGNED NOT NULL,
  `link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alt` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachments` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT '1',
  `status` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `category_id` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `viewed` int(11) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `link`, `image`, `alt`, `attachments`, `priority`, `status`, `category_id`, `user_id`, `type`, `viewed`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, NULL, NULL, 1, 'publish', 1, 1, 'tin-tuc', 0, NULL, '2018-04-17 07:02:51', '2018-04-17 07:02:51'),
(2, NULL, NULL, NULL, NULL, 1, 'publish', 1, 1, 'tin-tuc', 0, NULL, '2018-04-17 07:02:51', '2018-04-17 07:02:51'),
(3, NULL, NULL, NULL, NULL, 1, 'publish', 1, 1, 'tin-tuc', 0, NULL, '2018-04-17 07:02:51', '2018-04-17 07:02:51'),
(4, NULL, NULL, NULL, NULL, 1, 'publish', 1, 1, 'tin-tuc', 0, NULL, '2018-04-17 07:02:51', '2018-04-17 07:02:51'),
(5, NULL, NULL, NULL, NULL, 1, 'publish', 1, 1, 'tin-tuc', 0, NULL, '2018-04-17 07:02:51', '2018-04-17 07:02:51'),
(6, NULL, NULL, NULL, NULL, 1, 'publish', 1, 1, 'tin-tuc', 0, NULL, '2018-04-17 07:02:51', '2018-04-17 07:02:51'),
(7, NULL, NULL, NULL, NULL, 1, 'publish', 1, 1, 'tin-tuc', 0, NULL, '2018-04-17 07:02:51', '2018-04-17 07:02:51'),
(8, NULL, NULL, NULL, NULL, 1, 'publish', 1, 1, 'tin-tuc', 0, NULL, '2018-04-17 07:02:51', '2018-04-17 07:02:51'),
(9, NULL, NULL, NULL, NULL, 1, 'publish', 1, 1, 'tin-tuc', 0, NULL, '2018-04-17 07:02:51', '2018-04-17 07:02:51'),
(10, NULL, NULL, NULL, NULL, 1, 'publish', 1, 1, 'tin-tuc', 0, NULL, '2018-04-17 07:02:51', '2018-04-17 07:02:51'),
(11, NULL, NULL, NULL, NULL, 1, 'publish', 1, 1, 'tin-tuc', 0, NULL, '2018-04-17 07:02:51', '2018-04-17 07:02:51'),
(12, NULL, NULL, NULL, NULL, 1, 'publish', 1, 1, 'tin-tuc', 0, NULL, '2018-04-17 07:02:51', '2018-04-17 07:02:51'),
(13, NULL, NULL, NULL, NULL, 1, 'publish', 1, 1, 'tin-tuc', 0, NULL, '2018-04-17 07:02:51', '2018-04-17 07:02:51'),
(14, NULL, NULL, NULL, NULL, 1, 'publish', 1, 1, 'tin-tuc', 0, NULL, '2018-04-17 07:02:51', '2018-04-17 07:02:51'),
(15, NULL, NULL, NULL, NULL, 1, 'publish', 1, 1, 'tin-tuc', 0, NULL, '2018-04-17 07:02:51', '2018-04-17 07:02:51'),
(16, NULL, NULL, NULL, NULL, 1, 'publish', 1, 1, 'tin-tuc', 0, NULL, '2018-04-17 07:02:51', '2018-04-17 07:02:51'),
(17, NULL, NULL, NULL, NULL, 1, 'publish', 1, 1, 'tin-tuc', 0, NULL, '2018-04-17 07:02:51', '2018-04-17 07:02:51'),
(18, NULL, NULL, NULL, NULL, 1, 'publish', 1, 1, 'tin-tuc', 0, NULL, '2018-04-17 07:02:51', '2018-04-17 07:02:51'),
(19, NULL, NULL, NULL, NULL, 1, 'publish', 1, 1, 'tin-tuc', 0, NULL, '2018-04-17 07:02:51', '2018-04-17 07:02:51'),
(20, NULL, NULL, NULL, NULL, 1, 'publish', 1, 1, 'tin-tuc', 0, NULL, '2018-04-17 07:02:51', '2018-04-17 07:02:51'),
(21, NULL, '2018-05/section-icon.png', NULL, '', 1, 'publish', 1, 1, 'tieu-chi', 0, NULL, '2018-05-10 16:05:06', '2018-05-10 16:06:15'),
(22, NULL, '2018-05/section-icon-2.png', NULL, '', 2, 'publish', 1, 1, 'tieu-chi', 0, NULL, '2018-05-10 16:06:35', '2018-05-10 16:07:03'),
(23, NULL, '2018-05/section-icon-3.png', NULL, '', 3, 'publish', 1, 1, 'tieu-chi', 0, NULL, '2018-05-10 16:06:48', '2018-05-10 16:07:09'),
(24, NULL, NULL, NULL, NULL, 1, 'publish', 1, 1, 'chinh-sach-quy-dinh', 0, NULL, '2018-05-11 16:57:55', '2018-05-11 16:57:55'),
(25, NULL, NULL, NULL, NULL, 2, 'publish', 1, 1, 'chinh-sach-quy-dinh', 0, NULL, '2018-05-11 16:58:08', '2018-05-11 16:58:08'),
(26, NULL, NULL, NULL, NULL, 3, 'publish', 1, 1, 'chinh-sach-quy-dinh', 0, NULL, '2018-05-11 16:58:21', '2018-05-11 16:58:21'),
(27, NULL, NULL, NULL, NULL, 4, 'publish', 1, 1, 'chinh-sach-quy-dinh', 0, NULL, '2018-05-11 16:58:29', '2018-05-11 16:58:29'),
(28, NULL, NULL, NULL, NULL, 1, 'publish', 1, 1, 'ho-tro-khach-hang', 0, NULL, '2018-05-11 16:58:40', '2018-05-11 16:58:40'),
(29, NULL, NULL, NULL, NULL, 2, 'publish', 1, 1, 'ho-tro-khach-hang', 0, NULL, '2018-05-11 16:58:51', '2018-05-11 16:58:51'),
(30, NULL, NULL, NULL, NULL, 3, 'publish', 1, 1, 'ho-tro-khach-hang', 0, NULL, '2018-05-11 16:59:02', '2018-05-11 16:59:02'),
(31, NULL, NULL, NULL, NULL, 4, 'publish', 1, 1, 'ho-tro-khach-hang', 0, NULL, '2018-05-11 16:59:09', '2018-05-11 16:59:09'),
(32, NULL, '2018-05/sign-in-up-form.png', NULL, '', 1, 'publish', 1, 1, 'thu-thuat', 0, NULL, '2018-05-16 13:34:37', '2018-05-16 13:52:46'),
(33, NULL, '2018-05/chrismas-button.png', NULL, '', 2, 'publish', 1, 1, 'thu-thuat', 0, NULL, '2018-05-16 13:35:09', '2018-05-16 13:52:51'),
(34, NULL, '2018-05/full-screen-navigation.png', NULL, '', 3, 'publish', 1, 1, 'thu-thuat', 0, NULL, '2018-05-16 13:40:31', '2018-05-16 13:52:56');

-- --------------------------------------------------------

--
-- Table structure for table `post_attribute`
--

CREATE TABLE `post_attribute` (
  `post_id` int(10) UNSIGNED NOT NULL,
  `attribute_id` int(10) UNSIGNED NOT NULL,
  `option` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post_languages`
--

CREATE TABLE `post_languages` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `contents` longtext COLLATE utf8mb4_unicode_ci,
  `attributes` text COLLATE utf8mb4_unicode_ci,
  `meta_seo` text COLLATE utf8mb4_unicode_ci,
  `language` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_languages`
--

INSERT INTO `post_languages` (`id`, `title`, `slug`, `description`, `contents`, `attributes`, `meta_seo`, `language`, `post_id`) VALUES
(1, 'Prof. Burnice Kohler Jr.', 'prof-burnice-kohler-jr', 'Nihil voluptas sint facilis non ipsam. Sit autem ducimus aperiam iure nam architecto et. Et eum quis molestiae dolores maiores voluptas iusto. Nobis perferendis ad sit blanditiis similique.', 'Quia maxime rem tempora voluptas. Eos et illo totam eum. Ipsa id consequatur molestiae perspiciatis deserunt.', NULL, '{"title":"Prof. Burnice Kohler Jr.","keywords":"Prof. Burnice Kohler Jr.","description":"Prof. Burnice Kohler Jr."}', 'vi', 1),
(2, 'Lonie Brown', 'lonie-brown', 'Iusto rerum nihil suscipit eveniet suscipit repudiandae nostrum minus. Harum et aut sint quia mollitia et. Reprehenderit soluta porro voluptas. Quia delectus maxime beatae quibusdam.', 'Error iusto quis aliquam. Quis ea nihil suscipit et qui tempora molestiae. Sed quia nam dolores id. Deserunt reiciendis minus voluptatem corrupti error explicabo est.', NULL, '{"title":"Lonie Brown","keywords":"Lonie Brown","description":"Lonie Brown"}', 'en', 1),
(3, 'Rey Rice', 'rey-rice', 'Eos adipisci vero qui. Quis ut magnam quisquam enim a aspernatur. Laborum earum temporibus occaecati id asperiores non.', 'Cupiditate et vel eum inventore sequi fuga repellat aperiam. Dicta animi et aut. Est modi eum illum alias dicta.', NULL, '{"title":"Rey Rice","keywords":"Rey Rice","description":"Rey Rice"}', 'vi', 2),
(4, 'Jody Zulauf', 'jody-zulauf', 'Sapiente maiores qui non. Ratione maxime ipsa nulla tenetur. Aut quo modi repellat non soluta consequuntur omnis quia.', 'Quisquam tenetur dolor tempora dolor et perferendis. Quos et autem voluptatem commodi ex. Eligendi nihil nam accusantium quo.', NULL, '{"title":"Jody Zulauf","keywords":"Jody Zulauf","description":"Jody Zulauf"}', 'en', 2),
(5, 'Ms. Teresa Paucek DVM', 'ms-teresa-paucek-dvm', 'Aperiam labore commodi iure consequatur excepturi nulla sapiente. Voluptate quo nisi dolores odit.', 'Similique occaecati odit cum error repellat molestiae. Qui sit minus corporis error. Qui maxime sed ratione numquam asperiores porro nostrum ea. Voluptas expedita quia animi illo harum.', NULL, '{"title":"Ms. Teresa Paucek DVM","keywords":"Ms. Teresa Paucek DVM","description":"Ms. Teresa Paucek DVM"}', 'vi', 3),
(6, 'Yolanda Homenick', 'yolanda-homenick', 'Porro quia molestiae itaque totam asperiores. Eligendi doloremque voluptatibus vero perferendis molestiae voluptatem ut. Necessitatibus sapiente beatae ea qui.', 'Sed ratione quas et aliquid dolores. Fugiat temporibus dolorum reprehenderit voluptas facere fugit. Doloribus magni ut nemo aut recusandae. Expedita dolores saepe et assumenda.', NULL, '{"title":"Yolanda Homenick","keywords":"Yolanda Homenick","description":"Yolanda Homenick"}', 'en', 3),
(7, 'Esperanza Goodwin', 'esperanza-goodwin', 'Quia veniam molestiae inventore ipsam repudiandae molestiae quis. Inventore qui ut voluptates earum nostrum velit. Neque qui asperiores sed laborum. Pariatur sit sed error.', 'Est neque ipsa deserunt reiciendis quae. Voluptas aperiam magni sapiente. Laudantium voluptatum velit voluptatem laudantium.', NULL, '{"title":"Esperanza Goodwin","keywords":"Esperanza Goodwin","description":"Esperanza Goodwin"}', 'vi', 4),
(8, 'Dr. Ignatius Ondricka', 'dr-ignatius-ondricka', 'Numquam possimus quidem corrupti ut odit doloribus. Molestias qui aut sed voluptatem atque tenetur dicta ut. Architecto at et nobis doloribus ea et. Aut molestiae illum omnis facilis.', 'A praesentium accusantium et vel delectus voluptatum. Et porro dolorem fuga illum modi. Dolorem minima tempora nihil voluptatum ipsam quae.', NULL, '{"title":"Dr. Ignatius Ondricka","keywords":"Dr. Ignatius Ondricka","description":"Dr. Ignatius Ondricka"}', 'en', 4),
(9, 'Alva Johnson', 'alva-johnson', 'Assumenda enim qui itaque vero quae inventore praesentium nesciunt. Ipsam non aut nemo pariatur assumenda et. Harum expedita porro nostrum quo consectetur iusto.', 'Dolores quam id ut ad. Et labore laborum architecto aperiam distinctio dolorem quae id. Vel ipsum qui quis assumenda. Et qui et sed quidem non.', NULL, '{"title":"Alva Johnson","keywords":"Alva Johnson","description":"Alva Johnson"}', 'vi', 5),
(10, 'Destiny Kshlerin', 'destiny-kshlerin', 'Dolorem sit et delectus quae et aliquam. Ipsam at dicta consequuntur perferendis iusto quasi magni culpa. Cumque sequi accusantium dolorem animi ullam aut assumenda dolores.', 'Quae ut et exercitationem optio est porro pariatur. Similique consectetur et recusandae inventore ea. Vitae dicta sunt aut et ab. Deserunt velit perspiciatis similique ut.', NULL, '{"title":"Destiny Kshlerin","keywords":"Destiny Kshlerin","description":"Destiny Kshlerin"}', 'en', 5),
(11, 'Katlyn Auer', 'katlyn-auer', 'Nulla debitis et et est animi autem nihil. Ut tenetur fugit ipsam facilis mollitia non. Sit ullam earum velit nihil ut sapiente.', 'Sint itaque hic neque ea qui dolor consequatur. Officia et placeat est sequi iste. Reprehenderit illum ea soluta unde architecto rerum ducimus. Veniam voluptas quos dolorem a facere. Et quisquam magni odio nihil occaecati nobis animi.', NULL, '{"title":"Katlyn Auer","keywords":"Katlyn Auer","description":"Katlyn Auer"}', 'vi', 6),
(12, 'Mya Jakubowski Sr.', 'mya-jakubowski-sr', 'Occaecati veniam ut repudiandae earum a fugit. Exercitationem non ut dolor ratione temporibus. Ut non at nesciunt ex nemo suscipit provident.', 'Ratione ipsam ipsa qui aperiam earum. Magni perferendis maxime et similique. Architecto voluptates ut sunt dicta. Ipsa earum dolores laboriosam possimus voluptas sint sint quam. Corrupti voluptas magni odio sed in atque.', NULL, '{"title":"Mya Jakubowski Sr.","keywords":"Mya Jakubowski Sr.","description":"Mya Jakubowski Sr."}', 'en', 6),
(13, 'Dariana Abshire DVM', 'dariana-abshire-dvm', 'Ut nemo rerum ullam sunt. Voluptatibus voluptatibus et magnam enim omnis. Natus voluptate molestiae nemo est totam non beatae.', 'Delectus delectus laboriosam quisquam qui sint dolores. Excepturi non adipisci est quam velit. Similique ex qui consequatur recusandae quisquam magnam quasi doloremque. Cumque similique natus ab aut voluptas accusamus voluptatem sunt.', NULL, '{"title":"Dariana Abshire DVM","keywords":"Dariana Abshire DVM","description":"Dariana Abshire DVM"}', 'vi', 7),
(14, 'Stefanie Corkery', 'stefanie-corkery', 'Soluta nostrum quae ea fugit libero rem et. Odit provident quo cum. Quibusdam a delectus aut placeat nisi vel quia. Minus in iusto similique voluptas.', 'Delectus et accusamus eum qui. Nulla dicta odit quibusdam non iure. Molestiae ea aspernatur illo ratione et provident quis. Quisquam illum in facilis quae sint.', NULL, '{"title":"Stefanie Corkery","keywords":"Stefanie Corkery","description":"Stefanie Corkery"}', 'en', 7),
(15, 'Prof. Mariam Thiel', 'prof-mariam-thiel', 'Eveniet quidem culpa vero harum sapiente pariatur ut. Molestiae cumque rerum ratione in corrupti nesciunt maiores. Neque vel itaque labore nihil architecto quae repudiandae.', 'Aut veritatis necessitatibus veritatis enim optio sunt. Molestias ea quisquam sint. Aliquid aut enim aut saepe.', NULL, '{"title":"Prof. Mariam Thiel","keywords":"Prof. Mariam Thiel","description":"Prof. Mariam Thiel"}', 'vi', 8),
(16, 'Prof. Ephraim Davis', 'prof-ephraim-davis', 'Maiores voluptas laboriosam quia praesentium. Quia aliquid veritatis et quasi provident. Numquam tempora perferendis quo facilis dolorem est id.', 'Eligendi ipsa dicta necessitatibus ex totam. Dolores aut et totam nulla qui aut fugit aliquam. Aut neque id omnis totam et ut. Distinctio dolor voluptatem eum maxime velit fugiat dolore. Aut dolor et sit ea ratione.', NULL, '{"title":"Prof. Ephraim Davis","keywords":"Prof. Ephraim Davis","description":"Prof. Ephraim Davis"}', 'en', 8),
(17, 'Yvonne Harber', 'yvonne-harber', 'Enim qui praesentium architecto ea unde distinctio. Modi dolor excepturi aperiam dolorum vel fugit consequatur.', 'Minus qui ipsa officiis assumenda ipsum culpa aut odio. Veniam occaecati rem itaque sapiente aut similique. Dignissimos quam optio fugiat impedit repudiandae sequi. Quo nihil aut vel vel dicta.', NULL, '{"title":"Yvonne Harber","keywords":"Yvonne Harber","description":"Yvonne Harber"}', 'vi', 9),
(18, 'Amber Armstrong', 'amber-armstrong', 'Soluta autem quis earum sequi porro aperiam aut. Occaecati laboriosam illo doloremque corporis illum omnis. Unde sint voluptas necessitatibus enim.', 'Cupiditate aut sit libero nisi corporis. Quasi temporibus quis officia et sed sint. Et unde distinctio nihil et ut.', NULL, '{"title":"Amber Armstrong","keywords":"Amber Armstrong","description":"Amber Armstrong"}', 'en', 9),
(19, 'Garrison Steuber', 'garrison-steuber', 'Explicabo laudantium et voluptatibus sit ea ex nemo sit. Veritatis rerum facilis autem quod et voluptates. Vero unde explicabo fugiat est rerum. Sit quod veritatis nobis eius animi officiis.', 'Nesciunt et natus veniam rerum neque sequi corporis molestiae. Sunt voluptatem sequi aliquid aut accusantium voluptatem saepe.', NULL, '{"title":"Garrison Steuber","keywords":"Garrison Steuber","description":"Garrison Steuber"}', 'vi', 10),
(20, 'Meaghan Rau', 'meaghan-rau', 'Est perferendis facilis illum non eos. Suscipit occaecati eum hic autem. Error facere distinctio quia sit eius. Quibusdam sint consequatur magnam et amet. Sed enim quia et odio.', 'Quae eveniet iure reprehenderit illum. Accusantium asperiores repellat reiciendis odio est est nostrum. Velit enim molestiae qui laudantium a eveniet corporis.', NULL, '{"title":"Meaghan Rau","keywords":"Meaghan Rau","description":"Meaghan Rau"}', 'en', 10),
(21, 'Shannon Medhurst', 'shannon-medhurst', 'Velit saepe odit ratione deserunt. Sequi vero dolorum veniam ratione aut. Provident sunt velit laborum in laboriosam neque sapiente. Autem iure molestias accusantium reiciendis.', 'Ut excepturi ipsum officia aspernatur sunt error enim porro. Rem unde qui qui. Quo reiciendis ipsa dolores ipsam odio corporis.', NULL, '{"title":"Shannon Medhurst","keywords":"Shannon Medhurst","description":"Shannon Medhurst"}', 'vi', 11),
(22, 'Israel Smith', 'israel-smith', 'Rerum ex consequatur quisquam non aut voluptas laboriosam magni. Labore earum reiciendis dolorem maiores. Eligendi suscipit et ab sint magni aut.', 'Ea quam dolorum magni enim. Sint impedit distinctio voluptatum velit voluptatibus et. Totam corporis numquam magni et adipisci.', NULL, '{"title":"Israel Smith","keywords":"Israel Smith","description":"Israel Smith"}', 'en', 11),
(23, 'Brody Reilly', 'brody-reilly', 'Et esse enim consequatur dolore et. Officiis ad odio amet vitae. Repudiandae ullam ipsum qui et in. Maxime voluptas quisquam rerum incidunt voluptatem.', 'Quia aut sed ut est iusto. Voluptatum natus est voluptatem nobis esse quia.', NULL, '{"title":"Brody Reilly","keywords":"Brody Reilly","description":"Brody Reilly"}', 'vi', 12),
(24, 'Dr. Tanner Stamm', 'dr-tanner-stamm', 'Sint facere ratione atque minus. Voluptate et natus et non blanditiis est. Provident architecto repellendus est unde sunt.', 'Ipsum veniam velit qui eum. Et non aut cumque nam dicta nostrum quia reiciendis. Fugiat explicabo accusantium iste ipsa aut eveniet aut nisi.', NULL, '{"title":"Dr. Tanner Stamm","keywords":"Dr. Tanner Stamm","description":"Dr. Tanner Stamm"}', 'en', 12),
(25, 'Alberto Langosh', 'alberto-langosh', 'Repudiandae vel distinctio est qui maxime veniam quia. Omnis blanditiis aut quia sit perspiciatis.', 'Explicabo omnis voluptatem ipsa enim cum animi voluptas hic. Ut corrupti et atque qui. Inventore quos magni eum quia sit enim. Voluptatem repudiandae at neque sint quia voluptas rerum repellat.', NULL, '{"title":"Alberto Langosh","keywords":"Alberto Langosh","description":"Alberto Langosh"}', 'vi', 13),
(26, 'Roslyn Smith', 'roslyn-smith', 'Voluptatibus doloremque omnis at est officia maiores. Ex ratione iste voluptatem animi. Hic veniam ut et quibusdam dolore possimus. Esse placeat illo aut eum.', 'Qui consequuntur eaque et dolorem dicta aut facilis. Sit nostrum ullam sunt natus error.', NULL, '{"title":"Roslyn Smith","keywords":"Roslyn Smith","description":"Roslyn Smith"}', 'en', 13),
(27, 'Dr. Lelia Nicolas', 'dr-lelia-nicolas', 'Reprehenderit sit rerum sapiente quod dolor quasi. Delectus omnis odio repellendus molestiae quisquam eos laudantium. Velit quisquam tenetur et voluptatum omnis.', 'Voluptas nemo assumenda et assumenda voluptatem quod aut. Eaque repudiandae laborum occaecati provident. Quam culpa nihil laudantium pariatur non accusantium. Incidunt et voluptas aliquam quia dicta.', NULL, '{"title":"Dr. Lelia Nicolas","keywords":"Dr. Lelia Nicolas","description":"Dr. Lelia Nicolas"}', 'vi', 14),
(28, 'Aniyah Tremblay', 'aniyah-tremblay', 'Nisi perspiciatis sed pariatur ipsam nihil. Animi ex quos iure voluptatem.', 'Quia nulla aut reiciendis ad eius dolorum. Dolores quasi quia quae dolorem. Veritatis est sapiente unde voluptatem perferendis non sunt. Placeat dignissimos voluptates maiores illum vero.', NULL, '{"title":"Aniyah Tremblay","keywords":"Aniyah Tremblay","description":"Aniyah Tremblay"}', 'en', 14),
(29, 'Mr. Marty Schuster', 'mr-marty-schuster', 'Debitis sapiente natus quia alias omnis. Dolor quia illum minus repellendus sed nam quas. Ut et aspernatur dolores consequatur et necessitatibus. Debitis cupiditate qui et iure ea.', 'Optio accusamus et ducimus atque accusamus rerum. Sint natus voluptates vitae in tenetur sunt beatae dicta. Voluptas doloremque est quia sit minus. Molestiae libero ut alias quod mollitia nam et.', NULL, '{"title":"Mr. Marty Schuster","keywords":"Mr. Marty Schuster","description":"Mr. Marty Schuster"}', 'vi', 15),
(30, 'Mrs. Mozelle Orn', 'mrs-mozelle-orn', 'Laboriosam iusto temporibus enim culpa id. Omnis vero optio est est. Odit quis et voluptatem optio est dignissimos. Ea neque blanditiis harum aliquam. Commodi officia tenetur vitae aliquid qui.', 'Cupiditate suscipit sed voluptas repellat placeat. Nobis eius odio voluptatem possimus sint tenetur ut voluptatem.', NULL, '{"title":"Mrs. Mozelle Orn","keywords":"Mrs. Mozelle Orn","description":"Mrs. Mozelle Orn"}', 'en', 15),
(31, 'Urban Russel', 'urban-russel', 'Nostrum et est excepturi illum recusandae modi quia. Non blanditiis ea nesciunt dolore. Adipisci nesciunt est qui nesciunt non sint. Voluptatem est iste odit aspernatur velit aut omnis.', 'Voluptates fuga minus magni soluta veniam reiciendis provident. Ut dicta sit in sint nesciunt. Eligendi deleniti in et culpa nesciunt omnis. Nesciunt quia qui autem alias mollitia quia quis. Dolore cum omnis facere odio.', NULL, '{"title":"Urban Russel","keywords":"Urban Russel","description":"Urban Russel"}', 'vi', 16),
(32, 'Jayden Bauch IV', 'jayden-bauch-iv', 'Numquam ut et non voluptas aut. Cupiditate autem iste possimus enim. Consectetur consequuntur quaerat fuga excepturi voluptas unde.', 'Aperiam delectus accusamus ad rerum nam ab. Inventore et deleniti nobis. Aperiam dolorum architecto doloremque vitae enim.', NULL, '{"title":"Jayden Bauch IV","keywords":"Jayden Bauch IV","description":"Jayden Bauch IV"}', 'en', 16),
(33, 'Noel Brakus', 'noel-brakus', 'Officia molestiae et animi nihil fugit. Consequuntur voluptatem doloribus unde ad at fuga. Officia ut hic aut suscipit non tenetur. Odit sequi officia nobis.', 'Quo laboriosam repudiandae ut at consectetur. Id deleniti suscipit beatae dolor. Doloremque deserunt quaerat aut est possimus. Cum vel itaque sit autem pariatur eos consequatur. Et praesentium dolorem ratione.', NULL, '{"title":"Noel Brakus","keywords":"Noel Brakus","description":"Noel Brakus"}', 'vi', 17),
(34, 'Kirk Wyman', 'kirk-wyman', 'Perspiciatis dolores adipisci et porro consequatur et voluptatem. Possimus praesentium et sit ea est velit quae. Beatae et quibusdam placeat aut perferendis eum eaque.', 'Ut ut culpa necessitatibus quibusdam quae. Libero deleniti adipisci numquam nihil et ullam. Ipsam consectetur architecto qui cupiditate hic consectetur. Blanditiis inventore voluptatem molestiae animi nostrum.', NULL, '{"title":"Kirk Wyman","keywords":"Kirk Wyman","description":"Kirk Wyman"}', 'en', 17),
(35, 'Maye Schneider', 'maye-schneider', 'Nesciunt est autem nihil maiores consequatur. Libero accusamus praesentium quia atque dolor. Eos qui explicabo non iure odio vel in.', 'Quis numquam nisi repellat facere qui ducimus. Sit distinctio vitae ut tempora. Quaerat quo et fugiat qui. Modi quis reprehenderit nisi ab facilis voluptas.', NULL, '{"title":"Maye Schneider","keywords":"Maye Schneider","description":"Maye Schneider"}', 'vi', 18),
(36, 'Mrs. Mozelle Erdman DVM', 'mrs-mozelle-erdman-dvm', 'Aliquid id et possimus quas sed atque. Delectus nihil illo magnam qui molestiae culpa. Harum nostrum necessitatibus vel numquam quo id aut sunt. Molestias aut perferendis necessitatibus iusto.', 'Quae illum sint dicta quaerat nemo. Quo et enim odit cumque quibusdam ut voluptas. Est dolores sunt sapiente eius sed veritatis.', NULL, '{"title":"Mrs. Mozelle Erdman DVM","keywords":"Mrs. Mozelle Erdman DVM","description":"Mrs. Mozelle Erdman DVM"}', 'en', 18),
(37, 'Prof. Roger Rau PhD', 'prof-roger-rau-phd', 'Totam omnis dolor quod modi eius velit modi. Fugiat aperiam dolore nihil vel omnis. Aliquid non a quo et dolor.', 'Soluta corporis necessitatibus et iste et omnis quia. Aperiam cupiditate facere quia beatae. Quae ipsam dolorum reprehenderit quisquam et quisquam.', NULL, '{"title":"Prof. Roger Rau PhD","keywords":"Prof. Roger Rau PhD","description":"Prof. Roger Rau PhD"}', 'vi', 19),
(38, 'Forest Hegmann IV', 'forest-hegmann-iv', 'Accusamus recusandae inventore a sunt quas recusandae non. Repellendus aliquam est illum vero est. Tenetur deleniti accusantium vero rerum modi cum nihil.', 'Pariatur atque rerum quos. Qui eum accusantium quisquam est cumque et velit. Ea odit molestiae quis nobis aut suscipit dicta.', NULL, '{"title":"Forest Hegmann IV","keywords":"Forest Hegmann IV","description":"Forest Hegmann IV"}', 'en', 19),
(39, 'Claude Schoen', 'claude-schoen', 'Temporibus et a tempore odit ullam repudiandae. Maxime totam magni architecto vero est odio omnis. Sit aut ipsa voluptatum omnis. Est dicta voluptas et maiores corporis rem voluptas.', 'Cupiditate qui natus porro et. Veritatis quos modi perferendis saepe dolores molestiae quis.', NULL, '{"title":"Claude Schoen","keywords":"Claude Schoen","description":"Claude Schoen"}', 'vi', 20),
(40, 'Prof. Halle Yost', 'prof-halle-yost', 'Suscipit natus et aut iure optio molestiae. Unde sint est aut assumenda. Commodi eum possimus et. Voluptatem et numquam architecto consequatur voluptatem exercitationem in.', 'Dolor consequatur est optio. In numquam voluptatem est est voluptas. Iste assumenda facilis earum et voluptatem. Ut dolor aut repudiandae molestiae amet et.', NULL, '{"title":"Prof. Halle Yost","keywords":"Prof. Halle Yost","description":"Prof. Halle Yost"}', 'en', 20),
(41, 'Giao diện chuẩn Laptop - Mobile', 'giao-dien-chuan-laptop-mobile', 'Lorem ipsum dolor sittem ametam ngcing elit, per sed do eiusmoad teimpor inunt ut segad do eiusmod.', NULL, NULL, '{"title":null,"keywords":null,"description":null}', 'vi', 21),
(42, NULL, 'giao-dien-chuan-laptop-mobile', NULL, NULL, NULL, '{"title":null,"keywords":null,"description":null}', 'en', 21),
(43, 'Chia sẽ FREE trên chợ doanh nghiệp', 'chia-se-free-tren-cho-doanh-nghiep', 'Lorem ipsum dolor sittem ametam ngcing elit, per sed do eiusmoad teimpor inunt ut segad do eiusmod.', NULL, NULL, NULL, 'vi', 22),
(44, NULL, 'chia-se-free-tren-cho-doanh-nghiep', NULL, NULL, NULL, NULL, 'en', 22),
(45, 'Hỗ trợ 24 / 7', 'ho-tro-24-7', 'Lorem ipsum dolor sittem ametam ngcing elit, per sed do eiusmoad teimpor inunt ut segad do eiusmod.', NULL, NULL, NULL, 'vi', 23),
(46, NULL, 'ho-tro-24-7', NULL, NULL, NULL, NULL, 'en', 23),
(47, 'Chính sách bảo mật', 'chinh-sach-bao-mat', NULL, NULL, NULL, NULL, 'vi', 24),
(48, NULL, 'chinh-sach-bao-mat', NULL, NULL, NULL, NULL, 'en', 24),
(49, 'Chính sách đổi trả', 'chinh-sach-doi-tra', NULL, NULL, NULL, NULL, 'vi', 25),
(50, NULL, 'chinh-sach-doi-tra', NULL, NULL, NULL, NULL, 'en', 25),
(51, 'Quy định sử dụng', 'quy-dinh-su-dung', NULL, NULL, NULL, NULL, 'vi', 26),
(52, NULL, 'quy-dinh-su-dung', NULL, NULL, NULL, NULL, 'en', 26),
(53, 'Quy định nội dung', 'quy-dinh-noi-dung', NULL, NULL, NULL, NULL, 'vi', 27),
(54, NULL, 'quy-dinh-noi-dung', NULL, NULL, NULL, NULL, 'en', 27),
(55, 'Hướng dẫn sử dụng', 'huong-dan-su-dung', NULL, NULL, NULL, NULL, 'vi', 28),
(56, NULL, 'huong-dan-su-dung', NULL, NULL, NULL, NULL, 'en', 28),
(57, 'Hướng dẫn thanh toán', 'huong-dan-thanh-toan', NULL, NULL, NULL, NULL, 'vi', 29),
(58, NULL, 'huong-dan-thanh-toan', NULL, NULL, NULL, NULL, 'en', 29),
(59, 'Hướng dẫn gia hạn', 'huong-dan-gia-han', NULL, NULL, NULL, NULL, 'vi', 30),
(60, NULL, 'huong-dan-gia-han', NULL, NULL, NULL, NULL, 'en', 30),
(61, 'Hướng dẫn đổi gói dịch vụ', 'huong-dan-doi-goi-dich-vu', NULL, NULL, NULL, NULL, 'vi', 31),
(62, NULL, 'huong-dan-doi-goi-dich-vu', NULL, NULL, NULL, NULL, 'en', 31),
(63, 'Sign In/Up Form Transitions cực cool với CSS3', 'sign-inup-form-transitions-cuc-cool-voi-css3', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', NULL, NULL, '{"title":null,"keywords":null,"description":null}', 'vi', 32),
(64, NULL, 'sign-inup-form-transitions-cuc-cool-voi-css3', NULL, NULL, NULL, '{"title":null,"keywords":null,"description":null}', 'en', 32),
(65, 'Christmas Button – Mẫu button cho mùa giáng sinh', 'christmas-button-mau-button-cho-mua-giang-sinh', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', NULL, NULL, '{"title":null,"keywords":null,"description":null}', 'vi', 33),
(66, NULL, 'christmas-button-mau-button-cho-mua-giang-sinh', NULL, NULL, NULL, '{"title":null,"keywords":null,"description":null}', 'en', 33),
(67, 'Full Screen Navigation với CSS3 và jQuery', 'full-screen-navigation-voi-css3-va-jquery', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.', NULL, NULL, '{"title":null,"keywords":null,"description":null}', 'vi', 34),
(68, NULL, 'full-screen-navigation-voi-css3-va-jquery', NULL, NULL, NULL, '{"title":null,"keywords":null,"description":null}', 'en', 34);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `regular_price` int(11) NOT NULL DEFAULT '0',
  `sale_price` int(11) NOT NULL DEFAULT '0',
  `original_price` int(11) NOT NULL DEFAULT '0',
  `weight` int(11) NOT NULL DEFAULT '0',
  `link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alt` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attachments` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT '1',
  `status` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `supplier_id` int(10) UNSIGNED DEFAULT NULL,
  `category_id` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT '1',
  `type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `viewed` int(11) NOT NULL DEFAULT '0',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `code`, `regular_price`, `sale_price`, `original_price`, `weight`, `link`, `image`, `alt`, `attachments`, `priority`, `status`, `supplier_id`, `category_id`, `user_id`, `type`, `viewed`, `deleted_at`, `created_at`, `updated_at`) VALUES
(21, 'KW00001', 0, 0, 0, 0, NULL, '2018-05/metronic.jpg', NULL, NULL, 1, 'publish,new', NULL, 1, 1, 'san-pham', 0, NULL, '2018-05-11 16:04:03', '2018-05-11 16:04:03'),
(22, 'KW00002', 0, 0, 0, 0, NULL, '2018-05/canvas.jpg', NULL, NULL, 2, 'publish,new', NULL, 1, 1, 'san-pham', 0, NULL, '2018-05-11 16:04:30', '2018-05-11 16:04:30'),
(23, 'KW00003', 0, 0, 0, 0, NULL, '2018-05/porto.png', NULL, NULL, 3, 'publish,new', NULL, 1, 1, 'san-pham', 0, NULL, '2018-05-11 16:05:00', '2018-05-11 16:05:00');

-- --------------------------------------------------------

--
-- Table structure for table `product_attribute`
--

CREATE TABLE `product_attribute` (
  `product_id` int(10) UNSIGNED NOT NULL,
  `attribute_id` int(10) UNSIGNED NOT NULL,
  `option` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product_languages`
--

CREATE TABLE `product_languages` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `contents` longtext COLLATE utf8mb4_unicode_ci,
  `attributes` text COLLATE utf8mb4_unicode_ci,
  `meta_seo` text COLLATE utf8mb4_unicode_ci,
  `language` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_languages`
--

INSERT INTO `product_languages` (`id`, `title`, `slug`, `description`, `contents`, `attributes`, `meta_seo`, `language`, `product_id`) VALUES
(41, 'Metronic - Responsive Admin Dashboard Template', 'metronic-responsive-admin-dashboard-template', NULL, NULL, '[{"name":null,"value":null}]', '{"title":null,"keywords":null,"description":null}', 'vi', 21),
(42, NULL, 'metronic-responsive-admin-dashboard-template', NULL, NULL, '[{"name":null,"value":null}]', '{"title":null,"keywords":null,"description":null}', 'en', 21),
(43, 'Canvas | The Multi-Purpose HTML5 Template', 'canvas-the-multi-purpose-html5-template', NULL, NULL, '[{"name":null,"value":null}]', '{"title":null,"keywords":null,"description":null}', 'vi', 22),
(44, NULL, 'canvas-the-multi-purpose-html5-template', NULL, NULL, '[{"name":null,"value":null}]', '{"title":null,"keywords":null,"description":null}', 'en', 22),
(45, 'Porto - Responsive HTML5 Template', 'porto-responsive-html5-template', NULL, NULL, '[{"name":null,"value":null}]', '{"title":null,"keywords":null,"description":null}', 'vi', 23),
(46, NULL, 'porto-responsive-html5-template', NULL, NULL, '[{"name":null,"value":null}]', '{"title":null,"keywords":null,"description":null}', 'en', 23);

-- --------------------------------------------------------

--
-- Table structure for table `registers`
--

CREATE TABLE `registers` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` int(11) NOT NULL DEFAULT '0',
  `description` text COLLATE utf8mb4_unicode_ci,
  `contents` longtext COLLATE utf8mb4_unicode_ci,
  `priority` int(11) NOT NULL DEFAULT '1',
  `status` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `registers`
--

INSERT INTO `registers` (`id`, `title`, `name`, `phone`, `email`, `address`, `gender`, `description`, `contents`, `priority`, `status`, `type`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Đăng ký nhận bản tin', NULL, NULL, 'quochai.coder@gmail.com', NULL, 0, NULL, NULL, 1, 'publish', 'newsletter', NULL, '2018-05-02 16:59:12', '2018-05-02 16:59:12'),
(2, 'Đăng ký nhận bản tin', NULL, NULL, 'quochainina001@gmail.com', NULL, 0, NULL, NULL, 1, 'publish', 'newsletter', NULL, '2018-05-02 17:42:10', '2018-05-02 17:42:10'),
(3, 'Đăng ký nhận bản tin', NULL, NULL, 'quochainina002@gmail.com', NULL, 0, NULL, NULL, 1, 'publish', 'newsletter', NULL, '2018-05-02 17:43:23', '2018-05-02 17:43:23'),
(4, 'Đăng ký nhận bản tin', NULL, NULL, 'quochainina002@gmail.com', NULL, 0, NULL, NULL, 1, 'publish', 'newsletter', NULL, '2018-05-02 17:43:28', '2018-05-02 17:43:28'),
(5, 'Đăng ký nhận bản tin', NULL, NULL, 'quochainina002@gmail.com', NULL, 0, NULL, NULL, 1, 'publish', 'newsletter', NULL, '2018-05-02 17:43:32', '2018-05-02 17:43:32');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT '1',
  `status` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `description`, `priority`, `status`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', NULL, 1, 'publish', '2018-04-17 07:02:47', '2018-04-17 07:02:47'),
(2, 'san-pham', 'Sản phẩm', NULL, 1, 'publish', '2018-04-17 07:02:47', '2018-04-17 07:02:47'),
(3, 'order', 'Đơn hàng', NULL, 2, 'publish', '2018-04-17 07:02:47', '2018-05-06 15:51:10'),
(4, 'wms', 'Kho hàng', NULL, 3, 'publish', '2018-04-17 07:02:47', '2018-04-17 07:02:47'),
(5, 'tin-tuc', 'Tin tức', NULL, 4, 'publish', '2018-04-17 07:02:47', '2018-04-17 07:02:47'),
(6, 'dich-vu', 'Dịch vụ', NULL, 5, 'publish', '2018-04-17 07:02:47', '2018-04-17 07:02:47'),
(7, 'page', 'Trang tĩnh', NULL, 6, 'publish', '2018-04-17 07:02:47', '2018-05-06 15:52:01'),
(8, 'photo', 'Hình ảnh', NULL, 7, 'publish', '2018-04-17 07:02:47', '2018-05-06 15:52:05'),
(9, 'link', 'Liên kết', NULL, 8, 'publish', '2018-04-17 07:02:47', '2018-05-06 15:52:08'),
(10, 'register', 'Đăng ký', NULL, 9, 'publish', '2018-04-17 07:02:47', '2018-05-06 15:52:12'),
(11, 'comment', 'Bình luận', NULL, 10, 'publish', '2018-05-06 15:48:02', '2018-05-06 15:52:16');

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`user_id`, `role_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `name`, `value`) VALUES
(1, 'language', 'vi'),
(2, 'date_custom_format', NULL),
(3, 'product_per_page', '10'),
(4, 'thumbs', '{"product":{"_small":{"width":"300","height":"300"},"_medium":{"width":"600","height":"600"},"_large":{"width":"1000","height":"1000"}}}'),
(5, 'post_per_page', '10'),
(6, 'site_name', 'Kho Web Online'),
(7, 'site_slogan', NULL),
(8, 'site_address', NULL),
(9, 'site_email', 'quochainina@gmail.com'),
(10, 'site_phone', '1679933525'),
(11, 'site_fax', NULL),
(12, 'site_hotline', '985551650'),
(13, 'site_url', NULL),
(14, 'site_copyright', NULL),
(15, 'fanpage', NULL),
(16, 'google_coordinates', NULL),
(17, 'email_host', NULL),
(18, 'email_port', NULL),
(19, 'email_smtpsecure', NULL),
(20, 'email_username', 'voquochai'),
(21, 'email_password', '12345678'),
(22, 'email_to', NULL),
(23, 'email_cc', NULL),
(24, 'email_bcc', NULL),
(25, 'script_head', NULL),
(26, 'script_body', NULL),
(27, 'google_recaptcha_key', NULL),
(28, 'google_recaptcha_secret', NULL),
(29, 'date_format', 'd/m/Y'),
(30, 'logo', '2018-05/logo.png');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `priority` int(11) NOT NULL DEFAULT '1',
  `status` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT '1',
  `status` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `name`, `phone`, `email`, `address`, `image`, `priority`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'voquochai', '$2y$10$Z5HrZx.gfrX3CBQN6d0lqO4oCkoS7C9euQ6q1HgA83pn3VBVYSGAu', 'Võ Quốc Hải', NULL, 'quochainina@gmail.com', NULL, NULL, 1, 'publish', '12wbA0rrBGKyxXNwnJBAPYrpAMh0Euds6hthTbudOPV4tnj0MijzzzKghN0K', '2018-04-17 07:02:47', '2018-04-17 07:02:47');

-- --------------------------------------------------------

--
-- Table structure for table `user_group`
--

CREATE TABLE `user_group` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `group_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wms_exports`
--

CREATE TABLE `wms_exports` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `store_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` text COLLATE utf8mb4_unicode_ci,
  `product_code` text COLLATE utf8mb4_unicode_ci,
  `product_size` text COLLATE utf8mb4_unicode_ci,
  `product_color` text COLLATE utf8mb4_unicode_ci,
  `product_qty` text COLLATE utf8mb4_unicode_ci,
  `product_price` text COLLATE utf8mb4_unicode_ci,
  `quantity` int(11) NOT NULL DEFAULT '0',
  `total` int(11) NOT NULL DEFAULT '0',
  `note_cancel` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT '1',
  `status` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wms_imports`
--

CREATE TABLE `wms_imports` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `store_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_id` text COLLATE utf8mb4_unicode_ci,
  `product_code` text COLLATE utf8mb4_unicode_ci,
  `product_size` text COLLATE utf8mb4_unicode_ci,
  `product_color` text COLLATE utf8mb4_unicode_ci,
  `product_qty` text COLLATE utf8mb4_unicode_ci,
  `product_price` text COLLATE utf8mb4_unicode_ci,
  `quantity` int(11) NOT NULL DEFAULT '0',
  `total` int(11) NOT NULL DEFAULT '0',
  `note_cancel` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT '1',
  `status` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wms_stores`
--

CREATE TABLE `wms_stores` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `priority` int(11) NOT NULL DEFAULT '1',
  `status` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attribute_languages`
--
ALTER TABLE `attribute_languages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `attribute_languages_attribute_id_language_unique` (`attribute_id`,`language`),
  ADD KEY `attribute_languages_language_index` (`language`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_languages`
--
ALTER TABLE `category_languages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `category_languages_category_id_language_unique` (`category_id`,`language`),
  ADD KEY `category_languages_language_index` (`language`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_product_id_foreign` (`product_id`),
  ADD KEY `comments_post_id_foreign` (`post_id`),
  ADD KEY `comments_member_id_foreign` (`member_id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `groups_name_unique` (`name`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_reserved_at_index` (`queue`,`reserved_at`);

--
-- Indexes for table `links`
--
ALTER TABLE `links`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `link_languages`
--
ALTER TABLE `link_languages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `link_languages_link_id_language_unique` (`link_id`,`language`),
  ADD KEY `link_languages_language_index` (`language`);

--
-- Indexes for table `media_libraries`
--
ALTER TABLE `media_libraries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `members_username_unique` (`username`),
  ADD UNIQUE KEY `members_email_unique` (`email`);

--
-- Indexes for table `member_password_resets`
--
ALTER TABLE `member_password_resets`
  ADD KEY `member_password_resets_email_index` (`email`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_code_unique` (`code`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `page_languages`
--
ALTER TABLE `page_languages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `page_languages_page_id_language_unique` (`page_id`,`language`),
  ADD KEY `page_languages_language_index` (`language`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_unique` (`name`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_role_id_foreign` (`role_id`);

--
-- Indexes for table `photos`
--
ALTER TABLE `photos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `photo_languages`
--
ALTER TABLE `photo_languages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `photo_languages_photo_id_language_unique` (`photo_id`,`language`),
  ADD KEY `photo_languages_language_index` (`language`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_category_id_foreign` (`category_id`),
  ADD KEY `posts_user_id_foreign` (`user_id`);

--
-- Indexes for table `post_attribute`
--
ALTER TABLE `post_attribute`
  ADD KEY `post_attribute_post_id_foreign` (`post_id`),
  ADD KEY `post_attribute_attribute_id_foreign` (`attribute_id`);

--
-- Indexes for table `post_languages`
--
ALTER TABLE `post_languages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `post_languages_post_id_language_unique` (`post_id`,`language`),
  ADD KEY `post_languages_language_index` (`language`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_code_unique` (`code`),
  ADD KEY `products_supplier_id_foreign` (`supplier_id`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_user_id_foreign` (`user_id`);

--
-- Indexes for table `product_attribute`
--
ALTER TABLE `product_attribute`
  ADD KEY `product_attribute_product_id_foreign` (`product_id`),
  ADD KEY `product_attribute_attribute_id_foreign` (`attribute_id`);

--
-- Indexes for table `product_languages`
--
ALTER TABLE `product_languages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_languages_product_id_language_unique` (`product_id`,`language`),
  ADD KEY `product_languages_language_index` (`language`);

--
-- Indexes for table `registers`
--
ALTER TABLE `registers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `role_user_role_id_foreign` (`role_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `suppliers_code_unique` (`code`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_group`
--
ALTER TABLE `user_group`
  ADD KEY `user_group_user_id_foreign` (`user_id`),
  ADD KEY `user_group_group_id_foreign` (`group_id`);

--
-- Indexes for table `wms_exports`
--
ALTER TABLE `wms_exports`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `wms_exports_code_unique` (`code`);

--
-- Indexes for table `wms_imports`
--
ALTER TABLE `wms_imports`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `wms_imports_code_unique` (`code`);

--
-- Indexes for table `wms_stores`
--
ALTER TABLE `wms_stores`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `wms_stores_code_unique` (`code`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `attribute_languages`
--
ALTER TABLE `attribute_languages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `category_languages`
--
ALTER TABLE `category_languages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `links`
--
ALTER TABLE `links`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `link_languages`
--
ALTER TABLE `link_languages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `media_libraries`
--
ALTER TABLE `media_libraries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `page_languages`
--
ALTER TABLE `page_languages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `photos`
--
ALTER TABLE `photos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `photo_languages`
--
ALTER TABLE `photo_languages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT for table `post_languages`
--
ALTER TABLE `post_languages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `product_languages`
--
ALTER TABLE `product_languages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;
--
-- AUTO_INCREMENT for table `registers`
--
ALTER TABLE `registers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `wms_exports`
--
ALTER TABLE `wms_exports`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wms_imports`
--
ALTER TABLE `wms_imports`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wms_stores`
--
ALTER TABLE `wms_stores`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `attribute_languages`
--
ALTER TABLE `attribute_languages`
  ADD CONSTRAINT `attribute_languages_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `category_languages`
--
ALTER TABLE `category_languages`
  ADD CONSTRAINT `category_languages_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_member_id_foreign` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comments_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `link_languages`
--
ALTER TABLE `link_languages`
  ADD CONSTRAINT `link_languages_link_id_foreign` FOREIGN KEY (`link_id`) REFERENCES `links` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `page_languages`
--
ALTER TABLE `page_languages`
  ADD CONSTRAINT `page_languages_page_id_foreign` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `photo_languages`
--
ALTER TABLE `photo_languages`
  ADD CONSTRAINT `photo_languages_photo_id_foreign` FOREIGN KEY (`photo_id`) REFERENCES `photos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `post_attribute`
--
ALTER TABLE `post_attribute`
  ADD CONSTRAINT `post_attribute_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `post_attribute_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `post_languages`
--
ALTER TABLE `post_languages`
  ADD CONSTRAINT `post_languages_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `products_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_attribute`
--
ALTER TABLE `product_attribute`
  ADD CONSTRAINT `product_attribute_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_attribute_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `product_languages`
--
ALTER TABLE `product_languages`
  ADD CONSTRAINT `product_languages_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_group`
--
ALTER TABLE `user_group`
  ADD CONSTRAINT `user_group_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_group_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
