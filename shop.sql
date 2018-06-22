-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 22, 2018 lúc 07:23 PM
-- Phiên bản máy phục vụ: 10.1.30-MariaDB
-- Phiên bản PHP: 5.6.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `shop`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `attributes`
--

CREATE TABLE `attributes` (
  `id` int(10) UNSIGNED NOT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `regular_price` double NOT NULL DEFAULT '0',
  `sale_price` double NOT NULL DEFAULT '0',
  `priority` int(11) NOT NULL DEFAULT '1',
  `status` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `attributes`
--

INSERT INTO `attributes` (`id`, `value`, `regular_price`, `sale_price`, `priority`, `status`, `type`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, '#ffffff', 0, 0, 1, 'publish', 'product_colors', NULL, '2018-06-19 14:38:00', '2018-06-19 14:38:00'),
(2, '#291d9a', 0, 0, 1, 'publish', 'product_colors', NULL, '2018-06-19 14:38:17', '2018-06-19 14:38:17'),
(3, '#ffff00', 0, 0, 1, 'publish', 'product_colors', NULL, '2018-06-19 14:38:28', '2018-06-19 14:38:28'),
(4, '#ff0000', 0, 0, 1, 'publish', 'product_colors', NULL, '2018-06-19 14:38:35', '2018-06-19 14:38:35'),
(5, NULL, 0, 0, 1, 'publish', 'product_sizes', NULL, '2018-06-19 14:38:42', '2018-06-19 14:38:42'),
(6, NULL, 0, 0, 1, 'publish', 'product_sizes', NULL, '2018-06-19 14:38:47', '2018-06-19 14:38:47'),
(7, NULL, 0, 0, 1, 'publish', 'product_sizes', NULL, '2018-06-19 14:38:51', '2018-06-19 14:38:51'),
(8, NULL, 0, 0, 1, 'publish', 'product_sizes', NULL, '2018-06-19 14:38:55', '2018-06-19 14:38:55');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `attribute_languages`
--

CREATE TABLE `attribute_languages` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribute_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `attribute_languages`
--

INSERT INTO `attribute_languages` (`id`, `title`, `slug`, `language`, `attribute_id`) VALUES
(1, 'Trắng', 'trang', 'vi', 1),
(2, 'Xanh', 'xanh', 'vi', 2),
(3, 'Vàng', 'vang', 'vi', 3),
(4, 'Đỏ', 'do', 'vi', 4),
(5, 'M', 'm', 'vi', 5),
(6, 'S', 's', 'vi', 6),
(7, 'XL', 'xl', 'vi', 7),
(8, 'XXL', 'xxl', 'vi', 8);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
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
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `parent`, `image`, `alt`, `icon`, `priority`, `status`, `type`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 0, NULL, NULL, NULL, 0, 'publish', 'default', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category_languages`
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
-- Đang đổ dữ liệu cho bảng `category_languages`
--

INSERT INTO `category_languages` (`id`, `title`, `slug`, `description`, `contents`, `meta_seo`, `language`, `category_id`) VALUES
(1, 'Uncategorized', 'uncategorized', NULL, NULL, NULL, 'vi', 1),
(2, 'Uncategorized', 'uncategorized', NULL, NULL, NULL, 'en', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `comments`
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
-- Cấu trúc bảng cho bảng `coupons`
--

CREATE TABLE `coupons` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `coupon_amount` double NOT NULL DEFAULT '0',
  `number_of_uses` int(11) NOT NULL DEFAULT '0',
  `min_restriction_amount` double NOT NULL DEFAULT '0',
  `max_restriction_amount` double NOT NULL DEFAULT '0',
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
-- Cấu trúc bảng cho bảng `groups`
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
-- Cấu trúc bảng cho bảng `jobs`
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
-- Cấu trúc bảng cho bảng `links`
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
-- Cấu trúc bảng cho bảng `link_languages`
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
-- Cấu trúc bảng cho bảng `media_libraries`
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
-- Cấu trúc bảng cho bảng `members`
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
  `oauth_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `oauth_provider` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT '1',
  `status` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `member_password_resets`
--

CREATE TABLE `member_password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
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
(34, '2018_03_16_014803_create_jobs_table', 1),
(35, '2018_06_19_205106_create_wms_import_details_table', 1),
(36, '2018_06_19_211210_create_wms_export_details_table', 1),
(37, '2018_06_19_211448_create_order_details_table', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `coupon_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `coupon_amount` int(11) NOT NULL DEFAULT '0',
  `shipping` int(11) NOT NULL DEFAULT '0',
  `subtotal` double NOT NULL DEFAULT '0',
  `order_qty` int(11) NOT NULL DEFAULT '0',
  `order_price` double NOT NULL DEFAULT '0',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `district_id` int(11) NOT NULL DEFAULT '0',
  `province_id` int(11) NOT NULL DEFAULT '0',
  `payment_id` int(10) NOT NULL DEFAULT '0',
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

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `code`, `coupon_code`, `coupon_amount`, `shipping`, `subtotal`, `order_qty`, `order_price`, `name`, `phone`, `email`, `address`, `note`, `district_id`, `province_id`, `payment_id`, `member_id`, `user_id`, `status_id`, `priority`, `status`, `type`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'DH00001', NULL, 0, 30000, 2900000, 10, 2930000, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, NULL, 1, 2, 1, 'publish', 'online', NULL, '2018-06-21 16:46:33', '2018-06-21 17:37:31'),
(2, 'DH00002', NULL, 10000, 30000, 8700000, 30, 8720000, NULL, NULL, NULL, NULL, NULL, 0, 0, 3, NULL, 1, 1, 1, 'publish', 'online', NULL, '2018-06-21 17:49:33', '2018-06-22 16:03:58');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_details`
--

CREATE TABLE `order_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_qty` int(11) NOT NULL DEFAULT '0',
  `product_price` double NOT NULL DEFAULT '0',
  `size_id` int(11) NOT NULL DEFAULT '0',
  `size_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color_id` int(11) NOT NULL DEFAULT '0',
  `color_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_id` int(10) UNSIGNED NOT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `order_details`
--

INSERT INTO `order_details` (`id`, `product_id`, `product_code`, `product_title`, `product_qty`, `product_price`, `size_id`, `size_title`, `color_id`, `color_title`, `order_id`, `status`) VALUES
(13, 20, '523', 'Dr. Rosamond Johns IV - Đỏ - XXL', 10, 290000, 8, 'XXL', 4, 'Đỏ', 1, 'publish'),
(44, 20, '523', 'Dr. Rosamond Johns IV - Đỏ - XXL', 10, 290000, 8, 'XXL', 4, 'Đỏ', 2, 'publish'),
(45, 17, '2483', 'Alize Schimmel II - Vàng - XL', 10, 290000, 7, 'XL', 3, 'Vàng', 2, 'publish'),
(46, 17, '2483', 'Alize Schimmel II - Đỏ - XXL', 10, 290000, 8, 'XXL', 4, 'Đỏ', 2, 'publish');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `pages`
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
-- Đang đổ dữ liệu cho bảng `pages`
--

INSERT INTO `pages` (`id`, `link`, `image`, `alt`, `priority`, `status`, `type`, `viewed`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, NULL, 1, 'publish', 'gioi-thieu', 0, NULL, NULL, NULL),
(2, NULL, NULL, NULL, 1, 'publish', 'tuyen-dung', 0, NULL, NULL, NULL),
(3, NULL, NULL, NULL, 1, 'publish', 'lien-he', 0, NULL, NULL, NULL),
(4, NULL, NULL, NULL, 1, 'publish', 'footer', 0, NULL, NULL, NULL),
(5, NULL, NULL, NULL, 1, 'publish', 'index', 0, NULL, '2018-06-22 15:26:57', '2018-06-22 15:26:57');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `page_languages`
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
-- Đang đổ dữ liệu cho bảng `page_languages`
--

INSERT INTO `page_languages` (`id`, `title`, `slug`, `description`, `contents`, `meta_seo`, `language`, `page_id`) VALUES
(1, 'Giới thiệu', 'gioi-thieu', NULL, NULL, NULL, 'vi', 1),
(2, 'Giới thiệu', 'gioi-thieu', NULL, NULL, NULL, 'en', 1),
(3, 'Tuyển dụng', 'tuyen-dung', NULL, NULL, NULL, 'vi', 2),
(4, 'Tuyển dụng', 'tuyen-dung', NULL, NULL, NULL, 'en', 2),
(5, 'Liên hệ', 'lien-he', NULL, NULL, NULL, 'vi', 3),
(6, 'Liên hệ', 'lien-he', NULL, NULL, NULL, 'en', 3),
(7, 'Footer', 'footer', NULL, NULL, NULL, 'vi', 4),
(8, 'Footer', 'footer', NULL, NULL, NULL, 'en', 4),
(9, 'Trang chủ', 'trang-chu', NULL, NULL, '{\"title\":null,\"keywords\":null,\"description\":null}', 'vi', 5);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `permissions`
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
-- Cấu trúc bảng cho bảng `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `photos`
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
-- Cấu trúc bảng cho bảng `photo_languages`
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
-- Cấu trúc bảng cho bảng `posts`
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
-- Đang đổ dữ liệu cho bảng `posts`
--

INSERT INTO `posts` (`id`, `link`, `image`, `alt`, `attachments`, `priority`, `status`, `category_id`, `user_id`, `type`, `viewed`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, NULL, NULL, 1, 'publish', 1, 1, 'tin-tuc', 0, NULL, '2018-06-19 14:23:56', '2018-06-19 14:23:56'),
(2, NULL, NULL, NULL, NULL, 1, 'publish', 1, 1, 'tin-tuc', 0, NULL, '2018-06-19 14:23:56', '2018-06-19 14:23:56'),
(3, NULL, NULL, NULL, NULL, 1, 'publish', 1, 1, 'tin-tuc', 0, NULL, '2018-06-19 14:23:56', '2018-06-19 14:23:56'),
(4, NULL, NULL, NULL, NULL, 1, 'publish', 1, 1, 'tin-tuc', 0, NULL, '2018-06-19 14:23:56', '2018-06-19 14:23:56'),
(5, NULL, NULL, NULL, NULL, 1, 'publish', 1, 1, 'tin-tuc', 0, NULL, '2018-06-19 14:23:56', '2018-06-19 14:23:56'),
(6, NULL, NULL, NULL, NULL, 1, 'publish', 1, 1, 'tin-tuc', 0, NULL, '2018-06-19 14:23:56', '2018-06-19 14:23:56'),
(7, NULL, NULL, NULL, NULL, 1, 'publish', 1, 1, 'tin-tuc', 0, NULL, '2018-06-19 14:23:56', '2018-06-19 14:23:56'),
(8, NULL, NULL, NULL, NULL, 1, 'publish', 1, 1, 'tin-tuc', 0, NULL, '2018-06-19 14:23:56', '2018-06-19 14:23:56'),
(9, NULL, NULL, NULL, NULL, 1, 'publish', 1, 1, 'tin-tuc', 0, NULL, '2018-06-19 14:23:56', '2018-06-19 14:23:56'),
(10, NULL, NULL, NULL, NULL, 1, 'publish', 1, 1, 'tin-tuc', 0, NULL, '2018-06-19 14:23:56', '2018-06-19 14:23:56'),
(11, NULL, NULL, NULL, NULL, 1, 'publish', 1, 1, 'tin-tuc', 0, NULL, '2018-06-19 14:23:56', '2018-06-19 14:23:56'),
(12, NULL, NULL, NULL, NULL, 1, 'publish', 1, 1, 'tin-tuc', 0, NULL, '2018-06-19 14:23:56', '2018-06-19 14:23:56'),
(13, NULL, NULL, NULL, NULL, 1, 'publish', 1, 1, 'tin-tuc', 0, NULL, '2018-06-19 14:23:56', '2018-06-19 14:23:56'),
(14, NULL, NULL, NULL, NULL, 1, 'publish', 1, 1, 'tin-tuc', 0, NULL, '2018-06-19 14:23:56', '2018-06-19 14:23:56'),
(15, NULL, NULL, NULL, NULL, 1, 'publish', 1, 1, 'tin-tuc', 0, NULL, '2018-06-19 14:23:56', '2018-06-19 14:23:56'),
(16, NULL, NULL, NULL, NULL, 1, 'publish', 1, 1, 'tin-tuc', 0, NULL, '2018-06-19 14:23:56', '2018-06-19 14:23:56'),
(17, NULL, NULL, NULL, NULL, 1, 'publish', 1, 1, 'tin-tuc', 0, NULL, '2018-06-19 14:23:56', '2018-06-19 14:23:56'),
(18, NULL, NULL, NULL, NULL, 1, 'publish', 1, 1, 'tin-tuc', 0, NULL, '2018-06-19 14:23:56', '2018-06-19 14:23:56'),
(19, NULL, NULL, NULL, NULL, 1, 'publish', 1, 1, 'tin-tuc', 0, NULL, '2018-06-19 14:23:56', '2018-06-19 14:23:56'),
(20, NULL, NULL, NULL, NULL, 1, 'publish', 1, 1, 'tin-tuc', 0, NULL, '2018-06-19 14:23:56', '2018-06-19 14:23:56');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `post_attribute`
--

CREATE TABLE `post_attribute` (
  `post_id` int(10) UNSIGNED NOT NULL,
  `attribute_id` int(10) UNSIGNED NOT NULL,
  `option` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `post_languages`
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
-- Đang đổ dữ liệu cho bảng `post_languages`
--

INSERT INTO `post_languages` (`id`, `title`, `slug`, `description`, `contents`, `attributes`, `meta_seo`, `language`, `post_id`) VALUES
(1, 'Danielle Rowe', 'danielle-rowe', 'Animi est quis ea atque ea atque. Cupiditate placeat et quae ex. Exercitationem molestiae rerum quia magni voluptatem labore autem.', 'Libero provident doloremque sequi optio iure velit. Inventore occaecati animi doloribus qui. Ullam aspernatur culpa enim molestias quia magnam distinctio. Molestiae sed iure dignissimos distinctio quisquam magni.', NULL, '{\"title\":\"Danielle Rowe\",\"keywords\":\"Danielle Rowe\",\"description\":\"Danielle Rowe\"}', 'vi', 1),
(2, 'Robert Purdy', 'robert-purdy', 'Autem tenetur occaecati sequi. Optio in rerum quibusdam illo magni quo ad assumenda. Quia molestiae perferendis vel enim. Tempora et sit aut maxime et dolore mollitia.', 'Cupiditate omnis praesentium rem qui voluptatem. Aut autem corporis non amet omnis nesciunt sed. Deleniti corporis dolor culpa labore ut eum est nostrum. Necessitatibus rerum est veniam ab autem.', NULL, '{\"title\":\"Robert Purdy\",\"keywords\":\"Robert Purdy\",\"description\":\"Robert Purdy\"}', 'en', 1),
(3, 'Candice Jaskolski Sr.', 'candice-jaskolski-sr', 'Blanditiis et eligendi vitae. Quia non explicabo sunt dolorem incidunt sed qui nesciunt. Vel vel quod optio qui autem eius similique. Aut aperiam ut fugiat qui quibusdam sit.', 'Iure vel laudantium aut debitis iste voluptate. Aspernatur sunt ad quibusdam saepe consequuntur. Qui temporibus ullam amet quae nostrum alias.', NULL, '{\"title\":\"Candice Jaskolski Sr.\",\"keywords\":\"Candice Jaskolski Sr.\",\"description\":\"Candice Jaskolski Sr.\"}', 'vi', 2),
(4, 'Hassie Schulist I', 'hassie-schulist-i', 'Debitis et nobis vitae qui. Nisi quisquam earum et harum aut dolor rerum. Eveniet maxime culpa optio suscipit. Laborum et non nemo quia quas dolores. Vel ut nulla ea eveniet laborum architecto.', 'Beatae odit dolores veniam excepturi. Rerum excepturi ad eum qui delectus quis. Sed labore est placeat a eius natus. Neque deserunt facere rem enim laboriosam magnam quis.', NULL, '{\"title\":\"Hassie Schulist I\",\"keywords\":\"Hassie Schulist I\",\"description\":\"Hassie Schulist I\"}', 'en', 2),
(5, 'Dr. Hilma Gutkowski', 'dr-hilma-gutkowski', 'Perspiciatis repudiandae est accusantium saepe sint vel. Et quod eaque eaque. Dignissimos inventore exercitationem iste sit odio.', 'Repudiandae minus aut eos accusantium alias soluta sit. Aliquam blanditiis corporis laboriosam ea esse. Eum quia ullam eos maxime cupiditate aspernatur eaque.', NULL, '{\"title\":\"Dr. Hilma Gutkowski\",\"keywords\":\"Dr. Hilma Gutkowski\",\"description\":\"Dr. Hilma Gutkowski\"}', 'vi', 3),
(6, 'Prof. Kelly Schimmel', 'prof-kelly-schimmel', 'Fugiat doloremque non ipsum omnis doloremque. Nostrum accusantium dolor laudantium quia consequatur repellat. Modi doloribus voluptatem et qui magni animi.', 'Maxime sunt voluptate deleniti laborum dolorem quod. Nobis molestiae odio sequi et. Est suscipit cupiditate quam nisi atque. Odio dicta necessitatibus laudantium non labore voluptatem ut consequatur.', NULL, '{\"title\":\"Prof. Kelly Schimmel\",\"keywords\":\"Prof. Kelly Schimmel\",\"description\":\"Prof. Kelly Schimmel\"}', 'en', 3),
(7, 'Mr. Wilmer Crona PhD', 'mr-wilmer-crona-phd', 'Praesentium et et non nobis tenetur assumenda aliquid. Facere exercitationem harum hic nobis. Eum aut consequatur placeat. Et ut repellat molestias dolorum ut minima commodi.', 'Autem sunt libero cumque doloremque impedit tempore. Dolorum et ut esse animi velit. Voluptatibus rerum assumenda quam.', NULL, '{\"title\":\"Mr. Wilmer Crona PhD\",\"keywords\":\"Mr. Wilmer Crona PhD\",\"description\":\"Mr. Wilmer Crona PhD\"}', 'vi', 4),
(8, 'Dr. Lauriane Beatty Jr.', 'dr-lauriane-beatty-jr', 'Id tenetur quasi accusamus. Praesentium qui aperiam ut ex. Illo cum nulla sit sit quis.', 'Voluptatem autem ut autem eius corrupti. Ad temporibus blanditiis est est explicabo laboriosam. Mollitia rerum odit alias velit cupiditate aut qui quidem. Voluptatem sunt culpa mollitia nisi.', NULL, '{\"title\":\"Dr. Lauriane Beatty Jr.\",\"keywords\":\"Dr. Lauriane Beatty Jr.\",\"description\":\"Dr. Lauriane Beatty Jr.\"}', 'en', 4),
(9, 'Floy Kutch II', 'floy-kutch-ii', 'Asperiores aliquam tempora qui. Repellat aut eos odit et. Cupiditate placeat sit numquam provident quia sit.', 'Reprehenderit enim quia iure repellendus. Eos quod amet error explicabo repudiandae est. Amet rerum rerum unde cupiditate natus et. Enim ut beatae iste molestias soluta. Quia eaque ducimus enim totam ea.', NULL, '{\"title\":\"Floy Kutch II\",\"keywords\":\"Floy Kutch II\",\"description\":\"Floy Kutch II\"}', 'vi', 5),
(10, 'Julia Davis', 'julia-davis', 'Suscipit cupiditate assumenda eius est et commodi. Facere eius provident quod dicta omnis quia. Esse aspernatur quam consequuntur qui.', 'Unde sit suscipit similique atque. Aut non aut dolorum ea modi voluptas. Suscipit ipsum nemo repudiandae ex. Dolore vero iste non cupiditate.', NULL, '{\"title\":\"Julia Davis\",\"keywords\":\"Julia Davis\",\"description\":\"Julia Davis\"}', 'en', 5),
(11, 'Asa McGlynn', 'asa-mcglynn', 'Et et exercitationem consectetur vero libero nisi praesentium voluptas. Et odio tempore iure ut. Enim labore rerum sed in sequi voluptas expedita.', 'Eveniet dignissimos qui distinctio libero debitis hic non sed. Praesentium molestiae dolor dolor. Dolor repellendus ipsum ipsa itaque et aut totam.', NULL, '{\"title\":\"Asa McGlynn\",\"keywords\":\"Asa McGlynn\",\"description\":\"Asa McGlynn\"}', 'vi', 6),
(12, 'Clark Feeney DDS', 'clark-feeney-dds', 'Corrupti sint libero officia asperiores sed et nesciunt eum. Tenetur quisquam expedita omnis sed sunt quo harum. Quo unde et dignissimos et quia qui. Qui pariatur et adipisci ea quia similique.', 'Praesentium saepe fuga commodi consequuntur recusandae voluptas corrupti. Quis mollitia rerum magnam harum nostrum exercitationem in. Ut officiis et qui eligendi asperiores dolores a illum. Rerum autem rem aut voluptates optio.', NULL, '{\"title\":\"Clark Feeney DDS\",\"keywords\":\"Clark Feeney DDS\",\"description\":\"Clark Feeney DDS\"}', 'en', 6),
(13, 'Marietta Dietrich', 'marietta-dietrich', 'Quisquam soluta accusantium dignissimos ex quo ullam. Voluptate fuga aut et culpa est rerum earum. Fugit nisi fuga quam laborum atque repudiandae nihil.', 'Rerum rerum nulla aspernatur vitae eum exercitationem veritatis. Expedita ea est nulla aliquid eveniet libero fuga. Ullam totam dolorem beatae rerum.', NULL, '{\"title\":\"Marietta Dietrich\",\"keywords\":\"Marietta Dietrich\",\"description\":\"Marietta Dietrich\"}', 'vi', 7),
(14, 'Mr. Dustin Bailey', 'mr-dustin-bailey', 'Est assumenda iusto omnis. Eos nemo dolor possimus aut dolorem. Culpa quidem saepe itaque id. Quaerat qui quia placeat.', 'Officia quaerat aut inventore asperiores ducimus dolores dolores. Vero maiores labore labore amet aut. Quasi dolor et ullam non sequi.', NULL, '{\"title\":\"Mr. Dustin Bailey\",\"keywords\":\"Mr. Dustin Bailey\",\"description\":\"Mr. Dustin Bailey\"}', 'en', 7),
(15, 'Emmitt Goldner', 'emmitt-goldner', 'Et provident omnis labore. Qui ratione eaque eos libero.', 'Quia voluptatum corrupti quis dolorem. Natus quaerat et possimus sed id est saepe. Optio architecto eos sapiente sint voluptas mollitia sequi. Similique et maiores perferendis ipsa est nam voluptates molestiae.', NULL, '{\"title\":\"Emmitt Goldner\",\"keywords\":\"Emmitt Goldner\",\"description\":\"Emmitt Goldner\"}', 'vi', 8),
(16, 'Dr. Alford Wisozk II', 'dr-alford-wisozk-ii', 'Laboriosam quo aut dolor. Quos id beatae et omnis cupiditate. Eos architecto maxime ratione quasi est corrupti quae.', 'Placeat hic distinctio ullam quia exercitationem incidunt. Sed autem beatae molestias occaecati perferendis.', NULL, '{\"title\":\"Dr. Alford Wisozk II\",\"keywords\":\"Dr. Alford Wisozk II\",\"description\":\"Dr. Alford Wisozk II\"}', 'en', 8),
(17, 'Shanny Baumbach Sr.', 'shanny-baumbach-sr', 'Voluptate quas omnis quis sed illo est. Et praesentium similique eveniet rerum. In aut repellat voluptas sed enim. Ratione non tenetur at et iusto placeat ex.', 'Ipsam rerum et cupiditate voluptas vel. Non aut ut deleniti aut ut cum facere laudantium. Debitis corrupti omnis modi minus. Minima modi est sint eum non.', NULL, '{\"title\":\"Shanny Baumbach Sr.\",\"keywords\":\"Shanny Baumbach Sr.\",\"description\":\"Shanny Baumbach Sr.\"}', 'vi', 9),
(18, 'Jean Rutherford III', 'jean-rutherford-iii', 'Mollitia et sunt deserunt est eveniet. Occaecati ad quam voluptatum impedit sed harum ut. Voluptas voluptatem tempore neque quia. Temporibus eum doloremque beatae eius.', 'Sunt necessitatibus id laboriosam. Inventore doloribus ipsa molestiae sint voluptatum sunt sunt quia. Numquam repellendus animi error eos sint voluptates. Est et voluptas qui repudiandae sint.', NULL, '{\"title\":\"Jean Rutherford III\",\"keywords\":\"Jean Rutherford III\",\"description\":\"Jean Rutherford III\"}', 'en', 9),
(19, 'Miss Precious Nikolaus', 'miss-precious-nikolaus', 'Et architecto voluptatum porro velit id iste velit. Tenetur culpa ipsam rerum voluptates nulla ullam. Qui vitae in quibusdam vitae quos animi.', 'Ab qui quaerat sed et molestiae. Ut et voluptas officiis laboriosam dolor modi. Ut nam debitis totam et ex voluptatum. Qui dolorem veniam sed dolorem natus dolore voluptas.', NULL, '{\"title\":\"Miss Precious Nikolaus\",\"keywords\":\"Miss Precious Nikolaus\",\"description\":\"Miss Precious Nikolaus\"}', 'vi', 10),
(20, 'Ervin Rutherford', 'ervin-rutherford', 'Est possimus molestiae accusamus magnam dolorum sint perspiciatis. Dolorem quia aut deserunt fugiat consectetur. Aut sit illum ea rerum harum doloribus. Similique neque et quo numquam et.', 'Architecto assumenda omnis harum deserunt illo est aut. Dolor recusandae natus libero. Recusandae inventore dolorem voluptas est ex.', NULL, '{\"title\":\"Ervin Rutherford\",\"keywords\":\"Ervin Rutherford\",\"description\":\"Ervin Rutherford\"}', 'en', 10),
(21, 'Trevor Cormier', 'trevor-cormier', 'Voluptas aspernatur autem tempora qui quo debitis laboriosam. Quia accusamus molestias et odit repellendus et repellat.', 'Quod atque sunt et ea corporis omnis. Minus velit qui quam non iure voluptas. Est sed saepe voluptas quia sed.', NULL, '{\"title\":\"Trevor Cormier\",\"keywords\":\"Trevor Cormier\",\"description\":\"Trevor Cormier\"}', 'vi', 11),
(22, 'Nicolette Conroy', 'nicolette-conroy', 'Amet vero doloremque veritatis aliquid quibusdam minima quis. Et facere mollitia et accusamus. Maxime voluptatem neque quam architecto aut reiciendis magnam. Id sequi facere sit quo velit modi quasi.', 'Animi ad tempora perferendis architecto facere consectetur. Tempora sit ratione possimus eos quam fugiat a id. Nostrum praesentium nulla et quasi.', NULL, '{\"title\":\"Nicolette Conroy\",\"keywords\":\"Nicolette Conroy\",\"description\":\"Nicolette Conroy\"}', 'en', 11),
(23, 'Isom Jacobson', 'isom-jacobson', 'Nisi sunt unde quidem tempore. Nulla vel est dolorum est blanditiis. Beatae possimus reprehenderit aut.', 'Quam adipisci at voluptas reprehenderit illum recusandae doloribus. Ut sit officia et ea sequi sit hic. Sed debitis sed rem qui.', NULL, '{\"title\":\"Isom Jacobson\",\"keywords\":\"Isom Jacobson\",\"description\":\"Isom Jacobson\"}', 'vi', 12),
(24, 'Dr. Eduardo Champlin', 'dr-eduardo-champlin', 'Pariatur doloribus ut doloremque voluptas sed debitis. Esse qui veniam in. Fugiat veritatis similique quisquam velit et porro.', 'Voluptates at ad beatae voluptate eos rerum. Labore quos aut dolorum et magnam sit voluptas. Consequatur deleniti dolores praesentium vel harum. Sed sequi est corporis quo et quas et. Eaque fugiat distinctio recusandae temporibus dolorum voluptatum optio.', NULL, '{\"title\":\"Dr. Eduardo Champlin\",\"keywords\":\"Dr. Eduardo Champlin\",\"description\":\"Dr. Eduardo Champlin\"}', 'en', 12),
(25, 'Sibyl Littel V', 'sibyl-littel-v', 'Sit porro quo fugit rerum alias corrupti ut enim. Libero sed est autem quia quisquam officiis.', 'Facere porro illo molestiae aperiam quasi maiores quo. Labore eaque vitae tempora consequatur eaque. Labore voluptatem aut neque numquam quod ea consequatur.', NULL, '{\"title\":\"Sibyl Littel V\",\"keywords\":\"Sibyl Littel V\",\"description\":\"Sibyl Littel V\"}', 'vi', 13),
(26, 'America Runolfsson', 'america-runolfsson', 'Eos et necessitatibus ut consequuntur deserunt. Quis provident dolores nihil sed qui voluptatem ullam. Necessitatibus eum voluptates sint distinctio quibusdam molestias ut.', 'Culpa sequi quia deserunt laudantium et. Porro voluptatem et qui qui molestias non.', NULL, '{\"title\":\"America Runolfsson\",\"keywords\":\"America Runolfsson\",\"description\":\"America Runolfsson\"}', 'en', 13),
(27, 'Mr. Erich Murray PhD', 'mr-erich-murray-phd', 'Eaque repellat sit beatae consequatur sed officiis velit qui. Dolorum labore tenetur at qui. Qui voluptas velit nam impedit. Illum explicabo consequuntur id doloremque quasi eligendi qui.', 'Nulla et rerum qui et eum voluptatem et. Amet et itaque fuga. Molestiae officia consequatur et et.', NULL, '{\"title\":\"Mr. Erich Murray PhD\",\"keywords\":\"Mr. Erich Murray PhD\",\"description\":\"Mr. Erich Murray PhD\"}', 'vi', 14),
(28, 'Cathryn Kassulke V', 'cathryn-kassulke-v', 'Dolor ex minus quo et aut occaecati. Eum architecto ratione et nisi. Velit suscipit maxime error sit deserunt. Reprehenderit nobis eum vero autem id assumenda quasi. Cupiditate aut ut itaque.', 'Eveniet quo ducimus consequuntur voluptatem. Placeat maxime modi rerum et. Consequatur tenetur deleniti esse est. Omnis enim fugit eveniet quos doloribus a ab.', NULL, '{\"title\":\"Cathryn Kassulke V\",\"keywords\":\"Cathryn Kassulke V\",\"description\":\"Cathryn Kassulke V\"}', 'en', 14),
(29, 'Eldon Lynch V', 'eldon-lynch-v', 'Nam labore maiores nihil sapiente deleniti voluptatibus. In alias laborum dolore praesentium dolores quam eos sint. Sed eveniet voluptatem qui facere et dolore.', 'Quibusdam ex culpa id inventore excepturi. In aut nihil error culpa maiores vel sed. Numquam enim qui et est quia dolorem nihil natus. Iure eligendi deserunt dolores qui omnis ut vel pariatur.', NULL, '{\"title\":\"Eldon Lynch V\",\"keywords\":\"Eldon Lynch V\",\"description\":\"Eldon Lynch V\"}', 'vi', 15),
(30, 'Gloria Hessel', 'gloria-hessel', 'Id suscipit et officiis et. Consectetur atque saepe eos architecto. Voluptatibus quos quia porro explicabo sed ut vitae. Deserunt et libero quis suscipit.', 'Maiores autem totam molestias sit quas sunt recusandae. Dolores reprehenderit quia non et sit. Doloribus et corrupti voluptatem voluptas non dolores.', NULL, '{\"title\":\"Gloria Hessel\",\"keywords\":\"Gloria Hessel\",\"description\":\"Gloria Hessel\"}', 'en', 15),
(31, 'Dr. Lorna Parker Jr.', 'dr-lorna-parker-jr', 'Deserunt illo consectetur debitis unde provident. Nostrum et iste velit ipsum quia dicta consequatur. Est occaecati voluptatibus ratione ipsum dolor quae amet.', 'Aspernatur quia fuga neque sed vitae repellendus nulla. Iure vitae suscipit eum molestias. Neque incidunt consequatur et ea et omnis. Fuga exercitationem reiciendis omnis quia aperiam nam voluptate.', NULL, '{\"title\":\"Dr. Lorna Parker Jr.\",\"keywords\":\"Dr. Lorna Parker Jr.\",\"description\":\"Dr. Lorna Parker Jr.\"}', 'vi', 16),
(32, 'Roger Jakubowski', 'roger-jakubowski', 'Hic impedit ratione blanditiis dolorum. Pariatur et dignissimos non. Repellendus et cupiditate et rem. Reiciendis delectus eaque qui numquam.', 'Animi a excepturi quisquam explicabo cupiditate sint quidem. Ipsam officia et optio dolor cumque ut nam fugit. Similique ullam reiciendis aut numquam quod. Sit saepe ut maiores ab enim.', NULL, '{\"title\":\"Roger Jakubowski\",\"keywords\":\"Roger Jakubowski\",\"description\":\"Roger Jakubowski\"}', 'en', 16),
(33, 'Dawson Franecki', 'dawson-franecki', 'Eos nemo dolorem laudantium dignissimos inventore. Sint quis culpa non possimus quisquam adipisci. Est voluptas eaque ea quia laudantium nisi. Qui officia quod repellat deserunt in ut.', 'Quasi aut autem dolores eveniet. Sed quod error voluptatum omnis repudiandae natus. Non quibusdam ut natus sequi modi sequi optio qui.', NULL, '{\"title\":\"Dawson Franecki\",\"keywords\":\"Dawson Franecki\",\"description\":\"Dawson Franecki\"}', 'vi', 17),
(34, 'Amparo Witting', 'amparo-witting', 'Est est labore provident eius nisi omnis. Ea sunt consequuntur odit quia accusantium. Animi rerum ut blanditiis et excepturi dolore quo. Quas ratione autem nulla vitae cumque error.', 'Molestiae animi aut ut inventore ea. Dolores qui eaque ducimus sed et earum libero accusantium. Officiis eos magnam voluptatum asperiores sit aut. Consequatur est at error accusantium.', NULL, '{\"title\":\"Amparo Witting\",\"keywords\":\"Amparo Witting\",\"description\":\"Amparo Witting\"}', 'en', 17),
(35, 'Gust Jaskolski', 'gust-jaskolski', 'Nulla et ad est odio dolor. Accusantium atque iste consequatur veniam et. Iusto voluptas non totam cupiditate.', 'Magni error ut repellat ipsam quos dolores sint dolorem. Iusto inventore et aliquam modi doloremque. Quia quis at eum impedit natus at a in.', NULL, '{\"title\":\"Gust Jaskolski\",\"keywords\":\"Gust Jaskolski\",\"description\":\"Gust Jaskolski\"}', 'vi', 18),
(36, 'Prof. Kendrick Huel', 'prof-kendrick-huel', 'Aut natus doloremque ipsum. Cupiditate ea velit eos ipsam et. Unde beatae accusamus nobis.', 'Voluptatem eum ad at expedita rerum. Beatae ut veritatis fugiat voluptas eos. In sequi at vel cumque ad nihil libero.', NULL, '{\"title\":\"Prof. Kendrick Huel\",\"keywords\":\"Prof. Kendrick Huel\",\"description\":\"Prof. Kendrick Huel\"}', 'en', 18),
(37, 'Mrs. Kavon Upton II', 'mrs-kavon-upton-ii', 'Et sit blanditiis necessitatibus aut quia voluptatem et sapiente. Possimus quo eum reiciendis qui. Quam aliquid maxime et a voluptates modi ut.', 'Est magnam sapiente tempore ut magnam. Explicabo neque dolor minima ut sunt dolores. Et dolorem harum maxime omnis quaerat officiis. Et voluptas eos asperiores optio libero aut quae.', NULL, '{\"title\":\"Mrs. Kavon Upton II\",\"keywords\":\"Mrs. Kavon Upton II\",\"description\":\"Mrs. Kavon Upton II\"}', 'vi', 19),
(38, 'Mr. Lonzo Baumbach I', 'mr-lonzo-baumbach-i', 'Aut vel ut eos iure. Necessitatibus illo placeat consequuntur animi ut. Et optio iure ipsum praesentium.', 'Error ad a quo assumenda. Unde rerum fugiat necessitatibus dolorum. Quis perferendis inventore voluptas labore aut sed. Soluta iste modi magnam saepe ut ad veniam.', NULL, '{\"title\":\"Mr. Lonzo Baumbach I\",\"keywords\":\"Mr. Lonzo Baumbach I\",\"description\":\"Mr. Lonzo Baumbach I\"}', 'en', 19),
(39, 'Lyla Bauch', 'lyla-bauch', 'Alias ad dolorum exercitationem culpa earum fugit labore. Quas aliquam eum error cum molestiae. In rerum voluptas ut necessitatibus sunt.', 'Quia voluptas velit dolorum et accusantium molestiae praesentium. Accusamus sit minima dignissimos ea a non. Et facilis est nam amet labore sint. Vitae ea natus dicta fugiat exercitationem rerum.', NULL, '{\"title\":\"Lyla Bauch\",\"keywords\":\"Lyla Bauch\",\"description\":\"Lyla Bauch\"}', 'vi', 20),
(40, 'Gennaro Predovic', 'gennaro-predovic', 'Sed perspiciatis vero aliquid reprehenderit iste eum. Impedit quia eligendi sed consequatur. Vel quisquam aut rerum a modi. Mollitia eaque laboriosam quidem eaque. Officia dolorum ut beatae.', 'Sit veritatis velit quasi sunt dolorem. Dolores atque repellat quibusdam consequatur aut voluptatem magnam exercitationem. Similique voluptates magni recusandae possimus non.', NULL, '{\"title\":\"Gennaro Predovic\",\"keywords\":\"Gennaro Predovic\",\"description\":\"Gennaro Predovic\"}', 'en', 20);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `regular_price` double NOT NULL DEFAULT '0',
  `sale_price` double NOT NULL DEFAULT '0',
  `original_price` double NOT NULL DEFAULT '0',
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
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `code`, `regular_price`, `sale_price`, `original_price`, `weight`, `link`, `image`, `alt`, `attachments`, `priority`, `status`, `supplier_id`, `category_id`, `user_id`, `type`, `viewed`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, '38907233', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-06-19 14:23:52', '2018-06-19 14:23:52'),
(2, '8', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-06-19 14:23:52', '2018-06-19 14:23:52'),
(3, '23779', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-06-19 14:23:53', '2018-06-19 14:23:53'),
(4, '881', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-06-19 14:23:53', '2018-06-19 14:23:53'),
(5, '976045037', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-06-19 14:23:53', '2018-06-19 14:23:53'),
(6, '2698924', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-06-19 14:23:53', '2018-06-19 14:23:53'),
(7, '66179726', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-06-19 14:23:53', '2018-06-19 14:23:53'),
(8, '564', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-06-19 14:23:53', '2018-06-19 14:23:53'),
(9, '834', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-06-19 14:23:53', '2018-06-19 14:23:53'),
(10, '9170051', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-06-19 14:23:53', '2018-06-19 14:23:53'),
(11, '44', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-06-19 14:23:53', '2018-06-19 14:23:53'),
(12, '4854', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-06-19 14:23:53', '2018-06-19 14:23:53'),
(13, '366520908', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-06-19 14:23:53', '2018-06-19 14:23:53'),
(14, '25108046', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-06-19 14:23:53', '2018-06-19 14:23:53'),
(15, '66065508', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-06-19 14:23:53', '2018-06-19 14:23:53'),
(16, '17', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-06-19 14:23:53', '2018-06-19 14:23:53'),
(17, '2483', 290000, 200000, 50000, 500, NULL, NULL, NULL, '', 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-06-19 14:23:53', '2018-06-19 14:39:34'),
(18, '1', 290000, 200000, 50000, 500, NULL, NULL, NULL, '', 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-06-19 14:23:53', '2018-06-19 14:39:23'),
(19, '7', 290000, 200000, 50000, 500, NULL, NULL, NULL, '', 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-06-19 14:23:53', '2018-06-19 14:39:11'),
(20, '523', 290000, 200000, 50000, 500, NULL, NULL, NULL, '', 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-06-19 14:23:53', '2018-06-22 16:03:18');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_attribute`
--

CREATE TABLE `product_attribute` (
  `product_id` int(10) UNSIGNED NOT NULL,
  `attribute_id` int(10) UNSIGNED NOT NULL,
  `option` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_attribute`
--

INSERT INTO `product_attribute` (`product_id`, `attribute_id`, `option`, `type`) VALUES
(20, 4, NULL, 'product_colors'),
(20, 3, NULL, 'product_colors'),
(20, 2, NULL, 'product_colors'),
(20, 1, NULL, 'product_colors'),
(20, 8, NULL, 'product_sizes'),
(20, 7, NULL, 'product_sizes'),
(20, 6, NULL, 'product_sizes'),
(20, 5, NULL, 'product_sizes'),
(19, 4, NULL, 'product_colors'),
(19, 3, NULL, 'product_colors'),
(19, 2, NULL, 'product_colors'),
(19, 1, NULL, 'product_colors'),
(19, 8, NULL, 'product_sizes'),
(19, 7, NULL, 'product_sizes'),
(19, 6, NULL, 'product_sizes'),
(19, 5, NULL, 'product_sizes'),
(18, 4, NULL, 'product_colors'),
(18, 3, NULL, 'product_colors'),
(18, 2, NULL, 'product_colors'),
(18, 1, NULL, 'product_colors'),
(18, 8, NULL, 'product_sizes'),
(18, 7, NULL, 'product_sizes'),
(18, 6, NULL, 'product_sizes'),
(18, 5, NULL, 'product_sizes'),
(17, 4, NULL, 'product_colors'),
(17, 3, NULL, 'product_colors'),
(17, 2, NULL, 'product_colors'),
(17, 1, NULL, 'product_colors'),
(17, 8, NULL, 'product_sizes'),
(17, 7, NULL, 'product_sizes'),
(17, 6, NULL, 'product_sizes'),
(17, 5, NULL, 'product_sizes');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_languages`
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
-- Đang đổ dữ liệu cho bảng `product_languages`
--

INSERT INTO `product_languages` (`id`, `title`, `slug`, `description`, `contents`, `attributes`, `meta_seo`, `language`, `product_id`) VALUES
(1, 'Paige O\'Conner I', 'paige-oconner-i', 'Voluptatem iusto qui ipsum et quod deleniti. Ipsam consequuntur occaecati et odio et. Tempore omnis voluptas molestiae. Aut porro molestiae illo.', 'Praesentium facilis temporibus labore dignissimos quas in. Sequi vero accusantium temporibus cupiditate corrupti. Praesentium sint voluptatem explicabo.', NULL, '{\"title\":\"Paige O\'Conner I\",\"keywords\":\"Paige O\'Conner I\",\"description\":\"Paige O\'Conner I\"}', 'vi', 1),
(2, 'Ronny Will IV', 'ronny-will-iv', 'Molestiae eius non non est. Sed ratione molestiae laboriosam sint exercitationem dignissimos. Velit similique illum ea qui ducimus assumenda.', 'Voluptas dolor beatae quisquam quos repellat. Architecto autem ut voluptatem facilis id libero. Nulla est consequatur voluptatem quo ut repudiandae.', NULL, '{\"title\":\"Ronny Will IV\",\"keywords\":\"Ronny Will IV\",\"description\":\"Ronny Will IV\"}', 'en', 1),
(3, 'Seth Champlin III', 'seth-champlin-iii', 'Magnam necessitatibus fuga dicta explicabo. Ut architecto ea omnis nulla maxime quod. Id magni quae fugiat molestiae debitis. Accusamus maxime facilis non neque sed id culpa commodi.', 'Doloremque natus est ipsa quo. Quidem est vel dicta consequatur id aut. Voluptatem placeat occaecati ea enim illo iure.', NULL, '{\"title\":\"Seth Champlin III\",\"keywords\":\"Seth Champlin III\",\"description\":\"Seth Champlin III\"}', 'vi', 2),
(4, 'Mrs. Otha Tillman MD', 'mrs-otha-tillman-md', 'Quam voluptates dignissimos distinctio non illum et fugiat aut. Ab sit provident et vero sit pariatur. Veniam harum ducimus sed facilis natus ut deleniti.', 'Consequatur quaerat qui libero. Et et aut dolores temporibus. Veritatis quidem aut quaerat doloremque ipsam.', NULL, '{\"title\":\"Mrs. Otha Tillman MD\",\"keywords\":\"Mrs. Otha Tillman MD\",\"description\":\"Mrs. Otha Tillman MD\"}', 'en', 2),
(5, 'Mr. Malcolm Hessel', 'mr-malcolm-hessel', 'Atque perferendis molestiae quibusdam voluptates. Ad et id quidem incidunt. Dolorem dolores voluptatem at autem mollitia excepturi iure. Reiciendis dolore earum sed placeat voluptas.', 'Ut sit nemo est et voluptatibus asperiores. Et ea necessitatibus iusto et autem. Quasi optio vero sequi tempora aut est natus. Repellat corporis quis dolores nostrum molestias.', NULL, '{\"title\":\"Mr. Malcolm Hessel\",\"keywords\":\"Mr. Malcolm Hessel\",\"description\":\"Mr. Malcolm Hessel\"}', 'vi', 3),
(6, 'Justine Satterfield', 'justine-satterfield', 'Ipsum voluptas mollitia commodi dolor. Voluptate tempora ut eos tempora rerum placeat facilis. Voluptatem tenetur reiciendis qui deserunt.', 'Nemo vel illum illo tempore enim et est. Nesciunt molestiae omnis in iste voluptas voluptatum molestiae libero. Aperiam dignissimos libero blanditiis voluptates a.', NULL, '{\"title\":\"Justine Satterfield\",\"keywords\":\"Justine Satterfield\",\"description\":\"Justine Satterfield\"}', 'en', 3),
(7, 'Wilburn Hessel', 'wilburn-hessel', 'Culpa molestias quo deleniti sit sint possimus. Veniam incidunt iste rerum labore quos laborum rem. Eveniet porro non dolores enim.', 'Eaque in eaque modi id. Commodi nam alias aut error enim commodi. Nihil saepe qui quis ullam vel.', NULL, '{\"title\":\"Wilburn Hessel\",\"keywords\":\"Wilburn Hessel\",\"description\":\"Wilburn Hessel\"}', 'vi', 4),
(8, 'Miss Eulah Sawayn', 'miss-eulah-sawayn', 'Dolor placeat dolores aliquam eligendi qui. Praesentium ipsam odit eum. Sed fuga qui iure. Voluptatum voluptatem quis nesciunt ut perspiciatis laudantium libero.', 'Et deserunt et alias est culpa repellat vel. Amet quidem consectetur provident cupiditate maiores optio. Aut occaecati autem perferendis tempore.', NULL, '{\"title\":\"Miss Eulah Sawayn\",\"keywords\":\"Miss Eulah Sawayn\",\"description\":\"Miss Eulah Sawayn\"}', 'en', 4),
(9, 'Milford Cassin', 'milford-cassin', 'Omnis quibusdam inventore consequuntur id dolorem. Aperiam incidunt consequatur iure consequatur labore magni. Aliquam velit vel repellendus ipsam.', 'Reiciendis vel qui sed suscipit omnis. Rem excepturi aspernatur dolorem ut asperiores omnis. Sunt provident voluptatibus molestiae fuga quae minus voluptates. Eos asperiores eum vel ut quod culpa eos.', NULL, '{\"title\":\"Milford Cassin\",\"keywords\":\"Milford Cassin\",\"description\":\"Milford Cassin\"}', 'vi', 5),
(10, 'Dr. Eli Spencer', 'dr-eli-spencer', 'Illo quos voluptatum placeat omnis in. Laudantium rerum dolor facere qui animi aut. At minus adipisci et cupiditate.', 'Ut dolores alias dignissimos dolores dolores cupiditate veniam fugit. Occaecati in voluptatem sit quia maxime voluptates. Accusamus quibusdam optio itaque quasi dolores repudiandae qui.', NULL, '{\"title\":\"Dr. Eli Spencer\",\"keywords\":\"Dr. Eli Spencer\",\"description\":\"Dr. Eli Spencer\"}', 'en', 5),
(11, 'Dr. Santos D\'Amore', 'dr-santos-damore', 'Autem possimus impedit iure repellendus nam laboriosam atque commodi. Vel quasi quos odit. Non illo aspernatur dolor provident id. Quo blanditiis labore quas hic unde dolorum.', 'Quo necessitatibus et vero ut aliquam vel ut. Earum soluta amet voluptatem quasi minus aut. Ipsum eveniet ut quo odit dolores aut quae. Placeat voluptatem debitis distinctio ut.', NULL, '{\"title\":\"Dr. Santos D\'Amore\",\"keywords\":\"Dr. Santos D\'Amore\",\"description\":\"Dr. Santos D\'Amore\"}', 'vi', 6),
(12, 'Christina Cruickshank I', 'christina-cruickshank-i', 'Libero incidunt aut quae consequatur. Rem incidunt vel magnam illo quia ut.', 'Aut deleniti rem saepe eum fugiat ducimus. Dicta voluptas error voluptatem assumenda vero sunt voluptatem. Debitis unde fuga fugit eos recusandae consequuntur beatae. Tempora impedit quia aperiam ut repudiandae et delectus.', NULL, '{\"title\":\"Christina Cruickshank I\",\"keywords\":\"Christina Cruickshank I\",\"description\":\"Christina Cruickshank I\"}', 'en', 6),
(13, 'Erik Yost', 'erik-yost', 'Earum debitis praesentium labore temporibus. Voluptatem reprehenderit consequatur delectus quia voluptatem est voluptatibus asperiores. Vel sit inventore corporis consequuntur quos distinctio.', 'Culpa et consequatur quia cumque voluptate eum molestiae. Totam quod velit quisquam tenetur excepturi. Est recusandae laborum voluptatum praesentium quia sit eos quia.', NULL, '{\"title\":\"Erik Yost\",\"keywords\":\"Erik Yost\",\"description\":\"Erik Yost\"}', 'vi', 7),
(14, 'Mr. Jan Flatley', 'mr-jan-flatley', 'Dolor quasi architecto recusandae saepe veniam. Harum quam architecto ratione ut culpa aliquid. Nobis et ullam eligendi voluptas occaecati.', 'Sit voluptas ut rerum sit cupiditate aut. Magni veniam assumenda consectetur similique quidem. Id beatae eum hic molestias. Et at enim sapiente consequatur.', NULL, '{\"title\":\"Mr. Jan Flatley\",\"keywords\":\"Mr. Jan Flatley\",\"description\":\"Mr. Jan Flatley\"}', 'en', 7),
(15, 'Hubert Weissnat', 'hubert-weissnat', 'Sunt voluptas ea vel ut debitis deserunt voluptatum quod. Exercitationem similique repudiandae modi reprehenderit sit magni. Veritatis aut qui sit quam reiciendis et.', 'Qui quo aliquid non quod voluptatem quo molestiae rerum. Reiciendis suscipit non aliquam qui asperiores exercitationem. Enim doloribus sit veniam consequuntur eos earum iure non. Nobis assumenda quo qui perferendis ut unde totam. Ea similique numquam sit et tempore.', NULL, '{\"title\":\"Hubert Weissnat\",\"keywords\":\"Hubert Weissnat\",\"description\":\"Hubert Weissnat\"}', 'vi', 8),
(16, 'Meghan Kihn', 'meghan-kihn', 'Occaecati aliquam nemo amet iure molestiae iste est. Sit alias deserunt deleniti aperiam vel facilis.', 'Tempore esse aliquam nesciunt architecto similique maiores architecto. Et distinctio quis velit accusantium. Est porro sequi optio quia nesciunt.', NULL, '{\"title\":\"Meghan Kihn\",\"keywords\":\"Meghan Kihn\",\"description\":\"Meghan Kihn\"}', 'en', 8),
(17, 'Arlene Tremblay', 'arlene-tremblay', 'Eius amet quia saepe sit dolorem. Quibusdam nisi sunt enim.', 'Nisi et est eos tempore necessitatibus. Ab vel ad repellendus. Quia voluptatibus odio veniam veritatis architecto quae accusamus molestiae.', NULL, '{\"title\":\"Arlene Tremblay\",\"keywords\":\"Arlene Tremblay\",\"description\":\"Arlene Tremblay\"}', 'vi', 9),
(18, 'Reese Runte', 'reese-runte', 'Delectus ut debitis dolor est. Fugit fugiat iusto excepturi explicabo quae aut. Labore harum natus minus molestiae eligendi. Odio quasi sunt accusantium earum ea ex qui.', 'Velit dignissimos veritatis debitis enim porro sint. Et et quidem mollitia sed blanditiis. Et dolor explicabo natus quo tenetur et inventore.', NULL, '{\"title\":\"Reese Runte\",\"keywords\":\"Reese Runte\",\"description\":\"Reese Runte\"}', 'en', 9),
(19, 'Ms. Santina Halvorson DVM', 'ms-santina-halvorson-dvm', 'Sed tenetur non eius. Accusamus dolore nesciunt facilis officiis. Ea ex aliquid itaque id et excepturi velit.', 'Est neque maiores et quia. Dolorem atque ut consequuntur quod nisi unde eligendi. Rerum eum voluptatibus neque non. Vel delectus placeat quibusdam iusto animi aut sunt.', NULL, '{\"title\":\"Ms. Santina Halvorson DVM\",\"keywords\":\"Ms. Santina Halvorson DVM\",\"description\":\"Ms. Santina Halvorson DVM\"}', 'vi', 10),
(20, 'Mr. Donny Heathcote DDS', 'mr-donny-heathcote-dds', 'Sequi repellat saepe ea. Laborum rerum odit et sed. Optio omnis dolorem dicta enim et soluta fugit. Pariatur non quis voluptatem eligendi nam optio. Sit provident aliquam error repudiandae.', 'Et nam assumenda voluptas est ut quia. Repellat quia ex enim voluptas similique vel libero. Facilis ipsam laborum sunt aut numquam nulla laboriosam. Enim soluta eaque sequi. Delectus doloremque voluptatum ut amet.', NULL, '{\"title\":\"Mr. Donny Heathcote DDS\",\"keywords\":\"Mr. Donny Heathcote DDS\",\"description\":\"Mr. Donny Heathcote DDS\"}', 'en', 10),
(21, 'Sheila Corwin', 'sheila-corwin', 'Dolores ipsum quo consequatur tenetur. Non eum est rerum est aut. Dolores consequatur sint qui aliquid. Maiores eligendi qui voluptas hic. Minima iure omnis hic officia consequatur aspernatur sunt.', 'Et aut officiis et minus sint molestiae ut. Et est ex labore corrupti culpa. Non molestiae voluptate et molestiae. Eum expedita quos dicta commodi dicta beatae occaecati placeat.', NULL, '{\"title\":\"Sheila Corwin\",\"keywords\":\"Sheila Corwin\",\"description\":\"Sheila Corwin\"}', 'vi', 11),
(22, 'Name Reinger', 'name-reinger', 'Et possimus adipisci voluptatem molestiae soluta est voluptatem. Voluptas dolorem consequuntur quam rerum eveniet. Error vel aperiam maxime dolor libero quo sunt.', 'Dolor voluptatem vitae porro suscipit. Ab incidunt dolore omnis sed. Ducimus inventore est autem. Mollitia ut quidem harum accusantium quod et ullam sit.', NULL, '{\"title\":\"Name Reinger\",\"keywords\":\"Name Reinger\",\"description\":\"Name Reinger\"}', 'en', 11),
(23, 'Mr. Dax Rippin', 'mr-dax-rippin', 'Nesciunt aut consectetur odio. Error rerum suscipit placeat corporis necessitatibus veniam voluptatum consequatur. Non quibusdam odio molestias illo sit ab. Labore doloremque eos quidem vel.', 'Eaque quia ratione corporis quia. Fugit sit ipsam blanditiis tempora necessitatibus. Id dolorem deleniti quis ipsum qui voluptatem. Quod neque quas placeat ut incidunt doloremque. Minus ea doloremque qui delectus blanditiis molestiae.', NULL, '{\"title\":\"Mr. Dax Rippin\",\"keywords\":\"Mr. Dax Rippin\",\"description\":\"Mr. Dax Rippin\"}', 'vi', 12),
(24, 'Eda Welch', 'eda-welch', 'A quaerat harum et et est. Laboriosam odit expedita veritatis sit. Eos aspernatur consequuntur cumque sapiente consequatur.', 'Dolores quisquam mollitia eos tempore reprehenderit sint. Sed pariatur commodi sapiente vero ea consequatur. Enim non aliquam odio rerum accusantium. Dolores quis incidunt non rerum magnam aut molestiae.', NULL, '{\"title\":\"Eda Welch\",\"keywords\":\"Eda Welch\",\"description\":\"Eda Welch\"}', 'en', 12),
(25, 'Jodie Feest', 'jodie-feest', 'Quidem iure a labore et ipsa. Aspernatur voluptates consequatur est. Est quam sed qui sed est nisi consequuntur.', 'Labore vitae ut laudantium et error. Enim sed numquam sint excepturi et inventore illum. Aperiam et sint asperiores suscipit necessitatibus aliquam odit magnam. Illum hic corrupti iure recusandae omnis.', NULL, '{\"title\":\"Jodie Feest\",\"keywords\":\"Jodie Feest\",\"description\":\"Jodie Feest\"}', 'vi', 13),
(26, 'Miss Laisha Mohr III', 'miss-laisha-mohr-iii', 'Sit excepturi adipisci eos eos. Id modi consequatur deleniti molestiae voluptatem.', 'Soluta voluptatem autem veritatis consequatur sed. Voluptatem et rem repudiandae eum enim inventore eos error. Libero eum non provident eum exercitationem rerum saepe. Saepe dolor officia eum ullam.', NULL, '{\"title\":\"Miss Laisha Mohr III\",\"keywords\":\"Miss Laisha Mohr III\",\"description\":\"Miss Laisha Mohr III\"}', 'en', 13),
(27, 'Dr. Jayde Goodwin', 'dr-jayde-goodwin', 'Voluptates quo voluptatem facilis. Facere illo ipsam voluptas modi velit neque dolores ullam. Atque delectus debitis praesentium nam dolorem.', 'Voluptas qui rerum tenetur libero animi necessitatibus voluptatem. Velit amet ipsa impedit id. Molestiae laudantium et minus quis nulla repellat aperiam ex. Accusantium porro consequuntur doloremque excepturi odio voluptatibus voluptatem.', NULL, '{\"title\":\"Dr. Jayde Goodwin\",\"keywords\":\"Dr. Jayde Goodwin\",\"description\":\"Dr. Jayde Goodwin\"}', 'vi', 14),
(28, 'Lydia Monahan', 'lydia-monahan', 'Sed voluptates deserunt molestiae quia sint. Fugiat et exercitationem porro qui enim optio iure. Ex occaecati laudantium nobis molestias quidem. Ea enim nihil voluptatem explicabo vitae magnam.', 'Corrupti odit ut aut ipsam. Facere nihil voluptatem repellat numquam. Quas magnam consequatur et sit cum. Ullam earum reiciendis ipsa beatae.', NULL, '{\"title\":\"Lydia Monahan\",\"keywords\":\"Lydia Monahan\",\"description\":\"Lydia Monahan\"}', 'en', 14),
(29, 'Ms. Lessie Schaden', 'ms-lessie-schaden', 'Possimus sed vitae et rerum atque. Necessitatibus iure vero omnis. Quod vel dolorem perspiciatis ut.', 'Culpa eos et quod ab sit. Architecto eaque odit aut. Vel velit enim quisquam enim. Soluta maxime porro incidunt enim.', NULL, '{\"title\":\"Ms. Lessie Schaden\",\"keywords\":\"Ms. Lessie Schaden\",\"description\":\"Ms. Lessie Schaden\"}', 'vi', 15),
(30, 'Marco Schinner', 'marco-schinner', 'Explicabo et aut quidem ut incidunt architecto. Corporis et similique quis neque fugiat. Natus atque corporis mollitia aliquam.', 'Doloremque maiores earum consequuntur itaque ea porro. Odit libero ut in. Adipisci sed et officiis inventore non.', NULL, '{\"title\":\"Marco Schinner\",\"keywords\":\"Marco Schinner\",\"description\":\"Marco Schinner\"}', 'en', 15),
(31, 'Natasha Gutmann Sr.', 'natasha-gutmann-sr', 'Sed commodi provident ut aut aut in ducimus. Omnis non aut eligendi occaecati voluptatem. Excepturi qui minima quo. Nam rerum voluptatem animi saepe placeat inventore veritatis aut.', 'Et provident laboriosam culpa similique iure quis quia. Aliquam repudiandae eius autem eum assumenda modi. Ipsa aliquid nemo laborum consequuntur blanditiis molestiae labore porro. Est esse ut veniam ut odio vitae occaecati.', NULL, '{\"title\":\"Natasha Gutmann Sr.\",\"keywords\":\"Natasha Gutmann Sr.\",\"description\":\"Natasha Gutmann Sr.\"}', 'vi', 16),
(32, 'Noble Nikolaus', 'noble-nikolaus', 'Sit suscipit repudiandae necessitatibus natus. Iste ab cupiditate at nostrum et placeat. Labore quia sit expedita ex laudantium iure.', 'Rerum suscipit vel provident error ut temporibus ipsam. Aut veritatis dolores laborum omnis vitae veritatis rerum est. Et ut quisquam similique nostrum omnis. Aperiam optio voluptates fugiat minus.', NULL, '{\"title\":\"Noble Nikolaus\",\"keywords\":\"Noble Nikolaus\",\"description\":\"Noble Nikolaus\"}', 'en', 16),
(33, 'Alize Schimmel II', 'alize-schimmel-ii', 'Error deleniti id eligendi saepe. Iure ut eum sed non quam magnam. Quis est adipisci est ex deserunt. Nulla alias veritatis aut ipsum quis doloribus.', '<p>Deleniti cumque ullam non repellendus. Laboriosam qui corrupti neque numquam laborum totam. Assumenda ea ea illo et.</p>', '[{\"name\":null,\"value\":null}]', '{\"title\":\"Alize Schimmel II\",\"keywords\":\"Alize Schimmel II\",\"description\":\"Alize Schimmel II\"}', 'vi', 17),
(34, 'Royce Howe', 'royce-howe', 'Eius consequatur vitae voluptatum placeat. Veritatis tempore mollitia modi numquam qui. Ut minima fugiat dolorem excepturi ullam.', 'Exercitationem a at libero reiciendis mollitia eum. Nulla sunt minima reiciendis eum corrupti. Ab et quaerat nam omnis. Et perspiciatis quo modi.', NULL, '{\"title\":\"Royce Howe\",\"keywords\":\"Royce Howe\",\"description\":\"Royce Howe\"}', 'en', 17),
(35, 'Deanna Leffler', 'deanna-leffler', 'Aut dolore velit sunt ipsum magnam illo. Pariatur eaque dolor iste. Vel iusto aut dolores facilis repudiandae tempore. Consequatur dolore aut et illum nobis omnis praesentium.', '<p>Voluptate temporibus illum architecto exercitationem eaque. Dicta sint non vel dicta. Iure praesentium consequuntur ut est qui qui. Hic cum harum quis neque.</p>', '[{\"name\":null,\"value\":null}]', '{\"title\":\"Deanna Leffler\",\"keywords\":\"Deanna Leffler\",\"description\":\"Deanna Leffler\"}', 'vi', 18),
(36, 'Russ Stark', 'russ-stark', 'Nobis vero occaecati ratione voluptates itaque quis. Mollitia nesciunt dolorem incidunt rerum. Iusto alias aut provident fugit voluptas.', 'Maxime unde minima dignissimos aut delectus perferendis. Doloribus sapiente sit qui ut. Reiciendis dicta quia tenetur distinctio dolorum aperiam non at. Qui molestias id illo qui quia voluptatem culpa.', NULL, '{\"title\":\"Russ Stark\",\"keywords\":\"Russ Stark\",\"description\":\"Russ Stark\"}', 'en', 18),
(37, 'Prof. Johnathon Kutch', 'prof-johnathon-kutch', 'Reprehenderit fugiat voluptatem iure. Voluptas et neque officiis magnam tempore. Eveniet aut quo amet ut ea eos. Eos architecto laborum sit vel.', '<p>Voluptatem dignissimos voluptatem sed enim et similique. Ad totam possimus quas illo. Eius repellat et deleniti eaque.</p>', '[{\"name\":null,\"value\":null}]', '{\"title\":\"Prof. Johnathon Kutch\",\"keywords\":\"Prof. Johnathon Kutch\",\"description\":\"Prof. Johnathon Kutch\"}', 'vi', 19),
(38, 'Art Shields', 'art-shields', 'Esse sunt fugit eius quaerat ut optio. Qui ut tempore tenetur molestiae dolor quae. Aut dolorem ut sed repellat ea. Quo iure voluptatem quia illo dolores inventore.', 'Et ipsam aliquid est dicta. Voluptatem hic saepe velit. Soluta est quo accusantium debitis in dolore qui. Doloremque eos impedit ratione sint quia voluptatem.', NULL, '{\"title\":\"Art Shields\",\"keywords\":\"Art Shields\",\"description\":\"Art Shields\"}', 'en', 19),
(39, 'Dr. Rosamond Johns IV', 'dr-rosamond-johns-iv', 'Vel eos tempora repellendus et earum ea cupiditate. Rerum voluptatibus veritatis facere qui. Magni est aspernatur ab sed quae.', '<p>Quaerat placeat asperiores rerum vero. Soluta quidem officiis magnam repellendus. Natus architecto dicta nihil commodi porro. Nam et quo accusantium perferendis.</p>', '[{\"name\":null,\"value\":null}]', '{\"title\":\"Dr. Rosamond Johns IV\",\"keywords\":\"Dr. Rosamond Johns IV\",\"description\":\"Dr. Rosamond Johns IV\"}', 'vi', 20),
(40, 'Dr. Macy Crooks', 'dr-macy-crooks', 'Et facilis quaerat incidunt commodi reprehenderit molestiae. Et autem error aperiam nulla repellat in a consequatur.', 'Sed et eligendi dolores modi animi non. Dolore dolor non sit dolorum dolores magnam. Facilis modi accusamus iusto sed quas. Eligendi qui fugiat autem aspernatur enim dignissimos vel.', NULL, '{\"title\":\"Dr. Macy Crooks\",\"keywords\":\"Dr. Macy Crooks\",\"description\":\"Dr. Macy Crooks\"}', 'en', 20);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `registers`
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

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
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
-- Đang đổ dữ liệu cho bảng `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `description`, `priority`, `status`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'Administrator', NULL, 1, 'publish', '2018-06-19 14:23:52', '2018-06-19 14:23:52'),
(2, 'san-pham', 'Sản phẩm', NULL, 1, 'publish', '2018-06-19 14:23:52', '2018-06-19 14:23:52'),
(3, 'sales', 'Bán hàng', NULL, 1, 'publish', '2018-06-19 14:23:52', '2018-06-19 14:23:52'),
(4, 'wms', 'Kho hàng', NULL, 1, 'publish', '2018-06-19 14:23:52', '2018-06-19 14:23:52'),
(5, 'tin-tuc', 'Tin tức', NULL, 1, 'publish', '2018-06-19 14:23:52', '2018-06-19 14:23:52'),
(6, 'dich-vu', 'Dịch vụ', NULL, 1, 'publish', '2018-06-19 14:23:52', '2018-06-19 14:23:52'),
(7, 'pages', 'Trang tĩnh', NULL, 1, 'publish', '2018-06-19 14:23:52', '2018-06-19 14:23:52'),
(8, 'photos', 'Hình ảnh', NULL, 1, 'publish', '2018-06-19 14:23:52', '2018-06-19 14:23:52'),
(9, 'links', 'Liên kết', NULL, 1, 'publish', '2018-06-19 14:23:52', '2018-06-19 14:23:52'),
(10, 'registers', 'Đăng ký', NULL, 1, 'publish', '2018-06-19 14:23:52', '2018-06-19 14:23:52');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `role_user`
--

CREATE TABLE `role_user` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `role_user`
--

INSERT INTO `role_user` (`user_id`, `role_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `settings`
--

INSERT INTO `settings` (`id`, `name`, `value`) VALUES
(1, 'maintenance', 'off'),
(2, 'language', 'vi'),
(3, 'date_custom_format', NULL),
(4, 'product_per_page', '10'),
(5, 'thumbs', '{\"product\":{\"_small\":{\"width\":\"400\",\"height\":\"400\"},\"_medium\":{\"width\":\"600\",\"height\":\"600\"},\"_large\":{\"width\":\"1000\",\"height\":\"1000\"}}}'),
(6, 'post_per_page', '9'),
(7, 'site_name', 'Shop'),
(8, 'site_slogan', NULL),
(9, 'site_address', NULL),
(10, 'site_email', NULL),
(11, 'site_phone', NULL),
(12, 'site_fax', NULL),
(13, 'site_hotline', NULL),
(14, 'site_url', NULL),
(15, 'site_copyright', NULL),
(16, 'fanpage', NULL),
(17, 'google_coordinates', NULL),
(18, 'email_host', 'smtp.gmail.com'),
(19, 'email_port', '587'),
(20, 'email_smtpsecure', 'tls'),
(21, 'email_username', 'khowebonline'),
(22, 'email_password', 'mqgyhrwbjrthvmun'),
(23, 'email_to', 'khowebonline@gmail.com'),
(24, 'email_cc', NULL),
(25, 'email_bcc', NULL),
(26, 'script_head', NULL),
(27, 'script_body', NULL),
(28, 'google_recaptcha_key', NULL),
(29, 'google_recaptcha_secret', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `suppliers`
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
-- Cấu trúc bảng cho bảng `users`
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
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `name`, `phone`, `email`, `address`, `image`, `priority`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'voquochai', '$2y$10$emCrQvqc0Wau00NUzApjdueFf3wmcNt6qyUczOV5LJbYb/4a5Qo9a', 'Kho web online', NULL, 'khowebonline@gmail.com', NULL, NULL, 1, 'publish', 'wmScCEAMDK', '2018-06-19 14:23:52', '2018-06-19 14:25:27');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user_group`
--

CREATE TABLE `user_group` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `group_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wms_exports`
--

CREATE TABLE `wms_exports` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `store_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `export_qty` int(11) NOT NULL DEFAULT '0',
  `export_price` double NOT NULL DEFAULT '0',
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

--
-- Đang đổ dữ liệu cho bảng `wms_exports`
--

INSERT INTO `wms_exports` (`id`, `code`, `store_code`, `export_qty`, `export_price`, `note_cancel`, `order_id`, `user_id`, `priority`, `status`, `type`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'PX00001', NULL, 3, 870000, 'abc', NULL, 1, 1, 'cancel', 'default', NULL, '2018-06-21 15:55:36', '2018-06-21 16:04:37');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wms_export_details`
--

CREATE TABLE `wms_export_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_qty` int(11) NOT NULL DEFAULT '0',
  `product_price` double NOT NULL DEFAULT '0',
  `size_id` int(11) NOT NULL DEFAULT '0',
  `size_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color_id` int(11) NOT NULL DEFAULT '0',
  `color_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `export_id` int(10) UNSIGNED NOT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `wms_export_details`
--

INSERT INTO `wms_export_details` (`id`, `product_id`, `product_code`, `product_title`, `product_qty`, `product_price`, `size_id`, `size_title`, `color_id`, `color_title`, `export_id`, `status`) VALUES
(1, 20, '523', 'Dr. Rosamond Johns IV - Đỏ - XXL', 1, 290000, 8, 'XXL', 4, 'Đỏ', 1, 'cancel'),
(2, 17, '2483', 'Alize Schimmel II - Vàng - XL', 1, 290000, 7, 'XL', 3, 'Vàng', 1, 'cancel'),
(3, 17, '2483', 'Alize Schimmel II - Đỏ - XXL', 1, 290000, 8, 'XXL', 4, 'Đỏ', 1, 'cancel');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wms_imports`
--

CREATE TABLE `wms_imports` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `store_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `import_qty` int(11) NOT NULL DEFAULT '0',
  `import_price` double NOT NULL DEFAULT '0',
  `note_cancel` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT '1',
  `status` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `wms_imports`
--

INSERT INTO `wms_imports` (`id`, `code`, `store_code`, `import_qty`, `import_price`, `note_cancel`, `user_id`, `priority`, `status`, `type`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'PN00001', NULL, 70, 3800000, 'abc', 1, 1, 'publish', 'default', NULL, '2018-06-19 16:21:55', '2018-06-19 16:53:57'),
(2, 'PN00002', NULL, 20, 1000000, NULL, 1, 1, 'publish', 'default', NULL, '2018-06-19 17:19:01', '2018-06-19 17:19:02'),
(3, 'PN00003', NULL, 2000000, 100000000000, NULL, 1, 1, 'publish', 'default', NULL, '2018-06-22 16:04:54', '2018-06-22 16:04:54');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wms_import_details`
--

CREATE TABLE `wms_import_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_qty` int(11) NOT NULL DEFAULT '0',
  `product_price` double NOT NULL DEFAULT '0',
  `size_id` int(11) NOT NULL DEFAULT '0',
  `size_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color_id` int(11) NOT NULL DEFAULT '0',
  `color_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `import_id` int(10) UNSIGNED NOT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `wms_import_details`
--

INSERT INTO `wms_import_details` (`id`, `product_id`, `product_code`, `product_title`, `product_qty`, `product_price`, `size_id`, `size_title`, `color_id`, `color_title`, `import_id`, `status`) VALUES
(1, 20, '523', 'DR. ROSAMOND JOHNS IV', 10, 50000, 8, 'XXL', 4, 'Đỏ', 1, 'publish'),
(2, 17, '2483', 'ALIZE SCHIMMEL II', 10, 55000, 7, 'XL', 3, 'Vàng', 1, 'publish'),
(3, 18, '1', 'DEANNA LEFFLER', 10, 60000, 6, 'S', 2, 'Xanh', 1, 'publish'),
(4, 19, '7', 'PROF. JOHNATHON KUTCH', 10, 65000, 5, 'M', 1, 'Trắng', 1, 'publish'),
(5, 17, '2483', 'ALIZE SCHIMMEL II', 10, 50000, 8, 'XXL', 4, 'Đỏ', 1, 'publish'),
(6, 18, '1', 'DEANNA LEFFLER', 10, 50000, 8, 'XXL', 4, 'Đỏ', 1, 'publish'),
(7, 19, '7', 'PROF. JOHNATHON KUTCH', 10, 50000, 8, 'XXL', 4, 'Đỏ', 1, 'publish'),
(8, 18, '1', 'Deanna Leffler', 10, 50000, 7, 'XL', 4, 'Đỏ', 2, 'publish'),
(9, 19, '7', 'Prof. Johnathon Kutch', 10, 50000, 7, 'XL', 3, 'Vàng', 2, 'publish'),
(10, 20, '523', 'Dr. Rosamond Johns IV', 1000000, 50000, 8, 'XXL', 4, 'Đỏ', 3, 'publish'),
(11, 19, '7', 'Prof. Johnathon Kutch', 1000000, 50000, 6, 'S', 3, 'Vàng', 3, 'publish');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wms_stores`
--

CREATE TABLE `wms_stores` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
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
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `attribute_languages`
--
ALTER TABLE `attribute_languages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `attribute_languages_attribute_id_language_unique` (`attribute_id`,`language`),
  ADD KEY `attribute_languages_language_index` (`language`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `category_languages`
--
ALTER TABLE `category_languages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `category_languages_category_id_language_unique` (`category_id`,`language`),
  ADD KEY `category_languages_language_index` (`language`);

--
-- Chỉ mục cho bảng `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_product_id_foreign` (`product_id`),
  ADD KEY `comments_post_id_foreign` (`post_id`),
  ADD KEY `comments_member_id_foreign` (`member_id`);

--
-- Chỉ mục cho bảng `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`);

--
-- Chỉ mục cho bảng `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `groups_name_unique` (`name`);

--
-- Chỉ mục cho bảng `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_reserved_at_index` (`queue`,`reserved_at`);

--
-- Chỉ mục cho bảng `links`
--
ALTER TABLE `links`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `link_languages`
--
ALTER TABLE `link_languages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `link_languages_link_id_language_unique` (`link_id`,`language`),
  ADD KEY `link_languages_language_index` (`language`);

--
-- Chỉ mục cho bảng `media_libraries`
--
ALTER TABLE `media_libraries`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `members_username_unique` (`username`),
  ADD UNIQUE KEY `members_email_unique` (`email`);

--
-- Chỉ mục cho bảng `member_password_resets`
--
ALTER TABLE `member_password_resets`
  ADD KEY `member_password_resets_email_index` (`email`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_code_unique` (`code`);

--
-- Chỉ mục cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_details_order_id_foreign` (`order_id`);

--
-- Chỉ mục cho bảng `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `page_languages`
--
ALTER TABLE `page_languages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `page_languages_page_id_language_unique` (`page_id`,`language`),
  ADD KEY `page_languages_language_index` (`language`);

--
-- Chỉ mục cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Chỉ mục cho bảng `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_unique` (`name`);

--
-- Chỉ mục cho bảng `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_role_id_foreign` (`role_id`);

--
-- Chỉ mục cho bảng `photos`
--
ALTER TABLE `photos`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `photo_languages`
--
ALTER TABLE `photo_languages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `photo_languages_photo_id_language_unique` (`photo_id`,`language`),
  ADD KEY `photo_languages_language_index` (`language`);

--
-- Chỉ mục cho bảng `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_category_id_foreign` (`category_id`),
  ADD KEY `posts_user_id_foreign` (`user_id`);

--
-- Chỉ mục cho bảng `post_attribute`
--
ALTER TABLE `post_attribute`
  ADD KEY `post_attribute_post_id_foreign` (`post_id`),
  ADD KEY `post_attribute_attribute_id_foreign` (`attribute_id`);

--
-- Chỉ mục cho bảng `post_languages`
--
ALTER TABLE `post_languages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `post_languages_post_id_language_unique` (`post_id`,`language`),
  ADD KEY `post_languages_language_index` (`language`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_code_unique` (`code`),
  ADD KEY `products_supplier_id_foreign` (`supplier_id`),
  ADD KEY `products_category_id_foreign` (`category_id`),
  ADD KEY `products_user_id_foreign` (`user_id`);

--
-- Chỉ mục cho bảng `product_attribute`
--
ALTER TABLE `product_attribute`
  ADD KEY `product_attribute_product_id_foreign` (`product_id`),
  ADD KEY `product_attribute_attribute_id_foreign` (`attribute_id`);

--
-- Chỉ mục cho bảng `product_languages`
--
ALTER TABLE `product_languages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_languages_product_id_language_unique` (`product_id`,`language`),
  ADD KEY `product_languages_language_index` (`language`);

--
-- Chỉ mục cho bảng `registers`
--
ALTER TABLE `registers`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_unique` (`name`);

--
-- Chỉ mục cho bảng `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `role_user_role_id_foreign` (`role_id`);

--
-- Chỉ mục cho bảng `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `suppliers_code_unique` (`code`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Chỉ mục cho bảng `user_group`
--
ALTER TABLE `user_group`
  ADD KEY `user_group_user_id_foreign` (`user_id`),
  ADD KEY `user_group_group_id_foreign` (`group_id`);

--
-- Chỉ mục cho bảng `wms_exports`
--
ALTER TABLE `wms_exports`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `wms_exports_code_unique` (`code`);

--
-- Chỉ mục cho bảng `wms_export_details`
--
ALTER TABLE `wms_export_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wms_export_details_export_id_foreign` (`export_id`);

--
-- Chỉ mục cho bảng `wms_imports`
--
ALTER TABLE `wms_imports`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `wms_imports_code_unique` (`code`);

--
-- Chỉ mục cho bảng `wms_import_details`
--
ALTER TABLE `wms_import_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wms_import_details_import_id_foreign` (`import_id`);

--
-- Chỉ mục cho bảng `wms_stores`
--
ALTER TABLE `wms_stores`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `wms_stores_code_unique` (`code`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `attribute_languages`
--
ALTER TABLE `attribute_languages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `category_languages`
--
ALTER TABLE `category_languages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `groups`
--
ALTER TABLE `groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `links`
--
ALTER TABLE `links`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `link_languages`
--
ALTER TABLE `link_languages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `media_libraries`
--
ALTER TABLE `media_libraries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `members`
--
ALTER TABLE `members`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT cho bảng `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `page_languages`
--
ALTER TABLE `page_languages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `photos`
--
ALTER TABLE `photos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `photo_languages`
--
ALTER TABLE `photo_languages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `post_languages`
--
ALTER TABLE `post_languages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `product_languages`
--
ALTER TABLE `product_languages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT cho bảng `registers`
--
ALTER TABLE `registers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT cho bảng `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `wms_exports`
--
ALTER TABLE `wms_exports`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `wms_export_details`
--
ALTER TABLE `wms_export_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `wms_imports`
--
ALTER TABLE `wms_imports`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `wms_import_details`
--
ALTER TABLE `wms_import_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `wms_stores`
--
ALTER TABLE `wms_stores`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `attribute_languages`
--
ALTER TABLE `attribute_languages`
  ADD CONSTRAINT `attribute_languages_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `category_languages`
--
ALTER TABLE `category_languages`
  ADD CONSTRAINT `category_languages_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_member_id_foreign` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comments_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `link_languages`
--
ALTER TABLE `link_languages`
  ADD CONSTRAINT `link_languages_link_id_foreign` FOREIGN KEY (`link_id`) REFERENCES `links` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `page_languages`
--
ALTER TABLE `page_languages`
  ADD CONSTRAINT `page_languages_page_id_foreign` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `permission_role`
--
ALTER TABLE `permission_role`
  ADD CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `photo_languages`
--
ALTER TABLE `photo_languages`
  ADD CONSTRAINT `photo_languages_photo_id_foreign` FOREIGN KEY (`photo_id`) REFERENCES `photos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `posts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `post_attribute`
--
ALTER TABLE `post_attribute`
  ADD CONSTRAINT `post_attribute_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `post_attribute_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `post_languages`
--
ALTER TABLE `post_languages`
  ADD CONSTRAINT `post_languages_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `products_supplier_id_foreign` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `product_attribute`
--
ALTER TABLE `product_attribute`
  ADD CONSTRAINT `product_attribute_attribute_id_foreign` FOREIGN KEY (`attribute_id`) REFERENCES `attributes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_attribute_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `product_languages`
--
ALTER TABLE `product_languages`
  ADD CONSTRAINT `product_languages_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `user_group`
--
ALTER TABLE `user_group`
  ADD CONSTRAINT `user_group_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_group_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `wms_export_details`
--
ALTER TABLE `wms_export_details`
  ADD CONSTRAINT `wms_export_details_export_id_foreign` FOREIGN KEY (`export_id`) REFERENCES `wms_exports` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `wms_import_details`
--
ALTER TABLE `wms_import_details`
  ADD CONSTRAINT `wms_import_details_import_id_foreign` FOREIGN KEY (`import_id`) REFERENCES `wms_imports` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
