-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th4 05, 2018 lúc 11:28 SA
-- Phiên bản máy phục vụ: 10.1.21-MariaDB
-- Phiên bản PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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

INSERT INTO `attributes` (`id`, `value`, `priority`, `status`, `type`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, 'publish', 'product_tags', NULL, '2018-04-02 01:53:22', '2018-04-02 01:53:22'),
(2, NULL, 1, 'publish', 'post_tags', NULL, '2018-04-02 02:48:51', '2018-04-02 02:48:51'),
(3, 'rgb(14, 74, 208)', 1, 'publish', 'product_colors', NULL, '2018-04-03 20:49:38', '2018-04-03 20:49:38');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `attribute_languages`
--

CREATE TABLE `attribute_languages` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribute_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `attribute_languages`
--

INSERT INTO `attribute_languages` (`id`, `title`, `slug`, `language`, `attribute_id`) VALUES
(1, 'tag sản phẩm', 'tag-san-pham', 'vi', 1),
(2, NULL, '', 'en', 1),
(3, 'Tag tin tức', 'tag-tin-tuc', 'vi', 2),
(4, NULL, '', 'en', 2),
(5, 'Xanh', 'xanh', 'vi', 3),
(6, 'Blue', 'blue', 'en', 3);

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
(1, 0, NULL, NULL, NULL, 0, 'publish', 'default', NULL, NULL, NULL),
(2, 0, NULL, NULL, NULL, 1, 'publish', 'san-pham', NULL, '2018-04-03 20:32:27', '2018-04-03 20:43:13'),
(3, 0, NULL, NULL, NULL, 2, 'publish', 'san-pham', NULL, '2018-04-03 20:43:22', '2018-04-03 20:43:22');

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
  `language` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `category_languages`
--

INSERT INTO `category_languages` (`id`, `title`, `slug`, `description`, `contents`, `meta_seo`, `language`, `category_id`) VALUES
(1, 'Uncategorized', 'uncategorized', NULL, NULL, NULL, 'vi', 1),
(2, 'Uncategorized', 'uncategorized', NULL, NULL, NULL, 'en', 1),
(3, 'Danh mục 1', 'danh-muc-1', NULL, NULL, '{\"title\":null,\"keywords\":null,\"description\":null}', 'vi', 2),
(4, NULL, 'danh-muc-1', NULL, NULL, '{\"title\":null,\"keywords\":null,\"description\":null}', 'en', 2),
(5, 'Danh mục 2', 'danh-muc-2', NULL, NULL, '{\"title\":null,\"keywords\":null,\"description\":null}', 'vi', 3),
(6, NULL, 'danh-muc-2', NULL, NULL, '{\"title\":null,\"keywords\":null,\"description\":null}', 'en', 3);

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
  `coupon_amount` int(11) NOT NULL DEFAULT '0',
  `min_restriction_amount` int(11) NOT NULL DEFAULT '0',
  `max_restriction_amount` int(11) NOT NULL DEFAULT '0',
  `change_conditions_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `begin_at` timestamp NULL DEFAULT NULL,
  `end_at` timestamp NULL DEFAULT NULL,
  `priority` int(11) NOT NULL DEFAULT '1',
  `status` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `language` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `priority` int(11) NOT NULL DEFAULT '1',
  `status` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
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
(33, '2014_10_12_000000_create_users_table', 1),
(34, '2014_10_12_100000_create_password_resets_table', 1),
(35, '2017_03_16_030417_create_members_table', 1),
(36, '2017_06_22_030237_create_categories_table', 1),
(37, '2017_06_22_041225_create_category_languages_table', 1),
(38, '2017_06_28_030237_create_suppliers_table', 1),
(39, '2017_07_12_074145_create_products_table', 1),
(40, '2017_07_13_022922_create_product_languages_table', 1),
(41, '2017_07_19_022148_create_attributes_table', 1),
(42, '2017_07_19_043215_create_attribute_languages_table', 1),
(43, '2017_08_05_022238_create_product_attribute_relation_table', 1),
(44, '2017_10_02_032249_create_media_libraries_table', 1),
(45, '2017_12_22_064219_create_posts_table', 1),
(46, '2017_12_22_064418_create_post_languages_table', 1),
(47, '2017_12_22_064447_create_post_attribute_table', 1),
(48, '2017_12_23_184911_create_pages_table', 1),
(49, '2017_12_23_185000_create_page_languages_table', 1),
(50, '2017_12_25_154609_create_photos_table', 1),
(51, '2017_12_25_154624_create_photo_languages_table', 1),
(52, '2017_12_26_092247_create_settings_table', 1),
(53, '2018_01_02_044342_entrust_setup_tables', 1),
(54, '2018_01_09_154609_create_links_table', 1),
(55, '2018_01_09_154624_create_link_languages_table', 1),
(56, '2018_01_10_165341_create_registers_table', 1),
(57, '2018_01_14_160014_create_comments_table', 1),
(58, '2018_02_09_082208_create_orders_table', 1),
(59, '2018_02_22_074012_create_wms_stores_table', 1),
(60, '2018_02_23_024649_create_wms_imports_table', 1),
(61, '2018_03_01_061244_create_wms_exports_table', 1),
(62, '2018_03_07_014847_create_groups_table', 1),
(63, '2018_03_08_013630_create_user_group_relation_table', 1),
(64, '2018_03_16_014803_create_jobs_table', 1),
(65, '2018_04_05_045759_create_coupons_table', 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `code`, `quantity`, `shipping`, `subtotal`, `total`, `product_id`, `product_code`, `product_size`, `product_color`, `product_qty`, `product_price`, `name`, `phone`, `email`, `address`, `note`, `district_id`, `province_id`, `payment`, `member_id`, `user_id`, `status_id`, `priority`, `status`, `type`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'DH00001', 4, 0, 800000, 800000, '100,100,99,98', '541617,541617,622,5709', '0,0,0,0', '0,3,0,0', '1,1,1,1', '200000,200000,200000,200000', 'Võ Quốc Hải', '1679933525', 'quochai.coder@gmail.com', 'Tầng 3, Tòa nhà SG TEL', 'Test', 13, 1, NULL, NULL, NULL, 1, 1, 'publish', 'online', NULL, '2018-04-04 01:08:39', '2018-04-04 01:31:19');

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
(1, NULL, NULL, NULL, 1, 'publish', 'gioi-thieu', 0, NULL, NULL, '2018-04-03 19:38:09'),
(2, NULL, NULL, NULL, 1, 'publish', 'tuyen-dung', 0, NULL, NULL, NULL),
(3, NULL, NULL, NULL, 1, 'publish', 'lien-he', 0, NULL, NULL, NULL),
(4, NULL, NULL, NULL, 1, 'publish', 'footer', 0, NULL, NULL, '2018-04-02 21:15:03'),
(5, NULL, NULL, NULL, 1, 'publish', 'index', 0, NULL, '2018-04-03 00:50:08', '2018-04-03 00:50:24');

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
  `language` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `page_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `page_languages`
--

INSERT INTO `page_languages` (`id`, `title`, `slug`, `description`, `contents`, `meta_seo`, `language`, `page_id`) VALUES
(1, 'Giới thiệu', 'gioi-thieu', NULL, '<h3>What is Lorem Ipsum?</h3>\r\n\r\n<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<h3>Why do we use it?</h3>\r\n\r\n<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>\r\n\r\n<h3><br />\r\nWhere does it come from?</h3>\r\n\r\n<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p>\r\n\r\n<p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>\r\n\r\n<h3>Where can I get some?</h3>\r\n\r\n<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>', '{\"title\":null,\"keywords\":null,\"description\":null}', 'vi', 1),
(2, 'Giới thiệu', 'gioi-thieu', NULL, NULL, '{\"title\":null,\"keywords\":null,\"description\":null}', 'en', 1),
(3, 'Tuyển dụng', 'tuyen-dung', NULL, NULL, NULL, 'vi', 2),
(4, 'Tuyển dụng', 'tuyen-dung', NULL, NULL, NULL, 'en', 2),
(5, 'Liên hệ', 'lien-he', NULL, NULL, NULL, 'vi', 3),
(6, 'Liên hệ', 'lien-he', NULL, NULL, NULL, 'en', 3),
(7, 'Thông tin công ty', 'thong-tin-cong-ty', NULL, '<p>Địa chỉ:</p>\r\n\r\n<p>Điện thoại:</p>', NULL, 'vi', 4),
(8, 'Footer', 'thong-tin-cong-ty', NULL, NULL, NULL, 'en', 4),
(9, 'Trang chủ', 'trang-chu', NULL, NULL, '{\"title\":\"Laravel Shop\",\"keywords\":null,\"description\":null}', 'vi', 5),
(10, 'Trang chủ', 'trang-chu', NULL, NULL, '{\"title\":null,\"keywords\":null,\"description\":null}', 'en', 5);

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

--
-- Đang đổ dữ liệu cho bảng `photos`
--

INSERT INTO `photos` (`id`, `link`, `image`, `alt`, `priority`, `status`, `type`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, '#', NULL, NULL, 1, 'publish', 'slideshow', NULL, '2018-04-02 21:13:20', '2018-04-02 21:13:36');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `photo_languages`
--

CREATE TABLE `photo_languages` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `language` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `photo_languages`
--

INSERT INTO `photo_languages` (`id`, `title`, `description`, `language`, `photo_id`) VALUES
(1, 'Tiêu đề', 'Mô tả', 'vi', 1),
(2, NULL, NULL, 'en', 1);

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
(1, NULL, NULL, NULL, NULL, 1, 'publish', 1, 1, 'tin-tuc', 0, NULL, '2018-04-01 18:14:08', '2018-04-01 18:14:08'),
(2, NULL, NULL, NULL, NULL, 1, 'publish', 1, 1, 'tin-tuc', 0, NULL, '2018-04-01 18:14:09', '2018-04-01 18:14:09'),
(3, NULL, NULL, NULL, NULL, 1, 'publish', 1, 1, 'tin-tuc', 0, NULL, '2018-04-01 18:14:09', '2018-04-01 18:14:09'),
(4, NULL, NULL, NULL, NULL, 1, 'publish', 1, 1, 'tin-tuc', 0, NULL, '2018-04-01 18:14:09', '2018-04-01 18:14:09'),
(5, NULL, NULL, NULL, NULL, 1, 'publish', 1, 1, 'tin-tuc', 0, NULL, '2018-04-01 18:14:09', '2018-04-01 18:14:09'),
(6, NULL, NULL, NULL, NULL, 1, 'publish', 1, 1, 'tin-tuc', 0, NULL, '2018-04-01 18:14:09', '2018-04-01 18:14:09'),
(7, NULL, NULL, NULL, NULL, 1, 'publish', 1, 1, 'tin-tuc', 0, NULL, '2018-04-01 18:14:09', '2018-04-01 18:14:09'),
(8, NULL, NULL, NULL, NULL, 1, 'publish', 1, 1, 'tin-tuc', 0, NULL, '2018-04-01 18:14:09', '2018-04-01 18:14:09'),
(9, NULL, NULL, NULL, NULL, 1, 'publish', 1, 1, 'tin-tuc', 0, NULL, '2018-04-01 18:14:09', '2018-04-01 18:14:09'),
(10, NULL, NULL, NULL, NULL, 1, 'publish', 1, 1, 'tin-tuc', 0, NULL, '2018-04-01 18:14:09', '2018-04-01 18:14:09'),
(11, NULL, NULL, NULL, NULL, 1, 'publish', 1, 1, 'tin-tuc', 0, NULL, '2018-04-01 18:14:09', '2018-04-01 18:14:09'),
(12, NULL, NULL, NULL, NULL, 1, 'publish', 1, 1, 'tin-tuc', 0, NULL, '2018-04-01 18:14:09', '2018-04-01 18:14:09'),
(13, NULL, NULL, NULL, NULL, 1, 'publish', 1, 1, 'tin-tuc', 0, NULL, '2018-04-01 18:14:09', '2018-04-01 18:14:09'),
(14, NULL, NULL, NULL, NULL, 1, 'publish', 1, 1, 'tin-tuc', 0, NULL, '2018-04-01 18:14:09', '2018-04-01 18:14:09'),
(15, NULL, NULL, NULL, NULL, 1, 'publish', 1, 1, 'tin-tuc', 0, NULL, '2018-04-01 18:14:09', '2018-04-01 18:14:09'),
(16, NULL, NULL, NULL, NULL, 1, 'publish', 1, 1, 'tin-tuc', 0, NULL, '2018-04-01 18:14:09', '2018-04-01 18:14:09'),
(17, NULL, NULL, NULL, NULL, 1, 'publish', 1, 1, 'tin-tuc', 0, NULL, '2018-04-01 18:14:09', '2018-04-01 18:14:09'),
(18, NULL, NULL, NULL, NULL, 1, 'publish', 1, 1, 'tin-tuc', 0, NULL, '2018-04-01 18:14:09', '2018-04-01 18:14:09'),
(19, NULL, NULL, NULL, NULL, 1, 'publish', 1, 1, 'tin-tuc', 0, NULL, '2018-04-01 18:14:10', '2018-04-01 18:14:10'),
(20, NULL, NULL, NULL, NULL, 1, 'publish', 1, 1, 'tin-tuc', 0, NULL, '2018-04-01 18:14:10', '2018-04-01 18:14:10'),
(21, NULL, NULL, NULL, NULL, 1, 'publish', 1, 1, 'tin-tuc', 0, NULL, '2018-04-01 18:14:10', '2018-04-01 18:14:10'),
(22, NULL, NULL, NULL, NULL, 1, 'publish', 1, 1, 'tin-tuc', 0, NULL, '2018-04-01 18:14:10', '2018-04-01 18:14:10'),
(23, NULL, NULL, NULL, NULL, 1, 'publish', 1, 1, 'tin-tuc', 0, NULL, '2018-04-01 18:14:10', '2018-04-01 18:14:10'),
(24, NULL, NULL, NULL, NULL, 1, 'publish', 1, 1, 'tin-tuc', 0, NULL, '2018-04-01 18:14:10', '2018-04-01 18:14:10'),
(25, NULL, NULL, NULL, NULL, 1, 'publish', 1, 1, 'tin-tuc', 0, NULL, '2018-04-01 18:14:10', '2018-04-01 18:14:10'),
(26, NULL, NULL, NULL, NULL, 1, 'publish', 1, 1, 'tin-tuc', 0, NULL, '2018-04-01 18:14:10', '2018-04-01 18:14:10'),
(27, NULL, NULL, NULL, NULL, 1, 'publish', 1, 1, 'tin-tuc', 0, NULL, '2018-04-01 18:14:10', '2018-04-01 18:14:10'),
(28, NULL, NULL, NULL, NULL, 1, 'publish', 1, 1, 'tin-tuc', 0, NULL, '2018-04-01 18:14:10', '2018-04-01 18:14:10'),
(29, NULL, NULL, NULL, NULL, 1, 'publish', 1, 1, 'tin-tuc', 0, NULL, '2018-04-01 18:14:10', '2018-04-01 18:14:10'),
(30, NULL, NULL, NULL, NULL, 1, 'publish', 1, 1, 'tin-tuc', 0, NULL, '2018-04-01 18:14:10', '2018-04-01 18:14:10'),
(31, NULL, NULL, NULL, NULL, 1, 'publish', 1, 1, 'tin-tuc', 0, NULL, '2018-04-01 18:14:10', '2018-04-01 18:14:10'),
(32, NULL, NULL, NULL, NULL, 1, 'publish', 1, 1, 'tin-tuc', 0, NULL, '2018-04-01 18:14:11', '2018-04-01 18:14:11'),
(33, NULL, NULL, NULL, NULL, 1, 'publish', 1, 1, 'tin-tuc', 0, NULL, '2018-04-01 18:14:11', '2018-04-01 18:14:11'),
(34, NULL, NULL, NULL, NULL, 1, 'publish', 1, 1, 'tin-tuc', 0, NULL, '2018-04-01 18:14:11', '2018-04-01 18:14:11'),
(35, NULL, NULL, NULL, NULL, 1, 'publish', 1, 1, 'tin-tuc', 0, NULL, '2018-04-01 18:14:11', '2018-04-01 18:14:11'),
(36, NULL, NULL, NULL, NULL, 1, 'publish', 1, 1, 'tin-tuc', 0, NULL, '2018-04-01 18:14:11', '2018-04-01 18:14:11'),
(37, NULL, NULL, NULL, NULL, 1, 'publish', 1, 1, 'tin-tuc', 0, NULL, '2018-04-01 18:14:11', '2018-04-01 18:14:11'),
(38, NULL, NULL, NULL, NULL, 1, 'publish', 1, 1, 'tin-tuc', 0, NULL, '2018-04-01 18:14:11', '2018-04-01 18:14:11'),
(39, NULL, NULL, NULL, NULL, 1, 'publish', 1, 1, 'tin-tuc', 0, NULL, '2018-04-01 18:14:11', '2018-04-01 18:14:11'),
(40, NULL, NULL, NULL, NULL, 1, 'publish', 1, 1, 'tin-tuc', 2, NULL, '2018-04-01 18:14:11', '2018-04-01 18:14:11'),
(41, NULL, NULL, NULL, NULL, 1, 'publish', 1, 1, 'tin-tuc', 0, NULL, '2018-04-01 18:14:11', '2018-04-01 18:14:11'),
(42, NULL, NULL, NULL, NULL, 1, 'publish', 1, 1, 'tin-tuc', 0, NULL, '2018-04-01 18:14:11', '2018-04-01 18:14:11'),
(43, NULL, NULL, NULL, NULL, 1, 'publish', 1, 1, 'tin-tuc', 0, NULL, '2018-04-01 18:14:11', '2018-04-01 18:14:11'),
(44, NULL, NULL, NULL, NULL, 1, 'publish', 1, 1, 'tin-tuc', 0, NULL, '2018-04-01 18:14:11', '2018-04-01 18:14:11'),
(45, NULL, NULL, NULL, NULL, 1, 'publish', 1, 1, 'tin-tuc', 0, NULL, '2018-04-01 18:14:11', '2018-04-01 18:14:11'),
(46, NULL, NULL, NULL, NULL, 1, 'publish', 1, 1, 'tin-tuc', 0, NULL, '2018-04-01 18:14:11', '2018-04-01 18:14:11'),
(47, NULL, NULL, NULL, NULL, 1, 'publish', 1, 1, 'tin-tuc', 0, NULL, '2018-04-01 18:14:11', '2018-04-01 18:14:11'),
(48, NULL, NULL, NULL, NULL, 1, 'publish,new', 1, 1, 'tin-tuc', 0, NULL, '2018-04-01 18:14:11', '2018-04-01 18:14:11'),
(49, NULL, NULL, NULL, NULL, 1, 'publish,new', 1, 1, 'tin-tuc', 2, NULL, '2018-04-01 18:14:12', '2018-04-01 18:14:12'),
(50, NULL, NULL, NULL, '', 1, 'new,publish', 1, 1, 'tin-tuc', 3, NULL, '2018-04-01 18:14:12', '2018-04-02 02:48:55'),
(51, NULL, NULL, NULL, NULL, 1, 'publish,index', 1, 1, 'khach-hang', 0, NULL, '2018-04-02 21:14:09', '2018-04-02 21:14:09');

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

--
-- Đang đổ dữ liệu cho bảng `post_attribute`
--

INSERT INTO `post_attribute` (`post_id`, `attribute_id`, `option`, `type`) VALUES
(50, 2, NULL, 'post_tags');

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
  `language` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `post_languages`
--

INSERT INTO `post_languages` (`id`, `title`, `slug`, `description`, `contents`, `attributes`, `meta_seo`, `language`, `post_id`) VALUES
(1, 'Susie Berge', 'susie-berge', 'Explicabo tempore voluptatem explicabo neque voluptatem voluptatem. Nisi excepturi officia rerum. Omnis et est dignissimos sit maxime.', 'Sed doloribus quasi excepturi repellendus sit iure quod recusandae. Dolores nobis harum autem quo beatae cumque. Deleniti et veniam quo laborum. Quae quia repellat adipisci nemo.', NULL, '{\"title\":\"Susie Berge\",\"keywords\":\"Susie Berge\",\"description\":\"Susie Berge\"}', 'vi', 1),
(2, 'Miss Ashlee Skiles Jr.', 'miss-ashlee-skiles-jr', 'Enim reprehenderit quaerat sunt possimus magnam eos. Recusandae doloribus temporibus tempora est iusto non unde. Magni sunt veniam officiis et. Sint aspernatur libero itaque qui iusto et.', 'Rem et sint cumque voluptatum. Qui ut exercitationem aut impedit modi tenetur. Sit quis quidem ea.', NULL, '{\"title\":\"Miss Ashlee Skiles Jr.\",\"keywords\":\"Miss Ashlee Skiles Jr.\",\"description\":\"Miss Ashlee Skiles Jr.\"}', 'en', 1),
(3, 'Lance Dooley DDS', 'lance-dooley-dds', 'Et officiis repellendus error et dolores qui qui. Sed delectus ut et quis. Impedit consequatur debitis placeat deleniti minus placeat.', 'Quos voluptates adipisci quo sed ullam. Velit qui optio aut error. Voluptatem eligendi dolores magnam maxime. Sit atque non amet quaerat.', NULL, '{\"title\":\"Lance Dooley DDS\",\"keywords\":\"Lance Dooley DDS\",\"description\":\"Lance Dooley DDS\"}', 'vi', 2),
(4, 'Prof. Mauricio Hansen', 'prof-mauricio-hansen', 'Est eaque error iure cum veniam quas. Est qui commodi et placeat perferendis qui.', 'Voluptas necessitatibus nisi pariatur tempora hic a. Consequatur aut in quia distinctio. Illum reiciendis ut amet incidunt voluptatem placeat consequuntur dolor.', NULL, '{\"title\":\"Prof. Mauricio Hansen\",\"keywords\":\"Prof. Mauricio Hansen\",\"description\":\"Prof. Mauricio Hansen\"}', 'en', 2),
(5, 'Devyn Grady', 'devyn-grady', 'Tenetur omnis ut autem facilis fugiat temporibus veniam. Voluptatum tenetur ducimus placeat sit non. Possimus aut aspernatur consequatur pariatur et ratione maxime.', 'Nesciunt qui quidem nisi voluptas. Excepturi eum repellat voluptas unde. Voluptates et laboriosam nemo et architecto cum ut.', NULL, '{\"title\":\"Devyn Grady\",\"keywords\":\"Devyn Grady\",\"description\":\"Devyn Grady\"}', 'vi', 3),
(6, 'Janiya Schiller', 'janiya-schiller', 'Eos nisi voluptatem blanditiis saepe est. Velit commodi error sint totam minima. Dolore atque maxime placeat delectus rem delectus omnis. Ut sit perferendis hic quia natus amet consequatur.', 'Natus omnis earum facilis impedit aut. Labore tenetur odio quisquam eum. Inventore et dolor voluptate dolores laboriosam distinctio.', NULL, '{\"title\":\"Janiya Schiller\",\"keywords\":\"Janiya Schiller\",\"description\":\"Janiya Schiller\"}', 'en', 3),
(7, 'Arjun Satterfield', 'arjun-satterfield', 'Nemo vel eius consectetur corporis. Quaerat dolore ut in cupiditate. Consequatur odit tempore nam.', 'Beatae velit veniam tempore perferendis laboriosam. Iure asperiores labore quae nihil aut. A earum aut at sit unde est. Officiis eos dolore voluptas aut. Est id aut labore quidem iste dolores.', NULL, '{\"title\":\"Arjun Satterfield\",\"keywords\":\"Arjun Satterfield\",\"description\":\"Arjun Satterfield\"}', 'vi', 4),
(8, 'Judah West', 'judah-west', 'Rerum nemo voluptates vel est ipsam. Eius architecto enim ut omnis et qui eveniet. Et quis possimus ullam voluptatem qui sed nesciunt. Rerum animi aut debitis earum tempore qui.', 'Quaerat officiis fugiat nemo illo cumque et temporibus deserunt. Temporibus esse mollitia ab deserunt ea. Tempora consequatur aut adipisci sit deleniti ipsam. Placeat sint error voluptas consequatur quia nostrum dolor.', NULL, '{\"title\":\"Judah West\",\"keywords\":\"Judah West\",\"description\":\"Judah West\"}', 'en', 4),
(9, 'Jamil Romaguera', 'jamil-romaguera', 'Inventore in rerum soluta. Est aut autem itaque rem cumque deleniti quae. Explicabo et inventore praesentium excepturi ullam. Aspernatur aut voluptatem occaecati placeat sapiente est.', 'Ut odit sapiente recusandae magnam. Voluptatum ea nemo voluptatem. Qui occaecati non culpa tempore alias maxime. Magnam quo incidunt rerum quis est qui.', NULL, '{\"title\":\"Jamil Romaguera\",\"keywords\":\"Jamil Romaguera\",\"description\":\"Jamil Romaguera\"}', 'vi', 5),
(10, 'Alexanne Cruickshank', 'alexanne-cruickshank', 'Quia consequatur sed id voluptatum enim nisi. Ullam iure totam illo autem quibusdam. Eum nobis minus rerum. Accusantium doloribus sed perspiciatis est.', 'Voluptatum libero sit repudiandae nihil. Iste vitae autem sunt minus. Dolore aut sit aliquid itaque omnis id.', NULL, '{\"title\":\"Alexanne Cruickshank\",\"keywords\":\"Alexanne Cruickshank\",\"description\":\"Alexanne Cruickshank\"}', 'en', 5),
(11, 'Jonas Reichel', 'jonas-reichel', 'Quis facere sed illo sed explicabo. Cumque expedita reprehenderit voluptatibus. Qui inventore optio sed distinctio ut.', 'Magnam repellendus dolor itaque soluta inventore aut et. Reiciendis nesciunt ut repellendus doloribus quaerat enim aliquam. Ea sed ea odio alias.', NULL, '{\"title\":\"Jonas Reichel\",\"keywords\":\"Jonas Reichel\",\"description\":\"Jonas Reichel\"}', 'vi', 6),
(12, 'Madyson Huels', 'madyson-huels', 'Quia et distinctio sed. Natus id facilis ipsa accusamus et voluptatem voluptates. Sed ipsa et mollitia ab aut non.', 'Et ullam voluptatem aut. Et deleniti nesciunt ea.', NULL, '{\"title\":\"Madyson Huels\",\"keywords\":\"Madyson Huels\",\"description\":\"Madyson Huels\"}', 'en', 6),
(13, 'Keanu Spencer II', 'keanu-spencer-ii', 'Quam autem reiciendis qui quibusdam soluta qui. Non molestiae ut iste reiciendis nihil. Accusantium minima nulla dicta error voluptas ut explicabo.', 'Deserunt doloribus modi repudiandae. Quasi tempora sint soluta corporis at quod et minus. Magnam sed in expedita eligendi accusamus. Doloribus eius qui ut reiciendis.', NULL, '{\"title\":\"Keanu Spencer II\",\"keywords\":\"Keanu Spencer II\",\"description\":\"Keanu Spencer II\"}', 'vi', 7),
(14, 'Micah Roberts', 'micah-roberts', 'Voluptatem nostrum in iure impedit enim expedita. Et nam maiores dolore cumque modi esse suscipit. Dolorum perferendis non sequi cumque. Expedita modi id voluptate. Omnis quis quod modi dolore.', 'Eveniet sunt esse veritatis harum illo fuga ut. Aliquam neque et unde ipsa animi provident accusamus quibusdam. Id hic ipsam et.', NULL, '{\"title\":\"Micah Roberts\",\"keywords\":\"Micah Roberts\",\"description\":\"Micah Roberts\"}', 'en', 7),
(15, 'Roxanne Gibson', 'roxanne-gibson', 'Vel consequatur officia reiciendis eos. Ut blanditiis nobis eius. Aut rerum quo eligendi eos deserunt modi modi. A placeat consequuntur ipsam explicabo rerum et.', 'Perspiciatis quidem ut hic aliquid eaque nihil beatae. Quidem quas mollitia ut repudiandae iste delectus odio. Nobis accusamus asperiores aut veniam illum. Accusamus quibusdam eveniet dolore porro est enim.', NULL, '{\"title\":\"Roxanne Gibson\",\"keywords\":\"Roxanne Gibson\",\"description\":\"Roxanne Gibson\"}', 'vi', 8),
(16, 'Betsy Lubowitz', 'betsy-lubowitz', 'Quo sed qui quae ipsam. In sit ea provident nemo alias ut. Dolore aut enim aut distinctio excepturi quo amet. Sint aut debitis accusamus eum aspernatur nemo voluptatum.', 'Molestias id sint ut et aut aut possimus. Dolores illo vitae accusamus dolores eligendi eum. Quae voluptatem reiciendis molestias. Fugit facere impedit ullam deserunt quo labore.', NULL, '{\"title\":\"Betsy Lubowitz\",\"keywords\":\"Betsy Lubowitz\",\"description\":\"Betsy Lubowitz\"}', 'en', 8),
(17, 'Tiffany Heidenreich', 'tiffany-heidenreich', 'Illo impedit et quos sapiente cupiditate optio. Et ut quas sit deleniti. Molestiae neque consequatur voluptatum rerum maiores aliquam tempore. Et laboriosam et exercitationem quasi eveniet fugiat.', 'Quia deleniti eaque ipsam in porro et amet. Non ducimus soluta facilis aut. Officiis id neque repellendus tempora. Ipsa in veritatis facilis expedita consequatur ex quaerat.', NULL, '{\"title\":\"Tiffany Heidenreich\",\"keywords\":\"Tiffany Heidenreich\",\"description\":\"Tiffany Heidenreich\"}', 'vi', 9),
(18, 'Ciara Monahan', 'ciara-monahan', 'Placeat dolore accusamus et quia voluptate. Sint ab sit deleniti ea. Et et dolorem vitae molestiae occaecati amet.', 'Nobis porro reiciendis ut ad facere eum. Et non autem est. Dolorum quia delectus at expedita aut. Neque qui itaque officiis dolorum.', NULL, '{\"title\":\"Ciara Monahan\",\"keywords\":\"Ciara Monahan\",\"description\":\"Ciara Monahan\"}', 'en', 9),
(19, 'Candace Vandervort', 'candace-vandervort', 'Totam est aut optio necessitatibus dolore ullam recusandae. Aut animi rerum illum autem id dicta. Ut laborum autem quia velit et nulla earum.', 'Aut animi non iusto ipsam culpa commodi. Delectus dolore ut sequi. Et necessitatibus officiis ipsum quis unde recusandae numquam. Maxime illo ut ea a.', NULL, '{\"title\":\"Candace Vandervort\",\"keywords\":\"Candace Vandervort\",\"description\":\"Candace Vandervort\"}', 'vi', 10),
(20, 'Daphney Ortiz', 'daphney-ortiz', 'Doloremque fuga qui fuga et ut ut. Doloremque voluptatem cupiditate eum. Rerum in aut optio et doloremque vitae deleniti. Consequatur et aut voluptas aut veniam.', 'Voluptatibus numquam est ut magni suscipit dolor dolores. Corporis exercitationem magni similique autem cupiditate quos. Dolores est cumque eos doloremque. Voluptas ex rerum commodi sapiente.', NULL, '{\"title\":\"Daphney Ortiz\",\"keywords\":\"Daphney Ortiz\",\"description\":\"Daphney Ortiz\"}', 'en', 10),
(21, 'Prof. Tess Gerlach MD', 'prof-tess-gerlach-md', 'Est voluptas aspernatur accusamus atque ea ad. Laboriosam saepe consequatur voluptas est modi. Inventore aut delectus enim. Quas voluptatem aut blanditiis.', 'Distinctio et quibusdam iure voluptates aut et. Eum cum temporibus animi mollitia sint id et. Dolores cupiditate dolorem officiis veritatis voluptates aut.', NULL, '{\"title\":\"Prof. Tess Gerlach MD\",\"keywords\":\"Prof. Tess Gerlach MD\",\"description\":\"Prof. Tess Gerlach MD\"}', 'vi', 11),
(22, 'Antwon Hartmann', 'antwon-hartmann', 'Nostrum esse impedit adipisci et sunt deserunt dolores. Natus vitae fuga quas neque. Dicta consequatur et aut et et quo.', 'A culpa quis dolor a qui tempore. Iure omnis mollitia occaecati quia quis tenetur.', NULL, '{\"title\":\"Antwon Hartmann\",\"keywords\":\"Antwon Hartmann\",\"description\":\"Antwon Hartmann\"}', 'en', 11),
(23, 'Annetta Mosciski', 'annetta-mosciski', 'In consequuntur magni possimus fugit ipsum dolorem est. Repudiandae iste dolores saepe qui ut. Explicabo dolores cumque illum molestiae aut repellat quibusdam.', 'Quo iste maiores velit amet. Numquam tenetur eligendi aut vel ea.', NULL, '{\"title\":\"Annetta Mosciski\",\"keywords\":\"Annetta Mosciski\",\"description\":\"Annetta Mosciski\"}', 'vi', 12),
(24, 'Marjory Spinka', 'marjory-spinka', 'Id dolore quasi ab natus sit enim. Eum quae illum eos perferendis soluta consequuntur. Voluptatem quasi est at maxime voluptatem provident rem.', 'Repellendus sit perspiciatis non incidunt. Laboriosam aliquam quibusdam id commodi aut veritatis molestiae voluptatem. Numquam fugit iste quod dolorem rerum dicta. Hic rerum sed doloremque.', NULL, '{\"title\":\"Marjory Spinka\",\"keywords\":\"Marjory Spinka\",\"description\":\"Marjory Spinka\"}', 'en', 12),
(25, 'Mr. Cooper Bernier I', 'mr-cooper-bernier-i', 'Cupiditate quas unde officia facilis et facilis. Inventore ut asperiores quia autem qui. Qui consequuntur ratione sit temporibus ut.', 'Et animi rerum repudiandae. Sed facilis consequatur harum dolores id aperiam. Ullam ratione amet quo ratione possimus voluptates sed aut.', NULL, '{\"title\":\"Mr. Cooper Bernier I\",\"keywords\":\"Mr. Cooper Bernier I\",\"description\":\"Mr. Cooper Bernier I\"}', 'vi', 13),
(26, 'Sammy Green', 'sammy-green', 'Minima fuga voluptate voluptates et. Cumque debitis nihil sed non cumque officia totam. Culpa fugit qui earum explicabo sed nihil. Nihil repellendus molestias fugit quia qui.', 'Quas amet optio repudiandae distinctio numquam dolor dicta. Consequuntur debitis aut dolores nam eum. Repellat perspiciatis voluptatibus consequatur consequatur qui.', NULL, '{\"title\":\"Sammy Green\",\"keywords\":\"Sammy Green\",\"description\":\"Sammy Green\"}', 'en', 13),
(27, 'Prof. Brody Rempel', 'prof-brody-rempel', 'Delectus dolor temporibus in doloribus qui odit. Enim repellendus sed omnis consequatur voluptatem.', 'Dolor illum hic velit qui. Assumenda dolores non assumenda id eaque impedit et. Repellendus autem debitis sit consequatur iusto optio explicabo suscipit. Rerum tempore accusamus omnis ea.', NULL, '{\"title\":\"Prof. Brody Rempel\",\"keywords\":\"Prof. Brody Rempel\",\"description\":\"Prof. Brody Rempel\"}', 'vi', 14),
(28, 'Dr. Mara Wyman', 'dr-mara-wyman', 'Similique ea consequuntur in voluptate. Praesentium atque nulla in velit nihil et. Dicta error assumenda enim. Nulla ut sapiente pariatur non.', 'Alias labore non minima dolor velit repellat. Dolores tenetur ut iste. Veniam qui nemo quasi quisquam.', NULL, '{\"title\":\"Dr. Mara Wyman\",\"keywords\":\"Dr. Mara Wyman\",\"description\":\"Dr. Mara Wyman\"}', 'en', 14),
(29, 'Esteban Lynch', 'esteban-lynch', 'Vel quod recusandae eum ut placeat. Ut aut placeat numquam vel et voluptas eos. Natus et et sit iure eos. Voluptatem reiciendis similique necessitatibus velit consequatur iure.', 'At illo quas harum rerum quia voluptas doloribus. Eos vel consequatur minima sed. Facilis aspernatur numquam itaque quis pariatur.', NULL, '{\"title\":\"Esteban Lynch\",\"keywords\":\"Esteban Lynch\",\"description\":\"Esteban Lynch\"}', 'vi', 15),
(30, 'Jovani O\'Conner', 'jovani-oconner', 'Aut consequatur dolores quisquam. Officia quod voluptate numquam officiis sunt nisi. Iusto consequatur vel nihil deserunt veniam quis et. Eum et nisi ratione omnis dolores vel cum et.', 'In labore quidem est dolores. In magnam qui a aut perferendis. Molestiae et inventore repudiandae sed voluptas consequatur. Magnam magni qui excepturi tempora necessitatibus quas aut.', NULL, '{\"title\":\"Jovani O\'Conner\",\"keywords\":\"Jovani O\'Conner\",\"description\":\"Jovani O\'Conner\"}', 'en', 15),
(31, 'Danika Hessel', 'danika-hessel', 'Iusto error quis cumque non quibusdam aut. Distinctio voluptatem alias qui et deserunt. Quia adipisci aut at voluptas esse voluptatem. Est voluptatem voluptatibus ut aperiam veritatis quis.', 'Ut sit officiis cum eum voluptas. Sed molestiae aut eum distinctio molestiae ea aut. Earum possimus sequi nobis facere ipsum nihil voluptatum.', NULL, '{\"title\":\"Danika Hessel\",\"keywords\":\"Danika Hessel\",\"description\":\"Danika Hessel\"}', 'vi', 16),
(32, 'Soledad Bailey', 'soledad-bailey', 'Iste error ea eligendi quia. Sint ut non est magnam suscipit et voluptatum. Aut aut ut sunt.', 'Voluptas accusamus repellendus tempora deleniti non ratione. Ut minus eligendi est. Reiciendis veritatis possimus eos assumenda est. Quidem nihil eligendi aut veritatis ad voluptatem molestias.', NULL, '{\"title\":\"Soledad Bailey\",\"keywords\":\"Soledad Bailey\",\"description\":\"Soledad Bailey\"}', 'en', 16),
(33, 'Elizabeth Ullrich', 'elizabeth-ullrich', 'Nihil qui eligendi suscipit culpa. Rerum temporibus et dolor consequuntur perspiciatis architecto vero. Quibusdam nihil libero omnis animi et. Tenetur voluptas ducimus sed tempore.', 'Rerum in consectetur est impedit qui possimus aut. Tempora quia id error dolor sed a. Consequuntur reprehenderit corrupti iusto. Dolorem unde repudiandae totam ipsum qui velit dolorem.', NULL, '{\"title\":\"Elizabeth Ullrich\",\"keywords\":\"Elizabeth Ullrich\",\"description\":\"Elizabeth Ullrich\"}', 'vi', 17),
(34, 'Deven Cruickshank', 'deven-cruickshank', 'Cum illo ut voluptatum quia. Natus perferendis voluptatem aut provident porro. Nihil adipisci saepe occaecati dolor quia. Suscipit omnis officia illum quas consequatur.', 'Est dignissimos vitae quos ut ipsum. Quod qui sequi sunt nesciunt. Iure et impedit culpa officiis.', NULL, '{\"title\":\"Deven Cruickshank\",\"keywords\":\"Deven Cruickshank\",\"description\":\"Deven Cruickshank\"}', 'en', 17),
(35, 'Vance Dicki', 'vance-dicki', 'Et minima odio voluptatum. Et laborum vel est non quasi. Vel sit nemo occaecati. Dolor voluptas nostrum neque et perferendis aut. Eveniet ut omnis cumque quod voluptatum dicta in.', 'Itaque et et odit qui dolorum ipsa aut. Necessitatibus cupiditate est et et fugiat nisi aut. Iure saepe vitae est qui dolore aut repellendus.', NULL, '{\"title\":\"Vance Dicki\",\"keywords\":\"Vance Dicki\",\"description\":\"Vance Dicki\"}', 'vi', 18),
(36, 'Ludie Hyatt', 'ludie-hyatt', 'Quae rerum accusantium alias. Ratione ut voluptatem modi dolorum sit saepe quia. Amet vero veniam repellat quam quaerat.', 'Reiciendis dolorem libero quasi id. Et sapiente ullam quia fuga illum. Saepe ea quam libero sequi enim.', NULL, '{\"title\":\"Ludie Hyatt\",\"keywords\":\"Ludie Hyatt\",\"description\":\"Ludie Hyatt\"}', 'en', 18),
(37, 'Mariam Powlowski II', 'mariam-powlowski-ii', 'Dolorem non non aperiam nulla non nam. Dolore quis voluptas ut nam autem eaque. Iure quidem animi voluptatibus maxime ut velit. Minus iusto esse provident voluptatibus.', 'Quo fuga et et officiis quaerat quos. Illum exercitationem eos consectetur sunt omnis ipsam. Modi ipsam et sed veritatis praesentium. Reprehenderit veritatis quae qui molestiae consequatur consectetur.', NULL, '{\"title\":\"Mariam Powlowski II\",\"keywords\":\"Mariam Powlowski II\",\"description\":\"Mariam Powlowski II\"}', 'vi', 19),
(38, 'Immanuel Tremblay', 'immanuel-tremblay', 'Ab asperiores facilis aut temporibus. Quidem quis eligendi dolorum rem nisi eaque. Et quis fugit fugit in. Debitis est aut id vero doloribus. Commodi officia ducimus unde hic incidunt sed neque.', 'Commodi consequuntur sed recusandae ipsa possimus. Iste ea consequatur est quia facere. Sed et rerum ut consequatur quibusdam.', NULL, '{\"title\":\"Immanuel Tremblay\",\"keywords\":\"Immanuel Tremblay\",\"description\":\"Immanuel Tremblay\"}', 'en', 19),
(39, 'Rudolph Gerhold', 'rudolph-gerhold', 'Id dolor natus possimus repudiandae reiciendis dolores ut. Ipsum accusamus excepturi est qui quasi vero nihil. Et voluptatem eveniet unde asperiores. Et eveniet qui eveniet rerum.', 'Non fugiat sed sint et et magnam consequatur. Temporibus suscipit eaque aut tempore. Voluptate laudantium ut voluptas non.', NULL, '{\"title\":\"Rudolph Gerhold\",\"keywords\":\"Rudolph Gerhold\",\"description\":\"Rudolph Gerhold\"}', 'vi', 20),
(40, 'Hannah Bauch', 'hannah-bauch', 'Et consequatur repellendus libero. Sequi aliquid velit quibusdam a autem distinctio incidunt.', 'Illum inventore minima eveniet deserunt reiciendis ut. Veritatis voluptatibus placeat molestiae nihil. Tenetur architecto consectetur explicabo dolores.', NULL, '{\"title\":\"Hannah Bauch\",\"keywords\":\"Hannah Bauch\",\"description\":\"Hannah Bauch\"}', 'en', 20),
(41, 'Tavares Price', 'tavares-price', 'Id omnis et ut laborum. Est nemo voluptates pariatur est nihil. Officia maiores esse velit incidunt voluptas vel iure. Reiciendis harum earum earum ut voluptatem sint.', 'Molestiae ducimus similique ut. Suscipit repudiandae quam et hic excepturi. Et tempora qui dolorem iusto id et ratione. Ipsa soluta ut corrupti quia.', NULL, '{\"title\":\"Tavares Price\",\"keywords\":\"Tavares Price\",\"description\":\"Tavares Price\"}', 'vi', 21),
(42, 'Dr. Kade Erdman DVM', 'dr-kade-erdman-dvm', 'Error et temporibus voluptate fugit sed vitae. Consequatur voluptas ad quis et cumque optio qui. Commodi nam quae voluptate quasi maxime.', 'Rerum est fuga laudantium repellendus. A ipsum tempore et qui. Dicta ab atque quidem id rem ratione id. Et in mollitia magnam magni eligendi fuga consequatur.', NULL, '{\"title\":\"Dr. Kade Erdman DVM\",\"keywords\":\"Dr. Kade Erdman DVM\",\"description\":\"Dr. Kade Erdman DVM\"}', 'en', 21),
(43, 'Jayce Kunze', 'jayce-kunze', 'Odit ullam totam provident dicta aspernatur. Saepe ut et in exercitationem quia quod cupiditate. Incidunt et inventore necessitatibus possimus id. Voluptatem adipisci et aut qui.', 'Voluptatem saepe quis qui eum harum ea consequatur. Excepturi maiores inventore incidunt nam ut vel. Rerum ipsam dolorem sed animi. Vel voluptatem quisquam et.', NULL, '{\"title\":\"Jayce Kunze\",\"keywords\":\"Jayce Kunze\",\"description\":\"Jayce Kunze\"}', 'vi', 22),
(44, 'Alphonso Mosciski', 'alphonso-mosciski', 'Velit perspiciatis libero possimus eos sit. Rerum minus inventore sequi minus sed excepturi asperiores.', 'Sit nemo inventore maiores aut ea dolorem. In tempore deleniti dolorem in nihil necessitatibus.', NULL, '{\"title\":\"Alphonso Mosciski\",\"keywords\":\"Alphonso Mosciski\",\"description\":\"Alphonso Mosciski\"}', 'en', 22),
(45, 'Edyth Sauer', 'edyth-sauer', 'Ea necessitatibus culpa sapiente ut recusandae. Odio provident reprehenderit odit. Est in vero vel odit nihil ut.', 'Earum est ut dolorum nisi aut qui mollitia. Exercitationem voluptatem nostrum odio culpa corrupti est. Voluptatem omnis tempore accusantium voluptatem.', NULL, '{\"title\":\"Edyth Sauer\",\"keywords\":\"Edyth Sauer\",\"description\":\"Edyth Sauer\"}', 'vi', 23),
(46, 'Quincy Johns', 'quincy-johns', 'Et debitis eius consectetur ipsa deleniti adipisci. Distinctio repudiandae et exercitationem voluptatem ex. Qui non cumque tenetur et quia dolorem. Ratione at ipsam quidem natus quas sed.', 'Neque sint suscipit non recusandae fuga ad numquam. Placeat et qui rerum rem aut cupiditate labore repellendus. Ipsa alias pariatur tenetur repellendus pariatur optio.', NULL, '{\"title\":\"Quincy Johns\",\"keywords\":\"Quincy Johns\",\"description\":\"Quincy Johns\"}', 'en', 23),
(47, 'Selmer Willms', 'selmer-willms', 'Assumenda aut culpa omnis quas. Sunt dignissimos totam repudiandae provident. Eaque est corporis et voluptate est.', 'Ratione labore ea nostrum sint. Qui sapiente ex vero quod fuga. Dolor ipsum dolore aut laboriosam labore et.', NULL, '{\"title\":\"Selmer Willms\",\"keywords\":\"Selmer Willms\",\"description\":\"Selmer Willms\"}', 'vi', 24),
(48, 'Van Hirthe III', 'van-hirthe-iii', 'Adipisci aut quia quas voluptas hic. Nam quos suscipit sed consequatur nesciunt nihil velit. Aperiam exercitationem ut repellat. Quia sed eius eveniet ut amet modi placeat.', 'Quas quos quia ipsam ex voluptatibus voluptas blanditiis maxime. Itaque nihil veritatis expedita non et dolor autem. Nostrum nam perspiciatis id aspernatur reiciendis. Et rem accusamus dicta iure omnis.', NULL, '{\"title\":\"Van Hirthe III\",\"keywords\":\"Van Hirthe III\",\"description\":\"Van Hirthe III\"}', 'en', 24),
(49, 'Deon Doyle', 'deon-doyle', 'Soluta est minus maxime sint odit. Et cumque qui saepe porro dicta distinctio. Doloremque et impedit consequatur voluptas sed.', 'Illo beatae explicabo et nam quia. Architecto et et quia. Omnis pariatur et sequi tenetur ex. Qui consequatur et iste sunt neque blanditiis.', NULL, '{\"title\":\"Deon Doyle\",\"keywords\":\"Deon Doyle\",\"description\":\"Deon Doyle\"}', 'vi', 25),
(50, 'Dr. Jailyn Bayer', 'dr-jailyn-bayer', 'Consectetur in quam atque ipsum quam explicabo. Omnis maxime odit adipisci voluptates et et itaque. Minus praesentium et totam commodi quia molestiae sit. Quos tenetur provident totam id corrupti.', 'Quia sint eos voluptatem nobis dolores. Nulla qui et et culpa. Ut ipsa harum hic nisi corrupti. Optio expedita quam libero rerum error velit.', NULL, '{\"title\":\"Dr. Jailyn Bayer\",\"keywords\":\"Dr. Jailyn Bayer\",\"description\":\"Dr. Jailyn Bayer\"}', 'en', 25),
(51, 'Brisa Anderson IV', 'brisa-anderson-iv', 'Et unde nostrum deleniti quia atque voluptatem praesentium. Deserunt omnis voluptatem officia aut consequatur a voluptates. Et distinctio maxime ratione animi ut ducimus quasi eligendi.', 'Reprehenderit repudiandae nemo quis accusamus rerum mollitia. Consequatur saepe nihil voluptates.', NULL, '{\"title\":\"Brisa Anderson IV\",\"keywords\":\"Brisa Anderson IV\",\"description\":\"Brisa Anderson IV\"}', 'vi', 26),
(52, 'Prof. Ignatius Hartmann', 'prof-ignatius-hartmann', 'Sequi nisi ut quod molestiae nam. Nisi commodi odit non suscipit. Vel laudantium sed nihil voluptatem.', 'Blanditiis aperiam dolor vel voluptatum. Consequatur omnis fugiat in in. Ullam molestiae iure harum praesentium vel earum fugiat. Enim consectetur ut eaque dolor eveniet et. Id sed vel quaerat est.', NULL, '{\"title\":\"Prof. Ignatius Hartmann\",\"keywords\":\"Prof. Ignatius Hartmann\",\"description\":\"Prof. Ignatius Hartmann\"}', 'en', 26),
(53, 'Tom Lemke', 'tom-lemke', 'Eaque corporis tempora placeat delectus necessitatibus voluptatem labore reiciendis. Ipsam aspernatur molestias quos dignissimos pariatur soluta iste. Maxime est ratione enim.', 'Perferendis ad libero officia veritatis. Mollitia culpa corporis cupiditate et reiciendis molestiae. Dolorem voluptatem eligendi quam aut aut et eum soluta.', NULL, '{\"title\":\"Tom Lemke\",\"keywords\":\"Tom Lemke\",\"description\":\"Tom Lemke\"}', 'vi', 27),
(54, 'Miss Daphney Parisian Sr.', 'miss-daphney-parisian-sr', 'Natus minus tempora itaque. Libero unde modi rem ipsam occaecati qui ea.', 'Delectus atque quam est expedita est reiciendis. Aut magnam voluptas dolor doloribus velit cum. Qui eum harum ut error aut laborum dolorem. Nihil reprehenderit delectus nulla adipisci pariatur reprehenderit.', NULL, '{\"title\":\"Miss Daphney Parisian Sr.\",\"keywords\":\"Miss Daphney Parisian Sr.\",\"description\":\"Miss Daphney Parisian Sr.\"}', 'en', 27),
(55, 'Quinton Wunsch MD', 'quinton-wunsch-md', 'Quidem omnis dolor provident vel voluptatem eum dolores. Sed quas distinctio ab exercitationem dolor est. Sequi recusandae quidem quia est. Maiores numquam minima magni quia vel.', 'Qui natus dolores amet eaque blanditiis nostrum. Molestias esse quod quia autem voluptate officiis ullam quia. Ut dolor cupiditate aliquid vero.', NULL, '{\"title\":\"Quinton Wunsch MD\",\"keywords\":\"Quinton Wunsch MD\",\"description\":\"Quinton Wunsch MD\"}', 'vi', 28),
(56, 'Prof. Peyton Koepp MD', 'prof-peyton-koepp-md', 'Laudantium incidunt assumenda eos commodi odio dolorem. Optio fuga maxime quia pariatur eum unde.', 'Quos beatae tempora sequi enim iste. Est excepturi enim earum error rerum molestiae accusantium. Perspiciatis magnam quisquam quis neque non optio quod. At sit fuga et autem voluptatem amet provident.', NULL, '{\"title\":\"Prof. Peyton Koepp MD\",\"keywords\":\"Prof. Peyton Koepp MD\",\"description\":\"Prof. Peyton Koepp MD\"}', 'en', 28),
(57, 'Elian Glover', 'elian-glover', 'Qui praesentium cupiditate quo minus. Labore ipsam velit qui tempore dolores.', 'Consequatur quam iste dolorem nam beatae. Qui eius qui molestias dolore aut asperiores enim et. Sunt nihil maxime ipsa quibusdam est facere. Qui totam fugit ut et.', NULL, '{\"title\":\"Elian Glover\",\"keywords\":\"Elian Glover\",\"description\":\"Elian Glover\"}', 'vi', 29),
(58, 'Miss Imogene Wiegand', 'miss-imogene-wiegand', 'Ipsam similique illum qui et ab sapiente. Est soluta maxime dolor impedit consequatur ut. Ipsum natus sed suscipit architecto necessitatibus.', 'Saepe laudantium consequatur qui sed laudantium ducimus. Voluptatem molestiae ut dolorum quae dolorem dolores et. Quibusdam eos autem molestias.', NULL, '{\"title\":\"Miss Imogene Wiegand\",\"keywords\":\"Miss Imogene Wiegand\",\"description\":\"Miss Imogene Wiegand\"}', 'en', 29),
(59, 'Reginald Bayer PhD', 'reginald-bayer-phd', 'Possimus facilis et cum quibusdam aliquid vel asperiores. Consequatur eos nesciunt omnis et eius. Modi temporibus atque voluptatem deleniti quos quia nihil.', 'Nihil dicta sed est voluptatem tempore sunt doloribus recusandae. Voluptatem et fuga id.', NULL, '{\"title\":\"Reginald Bayer PhD\",\"keywords\":\"Reginald Bayer PhD\",\"description\":\"Reginald Bayer PhD\"}', 'vi', 30),
(60, 'Dr. Rahul Kuhic', 'dr-rahul-kuhic', 'Officiis non est occaecati reprehenderit eum. Perspiciatis quibusdam perferendis voluptatem qui ipsa. Corporis cumque voluptatibus quo.', 'Nostrum sequi at et. Et voluptatem et eaque numquam recusandae voluptas. Rerum non similique eveniet voluptatem.', NULL, '{\"title\":\"Dr. Rahul Kuhic\",\"keywords\":\"Dr. Rahul Kuhic\",\"description\":\"Dr. Rahul Kuhic\"}', 'en', 30),
(61, 'Trinity Cole', 'trinity-cole', 'Sapiente est ut quia nisi quaerat corrupti. Et non eius praesentium autem vitae ducimus. Nostrum est fugit quo repellat repudiandae dolorem. Culpa nisi at ducimus dicta tempore autem molestiae.', 'Aut quia dolore voluptatibus eos. Nesciunt ea culpa cum voluptas natus. Officiis explicabo ipsa veniam et. Dolorem minima eum quo vel. Saepe molestias ut numquam officiis tempora.', NULL, '{\"title\":\"Trinity Cole\",\"keywords\":\"Trinity Cole\",\"description\":\"Trinity Cole\"}', 'vi', 31),
(62, 'Dr. Earnestine Veum', 'dr-earnestine-veum', 'Aut explicabo accusamus deleniti odio. Debitis fuga voluptatem placeat nobis. Nobis fuga odit nemo.', 'Deserunt recusandae in debitis porro veniam numquam. Unde enim iure autem dolorem velit. Qui alias molestiae et molestiae provident sequi quis.', NULL, '{\"title\":\"Dr. Earnestine Veum\",\"keywords\":\"Dr. Earnestine Veum\",\"description\":\"Dr. Earnestine Veum\"}', 'en', 31),
(63, 'Toy Kerluke', 'toy-kerluke', 'Fugiat sint delectus quae tempore rerum tempora vero. Omnis in magnam est asperiores laudantium sunt placeat facere. Ad suscipit laboriosam sequi porro aspernatur. Ullam in aliquam deleniti et.', 'Ut quidem non non eveniet. Eos velit tenetur sed voluptatem sed totam.', NULL, '{\"title\":\"Toy Kerluke\",\"keywords\":\"Toy Kerluke\",\"description\":\"Toy Kerluke\"}', 'vi', 32),
(64, 'Dr. Charley Kris', 'dr-charley-kris', 'Qui voluptatibus sed dolor incidunt ut ea non. Cum est maxime repudiandae qui eaque.', 'Molestiae debitis veniam hic aut deserunt modi aliquid. Sapiente modi quam id nemo cupiditate voluptate nisi.', NULL, '{\"title\":\"Dr. Charley Kris\",\"keywords\":\"Dr. Charley Kris\",\"description\":\"Dr. Charley Kris\"}', 'en', 32),
(65, 'Prof. Isabel Weissnat', 'prof-isabel-weissnat', 'Odio voluptas ea dolores est reprehenderit. Illo dolorem temporibus laudantium odit provident mollitia. Impedit fugit non mollitia sint vitae.', 'Cumque vitae quibusdam natus consequatur nobis. Harum voluptatibus nihil id dolorem repudiandae.', NULL, '{\"title\":\"Prof. Isabel Weissnat\",\"keywords\":\"Prof. Isabel Weissnat\",\"description\":\"Prof. Isabel Weissnat\"}', 'vi', 33),
(66, 'Dr. Michaela Gerlach', 'dr-michaela-gerlach', 'Aliquid cumque dolores optio dolorem quasi. Exercitationem a delectus laudantium eum. Labore ab aperiam deleniti.', 'Nam qui corporis fugit minima. Dignissimos fuga est excepturi eum in omnis sint voluptatem. Eos quo minus adipisci commodi delectus voluptas ratione.', NULL, '{\"title\":\"Dr. Michaela Gerlach\",\"keywords\":\"Dr. Michaela Gerlach\",\"description\":\"Dr. Michaela Gerlach\"}', 'en', 33),
(67, 'Mr. Dorcas Stamm IV', 'mr-dorcas-stamm-iv', 'Autem sit ea autem quas magnam odit est. Animi qui exercitationem vel non. Tempora quisquam ea iure velit voluptatum eius.', 'Labore quia itaque cumque animi. Delectus eos officia consequuntur minima recusandae sit consequatur. Ratione pariatur recusandae exercitationem accusamus.', NULL, '{\"title\":\"Mr. Dorcas Stamm IV\",\"keywords\":\"Mr. Dorcas Stamm IV\",\"description\":\"Mr. Dorcas Stamm IV\"}', 'vi', 34),
(68, 'Aylin Schuster', 'aylin-schuster', 'Eveniet atque numquam et occaecati est. Est deleniti laboriosam sit. Debitis neque sunt non sit dolores amet voluptas consequatur. Iste recusandae molestiae assumenda ratione cumque est.', 'Possimus sint excepturi numquam molestias dolore ea. Animi quia quidem maxime maiores. Assumenda iusto nobis ut quo quis cumque earum iste. Consequatur tempora quo ut.', NULL, '{\"title\":\"Aylin Schuster\",\"keywords\":\"Aylin Schuster\",\"description\":\"Aylin Schuster\"}', 'en', 34),
(69, 'Alvera Daniel', 'alvera-daniel', 'Et et quod amet et voluptate odio aut eos. Facere quasi in cupiditate consequatur. Aliquid enim cumque veritatis possimus tempora repudiandae est.', 'Praesentium ut dolorem quasi. Omnis nesciunt ducimus ut sit. Facilis ex ratione eos.', NULL, '{\"title\":\"Alvera Daniel\",\"keywords\":\"Alvera Daniel\",\"description\":\"Alvera Daniel\"}', 'vi', 35),
(70, 'Sofia Gorczany', 'sofia-gorczany', 'Quisquam ut impedit dicta est. Aut inventore autem et sed fugiat sunt. Id reiciendis commodi labore sunt praesentium et laborum.', 'Commodi eveniet exercitationem accusantium consequatur vel accusantium numquam. Id maxime est delectus quasi doloribus et enim. Et adipisci animi quaerat beatae reiciendis ut. Delectus doloribus similique laboriosam non at et aut. Similique cupiditate rerum quis dignissimos repellat perferendis labore.', NULL, '{\"title\":\"Sofia Gorczany\",\"keywords\":\"Sofia Gorczany\",\"description\":\"Sofia Gorczany\"}', 'en', 35),
(71, 'Brenden Legros', 'brenden-legros', 'Iure vero sint sed magnam. Rerum ut quasi omnis laudantium eum est. Rerum expedita soluta consequatur vitae.', 'Sunt deserunt voluptas ratione inventore. Rem et consectetur exercitationem alias fugiat eos. Quis inventore non eos velit animi aliquid voluptate ut.', NULL, '{\"title\":\"Brenden Legros\",\"keywords\":\"Brenden Legros\",\"description\":\"Brenden Legros\"}', 'vi', 36),
(72, 'Frank Goldner MD', 'frank-goldner-md', 'Molestiae voluptas sint explicabo aut quia. Sapiente aut autem fugiat veritatis ut provident et. Ut eum impedit soluta esse maxime harum reiciendis placeat.', 'Enim ut optio quisquam quia ea. Iste et enim optio omnis qui veniam. Vel et id quis quo fugiat rerum.', NULL, '{\"title\":\"Frank Goldner MD\",\"keywords\":\"Frank Goldner MD\",\"description\":\"Frank Goldner MD\"}', 'en', 36),
(73, 'Lessie Jast', 'lessie-jast', 'Sequi ea magnam natus vero quia sit asperiores et. Aspernatur impedit omnis sed blanditiis voluptate. Incidunt distinctio temporibus magni impedit blanditiis.', 'Et ex ea et explicabo veniam voluptatem nulla. Nam similique reiciendis aut optio. Iusto ipsum voluptatem numquam asperiores fugit. Rerum omnis repudiandae cum numquam sit voluptate quos tempore. Optio voluptatum corrupti facere animi sed quis rerum maiores.', NULL, '{\"title\":\"Lessie Jast\",\"keywords\":\"Lessie Jast\",\"description\":\"Lessie Jast\"}', 'vi', 37),
(74, 'Carmella Nienow', 'carmella-nienow', 'Omnis dolorem inventore odio esse. Nisi enim voluptate eum ab. Explicabo sed soluta rerum natus natus pariatur ut.', 'Qui vel facere ab aut. Et non eos cum cum pariatur eaque tenetur. Officia esse itaque tenetur officia at quae accusamus aperiam.', NULL, '{\"title\":\"Carmella Nienow\",\"keywords\":\"Carmella Nienow\",\"description\":\"Carmella Nienow\"}', 'en', 37),
(75, 'Miss Aileen Kulas PhD', 'miss-aileen-kulas-phd', 'Accusantium ratione ducimus ipsa rerum est. Quia sapiente autem suscipit placeat. Laudantium optio voluptatum illum iure.', 'Asperiores et qui et et repudiandae doloribus blanditiis sint. Sapiente distinctio enim voluptatem velit ab est ex. Recusandae sed odio aut esse eveniet repellendus. Aperiam commodi minus placeat laboriosam et iste. Et aut ullam est nesciunt quia quia quis.', NULL, '{\"title\":\"Miss Aileen Kulas PhD\",\"keywords\":\"Miss Aileen Kulas PhD\",\"description\":\"Miss Aileen Kulas PhD\"}', 'vi', 38),
(76, 'Dr. Justen Parker V', 'dr-justen-parker-v', 'Culpa vero dolorum numquam inventore. Voluptatum vel laborum ut hic et. Et et nisi in qui aut. Error amet doloribus sint recusandae provident quod nobis.', 'Incidunt porro a omnis deleniti nam est error. Omnis perferendis reiciendis ex asperiores quas. Dolorem at error iure ipsam repellat incidunt. Vel esse hic et necessitatibus animi.', NULL, '{\"title\":\"Dr. Justen Parker V\",\"keywords\":\"Dr. Justen Parker V\",\"description\":\"Dr. Justen Parker V\"}', 'en', 38),
(77, 'Albertha Zboncak', 'albertha-zboncak', 'Labore aut dolor aut sapiente est culpa est. Temporibus aut reprehenderit molestiae quis omnis non hic. Sit dolorum itaque est vel rerum. Hic similique ipsum quaerat quia velit amet quis.', 'Dolorem tenetur ut quia voluptate nihil. Tempore quia quia dolores debitis voluptatem harum temporibus. Aperiam beatae sunt impedit molestiae non et qui. Minima eum commodi accusamus laudantium necessitatibus beatae. Consequatur qui consequatur numquam voluptatem officia nam aut.', NULL, '{\"title\":\"Albertha Zboncak\",\"keywords\":\"Albertha Zboncak\",\"description\":\"Albertha Zboncak\"}', 'vi', 39),
(78, 'Miss Krystel Koch', 'miss-krystel-koch', 'Non dignissimos labore eos dolore dolores. Et eveniet qui inventore quasi.', 'Vel amet nemo nisi illo suscipit maiores. Non mollitia laborum eos ut tenetur voluptas illo. Voluptatem placeat temporibus vero quos soluta nesciunt. Sed ducimus aut accusamus. Ea optio sit nemo et.', NULL, '{\"title\":\"Miss Krystel Koch\",\"keywords\":\"Miss Krystel Koch\",\"description\":\"Miss Krystel Koch\"}', 'en', 39),
(79, 'Prof. Brant Zemlak Jr.', 'prof-brant-zemlak-jr', 'Corrupti qui qui sed dolorem. Officiis nesciunt ex reiciendis aspernatur et. Et tempora officia ea perferendis aut porro.', 'Mollitia quos odio voluptas et quod sunt sint. In impedit deleniti dolorem error deserunt. Consequatur esse reiciendis consequuntur quis. Porro blanditiis modi maxime optio totam odit illo placeat.', NULL, '{\"title\":\"Prof. Brant Zemlak Jr.\",\"keywords\":\"Prof. Brant Zemlak Jr.\",\"description\":\"Prof. Brant Zemlak Jr.\"}', 'vi', 40),
(80, 'Chanel Watsica', 'chanel-watsica', 'Ut eveniet ratione fugiat et. Quos perspiciatis ducimus in architecto ratione. Fugit corporis doloribus reprehenderit. Autem non fuga odit magnam. Laborum et voluptatem qui sunt minima aperiam error.', 'Molestias aliquam sunt nobis sed sed vel. Voluptatem reiciendis ea qui aspernatur quasi id. Quam velit occaecati quisquam optio eum natus qui porro.', NULL, '{\"title\":\"Chanel Watsica\",\"keywords\":\"Chanel Watsica\",\"description\":\"Chanel Watsica\"}', 'en', 40),
(81, 'Armando Fahey', 'armando-fahey', 'Non optio nostrum quia sint. Officiis consequuntur ducimus quia nulla non voluptatem. Quia et eum explicabo aperiam perspiciatis. Beatae illum inventore quibusdam sapiente ut. Quis quas et incidunt.', 'Soluta provident rerum vitae omnis blanditiis ab. Sit rerum voluptas aut excepturi sequi. Dolorum quam debitis officia illo impedit.', NULL, '{\"title\":\"Armando Fahey\",\"keywords\":\"Armando Fahey\",\"description\":\"Armando Fahey\"}', 'vi', 41),
(82, 'Ally Purdy', 'ally-purdy', 'Sed velit enim a ducimus rerum. Incidunt dolores deserunt ut ut est. Et minima rem animi ipsum dolore.', 'Nihil et nam veritatis provident et iste non. Voluptas est ullam quos voluptas dolor dignissimos. Nulla eligendi ea sunt.', NULL, '{\"title\":\"Ally Purdy\",\"keywords\":\"Ally Purdy\",\"description\":\"Ally Purdy\"}', 'en', 41),
(83, 'Jonatan Bartoletti', 'jonatan-bartoletti', 'Est voluptas modi et quo. Omnis quia aliquid voluptate.', 'Dolores est voluptatem natus facilis ut. Perspiciatis rerum neque ea amet aliquid dolores ea. Ut facere sit repudiandae nostrum tempora placeat maiores. Impedit et necessitatibus sapiente amet et quia consequuntur.', NULL, '{\"title\":\"Jonatan Bartoletti\",\"keywords\":\"Jonatan Bartoletti\",\"description\":\"Jonatan Bartoletti\"}', 'vi', 42),
(84, 'Ms. Natasha Raynor Jr.', 'ms-natasha-raynor-jr', 'Eos enim unde impedit sint velit. Voluptatum reiciendis et doloribus est. Quas corrupti cum dignissimos facilis ullam distinctio quibusdam. Aliquam rerum minus ut quia et enim quia ea.', 'Earum aperiam corrupti sint itaque et et perspiciatis. Alias aut unde minus voluptatem optio. Sed perspiciatis repellat ut voluptas quia rem. Ipsum et ut tempore non consequatur.', NULL, '{\"title\":\"Ms. Natasha Raynor Jr.\",\"keywords\":\"Ms. Natasha Raynor Jr.\",\"description\":\"Ms. Natasha Raynor Jr.\"}', 'en', 42),
(85, 'Kellie Homenick', 'kellie-homenick', 'Velit explicabo sed repellendus sequi ut quod ratione. Consequatur commodi ut enim saepe sed. Quod facilis doloremque maxime qui voluptatibus. Eos cum earum unde maiores sit explicabo debitis.', 'Id voluptatem accusamus eius et. Voluptas aut voluptatem omnis temporibus eos est. Et qui culpa unde blanditiis et ut. Deserunt iure quo enim vitae fugit id unde rem. Porro eveniet labore sapiente sed voluptatem voluptatem fugit.', NULL, '{\"title\":\"Kellie Homenick\",\"keywords\":\"Kellie Homenick\",\"description\":\"Kellie Homenick\"}', 'vi', 43),
(86, 'August O\'Keefe', 'august-okeefe', 'Deleniti ullam porro perferendis. Occaecati aut praesentium voluptatibus velit. Perspiciatis est doloremque amet quas veniam sit rem. Suscipit error soluta ut error.', 'Praesentium facilis ea et. Nam sint quisquam illo. Voluptas non quia voluptas. Est consequatur reiciendis dolorem corporis ipsam est.', NULL, '{\"title\":\"August O\'Keefe\",\"keywords\":\"August O\'Keefe\",\"description\":\"August O\'Keefe\"}', 'en', 43),
(87, 'Dr. Rita Purdy', 'dr-rita-purdy', 'Non incidunt illum autem deleniti. Possimus voluptatum aut qui voluptates aut. Ad nihil quibusdam fuga veniam aliquid veniam est.', 'Exercitationem ducimus perferendis sit ut veniam. Blanditiis perspiciatis quos veniam recusandae doloribus dolor. Rerum aliquid autem natus qui enim consequatur animi.', NULL, '{\"title\":\"Dr. Rita Purdy\",\"keywords\":\"Dr. Rita Purdy\",\"description\":\"Dr. Rita Purdy\"}', 'vi', 44),
(88, 'Christop Prohaska', 'christop-prohaska', 'Quidem qui alias est asperiores. Explicabo vero quam quam. Assumenda tenetur accusamus neque. Architecto rerum blanditiis cum ea et fuga.', 'Impedit iste doloremque facilis blanditiis tempora. Accusantium voluptatem perferendis voluptas. Aut rem consequatur ab molestias rem laborum.', NULL, '{\"title\":\"Christop Prohaska\",\"keywords\":\"Christop Prohaska\",\"description\":\"Christop Prohaska\"}', 'en', 44),
(89, 'Darrel Huel', 'darrel-huel', 'Repellat sit omnis nostrum fugit. Repudiandae velit autem odio amet voluptate eum similique quae. Nobis consequatur voluptas fugit. Qui commodi est consequatur eligendi.', 'Perspiciatis id optio ut pariatur perferendis repellat. Cum eum aperiam vero quis ex consequatur. Quia nostrum voluptatem ipsa maiores et distinctio natus. Et eius autem eos nihil eaque. Atque reprehenderit reprehenderit aut dolor pariatur sunt officiis.', NULL, '{\"title\":\"Darrel Huel\",\"keywords\":\"Darrel Huel\",\"description\":\"Darrel Huel\"}', 'vi', 45),
(90, 'Tate Rice', 'tate-rice', 'Fuga aut nostrum in sint. Saepe vitae consequatur et incidunt commodi corporis.', 'Nesciunt sit ratione nisi quia et consequatur. Quia minus ab vel enim eveniet recusandae. Eaque laborum voluptatem sit necessitatibus et nihil quis. Officiis ullam est eius voluptatem nemo sit. Soluta similique expedita aut quasi nemo neque laborum.', NULL, '{\"title\":\"Tate Rice\",\"keywords\":\"Tate Rice\",\"description\":\"Tate Rice\"}', 'en', 45),
(91, 'Amely Howell Jr.', 'amely-howell-jr', 'Ut aut vitae dolorem nobis in natus consequatur. Perspiciatis dicta temporibus ipsum magnam qui et assumenda. Nihil soluta sit beatae repellendus aliquid.', 'Voluptate accusamus sed consequatur adipisci enim temporibus assumenda. Consequatur numquam vero soluta rerum temporibus et et. Consequuntur asperiores distinctio iusto ut.', NULL, '{\"title\":\"Amely Howell Jr.\",\"keywords\":\"Amely Howell Jr.\",\"description\":\"Amely Howell Jr.\"}', 'vi', 46),
(92, 'Trudie Little Jr.', 'trudie-little-jr', 'Et qui non molestias ipsa. Est quisquam doloremque qui officia. Voluptatem sunt sed voluptates quod.', 'Animi rem non nesciunt mollitia aut nihil necessitatibus enim. At et vel esse fugit. Doloremque fuga enim eos similique alias accusamus. Atque autem illum voluptatem sunt qui.', NULL, '{\"title\":\"Trudie Little Jr.\",\"keywords\":\"Trudie Little Jr.\",\"description\":\"Trudie Little Jr.\"}', 'en', 46),
(93, 'Santos Gerlach PhD', 'santos-gerlach-phd', 'Ea quo pariatur voluptatum sit voluptate repudiandae odit. Rem omnis similique reiciendis dolor. Voluptatum possimus voluptatem voluptates molestiae rerum consequatur. Nobis incidunt aut a nisi.', 'Excepturi nesciunt id magnam adipisci perferendis cupiditate. Sit non possimus illo quos voluptas harum minus. Quos alias et velit. Ipsam odit atque tempora dolores.', NULL, '{\"title\":\"Santos Gerlach PhD\",\"keywords\":\"Santos Gerlach PhD\",\"description\":\"Santos Gerlach PhD\"}', 'vi', 47),
(94, 'Joshuah Kub', 'joshuah-kub', 'Dolore id in totam. Rem qui atque alias ut. Quod eum quia est eveniet.', 'Dolor sint nihil repellendus. Tempora minus vel cum aut enim est voluptate dolorem. Amet architecto quia voluptas quae earum.', NULL, '{\"title\":\"Joshuah Kub\",\"keywords\":\"Joshuah Kub\",\"description\":\"Joshuah Kub\"}', 'en', 47),
(95, 'Dr. Josefina Rowe', 'dr-josefina-rowe', 'Sed temporibus facere mollitia eos repellat. Aut id omnis aliquam aut repudiandae reiciendis. In corrupti ipsa tempora repellat. Laboriosam similique qui architecto quia atque culpa nemo nostrum.', 'A voluptate numquam ut eius et optio natus. Molestiae cupiditate fuga voluptate rerum. Magnam cupiditate ipsa corporis possimus labore.', NULL, '{\"title\":\"Dr. Josefina Rowe\",\"keywords\":\"Dr. Josefina Rowe\",\"description\":\"Dr. Josefina Rowe\"}', 'vi', 48),
(96, 'Meghan Nader', 'meghan-nader', 'Dicta culpa labore sint excepturi maxime similique debitis. Nulla consequatur consectetur voluptatum eum accusantium cumque minima.', 'Eum asperiores voluptatem ipsum ut. Eaque a nihil eum voluptas earum at blanditiis ea. Minima rerum dolorem suscipit perferendis laborum libero. Praesentium sapiente earum nulla et aut dolor sit non.', NULL, '{\"title\":\"Meghan Nader\",\"keywords\":\"Meghan Nader\",\"description\":\"Meghan Nader\"}', 'en', 48),
(97, 'Mrs. Maybell Christiansen MD', 'mrs-maybell-christiansen-md', 'Et commodi non necessitatibus sed quas fuga incidunt. Placeat voluptas consequatur qui eligendi et officiis. Ad ipsam rerum dolore autem veritatis.', 'Adipisci mollitia nisi quis voluptatum tenetur aspernatur maiores. Voluptas sed cum natus dolorum reiciendis. Voluptas est ipsa aut laborum sapiente.', NULL, '{\"title\":\"Mrs. Maybell Christiansen MD\",\"keywords\":\"Mrs. Maybell Christiansen MD\",\"description\":\"Mrs. Maybell Christiansen MD\"}', 'vi', 49),
(98, 'Dr. Kane Pouros V', 'dr-kane-pouros-v', 'Quibusdam fugit saepe quisquam non ut. Id animi molestiae voluptatum consectetur recusandae unde sed laudantium. Eaque qui voluptatem dolore. Mollitia quae est veniam nulla ipsa.', 'Est aut debitis atque alias ipsam illum omnis. Alias cupiditate consectetur placeat quos. Perferendis id id sint commodi dolores praesentium numquam. Pariatur sit mollitia fuga ipsam ipsum officiis est voluptatibus. Necessitatibus quis voluptatem assumenda excepturi eos eum.', NULL, '{\"title\":\"Dr. Kane Pouros V\",\"keywords\":\"Dr. Kane Pouros V\",\"description\":\"Dr. Kane Pouros V\"}', 'en', 49),
(99, 'Alessia Beatty', 'alessia-beatty', 'Quas ipsam est tempore in id rerum. Et animi iste labore dolor. Quaerat in illo maiores qui officiis.', '<p>Quae necessitatibus aspernatur aliquid perferendis. Ipsam et et mollitia sunt et. Tempora nemo enim explicabo laudantium corporis est. Similique officiis nisi consequuntur quia in quas.</p>', NULL, '{\"title\":\"Alessia Beatty\",\"keywords\":\"Alessia Beatty\",\"description\":\"Alessia Beatty\"}', 'vi', 50),
(100, 'Dr. Hilbert Prosacco', 'alessia-beatty', 'Numquam vel at commodi sint voluptas praesentium facilis. Et officia quisquam perferendis veritatis aut dolorem voluptatibus. Sit harum veritatis totam natus. Libero atque et doloremque.', '<p>Harum cupiditate nihil placeat aspernatur. Optio reiciendis consectetur impedit recusandae est. Est non debitis et dolorum.</p>', NULL, '{\"title\":\"Dr. Hilbert Prosacco\",\"keywords\":\"Dr. Hilbert Prosacco\",\"description\":\"Dr. Hilbert Prosacco\"}', 'en', 50),
(101, 'Tiêu đề', 'tieu-de', 'Mô tả', NULL, NULL, NULL, 'vi', 51),
(102, NULL, 'tieu-de', NULL, NULL, NULL, NULL, 'en', 51);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `code`, `regular_price`, `sale_price`, `original_price`, `weight`, `link`, `image`, `alt`, `attachments`, `priority`, `status`, `supplier_id`, `category_id`, `user_id`, `type`, `viewed`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, '35479983', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:37', '2018-04-01 18:13:37'),
(2, '6115', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:37', '2018-04-01 18:13:37'),
(3, '662412222', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:37', '2018-04-01 18:13:37'),
(4, '24368', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:38', '2018-04-01 18:13:38'),
(5, '8', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:38', '2018-04-01 18:13:38'),
(6, '43898', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:38', '2018-04-01 18:13:38'),
(7, '149889', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:38', '2018-04-01 18:13:38'),
(8, '466', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:38', '2018-04-01 18:13:38'),
(9, '32715', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:38', '2018-04-01 18:13:38'),
(10, '768040077', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:38', '2018-04-01 18:13:38'),
(11, '25', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:38', '2018-04-01 18:13:38'),
(12, '157989916', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:38', '2018-04-01 18:13:38'),
(13, '6510438', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:38', '2018-04-01 18:13:38'),
(14, '901502', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:38', '2018-04-01 18:13:38'),
(15, '596505', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:38', '2018-04-01 18:13:38'),
(16, '2', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:38', '2018-04-01 18:13:38'),
(17, '65325410', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:38', '2018-04-01 18:13:38'),
(18, '280590', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:38', '2018-04-01 18:13:38'),
(19, '5021', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:38', '2018-04-01 18:13:38'),
(20, '84345', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:38', '2018-04-01 18:13:38'),
(21, '47901', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:39', '2018-04-01 18:13:39'),
(22, '484498', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:39', '2018-04-01 18:13:39'),
(23, '7', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:39', '2018-04-01 18:13:39'),
(24, '1', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:39', '2018-04-01 18:13:39'),
(25, '75', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:39', '2018-04-01 18:13:39'),
(26, '395029', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:39', '2018-04-01 18:13:39'),
(27, '6', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:39', '2018-04-01 18:13:39'),
(28, '7831073', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:39', '2018-04-01 18:13:39'),
(29, '215957879', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:39', '2018-04-01 18:13:39'),
(30, '418946769', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:40', '2018-04-01 18:13:40'),
(31, '82086415', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:40', '2018-04-01 18:13:40'),
(32, '1551', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:40', '2018-04-01 18:13:40'),
(33, '7409', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:40', '2018-04-01 18:13:40'),
(34, '2748567', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:40', '2018-04-01 18:13:40'),
(35, '3', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:40', '2018-04-01 18:13:40'),
(36, '7507', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:40', '2018-04-01 18:13:40'),
(37, '562', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:40', '2018-04-01 18:13:40'),
(38, '1046408', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:40', '2018-04-01 18:13:40'),
(39, '99830749', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:40', '2018-04-01 18:13:40'),
(40, '6129089', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:40', '2018-04-01 18:13:40'),
(41, '1', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:40', '2018-04-01 18:13:40'),
(42, '1416991', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:40', '2018-04-01 18:13:40'),
(43, '563136128', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:40', '2018-04-01 18:13:40'),
(44, '56737368', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:40', '2018-04-01 18:13:40'),
(45, '6', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:40', '2018-04-01 18:13:40'),
(46, '6080663', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:40', '2018-04-01 18:13:40'),
(47, '64827', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:40', '2018-04-01 18:13:40'),
(48, '19331136', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:40', '2018-04-01 18:13:40'),
(49, '51', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:40', '2018-04-01 18:13:40'),
(50, '20375477', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:41', '2018-04-01 18:13:41'),
(51, '805387', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:41', '2018-04-01 18:13:41'),
(52, '5', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:41', '2018-04-01 18:13:41'),
(53, '5', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:41', '2018-04-01 18:13:41'),
(54, '150', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:41', '2018-04-01 18:13:41'),
(55, '5578', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:41', '2018-04-01 18:13:41'),
(56, '27', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:41', '2018-04-01 18:13:41'),
(57, '5036672', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:41', '2018-04-01 18:13:41'),
(58, '8685', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:41', '2018-04-01 18:13:41'),
(59, '70208', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:41', '2018-04-01 18:13:41'),
(60, '236', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:41', '2018-04-01 18:13:41'),
(61, '693', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:41', '2018-04-01 18:13:41'),
(62, '98054', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:41', '2018-04-01 18:13:41'),
(63, '55655856', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:41', '2018-04-01 18:13:41'),
(64, '4472', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:41', '2018-04-01 18:13:41'),
(65, '599092327', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:41', '2018-04-01 18:13:41'),
(66, '252', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:41', '2018-04-01 18:13:41'),
(67, '507367547', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:41', '2018-04-01 18:13:41'),
(68, '21', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:41', '2018-04-01 18:13:41'),
(69, '85542', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:42', '2018-04-01 18:13:42'),
(70, '79326', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:42', '2018-04-01 18:13:42'),
(71, '7', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:42', '2018-04-01 18:13:42'),
(72, '4780', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:42', '2018-04-01 18:13:42'),
(73, '21', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:42', '2018-04-01 18:13:42'),
(74, '321', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:42', '2018-04-01 18:13:42'),
(75, '9', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:42', '2018-04-01 18:13:42'),
(76, '728039', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:42', '2018-04-01 18:13:42'),
(77, '9957747', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:42', '2018-04-01 18:13:42'),
(78, '1', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:42', '2018-04-01 18:13:42'),
(79, '77', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:42', '2018-04-01 18:13:42'),
(80, '5185862', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:42', '2018-04-01 18:13:42'),
(81, '20394', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:42', '2018-04-01 18:13:42'),
(82, '9183', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:42', '2018-04-01 18:13:42'),
(83, '61165296', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:42', '2018-04-01 18:13:42'),
(84, '672', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:42', '2018-04-01 18:13:42'),
(85, '80', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:43', '2018-04-01 18:13:43'),
(86, '851757528', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:43', '2018-04-01 18:13:43'),
(87, '5185', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:43', '2018-04-01 18:13:43'),
(88, '225', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:43', '2018-04-01 18:13:43'),
(89, '7105558', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:43', '2018-04-01 18:13:43'),
(90, '4951586', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:43', '2018-04-01 18:13:43'),
(91, '1785', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:43', '2018-04-01 18:13:43'),
(92, '468360', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:43', '2018-04-01 18:13:43'),
(93, '168', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish,new', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:44', '2018-04-01 18:13:44'),
(94, '2207', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish,new', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:44', '2018-04-01 18:13:44'),
(95, '9', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish,new', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:44', '2018-04-01 18:13:44'),
(96, '83158', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish,new', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:44', '2018-04-01 18:13:44'),
(97, '1910750', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish,new', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:44', '2018-04-01 18:13:44'),
(98, '5709', 290000, 200000, 50000, 500, NULL, NULL, NULL, NULL, 1, 'publish,new', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:44', '2018-04-01 18:13:44'),
(99, '622', 290000, 200000, 50000, 500, NULL, NULL, NULL, '', 1, 'new,publish', NULL, 1, 1, 'san-pham', 0, NULL, '2018-04-01 18:13:44', '2018-04-03 20:51:53'),
(100, '541617', 290000, 200000, 50000, 500, NULL, NULL, NULL, '', 1, 'new,publish', NULL, 2, 1, 'san-pham', 12, NULL, '2018-04-01 18:13:44', '2018-04-03 21:16:49');

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
(100, 1, NULL, 'product_tags'),
(100, 3, NULL, 'product_colors'),
(99, 3, NULL, 'product_colors');

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
  `language` char(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_languages`
--

INSERT INTO `product_languages` (`id`, `title`, `slug`, `description`, `contents`, `attributes`, `meta_seo`, `language`, `product_id`) VALUES
(1, 'Cielo Bergstrom', 'cielo-bergstrom', 'In consequatur sed nihil distinctio qui. Eaque odio quia qui. Possimus animi debitis vel tempora laboriosam facere.', 'Ea inventore quia minus exercitationem fugit nemo. Velit totam sit et voluptas harum aut vero. Ut illo ex voluptates ea voluptatem. Id reiciendis voluptas tempora laborum aliquid et voluptatem.', NULL, '{\"title\":\"Cielo Bergstrom\",\"keywords\":\"Cielo Bergstrom\",\"description\":\"Cielo Bergstrom\"}', 'vi', 1),
(2, 'Luz Dietrich', 'luz-dietrich', 'Omnis laudantium quod numquam quod. Est aspernatur vel ut reprehenderit mollitia ipsum delectus. Quibusdam magnam et voluptates qui ab. Qui cumque aliquid minima accusantium cupiditate repellat.', 'Earum sit facere cupiditate et non sint vitae. Est ut corporis hic atque.', NULL, '{\"title\":\"Luz Dietrich\",\"keywords\":\"Luz Dietrich\",\"description\":\"Luz Dietrich\"}', 'en', 1),
(3, 'Dr. Dewitt Sauer', 'dr-dewitt-sauer', 'Voluptatem quaerat et aperiam. Sed minima amet est et. Illo rerum quod voluptas.', 'Quos harum laudantium non vel illo quia. Rerum sequi sit enim aspernatur et ut quae est. Praesentium perferendis ea velit beatae officiis expedita maxime. Recusandae quia temporibus quasi sit amet dolores qui. Et quaerat quasi ratione quaerat est sed qui.', NULL, '{\"title\":\"Dr. Dewitt Sauer\",\"keywords\":\"Dr. Dewitt Sauer\",\"description\":\"Dr. Dewitt Sauer\"}', 'vi', 2),
(4, 'Ewell Trantow DDS', 'ewell-trantow-dds', 'Nihil fuga qui quia est ex id nulla. Reprehenderit veniam sed cupiditate perferendis molestiae nobis. Suscipit et sint repellat quasi. Animi velit nihil sint dolorum minima fugiat.', 'Quae unde exercitationem vitae voluptatem maxime quia. Earum commodi facilis vero ut quas sunt. Impedit dolores nemo non ipsa. Esse soluta molestiae facere minima odio unde.', NULL, '{\"title\":\"Ewell Trantow DDS\",\"keywords\":\"Ewell Trantow DDS\",\"description\":\"Ewell Trantow DDS\"}', 'en', 2),
(5, 'Giovanny Volkman III', 'giovanny-volkman-iii', 'Porro aliquam harum vero et. Corporis voluptas autem minima magnam.', 'Enim optio suscipit veniam. Et ut nesciunt iste exercitationem facilis neque impedit. Rem velit enim veritatis suscipit placeat.', NULL, '{\"title\":\"Giovanny Volkman III\",\"keywords\":\"Giovanny Volkman III\",\"description\":\"Giovanny Volkman III\"}', 'vi', 3),
(6, 'Roselyn Sanford MD', 'roselyn-sanford-md', 'Maiores id maxime reprehenderit suscipit nemo. Magnam sed laboriosam magnam est optio.', 'Adipisci ea officiis commodi. Amet non quia sit aut accusantium suscipit iste. Possimus hic iure et ut impedit. Omnis libero eos dicta quia sapiente est dolor.', NULL, '{\"title\":\"Roselyn Sanford MD\",\"keywords\":\"Roselyn Sanford MD\",\"description\":\"Roselyn Sanford MD\"}', 'en', 3),
(7, 'Prof. Austyn McDermott IV', 'prof-austyn-mcdermott-iv', 'Nostrum voluptatem voluptate facilis. Enim quia facilis iusto ducimus nesciunt est officia qui.', 'Numquam aut velit debitis esse et blanditiis. Vel qui reprehenderit rerum repellat sunt in. Omnis et neque consequatur inventore amet eveniet praesentium.', NULL, '{\"title\":\"Prof. Austyn McDermott IV\",\"keywords\":\"Prof. Austyn McDermott IV\",\"description\":\"Prof. Austyn McDermott IV\"}', 'vi', 4),
(8, 'Vicente Lockman', 'vicente-lockman', 'Alias cum laboriosam ullam et consequatur quia reiciendis. Similique rerum quis adipisci dolores quisquam ipsam. Repellat est unde suscipit omnis rerum.', 'Eos reiciendis dolores temporibus vel dolores a. Est fuga modi aut voluptas ut quas tenetur. Provident ut ipsam vitae nemo et quod ipsa. Esse et itaque ut fugit perferendis provident animi.', NULL, '{\"title\":\"Vicente Lockman\",\"keywords\":\"Vicente Lockman\",\"description\":\"Vicente Lockman\"}', 'en', 4),
(9, 'Breanne Koss', 'breanne-koss', 'In temporibus voluptas quis qui deleniti eaque tenetur. Sint veniam aut consequatur perferendis iusto. Et adipisci quam ea et dolorum. Aut id velit et sed rerum quas.', 'Neque modi unde assumenda repudiandae nemo. Veniam esse aut natus fugiat aperiam ut repellat dignissimos. Sint aut consectetur earum reprehenderit. Sunt officiis sint et asperiores culpa qui velit. Quis iste vel sed autem saepe.', NULL, '{\"title\":\"Breanne Koss\",\"keywords\":\"Breanne Koss\",\"description\":\"Breanne Koss\"}', 'vi', 5),
(10, 'Tyrique Hayes', 'tyrique-hayes', 'Eos perspiciatis consequatur illum sint. Sed blanditiis dicta eaque. Quod odio sunt molestiae.', 'Sed facilis amet reiciendis repellendus tenetur similique molestias. Fugit laboriosam animi et nihil nisi consectetur quam. Totam est mollitia fugiat voluptatem. Earum quis vero assumenda et placeat asperiores.', NULL, '{\"title\":\"Tyrique Hayes\",\"keywords\":\"Tyrique Hayes\",\"description\":\"Tyrique Hayes\"}', 'en', 5),
(11, 'Prof. Marian Dicki', 'prof-marian-dicki', 'Ipsa accusamus voluptates aliquid ea consequuntur nulla ea. Ut nostrum accusamus repudiandae maiores voluptatem. Dolorum et iste sint quis tempora dolorem.', 'Vel vel quisquam reprehenderit ut eaque pariatur distinctio. Sint eum qui corporis voluptas. Et sunt molestias nostrum quos temporibus enim facere.', NULL, '{\"title\":\"Prof. Marian Dicki\",\"keywords\":\"Prof. Marian Dicki\",\"description\":\"Prof. Marian Dicki\"}', 'vi', 6),
(12, 'Clemmie Schowalter', 'clemmie-schowalter', 'Doloremque rem nihil earum magnam distinctio velit. Eos provident voluptatem aut commodi doloremque. Nam ducimus omnis non hic.', 'Necessitatibus odit tenetur ea quam dolorum quas. Facere quidem animi dignissimos dicta. Nobis ut nostrum natus ut officiis in. Saepe animi id adipisci neque rem fuga. Aut omnis aut ad maiores.', NULL, '{\"title\":\"Clemmie Schowalter\",\"keywords\":\"Clemmie Schowalter\",\"description\":\"Clemmie Schowalter\"}', 'en', 6),
(13, 'Marques Murphy', 'marques-murphy', 'Enim quia voluptatem aut perspiciatis. Nemo totam magnam in dicta hic et consequuntur. Ut architecto veniam minima quibusdam voluptatem sint.', 'Nam delectus earum consequatur esse ullam. Enim tempore quidem delectus. Vel et quam quas voluptas nostrum sit. Fuga non ad non.', NULL, '{\"title\":\"Marques Murphy\",\"keywords\":\"Marques Murphy\",\"description\":\"Marques Murphy\"}', 'vi', 7),
(14, 'Mrs. Pearline Quigley', 'mrs-pearline-quigley', 'Voluptatibus cumque autem ut id ab non. Quia perspiciatis temporibus in accusamus. Tenetur sint nihil ad aut deleniti aut. Dicta dignissimos explicabo qui est temporibus.', 'Enim nam quo commodi iusto et. Id eaque doloremque ipsam ipsum omnis neque laudantium exercitationem. Consequatur modi sit et autem in maiores tenetur.', NULL, '{\"title\":\"Mrs. Pearline Quigley\",\"keywords\":\"Mrs. Pearline Quigley\",\"description\":\"Mrs. Pearline Quigley\"}', 'en', 7),
(15, 'Prof. Baby Gulgowski', 'prof-baby-gulgowski', 'Aut ratione illo temporibus est quam quisquam. Dolorem nulla vero minima asperiores autem voluptatem tenetur. Eos cumque et itaque assumenda qui. Et possimus minus voluptas.', 'Repellendus minus voluptas quis rerum eaque et quia dignissimos. Sit explicabo sit est consectetur et ut facilis. Ut beatae quos molestiae iure quas. Voluptate et reprehenderit impedit numquam non qui.', NULL, '{\"title\":\"Prof. Baby Gulgowski\",\"keywords\":\"Prof. Baby Gulgowski\",\"description\":\"Prof. Baby Gulgowski\"}', 'vi', 8),
(16, 'Miss Ashlee Fay', 'miss-ashlee-fay', 'Voluptatem qui dolores asperiores ullam quo expedita rerum beatae. Est architecto voluptatem modi sed odit corporis ut. Odio est aut ipsum sequi aliquam ut placeat. Quis placeat eaque in minus quia.', 'Nulla aut deleniti vitae ipsam facere. Corrupti soluta vitae dolorem placeat consequuntur dolores et. Nisi possimus libero ut quia.', NULL, '{\"title\":\"Miss Ashlee Fay\",\"keywords\":\"Miss Ashlee Fay\",\"description\":\"Miss Ashlee Fay\"}', 'en', 8),
(17, 'Rosie Will', 'rosie-will', 'Neque quibusdam error quas eaque voluptatum ipsum. Perferendis autem reprehenderit ducimus praesentium enim. Dolor non culpa sit iusto aut culpa error.', 'Molestias consequatur eos sapiente reprehenderit sed. Aut autem quae possimus expedita iure.', NULL, '{\"title\":\"Rosie Will\",\"keywords\":\"Rosie Will\",\"description\":\"Rosie Will\"}', 'vi', 9),
(18, 'Prof. Everett Thiel', 'prof-everett-thiel', 'Et dicta quia dolor aut sint possimus voluptas. Non voluptatem dolorem harum repellendus. Voluptatem praesentium placeat ut culpa. Facere saepe id quidem voluptatem cumque ut temporibus.', 'Accusamus corporis autem cumque. Cumque animi eveniet voluptatem et doloremque placeat. Quis accusamus cumque consequatur illum at ipsum sint.', NULL, '{\"title\":\"Prof. Everett Thiel\",\"keywords\":\"Prof. Everett Thiel\",\"description\":\"Prof. Everett Thiel\"}', 'en', 9),
(19, 'Dr. Chandler Batz MD', 'dr-chandler-batz-md', 'Sapiente cupiditate quidem distinctio molestiae. Et perferendis illum quo. Nam consectetur qui velit voluptatem itaque quo voluptatem.', 'Quisquam voluptatem sapiente voluptate explicabo distinctio. Ad quibusdam aliquid explicabo voluptas est aliquam. Placeat quia eligendi natus maxime.', NULL, '{\"title\":\"Dr. Chandler Batz MD\",\"keywords\":\"Dr. Chandler Batz MD\",\"description\":\"Dr. Chandler Batz MD\"}', 'vi', 10),
(20, 'Carroll Botsford', 'carroll-botsford', 'Aperiam facilis odit quas cumque distinctio illum voluptatem sint. Sapiente voluptatibus qui culpa et harum illum. Cum rem quidem iusto rerum in eius.', 'Cupiditate quia nobis nobis culpa numquam. Quo voluptate facere dolor qui fugit voluptatem nobis.', NULL, '{\"title\":\"Carroll Botsford\",\"keywords\":\"Carroll Botsford\",\"description\":\"Carroll Botsford\"}', 'en', 10),
(21, 'Isadore Rau', 'isadore-rau', 'Aut repudiandae itaque incidunt perspiciatis beatae. Similique neque et ut et libero voluptatibus. Voluptatem cupiditate sed voluptatibus enim voluptatibus voluptas. Ullam non dignissimos omnis qui.', 'Accusamus consequatur aliquid quas voluptatem laboriosam occaecati molestiae veniam. Quidem quia qui in qui dignissimos amet. Qui nostrum similique dolor ut at. Rerum tempore quo in qui quas libero. Dolores error ut aliquam libero distinctio provident omnis velit.', NULL, '{\"title\":\"Isadore Rau\",\"keywords\":\"Isadore Rau\",\"description\":\"Isadore Rau\"}', 'vi', 11),
(22, 'Jackie Beatty', 'jackie-beatty', 'Consequatur a vel sint doloribus at quo. Numquam velit enim quia. Officia optio atque magnam velit.', 'Et officia hic reiciendis. Quod impedit et perspiciatis.', NULL, '{\"title\":\"Jackie Beatty\",\"keywords\":\"Jackie Beatty\",\"description\":\"Jackie Beatty\"}', 'en', 11),
(23, 'Ewell Crist', 'ewell-crist', 'Rem voluptatem cum rerum magnam voluptas et excepturi. Voluptas in molestiae at dolor delectus accusamus occaecati molestiae. Nisi velit distinctio asperiores non minima enim.', 'Esse sint adipisci quaerat est ipsum voluptate eaque. Voluptatem aut vitae iste sunt vitae et.', NULL, '{\"title\":\"Ewell Crist\",\"keywords\":\"Ewell Crist\",\"description\":\"Ewell Crist\"}', 'vi', 12),
(24, 'Trycia Lueilwitz I', 'trycia-lueilwitz-i', 'Et et odit tenetur culpa voluptatem qui. Praesentium voluptates a aut maiores ipsa reiciendis odit.', 'Non maxime exercitationem qui exercitationem dicta assumenda voluptate. Doloremque alias ipsam quam aut dolores.', NULL, '{\"title\":\"Trycia Lueilwitz I\",\"keywords\":\"Trycia Lueilwitz I\",\"description\":\"Trycia Lueilwitz I\"}', 'en', 12),
(25, 'Dr. Tremaine Lubowitz', 'dr-tremaine-lubowitz', 'Vel assumenda voluptates aut qui enim qui. Repellat ex est itaque labore minus commodi. Asperiores consequatur aut velit ut.', 'Aut dolore magnam distinctio omnis et. Beatae deleniti animi est fugiat voluptas. Fugit voluptatem et quos eum nemo modi. Ea et sapiente eum in error ullam.', NULL, '{\"title\":\"Dr. Tremaine Lubowitz\",\"keywords\":\"Dr. Tremaine Lubowitz\",\"description\":\"Dr. Tremaine Lubowitz\"}', 'vi', 13),
(26, 'Ms. Lauryn Daniel V', 'ms-lauryn-daniel-v', 'Iusto atque repellat voluptas ipsam tempore. Aut recusandae sunt architecto. Sint blanditiis praesentium laboriosam. Optio deleniti at et.', 'Dolorem facilis consequatur neque ipsa accusamus accusantium. Asperiores et quia odio. Nihil beatae corrupti totam vel aperiam. Sapiente amet inventore commodi nihil quia quod delectus aut.', NULL, '{\"title\":\"Ms. Lauryn Daniel V\",\"keywords\":\"Ms. Lauryn Daniel V\",\"description\":\"Ms. Lauryn Daniel V\"}', 'en', 13),
(27, 'Ellis Zemlak MD', 'ellis-zemlak-md', 'Porro sit ut aliquam consequatur possimus. Nulla est quis debitis recusandae. Ducimus et recusandae quam voluptatem repellendus et.', 'Aut minima expedita laboriosam omnis et. Quam commodi quo voluptates perferendis vero. Asperiores voluptatem enim quaerat numquam ut. Iste ullam neque ipsam et ab odit maiores. Iste sequi occaecati aut minus quibusdam.', NULL, '{\"title\":\"Ellis Zemlak MD\",\"keywords\":\"Ellis Zemlak MD\",\"description\":\"Ellis Zemlak MD\"}', 'vi', 14),
(28, 'Prof. Vernon Kuhlman PhD', 'prof-vernon-kuhlman-phd', 'Sequi rerum assumenda necessitatibus id esse adipisci error. Reprehenderit aut et sint voluptates. Est modi sed nemo. Et eius rem omnis mollitia unde eum.', 'Quae dolore ea dolores architecto consequatur nisi facere. Voluptate incidunt distinctio sit saepe qui. Eos fugiat velit minima dolores et culpa.', NULL, '{\"title\":\"Prof. Vernon Kuhlman PhD\",\"keywords\":\"Prof. Vernon Kuhlman PhD\",\"description\":\"Prof. Vernon Kuhlman PhD\"}', 'en', 14),
(29, 'Tillman Langosh', 'tillman-langosh', 'Beatae dolorem et voluptatem omnis. Suscipit sed consequuntur qui placeat. Ipsa aut et dolore hic vero sequi. Velit officia doloremque soluta voluptas iure amet consequatur.', 'Vel aut qui adipisci in itaque. Ut eos libero ipsa.', NULL, '{\"title\":\"Tillman Langosh\",\"keywords\":\"Tillman Langosh\",\"description\":\"Tillman Langosh\"}', 'vi', 15),
(30, 'Laurel Boyer I', 'laurel-boyer-i', 'Quo quas dolorem voluptatem dolorem excepturi qui. Voluptatem numquam numquam id voluptate fugiat. Provident doloremque voluptatibus atque in suscipit placeat non.', 'At asperiores earum sint recusandae non neque odit. Aut illo architecto quos. Ex quis tempore ipsam excepturi illo eos.', NULL, '{\"title\":\"Laurel Boyer I\",\"keywords\":\"Laurel Boyer I\",\"description\":\"Laurel Boyer I\"}', 'en', 15),
(31, 'Jodie Kozey', 'jodie-kozey', 'Dolor ea ducimus aliquam praesentium placeat. Itaque eligendi totam nulla voluptas ad. Tempore voluptatem eius est eos. Perspiciatis odio et consequatur delectus sit.', 'Quis itaque voluptate saepe numquam. Qui a sapiente dolor. Sed est voluptatum sequi.', NULL, '{\"title\":\"Jodie Kozey\",\"keywords\":\"Jodie Kozey\",\"description\":\"Jodie Kozey\"}', 'vi', 16),
(32, 'Dr. Nikko Nitzsche PhD', 'dr-nikko-nitzsche-phd', 'Asperiores dolores aut vero dolorum ad sapiente. Eum earum temporibus repudiandae. Dolor recusandae ut quam iste earum repudiandae. Consequatur beatae sed officiis dolores maxime vitae.', 'Sapiente ut accusamus voluptatem. Minima sed corrupti et saepe labore delectus nulla. Est quia beatae velit modi. In eum deleniti ea.', NULL, '{\"title\":\"Dr. Nikko Nitzsche PhD\",\"keywords\":\"Dr. Nikko Nitzsche PhD\",\"description\":\"Dr. Nikko Nitzsche PhD\"}', 'en', 16),
(33, 'Mabel White', 'mabel-white', 'Est fuga ut quidem est. Officia aut officia explicabo est accusamus non deleniti ipsum. Non consequatur recusandae et soluta. Sed eaque a cumque id.', 'Provident ratione assumenda sit soluta quis corrupti. Sit sunt mollitia iure ut vitae quidem voluptatem quasi. Ipsam et sequi facere quo perspiciatis. Dicta voluptatem ea molestiae consectetur dolores. A aut enim ex voluptas magni omnis.', NULL, '{\"title\":\"Mabel White\",\"keywords\":\"Mabel White\",\"description\":\"Mabel White\"}', 'vi', 17),
(34, 'Brown Brekke IV', 'brown-brekke-iv', 'Dolorem harum sit laudantium fuga mollitia. Ut nihil asperiores quaerat quae illo dolorem. Deserunt assumenda voluptatem numquam dolorem.', 'Dolorem rerum qui ea. Possimus suscipit aut et omnis. Incidunt commodi ex voluptatibus dolores facere qui alias. Est quisquam et dolorem incidunt sapiente.', NULL, '{\"title\":\"Brown Brekke IV\",\"keywords\":\"Brown Brekke IV\",\"description\":\"Brown Brekke IV\"}', 'en', 17),
(35, 'Sam Hyatt', 'sam-hyatt', 'Et aspernatur magnam voluptas autem. Incidunt doloremque voluptatem qui nulla.', 'Aut blanditiis eum optio reprehenderit. Nihil facilis corporis molestiae ut nobis.', NULL, '{\"title\":\"Sam Hyatt\",\"keywords\":\"Sam Hyatt\",\"description\":\"Sam Hyatt\"}', 'vi', 18),
(36, 'Prof. Mariano Johnson', 'prof-mariano-johnson', 'Rem delectus commodi aut tenetur quo quia et. Placeat qui aut unde saepe iste. Commodi sit aliquam et.', 'Dolorem ullam omnis hic ipsum. Autem quam laborum adipisci placeat aspernatur cupiditate. Est ut earum labore suscipit aliquid.', NULL, '{\"title\":\"Prof. Mariano Johnson\",\"keywords\":\"Prof. Mariano Johnson\",\"description\":\"Prof. Mariano Johnson\"}', 'en', 18),
(37, 'Pauline Kessler', 'pauline-kessler', 'Placeat sit sequi sint aut cum. Sequi id aut culpa culpa. Praesentium ab totam hic incidunt maiores qui error ipsum. Atque occaecati repudiandae quo porro quis et ipsum.', 'Atque voluptatem similique dolorem autem occaecati recusandae ut. Nisi dolores repudiandae aut autem recusandae blanditiis assumenda. Ad vitae omnis voluptatem aut.', NULL, '{\"title\":\"Pauline Kessler\",\"keywords\":\"Pauline Kessler\",\"description\":\"Pauline Kessler\"}', 'vi', 19),
(38, 'Prof. Vinnie Lehner V', 'prof-vinnie-lehner-v', 'Expedita dolorem maxime quidem nulla et voluptas sunt. Qui est est vel vero. Fuga eum omnis voluptas sunt. Optio officia magnam modi voluptatem sed.', 'Ut molestiae exercitationem reprehenderit necessitatibus aperiam. Qui officiis soluta quis occaecati et sequi. Et perferendis minima velit deserunt dicta alias.', NULL, '{\"title\":\"Prof. Vinnie Lehner V\",\"keywords\":\"Prof. Vinnie Lehner V\",\"description\":\"Prof. Vinnie Lehner V\"}', 'en', 19),
(39, 'Theresia Kuhic', 'theresia-kuhic', 'Perferendis alias corporis voluptatem sunt autem totam nihil voluptatibus. Aperiam qui quidem unde. Magni ullam vel sequi expedita dolor.', 'In quia rerum voluptas nisi sequi et aliquam. Dicta eum quidem qui quia quidem ipsa aperiam. Eum consequatur alias in labore et repellat alias quo. Eaque laudantium architecto sint.', NULL, '{\"title\":\"Theresia Kuhic\",\"keywords\":\"Theresia Kuhic\",\"description\":\"Theresia Kuhic\"}', 'vi', 20),
(40, 'Warren Schiller', 'warren-schiller', 'Aut ad aut quam qui consequatur modi voluptate. Dolorem repellat unde ab quos veritatis.', 'Est amet est sunt alias et rerum nihil. Corporis doloribus qui ipsam sit.', NULL, '{\"title\":\"Warren Schiller\",\"keywords\":\"Warren Schiller\",\"description\":\"Warren Schiller\"}', 'en', 20),
(41, 'Cloyd Batz', 'cloyd-batz', 'Qui ducimus deserunt qui. Assumenda asperiores sed optio amet iusto. Dolores et eveniet amet illo. Est ipsum aspernatur eveniet. Sed error vitae perferendis qui voluptatem.', 'Vitae veritatis sequi non consequatur. Eius sunt voluptas unde est doloremque.', NULL, '{\"title\":\"Cloyd Batz\",\"keywords\":\"Cloyd Batz\",\"description\":\"Cloyd Batz\"}', 'vi', 21),
(42, 'Joey Gislason', 'joey-gislason', 'Deleniti nihil commodi beatae. Deleniti voluptatem expedita saepe incidunt. Ipsa quia laboriosam ducimus soluta. Eaque doloribus soluta rerum molestias optio dolore similique.', 'Sed minima exercitationem et ea officia tempora. Tempore non voluptatibus esse inventore velit in. Autem dolor vel vel est sunt ut. Porro cum quasi et et rem nostrum sint.', NULL, '{\"title\":\"Joey Gislason\",\"keywords\":\"Joey Gislason\",\"description\":\"Joey Gislason\"}', 'en', 21),
(43, 'Dayton Fritsch', 'dayton-fritsch', 'Earum quo eum est reiciendis ratione. Aut iste distinctio illo velit mollitia. Minima veniam qui molestiae repellat sunt.', 'Alias ea repellendus vel architecto praesentium vel dolor. Quaerat est molestias quia sed est nihil. Harum ut et dolor recusandae architecto placeat optio. Iure vel ut harum veritatis.', NULL, '{\"title\":\"Dayton Fritsch\",\"keywords\":\"Dayton Fritsch\",\"description\":\"Dayton Fritsch\"}', 'vi', 22),
(44, 'Prof. Filomena Doyle IV', 'prof-filomena-doyle-iv', 'Repudiandae saepe iusto quo atque. Earum enim repellat repellendus magni. Vero earum culpa harum.', 'Iure et similique voluptate dolorem excepturi. Hic quia odio neque ducimus sapiente. Voluptates cum hic iure fugiat repudiandae omnis velit. Vel neque et velit esse nihil quia.', NULL, '{\"title\":\"Prof. Filomena Doyle IV\",\"keywords\":\"Prof. Filomena Doyle IV\",\"description\":\"Prof. Filomena Doyle IV\"}', 'en', 22),
(45, 'Monica Rohan', 'monica-rohan', 'Alias rerum consequatur deleniti natus saepe. Et non voluptatem quis et. Et nostrum excepturi temporibus aperiam. Aut sed aut placeat similique non veniam.', 'Velit asperiores voluptas est vitae alias eum qui. Quaerat nisi delectus est optio et qui nihil. Libero ut suscipit et. Voluptatem sequi qui ut aperiam inventore saepe. Dolore dolores ea distinctio optio.', NULL, '{\"title\":\"Monica Rohan\",\"keywords\":\"Monica Rohan\",\"description\":\"Monica Rohan\"}', 'vi', 23),
(46, 'Christiana Glover', 'christiana-glover', 'Dolorem ducimus ut exercitationem consequuntur eius nihil dignissimos. In officiis architecto dolores.', 'Similique perspiciatis maiores recusandae distinctio sed. Quidem voluptates laboriosam officia quas.', NULL, '{\"title\":\"Christiana Glover\",\"keywords\":\"Christiana Glover\",\"description\":\"Christiana Glover\"}', 'en', 23),
(47, 'Dr. Donny Glover', 'dr-donny-glover', 'Sed corporis perferendis magni voluptatem eveniet ipsum qui. Ut aut rerum modi cum consequuntur reprehenderit ut. Deserunt sint sit nisi sapiente error tempore.', 'Enim enim ea quas id sit. Qui ea et voluptas aliquid. Quo quo molestiae dolorem deserunt ipsam laudantium impedit. Facilis ut qui nulla veniam ut.', NULL, '{\"title\":\"Dr. Donny Glover\",\"keywords\":\"Dr. Donny Glover\",\"description\":\"Dr. Donny Glover\"}', 'vi', 24),
(48, 'Mercedes Yundt Sr.', 'mercedes-yundt-sr', 'Nihil libero nisi ab autem. Labore suscipit eius ea ipsam asperiores. Nemo vitae est temporibus corrupti est. Quia ut doloremque occaecati sequi illo. Ad quo ducimus nesciunt aliquid vel quia.', 'Est ipsum reprehenderit laboriosam dolorum consequatur provident. Quod eius itaque doloremque ut. Maiores sit sapiente voluptates sed. Perferendis mollitia vero et eos est.', NULL, '{\"title\":\"Mercedes Yundt Sr.\",\"keywords\":\"Mercedes Yundt Sr.\",\"description\":\"Mercedes Yundt Sr.\"}', 'en', 24),
(49, 'Prof. Spencer Schaefer', 'prof-spencer-schaefer', 'Sunt accusantium quae velit architecto fugit. Aut ipsam voluptatibus cupiditate deserunt voluptatibus error minus officiis.', 'Consequuntur iure cum praesentium dolorem aliquid et est. Velit blanditiis quisquam nisi ratione veritatis consequatur. Voluptatibus magnam amet dolor at. Non fugiat est et velit.', NULL, '{\"title\":\"Prof. Spencer Schaefer\",\"keywords\":\"Prof. Spencer Schaefer\",\"description\":\"Prof. Spencer Schaefer\"}', 'vi', 25),
(50, 'Erick Ruecker', 'erick-ruecker', 'Cum accusantium assumenda amet eaque placeat. Blanditiis non et vitae modi hic similique. Et aut non sequi.', 'Suscipit et ab omnis sunt. Et quis ut omnis commodi in. Saepe quisquam quibusdam voluptas minus neque omnis fuga aperiam.', NULL, '{\"title\":\"Erick Ruecker\",\"keywords\":\"Erick Ruecker\",\"description\":\"Erick Ruecker\"}', 'en', 25),
(51, 'Emily Stiedemann', 'emily-stiedemann', 'Excepturi et nam est culpa nisi et. Aut iste praesentium rerum non.', 'Cum officiis praesentium sint. Ducimus sit quisquam quod occaecati et ratione architecto et. Nisi at est dolor accusamus.', NULL, '{\"title\":\"Emily Stiedemann\",\"keywords\":\"Emily Stiedemann\",\"description\":\"Emily Stiedemann\"}', 'vi', 26),
(52, 'Ramiro Spinka', 'ramiro-spinka', 'Eum nostrum similique in ut odit quam. Culpa quisquam ut odit ad odio. Aut ducimus suscipit tempora veniam. Voluptas nobis modi ut assumenda et qui.', 'Deserunt non libero at et. Ipsa tempora est voluptas enim totam aliquid. Numquam quia dolores eligendi commodi quis. Suscipit odio laudantium illo expedita eum qui.', NULL, '{\"title\":\"Ramiro Spinka\",\"keywords\":\"Ramiro Spinka\",\"description\":\"Ramiro Spinka\"}', 'en', 26),
(53, 'Jasper Keebler', 'jasper-keebler', 'Quia debitis omnis unde velit explicabo. Error totam facilis autem commodi est. Iste fugit ipsum sunt similique.', 'Architecto enim consectetur praesentium ipsum amet. Pariatur itaque veniam at qui et deserunt et. Hic numquam aut quos nulla amet asperiores. Dolorum optio deserunt corporis minima quidem aperiam.', NULL, '{\"title\":\"Jasper Keebler\",\"keywords\":\"Jasper Keebler\",\"description\":\"Jasper Keebler\"}', 'vi', 27),
(54, 'Arturo Mante', 'arturo-mante', 'Blanditiis et ducimus provident soluta dolorum. Illum hic voluptatem quas ipsa dolorem nisi consequatur. Labore inventore vel laborum eveniet voluptas provident.', 'Est culpa ut officiis sed eaque. Eos occaecati sint accusamus quia. Et et ea eum sit aut soluta.', NULL, '{\"title\":\"Arturo Mante\",\"keywords\":\"Arturo Mante\",\"description\":\"Arturo Mante\"}', 'en', 27),
(55, 'Aimee Ritchie', 'aimee-ritchie', 'Eum rerum officiis veniam. Est sed consectetur voluptate quia.', 'Nesciunt et culpa qui est. Pariatur beatae officia reprehenderit aut sequi. Dolorem sunt rem minus id rem.', NULL, '{\"title\":\"Aimee Ritchie\",\"keywords\":\"Aimee Ritchie\",\"description\":\"Aimee Ritchie\"}', 'vi', 28),
(56, 'Kenya Emard', 'kenya-emard', 'Voluptates quis blanditiis eos veniam dolorem sint illo. Velit doloremque quidem qui molestiae accusamus ipsum cum. Ex dolorem doloremque voluptatem possimus. Ut aut dolorem similique.', 'Ullam dolor perspiciatis cupiditate vitae vero aut sapiente. Vel id dolor id vitae.', NULL, '{\"title\":\"Kenya Emard\",\"keywords\":\"Kenya Emard\",\"description\":\"Kenya Emard\"}', 'en', 28),
(57, 'Rasheed Lubowitz', 'rasheed-lubowitz', 'Ab quia rem provident in suscipit repudiandae qui. Rerum inventore ut possimus. Est ut non soluta fuga aut.', 'Iusto sit voluptatem tempore optio rerum aperiam. Sed ab quidem repellendus error officiis rerum vel dolorem. Quia labore numquam eius voluptatum voluptate rem est. Id molestiae pariatur hic et nostrum in.', NULL, '{\"title\":\"Rasheed Lubowitz\",\"keywords\":\"Rasheed Lubowitz\",\"description\":\"Rasheed Lubowitz\"}', 'vi', 29),
(58, 'Meda Kertzmann', 'meda-kertzmann', 'Quidem sunt voluptatem soluta sit delectus nulla incidunt. Voluptate ut a cum suscipit suscipit molestiae. Praesentium aliquid et quod tempore iusto nihil. Et dolor exercitationem ut fugit.', 'Commodi provident blanditiis sapiente natus ducimus dolorum. Qui dolorem ratione ut voluptates rem. Ratione in perspiciatis qui laborum dicta omnis quia ratione.', NULL, '{\"title\":\"Meda Kertzmann\",\"keywords\":\"Meda Kertzmann\",\"description\":\"Meda Kertzmann\"}', 'en', 29),
(59, 'Dr. Leanne Crona I', 'dr-leanne-crona-i', 'Corrupti fuga et sint facilis error ullam. Et facere nobis laboriosam natus est dolor dignissimos. Occaecati illum aut amet et tenetur assumenda. Velit accusantium ut laboriosam.', 'Asperiores corrupti dolores facere est. Enim consequatur quis voluptates harum tempore placeat deleniti. Labore quibusdam vero dolor eveniet mollitia vero incidunt repellat.', NULL, '{\"title\":\"Dr. Leanne Crona I\",\"keywords\":\"Dr. Leanne Crona I\",\"description\":\"Dr. Leanne Crona I\"}', 'vi', 30),
(60, 'Prof. Hilton Okuneva Sr.', 'prof-hilton-okuneva-sr', 'Voluptate fugit autem ipsum eos. Totam nihil expedita excepturi est quia sit. Consequuntur dolorem vero veniam vel repudiandae dolor quidem.', 'Rem sapiente qui voluptatem vero dolorem. Dolores cumque doloremque nulla.', NULL, '{\"title\":\"Prof. Hilton Okuneva Sr.\",\"keywords\":\"Prof. Hilton Okuneva Sr.\",\"description\":\"Prof. Hilton Okuneva Sr.\"}', 'en', 30),
(61, 'Domenico Jerde', 'domenico-jerde', 'Officia hic ab esse enim aut at. Omnis illum unde neque vel. Aut qui quaerat rerum deserunt sit.', 'Vel asperiores accusamus nobis. Impedit qui saepe dignissimos ratione saepe maiores in. Quidem id nesciunt id quo.', NULL, '{\"title\":\"Domenico Jerde\",\"keywords\":\"Domenico Jerde\",\"description\":\"Domenico Jerde\"}', 'vi', 31),
(62, 'Mr. Adolf Jones', 'mr-adolf-jones', 'Distinctio magni sit rerum officiis dicta eum. Numquam ut quo ut tenetur. Iure cum ut enim vel eum tempora. Deserunt cupiditate facere qui voluptatibus veritatis autem quisquam.', 'Ut expedita eos amet quos. Enim aut maxime ipsum praesentium accusantium et. Est sunt velit est. Dolorum nisi aperiam tenetur culpa officiis occaecati.', NULL, '{\"title\":\"Mr. Adolf Jones\",\"keywords\":\"Mr. Adolf Jones\",\"description\":\"Mr. Adolf Jones\"}', 'en', 31),
(63, 'Sonya Koepp', 'sonya-koepp', 'Id sed fugiat illo. Ut ab iusto similique quam occaecati illo. Earum architecto a ea repudiandae.', 'Labore delectus quod totam molestias aperiam dolor et laudantium. Quia molestias corrupti quam at ipsum. Et nihil vero animi excepturi eos. Sit neque explicabo non cumque modi.', NULL, '{\"title\":\"Sonya Koepp\",\"keywords\":\"Sonya Koepp\",\"description\":\"Sonya Koepp\"}', 'vi', 32),
(64, 'Naomie Brown', 'naomie-brown', 'Qui doloremque perspiciatis et aut. Molestiae tempore sit a est. Magnam iste qui dolorum harum dolores atque laborum.', 'Necessitatibus placeat possimus corporis eos ab. Quam praesentium id aut nam. Atque eum quibusdam aliquid labore qui delectus. Reprehenderit deserunt ipsa in possimus culpa vel. Quia nam quasi consequatur in illum aut.', NULL, '{\"title\":\"Naomie Brown\",\"keywords\":\"Naomie Brown\",\"description\":\"Naomie Brown\"}', 'en', 32),
(65, 'Guillermo Trantow', 'guillermo-trantow', 'Et fugiat doloremque ab nisi odio. Accusantium sunt repellat quia eum vitae. Modi ducimus ea laborum voluptatem delectus. Odit et aut debitis architecto.', 'Pariatur et repellendus quia. Libero praesentium praesentium fugiat eius corporis. Asperiores quos quos eaque quod amet. Blanditiis reprehenderit alias explicabo repellendus.', NULL, '{\"title\":\"Guillermo Trantow\",\"keywords\":\"Guillermo Trantow\",\"description\":\"Guillermo Trantow\"}', 'vi', 33),
(66, 'Graciela Bednar', 'graciela-bednar', 'Qui rerum explicabo molestiae enim et. Architecto vel quod minus dolor illum. Delectus occaecati et nobis quod iure.', 'Sit aut hic ad fugit. Sunt mollitia repellendus asperiores. Ut delectus autem porro occaecati tenetur consequatur laudantium.', NULL, '{\"title\":\"Graciela Bednar\",\"keywords\":\"Graciela Bednar\",\"description\":\"Graciela Bednar\"}', 'en', 33),
(67, 'Mrs. Alia Robel MD', 'mrs-alia-robel-md', 'Totam quos illum ut eum officiis. Quis animi dolorum accusantium id quibusdam. Molestiae saepe incidunt aut libero omnis qui voluptate.', 'Et consequatur recusandae rerum quia. Qui ut occaecati qui quo est aliquid provident.', NULL, '{\"title\":\"Mrs. Alia Robel MD\",\"keywords\":\"Mrs. Alia Robel MD\",\"description\":\"Mrs. Alia Robel MD\"}', 'vi', 34),
(68, 'Dr. Scotty Dooley', 'dr-scotty-dooley', 'Non officiis nobis atque eum rerum. Voluptas quos et iusto quia. Dolor ab rem recusandae eaque deleniti.', 'Molestiae et inventore ut necessitatibus sunt debitis consequatur. Tempore dolorem temporibus id omnis error sint assumenda esse. Eius laudantium nam in repellat ipsum velit expedita. Pariatur eius et qui harum libero.', NULL, '{\"title\":\"Dr. Scotty Dooley\",\"keywords\":\"Dr. Scotty Dooley\",\"description\":\"Dr. Scotty Dooley\"}', 'en', 34),
(69, 'Prof. Edyth Gleason', 'prof-edyth-gleason', 'Nisi corrupti qui est laborum officiis est. Iusto et sunt laboriosam inventore qui eaque nam. Eveniet in suscipit aut aut quibusdam incidunt quas.', 'Fugiat excepturi alias eligendi aut. Consequuntur quis quisquam voluptas corporis. Ut provident dolorum dolorem odio beatae. Veniam tenetur qui consequatur expedita magnam quisquam.', NULL, '{\"title\":\"Prof. Edyth Gleason\",\"keywords\":\"Prof. Edyth Gleason\",\"description\":\"Prof. Edyth Gleason\"}', 'vi', 35),
(70, 'Alda Bode', 'alda-bode', 'Aperiam beatae voluptatem iste laboriosam tempore. Blanditiis iste id harum et quae quibusdam sed. Doloremque vel porro optio rerum enim adipisci. Nostrum dolorem illum cum sit.', 'Optio velit veritatis aliquam nobis et. Nam rem veniam occaecati nostrum tempora repellat. Eligendi nihil eligendi dolores voluptas.', NULL, '{\"title\":\"Alda Bode\",\"keywords\":\"Alda Bode\",\"description\":\"Alda Bode\"}', 'en', 35),
(71, 'Jack Torphy I', 'jack-torphy-i', 'Ut et dolor reprehenderit tempore. Placeat doloremque nam itaque. Corporis maiores eveniet maiores omnis rerum nulla.', 'Omnis beatae ducimus fuga ea rerum corrupti. Fugit vitae quam sapiente veritatis qui. Fugiat magnam sed sunt mollitia et voluptas doloribus.', NULL, '{\"title\":\"Jack Torphy I\",\"keywords\":\"Jack Torphy I\",\"description\":\"Jack Torphy I\"}', 'vi', 36),
(72, 'Cristian Carter', 'cristian-carter', 'Temporibus blanditiis at laudantium quod. Consequuntur dolores et et voluptatibus voluptates. Tempora quidem sequi labore rerum similique deserunt. Laboriosam odio minima accusamus repellat.', 'Quis accusantium cumque sapiente fugiat sed dicta quo ipsam. Aspernatur provident quia eaque ullam ut quidem laborum. Omnis officia sit est molestias earum doloremque laborum. Sunt consequatur itaque ea error.', NULL, '{\"title\":\"Cristian Carter\",\"keywords\":\"Cristian Carter\",\"description\":\"Cristian Carter\"}', 'en', 36),
(73, 'Wilbert Brakus III', 'wilbert-brakus-iii', 'Eos dignissimos repellendus voluptatem nesciunt. Corporis sit quo nobis. Sit qui nihil et dolor blanditiis officiis. Amet fuga est ut ab laudantium et voluptas.', 'Officiis dolore voluptatem itaque sint molestiae vitae eos. Et modi dolor reiciendis alias impedit vero. Enim provident excepturi recusandae tenetur ut esse. Ipsam perspiciatis earum modi.', NULL, '{\"title\":\"Wilbert Brakus III\",\"keywords\":\"Wilbert Brakus III\",\"description\":\"Wilbert Brakus III\"}', 'vi', 37),
(74, 'Anais Blanda', 'anais-blanda', 'Tempora officia aut sed non asperiores cum. Earum perferendis architecto veniam architecto ullam qui numquam. Ut nihil animi ipsa doloribus laborum dolor culpa.', 'Sint dolor sunt voluptas atque ea. Repellendus dolore recusandae ea adipisci. Animi sed ullam numquam molestiae ut est. Perferendis ut vitae commodi voluptatibus culpa nihil illo.', NULL, '{\"title\":\"Anais Blanda\",\"keywords\":\"Anais Blanda\",\"description\":\"Anais Blanda\"}', 'en', 37),
(75, 'Olaf Lakin', 'olaf-lakin', 'Eos velit harum optio aut sit quia. Numquam fugit sint quia molestias sed voluptatem est. Modi ipsa rerum illum quia est corporis modi. Odio omnis consequatur quos voluptas quo facere nam.', 'Hic in quis ut sit velit. Voluptatem occaecati molestiae veritatis nihil error. Non sit tenetur ut similique debitis laboriosam. Est est et ea sed corrupti totam explicabo rem.', NULL, '{\"title\":\"Olaf Lakin\",\"keywords\":\"Olaf Lakin\",\"description\":\"Olaf Lakin\"}', 'vi', 38),
(76, 'Prof. Bryon Bartoletti III', 'prof-bryon-bartoletti-iii', 'Ut culpa iure omnis qui. Architecto nemo minima quidem enim dicta. Voluptas ipsa in maxime voluptatem. Optio aliquam eveniet voluptas.', 'Distinctio ut sint et doloribus eveniet qui. Quaerat fugit consectetur dolor corporis voluptates beatae aperiam. Enim sint similique sequi aut.', NULL, '{\"title\":\"Prof. Bryon Bartoletti III\",\"keywords\":\"Prof. Bryon Bartoletti III\",\"description\":\"Prof. Bryon Bartoletti III\"}', 'en', 38),
(77, 'Dominic Stroman Sr.', 'dominic-stroman-sr', 'Asperiores expedita quos nihil dolor impedit et. Et qui aut molestiae excepturi quos in. Accusamus amet mollitia similique amet sed sapiente deserunt.', 'Placeat inventore molestiae est. Et eligendi ullam facilis qui expedita. Quasi provident perspiciatis praesentium doloremque.', NULL, '{\"title\":\"Dominic Stroman Sr.\",\"keywords\":\"Dominic Stroman Sr.\",\"description\":\"Dominic Stroman Sr.\"}', 'vi', 39),
(78, 'Prof. Harmon O\'Kon', 'prof-harmon-okon', 'Laudantium qui rerum deleniti voluptas. Quis aut earum quia necessitatibus. Dolorum quaerat est totam ea.', 'Voluptatem eum aut placeat nihil neque nulla. Cumque perferendis accusantium consectetur earum sapiente. Mollitia ipsam suscipit occaecati minima voluptatum est quibusdam voluptate. Architecto est distinctio provident et. Qui error cupiditate earum omnis rerum porro nemo.', NULL, '{\"title\":\"Prof. Harmon O\'Kon\",\"keywords\":\"Prof. Harmon O\'Kon\",\"description\":\"Prof. Harmon O\'Kon\"}', 'en', 39),
(79, 'Miss Mia Maggio', 'miss-mia-maggio', 'Dolores culpa ab numquam vero nisi aliquid quia. Nemo id delectus quo nihil placeat. Eaque enim expedita voluptatibus blanditiis et et.', 'Vero aut quia eum. Omnis quas dolores quos aperiam cupiditate. Expedita suscipit nisi et sed ut eos iste inventore. Repudiandae labore magnam vel quidem et expedita dolorum.', NULL, '{\"title\":\"Miss Mia Maggio\",\"keywords\":\"Miss Mia Maggio\",\"description\":\"Miss Mia Maggio\"}', 'vi', 40),
(80, 'Rogers Gaylord', 'rogers-gaylord', 'Est dolore repellat officia reprehenderit. Minus modi qui eius expedita voluptatibus id.', 'Provident eum pariatur quod impedit pariatur vel magni. Sapiente nobis non veniam nihil. Quia ut fuga provident tempore vel rem aliquam. Officiis non fuga sit ut. Facere quo non vel sed vel.', NULL, '{\"title\":\"Rogers Gaylord\",\"keywords\":\"Rogers Gaylord\",\"description\":\"Rogers Gaylord\"}', 'en', 40),
(81, 'Hassie Mayer', 'hassie-mayer', 'Velit reprehenderit nobis aspernatur quia harum praesentium reiciendis. Aut natus esse rerum magnam est quas nihil. Libero voluptatum excepturi magnam ea est officiis. In alias quia error quia enim.', 'Dolores iusto dolor asperiores ab ea cumque quidem. Animi dolorum ut nihil pariatur quisquam ducimus rerum. Quam iusto iste nemo inventore. Eius et a fugiat odio culpa.', NULL, '{\"title\":\"Hassie Mayer\",\"keywords\":\"Hassie Mayer\",\"description\":\"Hassie Mayer\"}', 'vi', 41),
(82, 'Prof. Terrence Farrell', 'prof-terrence-farrell', 'Veritatis eum vitae laudantium rerum. Asperiores qui nemo sit commodi voluptatem culpa tenetur. Ut voluptatibus aut explicabo magni mollitia voluptate corporis.', 'Dolorem ullam praesentium quis ab. Animi et quis doloremque aut. Ipsam cum odit voluptas et qui quia. Voluptas voluptatem dolorem est inventore alias.', NULL, '{\"title\":\"Prof. Terrence Farrell\",\"keywords\":\"Prof. Terrence Farrell\",\"description\":\"Prof. Terrence Farrell\"}', 'en', 41),
(83, 'Graham Leffler IV', 'graham-leffler-iv', 'Id tempore doloribus eum nam aut. Qui enim natus quia. Quisquam totam magnam sit beatae aperiam expedita ab.', 'Consectetur impedit voluptatem ut eum. Ipsum est dolores et deleniti aliquid corrupti. Et vero minima nihil sequi expedita.', NULL, '{\"title\":\"Graham Leffler IV\",\"keywords\":\"Graham Leffler IV\",\"description\":\"Graham Leffler IV\"}', 'vi', 42),
(84, 'Mr. Dylan Dibbert', 'mr-dylan-dibbert', 'Sequi sint id eos impedit totam voluptatem aut. Illum sunt rerum repudiandae accusamus ut dolores voluptate. Quia at quo earum corrupti sapiente.', 'Ad earum necessitatibus aut eligendi neque esse quam. Praesentium est autem aspernatur explicabo amet nemo. Aut eum quo placeat natus. Quas molestias voluptatem aliquid incidunt similique dolor quibusdam.', NULL, '{\"title\":\"Mr. Dylan Dibbert\",\"keywords\":\"Mr. Dylan Dibbert\",\"description\":\"Mr. Dylan Dibbert\"}', 'en', 42),
(85, 'Celine Schmidt II', 'celine-schmidt-ii', 'Iusto facilis non eveniet in vel. Rerum a et facilis quibusdam ipsa. In laboriosam illum officiis. Est quia laudantium blanditiis est.', 'Iure sit eos quo laudantium sequi aut. Odio neque quia pariatur mollitia sapiente voluptas. Voluptas sed qui esse amet tempore autem.', NULL, '{\"title\":\"Celine Schmidt II\",\"keywords\":\"Celine Schmidt II\",\"description\":\"Celine Schmidt II\"}', 'vi', 43),
(86, 'Prof. Lucius Kozey IV', 'prof-lucius-kozey-iv', 'Non consequatur debitis quo cumque nulla voluptatibus veritatis. Sed dignissimos fuga ut ipsa temporibus quis delectus.', 'Voluptatem aut id dolorem ipsam labore et. Laboriosam sint id laudantium aspernatur sed enim laudantium.', NULL, '{\"title\":\"Prof. Lucius Kozey IV\",\"keywords\":\"Prof. Lucius Kozey IV\",\"description\":\"Prof. Lucius Kozey IV\"}', 'en', 43),
(87, 'Ima Maggio', 'ima-maggio', 'Doloribus magnam minima in quo quae illo voluptatem. Et ipsam accusamus doloremque veritatis natus. Numquam consequatur impedit commodi maxime.', 'Qui a exercitationem quisquam voluptas impedit non molestiae ex. Optio assumenda saepe veritatis. Ut quam dolorem laborum mollitia.', NULL, '{\"title\":\"Ima Maggio\",\"keywords\":\"Ima Maggio\",\"description\":\"Ima Maggio\"}', 'vi', 44),
(88, 'Rhoda Okuneva V', 'rhoda-okuneva-v', 'Deserunt est fugiat atque ipsa reprehenderit aut qui exercitationem. Et quia consequatur quo expedita fugit dicta cum. Qui fugit est occaecati cumque a ut.', 'Est sapiente qui nulla tempora. Unde quam est enim aut ipsam. Cum deserunt voluptatem illum enim eligendi a exercitationem.', NULL, '{\"title\":\"Rhoda Okuneva V\",\"keywords\":\"Rhoda Okuneva V\",\"description\":\"Rhoda Okuneva V\"}', 'en', 44),
(89, 'Norris Littel', 'norris-littel', 'Rerum ipsum autem minus non ut. Harum labore quibusdam nostrum aut. Vero qui voluptatem modi consequuntur error qui cumque blanditiis. Labore qui aperiam nostrum ratione aut omnis.', 'Cumque provident consequatur omnis nobis at molestias et. Sit sed est nulla odit maiores. Sit qui veritatis cumque qui. Asperiores et velit doloremque nisi.', NULL, '{\"title\":\"Norris Littel\",\"keywords\":\"Norris Littel\",\"description\":\"Norris Littel\"}', 'vi', 45),
(90, 'Toney Huel', 'toney-huel', 'Placeat corporis sit placeat molestiae quo. Reprehenderit omnis repudiandae velit possimus quia dolorem. Quos occaecati eos blanditiis earum. Deleniti nisi nihil et est ut.', 'Qui rerum officiis veritatis assumenda. Et est inventore consequatur accusantium. Sunt aut esse dolore similique.', NULL, '{\"title\":\"Toney Huel\",\"keywords\":\"Toney Huel\",\"description\":\"Toney Huel\"}', 'en', 45),
(91, 'Kenneth Trantow', 'kenneth-trantow', 'Ratione ipsum ut animi alias autem officiis. Commodi eum quis quia est aut id eos. Maiores sunt nisi nam.', 'Non veniam et culpa et ut enim. Eum ducimus quas eum omnis non cupiditate. Tempore itaque saepe similique atque accusantium.', NULL, '{\"title\":\"Kenneth Trantow\",\"keywords\":\"Kenneth Trantow\",\"description\":\"Kenneth Trantow\"}', 'vi', 46),
(92, 'Earnestine Gutmann', 'earnestine-gutmann', 'Aut a officia ut ducimus laudantium. Voluptates at ullam quia quia quisquam inventore. Incidunt ullam odio vero a labore consequuntur quae beatae.', 'Doloremque voluptatem temporibus omnis dolorem dolore et. Molestiae et rerum autem molestias. Nisi error debitis velit eligendi.', NULL, '{\"title\":\"Earnestine Gutmann\",\"keywords\":\"Earnestine Gutmann\",\"description\":\"Earnestine Gutmann\"}', 'en', 46),
(93, 'Miss Ona Dibbert V', 'miss-ona-dibbert-v', 'Aliquid dolorem quidem repudiandae. A nostrum sint sit fugiat. Est doloribus expedita ab voluptatem accusantium aspernatur.', 'Nobis delectus ut velit asperiores accusamus. A et et iure alias expedita. Nam rerum eum optio consectetur quisquam laudantium laborum. Suscipit est omnis distinctio quia.', NULL, '{\"title\":\"Miss Ona Dibbert V\",\"keywords\":\"Miss Ona Dibbert V\",\"description\":\"Miss Ona Dibbert V\"}', 'vi', 47),
(94, 'Vergie Gulgowski', 'vergie-gulgowski', 'Possimus aut et adipisci ut sit. Recusandae perferendis sed quam eum in. Explicabo harum eaque aliquam ullam vero quos explicabo esse. Officiis eum consequuntur sit repudiandae velit.', 'Sapiente nihil suscipit omnis est similique harum labore maiores. Voluptatibus omnis aperiam suscipit enim. Sint commodi dolor provident aut. Reiciendis vel quasi dolorum possimus.', NULL, '{\"title\":\"Vergie Gulgowski\",\"keywords\":\"Vergie Gulgowski\",\"description\":\"Vergie Gulgowski\"}', 'en', 47),
(95, 'Jewel Lynch', 'jewel-lynch', 'Non veniam ipsa debitis molestiae dolores pariatur quam. Pariatur quod voluptatem iure odio. A dolores qui voluptates quod qui voluptatem eveniet unde.', 'Atque illo accusamus esse amet libero. Ut iste reprehenderit nisi alias eos vel aut. Ea accusantium autem nihil voluptatibus. At qui iure qui sunt aperiam iste.', NULL, '{\"title\":\"Jewel Lynch\",\"keywords\":\"Jewel Lynch\",\"description\":\"Jewel Lynch\"}', 'vi', 48),
(96, 'Elwyn Kohler', 'elwyn-kohler', 'Ut ut nam voluptatem ad dolorem nobis. Magnam vitae blanditiis at cumque eum. Saepe voluptas ea velit et optio vitae odio.', 'Adipisci deleniti tempora veniam placeat. Ea dolore et dolore est dicta non. Aut vitae voluptatem non et qui et. Porro expedita aut nesciunt.', NULL, '{\"title\":\"Elwyn Kohler\",\"keywords\":\"Elwyn Kohler\",\"description\":\"Elwyn Kohler\"}', 'en', 48),
(97, 'Loren Turner Jr.', 'loren-turner-jr', 'Voluptatem delectus nihil quia dolor. Doloremque veniam aut ut ut. Omnis aspernatur non numquam quidem quidem. Voluptatem voluptatem possimus quidem aspernatur veniam nam cum.', 'Quisquam velit tenetur accusamus. Nihil sed asperiores eum laudantium ab. Est a corporis natus neque aliquid nostrum.', NULL, '{\"title\":\"Loren Turner Jr.\",\"keywords\":\"Loren Turner Jr.\",\"description\":\"Loren Turner Jr.\"}', 'vi', 49),
(98, 'Neal Will', 'neal-will', 'Id voluptates dolore recusandae est ratione. Pariatur iste illum minima nobis neque eos. Incidunt in deserunt optio modi. Magni et quae eveniet aut.', 'Quia voluptatem explicabo inventore aperiam quia eum. Fugit labore ab quasi dignissimos velit. Ea reiciendis doloremque aut pariatur maiores officia tenetur.', NULL, '{\"title\":\"Neal Will\",\"keywords\":\"Neal Will\",\"description\":\"Neal Will\"}', 'en', 49),
(99, 'Prof. Retha Rodriguez', 'prof-retha-rodriguez', 'Quis autem ut nemo. Reprehenderit perspiciatis et id deserunt qui.', 'Excepturi non facilis dolore quia explicabo eius provident. Perferendis fugit voluptas est quia qui. Et et modi doloribus voluptas tempore.', NULL, '{\"title\":\"Prof. Retha Rodriguez\",\"keywords\":\"Prof. Retha Rodriguez\",\"description\":\"Prof. Retha Rodriguez\"}', 'vi', 50),
(100, 'Kasandra Weber DVM', 'kasandra-weber-dvm', 'Placeat quod optio blanditiis aperiam ut. Magnam voluptatum illum est ipsam est dolor. Et facilis sed iste dolore.', 'Ducimus qui doloremque dolorem omnis. Consequatur iure repudiandae et nihil voluptatem tenetur. Mollitia nesciunt laudantium ad esse quod maxime sequi.', NULL, '{\"title\":\"Kasandra Weber DVM\",\"keywords\":\"Kasandra Weber DVM\",\"description\":\"Kasandra Weber DVM\"}', 'en', 50),
(101, 'Dangelo Kertzmann MD', 'dangelo-kertzmann-md', 'Architecto est quasi ut aut accusamus eos. Et cupiditate quia sed quas excepturi nisi eaque. Eveniet inventore et quo in ullam quam quisquam. Dolore consequuntur expedita dolorem.', 'Est veniam ipsam praesentium iusto. A perferendis rerum placeat nisi deserunt. Perferendis dolorem minima sequi.', NULL, '{\"title\":\"Dangelo Kertzmann MD\",\"keywords\":\"Dangelo Kertzmann MD\",\"description\":\"Dangelo Kertzmann MD\"}', 'vi', 51),
(102, 'Xavier Mante', 'xavier-mante', 'Adipisci molestiae fugiat sint quia. Suscipit corrupti sunt quia sapiente quos.', 'Perferendis consequuntur eos vero omnis et. Sit vel consectetur omnis voluptas ea necessitatibus quia. Libero possimus dolor nihil ratione debitis rerum.', NULL, '{\"title\":\"Xavier Mante\",\"keywords\":\"Xavier Mante\",\"description\":\"Xavier Mante\"}', 'en', 51),
(103, 'Dr. Rex Kshlerin', 'dr-rex-kshlerin', 'Molestiae dolore excepturi excepturi reiciendis est. Labore magnam cum expedita dicta enim ratione est sit.', 'Corporis dolore odio fuga. Nulla aut qui repellat temporibus est sint. Ipsa reiciendis et dolore explicabo corrupti modi quo. Recusandae nemo qui in dolor necessitatibus.', NULL, '{\"title\":\"Dr. Rex Kshlerin\",\"keywords\":\"Dr. Rex Kshlerin\",\"description\":\"Dr. Rex Kshlerin\"}', 'vi', 52),
(104, 'Dr. Neil Mohr', 'dr-neil-mohr', 'A velit sed rerum delectus autem nam ad. Incidunt ullam exercitationem voluptatem est. Alias voluptatum dolorum corporis est est eligendi. Enim ut possimus autem quia similique dignissimos esse id.', 'Possimus aut a et deserunt. Reprehenderit vel molestiae et est iusto sequi omnis. Ipsa quasi nihil corrupti dolores. Enim ipsa consequuntur totam corporis ea quis beatae.', NULL, '{\"title\":\"Dr. Neil Mohr\",\"keywords\":\"Dr. Neil Mohr\",\"description\":\"Dr. Neil Mohr\"}', 'en', 52),
(105, 'Kurtis Balistreri', 'kurtis-balistreri', 'Est nemo ut magnam quis ut beatae et. Eaque rerum quia aut reprehenderit. Molestias et sit natus ut. Eligendi iusto ut earum ducimus veritatis voluptas aut.', 'Iste asperiores ut aut alias. Amet ipsa asperiores nesciunt dignissimos occaecati repellat distinctio. Praesentium atque consequatur fugiat debitis aut inventore.', NULL, '{\"title\":\"Kurtis Balistreri\",\"keywords\":\"Kurtis Balistreri\",\"description\":\"Kurtis Balistreri\"}', 'vi', 53),
(106, 'Nona Will', 'nona-will', 'Dolor aut quis accusamus fugiat. Quasi consequatur labore consequuntur laborum. Amet dolorem esse reprehenderit fugiat natus sapiente et.', 'Quos doloribus consequatur ut nihil libero eos reiciendis qui. Ratione et delectus est soluta. Impedit voluptatibus molestiae consequatur unde voluptatem nesciunt impedit.', NULL, '{\"title\":\"Nona Will\",\"keywords\":\"Nona Will\",\"description\":\"Nona Will\"}', 'en', 53),
(107, 'Mr. Fern Braun DVM', 'mr-fern-braun-dvm', 'Exercitationem est ut fuga et accusantium esse. Excepturi odio reprehenderit perferendis est molestiae mollitia. Autem vitae et qui nobis molestiae mollitia vitae et. Quia eos id soluta accusantium.', 'Eum nam a a soluta reprehenderit. Ex dolor id ab tenetur. Nam voluptatem dolorem quisquam et modi. Suscipit non et consequuntur.', NULL, '{\"title\":\"Mr. Fern Braun DVM\",\"keywords\":\"Mr. Fern Braun DVM\",\"description\":\"Mr. Fern Braun DVM\"}', 'vi', 54);
INSERT INTO `product_languages` (`id`, `title`, `slug`, `description`, `contents`, `attributes`, `meta_seo`, `language`, `product_id`) VALUES
(108, 'Prof. Jeffry Donnelly IV', 'prof-jeffry-donnelly-iv', 'Perspiciatis facilis blanditiis expedita rerum omnis. Dolores sint iusto adipisci nobis ipsam expedita harum. Possimus dolorum quis eos omnis ex facilis.', 'Et deserunt maxime accusantium rerum. Molestias doloremque omnis dignissimos rerum.', NULL, '{\"title\":\"Prof. Jeffry Donnelly IV\",\"keywords\":\"Prof. Jeffry Donnelly IV\",\"description\":\"Prof. Jeffry Donnelly IV\"}', 'en', 54),
(109, 'Vergie Harber', 'vergie-harber', 'Numquam aut animi sunt numquam quia officiis facere. Rerum a animi reiciendis corrupti voluptatem. Aliquam repellendus sed repellendus quis ut. Modi corporis veritatis eos non sed voluptas.', 'Reiciendis velit suscipit autem quas maxime sit. Distinctio et assumenda tempora at soluta. Similique est velit et officia qui reprehenderit aut. Corrupti nihil tenetur rem.', NULL, '{\"title\":\"Vergie Harber\",\"keywords\":\"Vergie Harber\",\"description\":\"Vergie Harber\"}', 'vi', 55),
(110, 'Kaela Emard', 'kaela-emard', 'Architecto sint aut cumque expedita excepturi non. Nobis sed qui reprehenderit hic. Modi vitae dicta repellat distinctio.', 'Qui corporis atque odit a fugiat ea id id. Id quia aperiam sequi dolores. Praesentium ad voluptate sint quibusdam at reprehenderit.', NULL, '{\"title\":\"Kaela Emard\",\"keywords\":\"Kaela Emard\",\"description\":\"Kaela Emard\"}', 'en', 55),
(111, 'Judy Stroman', 'judy-stroman', 'Autem magni hic reprehenderit quia molestiae. Labore consectetur beatae corporis facilis aut. Fuga aut quia sit molestiae eum. Voluptatibus non magni fugiat sint doloribus.', 'Dolorem voluptatem in ab laboriosam accusamus modi consectetur alias. In voluptas rerum ab eius. Architecto ipsam laborum ut hic soluta repudiandae.', NULL, '{\"title\":\"Judy Stroman\",\"keywords\":\"Judy Stroman\",\"description\":\"Judy Stroman\"}', 'vi', 56),
(112, 'Cali Zieme', 'cali-zieme', 'Minima autem nulla qui dignissimos sint et. In et laborum vel beatae molestias. Quam provident est velit omnis. Rem nemo itaque vel pariatur et voluptatibus veritatis.', 'Quo aut vel ut et. Et facere accusamus nemo. Eligendi consequatur cum voluptatem mollitia nihil.', NULL, '{\"title\":\"Cali Zieme\",\"keywords\":\"Cali Zieme\",\"description\":\"Cali Zieme\"}', 'en', 56),
(113, 'Sophia Labadie', 'sophia-labadie', 'Porro autem ipsam error quo maiores iure. Sunt quaerat doloribus animi tempora dolor ipsam odit. Accusantium eos ut et et reprehenderit est.', 'Qui molestiae qui necessitatibus deleniti. Aut temporibus ratione libero praesentium. Rerum consequuntur nam voluptates. Culpa rem harum aut velit totam laborum. Voluptatem eos eos dolores architecto eum.', NULL, '{\"title\":\"Sophia Labadie\",\"keywords\":\"Sophia Labadie\",\"description\":\"Sophia Labadie\"}', 'vi', 57),
(114, 'Francesco Douglas', 'francesco-douglas', 'Omnis qui non qui fugit aliquam aut reiciendis. Aut sed molestiae odit veritatis.', 'Fuga quia harum omnis odio. Rem blanditiis quam ab voluptas. Incidunt illo aperiam laudantium corrupti est.', NULL, '{\"title\":\"Francesco Douglas\",\"keywords\":\"Francesco Douglas\",\"description\":\"Francesco Douglas\"}', 'en', 57),
(115, 'Cayla Corwin', 'cayla-corwin', 'Ab mollitia commodi magnam magni veritatis. Porro molestiae quia quo possimus esse magni.', 'Harum ut dolorem ut soluta maxime assumenda. Eum velit sapiente est delectus. Rerum dicta in occaecati consequuntur eius.', NULL, '{\"title\":\"Cayla Corwin\",\"keywords\":\"Cayla Corwin\",\"description\":\"Cayla Corwin\"}', 'vi', 58),
(116, 'Jaylon Runolfsdottir', 'jaylon-runolfsdottir', 'Et odit enim vitae debitis eligendi. Magnam adipisci voluptas accusamus veniam facere labore et. Libero vitae eveniet sit et. Est minima velit ipsum non.', 'Veniam illo earum iure debitis dolor. Qui earum consequatur voluptatem aperiam optio. Temporibus in et illum aut delectus.', NULL, '{\"title\":\"Jaylon Runolfsdottir\",\"keywords\":\"Jaylon Runolfsdottir\",\"description\":\"Jaylon Runolfsdottir\"}', 'en', 58),
(117, 'Mr. Stephen Upton', 'mr-stephen-upton', 'Sed quibusdam magni quisquam perspiciatis laudantium repudiandae. Reprehenderit error dolor ipsam ab exercitationem. Natus ut et est delectus.', 'Necessitatibus aut porro voluptas. Dignissimos odio sed incidunt et.', NULL, '{\"title\":\"Mr. Stephen Upton\",\"keywords\":\"Mr. Stephen Upton\",\"description\":\"Mr. Stephen Upton\"}', 'vi', 59),
(118, 'Mr. Eric Gerhold', 'mr-eric-gerhold', 'Autem repudiandae blanditiis odit totam sint fuga soluta facilis. Et eum expedita ut sed. Voluptas blanditiis dolores beatae deserunt laborum nihil. Omnis voluptate ut saepe molestias non ullam vel.', 'Illum aut cupiditate omnis sed. Voluptas sed officia sit sapiente nisi aperiam non. Voluptas voluptas ea quia cupiditate sint. Accusamus autem animi sit debitis non laboriosam quas a.', NULL, '{\"title\":\"Mr. Eric Gerhold\",\"keywords\":\"Mr. Eric Gerhold\",\"description\":\"Mr. Eric Gerhold\"}', 'en', 59),
(119, 'Kattie Stoltenberg MD', 'kattie-stoltenberg-md', 'Distinctio cupiditate itaque maiores rerum. Dolores omnis qui officia dolorem quia et asperiores. Temporibus incidunt aut cupiditate itaque hic tempore natus.', 'Quidem qui adipisci voluptatem ut optio soluta. Corrupti molestiae consequuntur porro modi asperiores minus. Exercitationem sunt incidunt voluptatum ut facilis pariatur placeat.', NULL, '{\"title\":\"Kattie Stoltenberg MD\",\"keywords\":\"Kattie Stoltenberg MD\",\"description\":\"Kattie Stoltenberg MD\"}', 'vi', 60),
(120, 'Alexis Hahn Sr.', 'alexis-hahn-sr', 'Fugit eum et ut sed id optio odio sed. Est debitis est modi deleniti suscipit modi. Est soluta deleniti consequuntur dignissimos.', 'Eveniet eum quaerat quam assumenda. Sed nesciunt perferendis optio et aut. Voluptatem aliquam repellat eius nesciunt tenetur enim et. Est hic ipsam ut temporibus aut libero aspernatur.', NULL, '{\"title\":\"Alexis Hahn Sr.\",\"keywords\":\"Alexis Hahn Sr.\",\"description\":\"Alexis Hahn Sr.\"}', 'en', 60),
(121, 'Caroline Carroll', 'caroline-carroll', 'Soluta necessitatibus repellendus cupiditate. Consequuntur ut architecto tempora vel recusandae. Autem voluptates ut nobis libero. Et laborum facilis omnis reiciendis id.', 'Qui aut aut placeat voluptatibus qui. Hic ut rem commodi a culpa minus. Voluptatem harum sit quaerat voluptas.', NULL, '{\"title\":\"Caroline Carroll\",\"keywords\":\"Caroline Carroll\",\"description\":\"Caroline Carroll\"}', 'vi', 61),
(122, 'Dr. Ezequiel Hyatt IV', 'dr-ezequiel-hyatt-iv', 'Sint natus ad molestiae dignissimos excepturi eius. Molestiae nihil inventore est est aut. Autem sit autem cumque minima et consectetur.', 'Libero dolores repellat enim quibusdam est id. Doloremque quisquam pariatur accusantium qui et amet. Temporibus dolorem iste aspernatur provident ut est.', NULL, '{\"title\":\"Dr. Ezequiel Hyatt IV\",\"keywords\":\"Dr. Ezequiel Hyatt IV\",\"description\":\"Dr. Ezequiel Hyatt IV\"}', 'en', 61),
(123, 'Prof. Stan Wiegand', 'prof-stan-wiegand', 'Quis ea voluptatibus qui a aut sequi. Voluptas fugiat reprehenderit omnis. Earum cum animi provident cumque quia id dolorem. Omnis autem ea ut facere.', 'Enim porro quia et voluptas nihil. Non assumenda at laborum ut eaque nihil. Numquam ab eius pariatur consequatur id amet sed laudantium.', NULL, '{\"title\":\"Prof. Stan Wiegand\",\"keywords\":\"Prof. Stan Wiegand\",\"description\":\"Prof. Stan Wiegand\"}', 'vi', 62),
(124, 'Drew Witting', 'drew-witting', 'Quia nisi beatae facilis ut rerum aut. Est sapiente rerum rerum a et. Adipisci placeat animi fugiat ratione illo. Consequatur voluptatem iusto adipisci rerum.', 'Autem ipsam sit qui omnis tempore doloribus. Et et assumenda expedita maxime facere eos. Sint consectetur nihil asperiores neque. Fugiat qui labore iure officiis.', NULL, '{\"title\":\"Drew Witting\",\"keywords\":\"Drew Witting\",\"description\":\"Drew Witting\"}', 'en', 62),
(125, 'Miss Shanny Effertz', 'miss-shanny-effertz', 'Et et in repellat porro et. Voluptatem totam consequatur et beatae. Iusto rem libero omnis aliquam quae voluptas. Autem sed aliquam labore consectetur tenetur nobis.', 'Corrupti voluptas voluptatem occaecati cupiditate. Accusamus eaque non vitae ut perferendis et corporis. Quam nisi est sint est. Est tenetur fuga consectetur in corporis in. Aut dolores assumenda rerum nisi odit inventore non.', NULL, '{\"title\":\"Miss Shanny Effertz\",\"keywords\":\"Miss Shanny Effertz\",\"description\":\"Miss Shanny Effertz\"}', 'vi', 63),
(126, 'Miracle Spencer', 'miracle-spencer', 'Voluptate consequuntur eaque id culpa dignissimos. Voluptates beatae expedita in. Accusantium qui quia ab ea sit quaerat.', 'Quidem recusandae consequatur sunt enim fuga saepe. Est consectetur deleniti quia placeat quam quo consequatur. Non eum eos sit neque adipisci autem aspernatur.', NULL, '{\"title\":\"Miracle Spencer\",\"keywords\":\"Miracle Spencer\",\"description\":\"Miracle Spencer\"}', 'en', 63),
(127, 'Ms. Aurelie Mueller DVM', 'ms-aurelie-mueller-dvm', 'Voluptatem velit ipsum commodi. Fuga et non voluptatem sunt. Est deleniti sequi reprehenderit illum sapiente mollitia.', 'Occaecati ea qui molestias unde. Sunt molestiae aspernatur eius consequatur nulla suscipit dignissimos. Harum quo excepturi et quia molestias hic.', NULL, '{\"title\":\"Ms. Aurelie Mueller DVM\",\"keywords\":\"Ms. Aurelie Mueller DVM\",\"description\":\"Ms. Aurelie Mueller DVM\"}', 'vi', 64),
(128, 'Yoshiko West', 'yoshiko-west', 'Perspiciatis accusamus et eius magni. Accusamus ut voluptates sunt similique neque voluptatem repudiandae. Autem est pariatur quo voluptatem sit nemo. Accusamus ad minus asperiores incidunt.', 'Et sequi ut aperiam molestias id adipisci similique. Doloremque doloribus aliquam ut aliquid nesciunt. Voluptatem aut harum minus aspernatur cumque. Aut ea fugiat aut omnis consequatur.', NULL, '{\"title\":\"Yoshiko West\",\"keywords\":\"Yoshiko West\",\"description\":\"Yoshiko West\"}', 'en', 64),
(129, 'Justus Schiller', 'justus-schiller', 'Amet aut dolores ut similique eaque qui deserunt. Magnam qui sunt odit in non provident culpa. Blanditiis qui et velit et temporibus velit occaecati.', 'Sit voluptatem et laboriosam autem dolores amet. Quod nesciunt nostrum et inventore.', NULL, '{\"title\":\"Justus Schiller\",\"keywords\":\"Justus Schiller\",\"description\":\"Justus Schiller\"}', 'vi', 65),
(130, 'Dortha Gutkowski', 'dortha-gutkowski', 'Ullam harum qui quo dicta qui qui est. Voluptates veritatis tempora facere iusto minima. Quidem vel unde quia ex.', 'Quod et reprehenderit est aut pariatur ut. Vitae est accusamus eos quasi. Quibusdam rem non officiis totam aut placeat.', NULL, '{\"title\":\"Dortha Gutkowski\",\"keywords\":\"Dortha Gutkowski\",\"description\":\"Dortha Gutkowski\"}', 'en', 65),
(131, 'Morris Williamson I', 'morris-williamson-i', 'Qui voluptas provident et ea. Et et consequatur illo voluptatum sit ipsam sed. Est adipisci rem rerum veniam numquam.', 'Sit earum veniam quis quia nesciunt. Voluptas ratione cumque nihil saepe molestias id. Nulla hic qui vitae aut est.', NULL, '{\"title\":\"Morris Williamson I\",\"keywords\":\"Morris Williamson I\",\"description\":\"Morris Williamson I\"}', 'vi', 66),
(132, 'Dr. Sabryna Cruickshank', 'dr-sabryna-cruickshank', 'Iure laborum numquam aut et. Voluptates et sit corrupti aliquid vel.', 'Quis facere corporis ut dolor atque recusandae deserunt. Consequatur quis et natus atque a minima. Quia iste iure nobis ad. Aut dolorem magni incidunt rerum eos.', NULL, '{\"title\":\"Dr. Sabryna Cruickshank\",\"keywords\":\"Dr. Sabryna Cruickshank\",\"description\":\"Dr. Sabryna Cruickshank\"}', 'en', 66),
(133, 'Mr. Roberto Effertz V', 'mr-roberto-effertz-v', 'Aut deleniti fugit minima inventore at labore tempora. Fugiat sint et fugit sit est. Aut quia perspiciatis similique dolorem quas quam fugiat vero. Sed eum corporis perspiciatis sit.', 'Quae maiores nam qui sed. Assumenda sit voluptas vitae maxime voluptatem cupiditate nam voluptatem. Quisquam aliquam architecto fugiat et voluptas repellendus quam eos.', NULL, '{\"title\":\"Mr. Roberto Effertz V\",\"keywords\":\"Mr. Roberto Effertz V\",\"description\":\"Mr. Roberto Effertz V\"}', 'vi', 67),
(134, 'Bruce Gusikowski', 'bruce-gusikowski', 'Consequuntur sit voluptate et quas eum aliquid quia. Expedita sequi qui nesciunt. Sint dignissimos dignissimos qui atque. Sed vero omnis animi voluptatem impedit doloremque.', 'Adipisci expedita qui cupiditate atque. Mollitia non porro mollitia vitae nesciunt deleniti debitis. At quaerat sed suscipit quam fuga deserunt sit.', NULL, '{\"title\":\"Bruce Gusikowski\",\"keywords\":\"Bruce Gusikowski\",\"description\":\"Bruce Gusikowski\"}', 'en', 67),
(135, 'Jacynthe Bahringer', 'jacynthe-bahringer', 'Deserunt sed tempore aliquam nam dignissimos nesciunt. Error est rerum saepe ea natus maxime enim. Voluptatem sunt animi eum voluptatem rem.', 'Perspiciatis et earum et nihil. Est officiis illo quia accusantium. Est suscipit dicta maiores dolores neque dolores at. Necessitatibus culpa vel quo delectus eos iste odit.', NULL, '{\"title\":\"Jacynthe Bahringer\",\"keywords\":\"Jacynthe Bahringer\",\"description\":\"Jacynthe Bahringer\"}', 'vi', 68),
(136, 'Dolores Baumbach', 'dolores-baumbach', 'Doloremque laudantium alias et aliquam. Sint aut eos velit quia. Et voluptatem quaerat eum adipisci. Voluptas veritatis excepturi qui consequatur sed impedit sed.', 'Mollitia rerum earum est voluptatem cum unde dolores perferendis. Voluptas earum possimus repellendus ut occaecati sint. Veniam ipsa rem aut magnam ratione eos. Qui eos fugit dolores sed voluptatum voluptatum.', NULL, '{\"title\":\"Dolores Baumbach\",\"keywords\":\"Dolores Baumbach\",\"description\":\"Dolores Baumbach\"}', 'en', 68),
(137, 'Viva Lynch', 'viva-lynch', 'Facere architecto non quidem eum rerum. Impedit nulla id ex id. Quia nam ipsam amet recusandae officia est. Eius error enim quod.', 'Et placeat aut facilis molestias. Minima dolore numquam porro corporis quia tenetur ut cupiditate.', NULL, '{\"title\":\"Viva Lynch\",\"keywords\":\"Viva Lynch\",\"description\":\"Viva Lynch\"}', 'vi', 69),
(138, 'Edward Zulauf', 'edward-zulauf', 'Rerum sint corrupti sit dolores aut voluptates. Quam hic est molestias alias et earum laborum. Maxime a dolorem dolore ipsa sint libero aliquam.', 'Voluptates similique labore aperiam velit corrupti ad quia. Quam ut aut officiis quia vitae. Aut qui voluptate ut qui consequuntur rerum.', NULL, '{\"title\":\"Edward Zulauf\",\"keywords\":\"Edward Zulauf\",\"description\":\"Edward Zulauf\"}', 'en', 69),
(139, 'Emile Connelly', 'emile-connelly', 'Ratione minima et optio eos maiores. Est deleniti recusandae blanditiis sint et est et.', 'In sit ut beatae quis in sit sit. Nam inventore omnis id sunt ut. Non quibusdam est quis. Magni autem sunt sed rerum officia.', NULL, '{\"title\":\"Emile Connelly\",\"keywords\":\"Emile Connelly\",\"description\":\"Emile Connelly\"}', 'vi', 70),
(140, 'Cecelia Hills III', 'cecelia-hills-iii', 'Voluptas molestiae odit autem. Et nihil qui natus reprehenderit. Reiciendis molestiae quam asperiores neque omnis.', 'Perspiciatis quia velit animi voluptatem sed doloremque. Esse aut voluptatem consequatur quam. Autem illum maiores aperiam in qui. Quod illum dolores aut aut cum quidem.', NULL, '{\"title\":\"Cecelia Hills III\",\"keywords\":\"Cecelia Hills III\",\"description\":\"Cecelia Hills III\"}', 'en', 70),
(141, 'Newton Heller', 'newton-heller', 'Recusandae cumque officiis dolore minima dolorem neque. Odit error cum sunt ducimus. Quod eaque illum laboriosam dolorem voluptates rem ipsa. Consequatur voluptas dolorem error architecto.', 'Sed qui dolorem ipsum rerum. Sit ducimus libero officia aut nam aliquid. Hic quia asperiores adipisci maiores cum molestiae autem.', NULL, '{\"title\":\"Newton Heller\",\"keywords\":\"Newton Heller\",\"description\":\"Newton Heller\"}', 'vi', 71),
(142, 'Dr. Jovanny Gerhold', 'dr-jovanny-gerhold', 'Ut voluptates porro non et quod ex nisi. Ut sunt animi qui inventore suscipit corporis. Labore voluptatibus ea et.', 'Laboriosam quia blanditiis laboriosam omnis velit eum et. Id aut suscipit totam nulla magnam facere qui. Illum omnis id perspiciatis quo quis.', NULL, '{\"title\":\"Dr. Jovanny Gerhold\",\"keywords\":\"Dr. Jovanny Gerhold\",\"description\":\"Dr. Jovanny Gerhold\"}', 'en', 71),
(143, 'Prof. Rowland Schowalter', 'prof-rowland-schowalter', 'Saepe rerum dolores saepe enim illo. Animi numquam quasi aliquid accusamus quia numquam. Ratione est qui cupiditate facilis.', 'In voluptatem esse quidem sunt enim modi laboriosam possimus. Asperiores vel adipisci labore ab. Molestiae quo itaque blanditiis quasi omnis optio rerum. Autem distinctio sequi ratione quasi aut molestias sapiente.', NULL, '{\"title\":\"Prof. Rowland Schowalter\",\"keywords\":\"Prof. Rowland Schowalter\",\"description\":\"Prof. Rowland Schowalter\"}', 'vi', 72),
(144, 'Miss Cortney Pfannerstill', 'miss-cortney-pfannerstill', 'Sit vel distinctio quod quo molestias quisquam neque. Id dolorem quis ut ipsa ut. Aut autem natus ipsa eveniet ea nihil explicabo. Quisquam ullam nulla velit molestiae.', 'Sint harum sed enim dolor in. Quibusdam et sunt atque quibusdam. Quas tempora aspernatur laboriosam minus. Veritatis sunt aut distinctio numquam repudiandae ipsam est.', NULL, '{\"title\":\"Miss Cortney Pfannerstill\",\"keywords\":\"Miss Cortney Pfannerstill\",\"description\":\"Miss Cortney Pfannerstill\"}', 'en', 72),
(145, 'Miss Melody Nicolas Sr.', 'miss-melody-nicolas-sr', 'Dignissimos facere et omnis optio. Vel dolorum ad nostrum et ea. In eveniet reprehenderit vitae temporibus et asperiores adipisci. Minima odit ut inventore corrupti.', 'Mollitia aliquam distinctio cumque et. Autem illum laborum non animi et minima. Et ducimus quis perspiciatis vel ut. Id aut atque eos enim et tempora minus.', NULL, '{\"title\":\"Miss Melody Nicolas Sr.\",\"keywords\":\"Miss Melody Nicolas Sr.\",\"description\":\"Miss Melody Nicolas Sr.\"}', 'vi', 73),
(146, 'Brielle Anderson', 'brielle-anderson', 'Excepturi deserunt nihil laborum vel soluta qui. Officia ipsam voluptatem autem sit. Ut aut quas vitae. Voluptatem maiores excepturi expedita ut omnis sit animi.', 'Et explicabo maxime voluptatum beatae et velit officiis. Ut dignissimos sint aut dicta inventore. Unde ea itaque qui maxime nostrum voluptatem voluptate.', NULL, '{\"title\":\"Brielle Anderson\",\"keywords\":\"Brielle Anderson\",\"description\":\"Brielle Anderson\"}', 'en', 73),
(147, 'Dr. Courtney Zulauf', 'dr-courtney-zulauf', 'Dolores commodi enim magni iusto. Laudantium quis eos vel odio.', 'Eum nobis labore nostrum vero quidem odit. Voluptatem veritatis voluptates amet et quas praesentium corporis. Quo nulla nobis mollitia. Sint assumenda cum aut eos quia sint ducimus. Est nisi omnis rerum amet.', NULL, '{\"title\":\"Dr. Courtney Zulauf\",\"keywords\":\"Dr. Courtney Zulauf\",\"description\":\"Dr. Courtney Zulauf\"}', 'vi', 74),
(148, 'Friedrich Wolff', 'friedrich-wolff', 'Est nihil sunt dolore corrupti. Sit amet iste ad. Minima quia libero expedita totam earum.', 'Quia molestias eligendi beatae hic laboriosam. Iure omnis quibusdam voluptatem. Consectetur sit sed libero mollitia. Sapiente dolore est numquam autem repellat porro minima est.', NULL, '{\"title\":\"Friedrich Wolff\",\"keywords\":\"Friedrich Wolff\",\"description\":\"Friedrich Wolff\"}', 'en', 74),
(149, 'Hassan Wyman', 'hassan-wyman', 'Architecto fuga aut cum impedit harum deserunt. Sunt est voluptates exercitationem vel. Perspiciatis assumenda distinctio nam culpa.', 'Commodi accusantium deserunt corporis. Exercitationem neque omnis quos non. Quam voluptatem voluptas temporibus laudantium voluptatum. Libero eius debitis fugit.', NULL, '{\"title\":\"Hassan Wyman\",\"keywords\":\"Hassan Wyman\",\"description\":\"Hassan Wyman\"}', 'vi', 75),
(150, 'Toney Rogahn', 'toney-rogahn', 'Adipisci labore et omnis amet. Nihil laudantium nihil quo fugiat officiis vero.', 'Consequatur molestias facilis sed optio et est. Placeat quia est necessitatibus. Quia praesentium quod aspernatur qui fugit pariatur unde.', NULL, '{\"title\":\"Toney Rogahn\",\"keywords\":\"Toney Rogahn\",\"description\":\"Toney Rogahn\"}', 'en', 75),
(151, 'Warren Morissette', 'warren-morissette', 'Saepe eum sapiente eligendi aspernatur. Non occaecati aperiam hic sit ut nemo hic. Sunt tenetur architecto animi voluptas dolorem. Eos quasi perspiciatis ut beatae sint quo.', 'Sed id est sit sapiente distinctio repudiandae qui. Provident velit enim rerum provident sapiente error modi. Quasi et illo dolore quasi repellat. Neque quidem et in ea maiores voluptatem ut.', NULL, '{\"title\":\"Warren Morissette\",\"keywords\":\"Warren Morissette\",\"description\":\"Warren Morissette\"}', 'vi', 76),
(152, 'Prof. Kolby Mosciski Jr.', 'prof-kolby-mosciski-jr', 'Nesciunt maiores at facere velit ipsam sint ut. Impedit explicabo non consequatur nobis quaerat. Qui quo dolorem provident dignissimos ex ipsum. Dolores similique animi minus.', 'Quia enim provident velit hic adipisci molestiae. Porro commodi incidunt magnam illum quo debitis vel. Dignissimos velit vel vel. Ad tenetur incidunt nisi voluptatem sapiente dolores suscipit in.', NULL, '{\"title\":\"Prof. Kolby Mosciski Jr.\",\"keywords\":\"Prof. Kolby Mosciski Jr.\",\"description\":\"Prof. Kolby Mosciski Jr.\"}', 'en', 76),
(153, 'Keara Schimmel', 'keara-schimmel', 'Dolorum beatae est veritatis in qui labore. Et quisquam vero ratione minima beatae illum explicabo. Laborum optio fugiat qui impedit. Eligendi libero officiis vel earum et saepe.', 'Ut non qui molestiae voluptatem libero dolor. Qui hic magnam deleniti quo quia architecto.', NULL, '{\"title\":\"Keara Schimmel\",\"keywords\":\"Keara Schimmel\",\"description\":\"Keara Schimmel\"}', 'vi', 77),
(154, 'Dr. Elijah Tromp', 'dr-elijah-tromp', 'Debitis nihil voluptatem eaque rem est consequatur repellendus. Ipsam in iste at voluptatibus et ducimus. Et harum molestiae amet est.', 'Placeat sit iusto voluptate corrupti molestiae similique placeat ut. Doloremque repudiandae illo maxime ipsam debitis quasi est voluptas. Ut asperiores maxime dolorem perferendis. Ratione sint aliquam modi sed et facilis minima culpa.', NULL, '{\"title\":\"Dr. Elijah Tromp\",\"keywords\":\"Dr. Elijah Tromp\",\"description\":\"Dr. Elijah Tromp\"}', 'en', 77),
(155, 'Fay Howell I', 'fay-howell-i', 'Minima magnam velit in voluptate minus. Quisquam voluptas labore laboriosam natus et et. Qui soluta qui minus suscipit quis inventore.', 'Et distinctio id esse neque illo voluptatibus et. Ex unde possimus omnis deserunt eius. Nam et ipsa excepturi et voluptatem quos possimus.', NULL, '{\"title\":\"Fay Howell I\",\"keywords\":\"Fay Howell I\",\"description\":\"Fay Howell I\"}', 'vi', 78),
(156, 'Leslie Kassulke', 'leslie-kassulke', 'Recusandae ullam delectus ipsa et placeat dolores quae. Iusto animi beatae nostrum. Consequatur autem dolores atque odit. Est suscipit ab ipsam voluptatem corporis sit.', 'Distinctio quam porro vitae libero neque consequuntur aut. Est aut unde quis quaerat. Temporibus rerum ut saepe. Adipisci aut libero temporibus itaque.', NULL, '{\"title\":\"Leslie Kassulke\",\"keywords\":\"Leslie Kassulke\",\"description\":\"Leslie Kassulke\"}', 'en', 78),
(157, 'Edwin Ernser', 'edwin-ernser', 'Rem cum voluptatem autem deserunt. Distinctio sed ut distinctio aut. Et doloremque id qui repellat maxime corporis doloribus.', 'Voluptatem saepe ducimus odio consequuntur. Eum doloremque eum voluptatem est eos ipsum beatae aut. Sint quaerat officiis est eius. Fuga hic aut exercitationem provident.', NULL, '{\"title\":\"Edwin Ernser\",\"keywords\":\"Edwin Ernser\",\"description\":\"Edwin Ernser\"}', 'vi', 79),
(158, 'Tod Hauck', 'tod-hauck', 'Quo possimus laborum reprehenderit omnis quaerat omnis ea sed. Nulla natus molestiae et et neque in sit omnis. Reprehenderit qui veritatis provident illum quibusdam qui.', 'Non nisi hic autem quo quo ut quae. Provident expedita rerum quas rem occaecati. Ut autem eaque voluptas voluptate.', NULL, '{\"title\":\"Tod Hauck\",\"keywords\":\"Tod Hauck\",\"description\":\"Tod Hauck\"}', 'en', 79),
(159, 'Mr. Paolo Kirlin', 'mr-paolo-kirlin', 'Sint et a aut esse distinctio dolore dolorum. Omnis nihil consequatur corporis error cumque voluptatem voluptatem. Sit officia dicta ex harum expedita aspernatur.', 'Tempora et molestiae quia rerum consequatur non inventore. Saepe temporibus odio explicabo impedit dolores tenetur quae ut. Qui veritatis sit animi doloremque at ut.', NULL, '{\"title\":\"Mr. Paolo Kirlin\",\"keywords\":\"Mr. Paolo Kirlin\",\"description\":\"Mr. Paolo Kirlin\"}', 'vi', 80),
(160, 'Miss Verlie Mante V', 'miss-verlie-mante-v', 'Non deserunt repudiandae odit. Porro doloribus assumenda repellat aspernatur in.', 'Earum enim quia harum accusantium accusantium et mollitia non. Ut sit aut praesentium id sit libero.', NULL, '{\"title\":\"Miss Verlie Mante V\",\"keywords\":\"Miss Verlie Mante V\",\"description\":\"Miss Verlie Mante V\"}', 'en', 80),
(161, 'Estrella Pouros', 'estrella-pouros', 'Similique tempora qui dignissimos eligendi maxime. Illo repellendus aut ex rerum ut. Enim rerum nemo dolorem et veritatis. Rerum adipisci eos eos et.', 'Commodi velit cum natus possimus. Rem at culpa praesentium rerum. Natus eius qui perferendis sed omnis est. Magnam qui harum vitae iste sed in quas.', NULL, '{\"title\":\"Estrella Pouros\",\"keywords\":\"Estrella Pouros\",\"description\":\"Estrella Pouros\"}', 'vi', 81),
(162, 'Elise Trantow', 'elise-trantow', 'Animi eos sed aut. Sunt dolores fuga sint repellendus hic qui neque. Amet tempora molestiae aliquam voluptas repellendus.', 'Architecto optio sit in omnis et. Consequatur occaecati ratione in deserunt esse. Fugit et assumenda quae magnam quidem pariatur aperiam.', NULL, '{\"title\":\"Elise Trantow\",\"keywords\":\"Elise Trantow\",\"description\":\"Elise Trantow\"}', 'en', 81),
(163, 'Mr. Nick Grimes Sr.', 'mr-nick-grimes-sr', 'Voluptatem aut consequuntur inventore hic. Dolorem excepturi rerum facilis omnis quidem exercitationem porro voluptatem. Architecto et dolorem ut autem eligendi eius et.', 'Mollitia reprehenderit ea accusantium est dignissimos soluta. Incidunt rerum vel et natus sequi corrupti voluptas. Nesciunt nobis delectus molestias non tempora odit delectus. In voluptatem quis debitis dolor.', NULL, '{\"title\":\"Mr. Nick Grimes Sr.\",\"keywords\":\"Mr. Nick Grimes Sr.\",\"description\":\"Mr. Nick Grimes Sr.\"}', 'vi', 82),
(164, 'Ms. Virginie Kertzmann', 'ms-virginie-kertzmann', 'Saepe sunt iste et consequatur excepturi. Corrupti consequatur aspernatur quidem non. Illo ut accusantium et. Voluptatem est atque sint soluta rerum quaerat aliquid.', 'Magni eius perspiciatis quia nam placeat dolores. Inventore veniam dolorem excepturi veritatis. Deserunt sapiente laudantium sit cum maxime. Vel ex ipsa animi aut aut optio.', NULL, '{\"title\":\"Ms. Virginie Kertzmann\",\"keywords\":\"Ms. Virginie Kertzmann\",\"description\":\"Ms. Virginie Kertzmann\"}', 'en', 82),
(165, 'Mr. Peyton Ryan DVM', 'mr-peyton-ryan-dvm', 'Aspernatur et voluptatum corporis eos et eveniet qui est. Et repellat nemo nisi dicta. Dicta ea et cum nemo.', 'Et possimus voluptates amet temporibus. Illo voluptatem et est suscipit harum.', NULL, '{\"title\":\"Mr. Peyton Ryan DVM\",\"keywords\":\"Mr. Peyton Ryan DVM\",\"description\":\"Mr. Peyton Ryan DVM\"}', 'vi', 83),
(166, 'Litzy Boehm', 'litzy-boehm', 'Dolores labore voluptatem corrupti iste ratione odio. Fugit ab quis voluptas et. Repudiandae sed possimus libero perspiciatis eos veniam.', 'Debitis expedita vel numquam. Occaecati totam nostrum accusantium esse aut. Saepe eaque soluta fugit commodi. Qui ratione eaque accusamus qui vitae.', NULL, '{\"title\":\"Litzy Boehm\",\"keywords\":\"Litzy Boehm\",\"description\":\"Litzy Boehm\"}', 'en', 83),
(167, 'Ellsworth Wiza', 'ellsworth-wiza', 'Delectus necessitatibus a sint et ut ducimus quos esse. Ut odio sequi odio dicta similique iure aperiam iusto.', 'Nulla delectus eius et voluptatem hic eaque omnis. Tenetur non tempora ab eos vel cum. Illum quasi aliquid et labore voluptatem hic accusamus. Sit distinctio occaecati quidem ex perspiciatis qui rerum.', NULL, '{\"title\":\"Ellsworth Wiza\",\"keywords\":\"Ellsworth Wiza\",\"description\":\"Ellsworth Wiza\"}', 'vi', 84),
(168, 'Dahlia Bechtelar', 'dahlia-bechtelar', 'Quia quibusdam eius magni natus sequi. Recusandae hic saepe qui cum. Eos harum et necessitatibus ipsum aut ut autem.', 'Voluptates qui dolor voluptatum id aperiam placeat reprehenderit. Quisquam possimus fugiat aperiam doloribus pariatur odit id. Aliquid aut laboriosam non pariatur sit.', NULL, '{\"title\":\"Dahlia Bechtelar\",\"keywords\":\"Dahlia Bechtelar\",\"description\":\"Dahlia Bechtelar\"}', 'en', 84),
(169, 'Dr. Garfield Corkery DVM', 'dr-garfield-corkery-dvm', 'Quasi nam explicabo eum qui ratione nobis quaerat soluta. Et aut assumenda nihil minus. Ea perferendis temporibus ipsum sit et temporibus.', 'Unde ut quos laboriosam occaecati cumque quam. Laborum occaecati exercitationem corporis aliquid. Fugit quia est et error blanditiis aut. Inventore et molestiae et corrupti ab similique veniam.', NULL, '{\"title\":\"Dr. Garfield Corkery DVM\",\"keywords\":\"Dr. Garfield Corkery DVM\",\"description\":\"Dr. Garfield Corkery DVM\"}', 'vi', 85),
(170, 'Prof. Blaise Nolan DVM', 'prof-blaise-nolan-dvm', 'Est sapiente et totam consequatur et repellat. Temporibus sequi quos vel. Dolorem nobis dolore voluptates qui. Dolores porro soluta ea aut animi sit.', 'Velit laboriosam necessitatibus iusto hic eum. Ut quidem et id at. Nihil temporibus nihil autem tempora. Occaecati error deserunt et inventore. Facere eum dolor debitis voluptate itaque beatae ullam.', NULL, '{\"title\":\"Prof. Blaise Nolan DVM\",\"keywords\":\"Prof. Blaise Nolan DVM\",\"description\":\"Prof. Blaise Nolan DVM\"}', 'en', 85),
(171, 'Davon Vandervort', 'davon-vandervort', 'Similique vitae ut repellendus velit sed aut repellendus. Quibusdam voluptatem iure occaecati voluptatem. Et enim dolores omnis eligendi.', 'Officia labore iusto asperiores explicabo consequuntur ipsa neque quae. Qui eum ratione animi rerum accusamus doloremque. Dolor omnis vel laborum deserunt similique et.', NULL, '{\"title\":\"Davon Vandervort\",\"keywords\":\"Davon Vandervort\",\"description\":\"Davon Vandervort\"}', 'vi', 86),
(172, 'Roger Quitzon', 'roger-quitzon', 'Sapiente velit sit iste tempore numquam quia. Facere harum assumenda qui non. Distinctio quidem fugit consectetur in molestiae dolorem.', 'Debitis dolorem repellat quos et ab. Eius provident et perferendis blanditiis dolores. Explicabo at et nesciunt autem eos itaque. Laudantium voluptatibus beatae veniam aspernatur debitis modi est.', NULL, '{\"title\":\"Roger Quitzon\",\"keywords\":\"Roger Quitzon\",\"description\":\"Roger Quitzon\"}', 'en', 86),
(173, 'Aylin Hamill', 'aylin-hamill', 'Consequatur aspernatur rerum voluptatum dolorem non exercitationem. Est rerum unde dolor aut. Molestiae occaecati incidunt totam neque assumenda ipsam ex.', 'Itaque laudantium voluptate soluta dolor. Beatae illum libero eaque molestias aut. Recusandae et non dolor voluptatem non vitae.', NULL, '{\"title\":\"Aylin Hamill\",\"keywords\":\"Aylin Hamill\",\"description\":\"Aylin Hamill\"}', 'vi', 87),
(174, 'Reanna Pfeffer', 'reanna-pfeffer', 'Suscipit et id pariatur odit iusto. Sed et dolorum iste harum amet. Qui architecto beatae pariatur et ipsam odio dolorem.', 'Maxime temporibus aut sed ut omnis non corrupti velit. Saepe hic voluptate et. A consequuntur dolores consectetur nisi vel veritatis ut.', NULL, '{\"title\":\"Reanna Pfeffer\",\"keywords\":\"Reanna Pfeffer\",\"description\":\"Reanna Pfeffer\"}', 'en', 87),
(175, 'Patricia Crona', 'patricia-crona', 'Corporis eos atque consequatur vel. Est dicta architecto consectetur quia placeat corrupti. Quibusdam autem autem blanditiis nulla recusandae hic. Est et placeat unde at quod doloremque.', 'Labore quia molestiae eum maxime corporis nihil. Doloremque nostrum dolorem id dolor sed voluptatibus quia.', NULL, '{\"title\":\"Patricia Crona\",\"keywords\":\"Patricia Crona\",\"description\":\"Patricia Crona\"}', 'vi', 88),
(176, 'Cindy Abbott', 'cindy-abbott', 'Delectus sint id provident dolores natus quo. Non est vero quos cumque ab ea. Minus facilis necessitatibus dolores quia officiis.', 'Eveniet neque doloribus porro excepturi voluptas veritatis vitae excepturi. Repudiandae nisi eveniet consequatur quaerat. Magni quo delectus qui voluptas debitis vel nam.', NULL, '{\"title\":\"Cindy Abbott\",\"keywords\":\"Cindy Abbott\",\"description\":\"Cindy Abbott\"}', 'en', 88),
(177, 'Joy Gleichner', 'joy-gleichner', 'Optio velit error nisi. Qui sint quo nobis velit. Et iusto et veritatis quo saepe vitae.', 'Et enim dicta qui. Nihil voluptas possimus repellat et et quia nesciunt. Fugit sit quia ipsa repellat magnam laboriosam dignissimos ipsa. Voluptatibus vitae veniam deleniti fugit iure non.', NULL, '{\"title\":\"Joy Gleichner\",\"keywords\":\"Joy Gleichner\",\"description\":\"Joy Gleichner\"}', 'vi', 89),
(178, 'Mrs. Lizeth Funk', 'mrs-lizeth-funk', 'Culpa omnis dignissimos facere laborum. Quaerat sit voluptatem ut officia et quibusdam voluptatum.', 'Et temporibus ut ut minus et. Cupiditate iste atque aut aspernatur. Impedit consequuntur soluta adipisci quia magni doloremque est. Dolore aut non nihil et.', NULL, '{\"title\":\"Mrs. Lizeth Funk\",\"keywords\":\"Mrs. Lizeth Funk\",\"description\":\"Mrs. Lizeth Funk\"}', 'en', 89),
(179, 'Dr. Janet Armstrong', 'dr-janet-armstrong', 'Vel mollitia similique sint temporibus. Ab facere ipsum quia. Quos nobis iste qui nihil. Quia voluptates exercitationem sed expedita voluptas et alias. At sit blanditiis dolores vel quibusdam.', 'Perspiciatis saepe ut ullam quas voluptatem ut qui. Minima qui error eligendi dignissimos. Ipsam ea voluptates qui a tenetur officia. Cumque omnis explicabo quasi quia tempora.', NULL, '{\"title\":\"Dr. Janet Armstrong\",\"keywords\":\"Dr. Janet Armstrong\",\"description\":\"Dr. Janet Armstrong\"}', 'vi', 90),
(180, 'Forrest Gaylord', 'forrest-gaylord', 'Blanditiis omnis quis necessitatibus inventore enim aut. Ex nemo ut vero illo veniam fugit culpa. Officiis molestiae veritatis unde non incidunt harum.', 'Nihil occaecati quidem nulla ut aperiam vel architecto esse. Impedit provident aliquam aliquid beatae maxime animi esse.', NULL, '{\"title\":\"Forrest Gaylord\",\"keywords\":\"Forrest Gaylord\",\"description\":\"Forrest Gaylord\"}', 'en', 90),
(181, 'Ms. Estelle Fahey', 'ms-estelle-fahey', 'Quam labore expedita sunt dolorem excepturi. A iste et cum ut mollitia iste sit. Harum aut delectus esse.', 'Consequuntur placeat animi suscipit ea sed est quos. Omnis aperiam labore amet. Qui dicta quia voluptates voluptatem velit laudantium. Id rerum vel eveniet alias perspiciatis asperiores. In illo accusamus qui.', NULL, '{\"title\":\"Ms. Estelle Fahey\",\"keywords\":\"Ms. Estelle Fahey\",\"description\":\"Ms. Estelle Fahey\"}', 'vi', 91),
(182, 'Roxane Blanda', 'roxane-blanda', 'Voluptatem aut voluptatum itaque cupiditate. Ab voluptate velit iusto officiis temporibus earum. Excepturi ut aut ut quaerat vel.', 'Iusto similique quo quia et placeat. Magnam ducimus corporis eos quod exercitationem distinctio. Eveniet dolorum ipsa aut impedit qui laborum officia. Ipsam cumque autem sed explicabo in ab deleniti facilis.', NULL, '{\"title\":\"Roxane Blanda\",\"keywords\":\"Roxane Blanda\",\"description\":\"Roxane Blanda\"}', 'en', 91),
(183, 'Stella Rempel MD', 'stella-rempel-md', 'Eum quae error error excepturi. Voluptate suscipit impedit sed aut sunt quo suscipit. Voluptatum dolor tempora in eum libero tenetur est ea.', 'Qui officiis fugiat inventore aliquam corporis et. Rerum vel repellendus et molestiae inventore sit soluta. Molestias qui pariatur ullam. Recusandae minima itaque dolorem officiis.', NULL, '{\"title\":\"Stella Rempel MD\",\"keywords\":\"Stella Rempel MD\",\"description\":\"Stella Rempel MD\"}', 'vi', 92),
(184, 'Kade Monahan', 'kade-monahan', 'Quo nobis magnam dolor voluptate tempore enim nulla. Autem voluptatem error facere ducimus. Sit voluptatibus ipsum voluptate.', 'Voluptatem iure sunt corrupti dolorem architecto rem et sunt. Quo aliquid magni eum aut odio.', NULL, '{\"title\":\"Kade Monahan\",\"keywords\":\"Kade Monahan\",\"description\":\"Kade Monahan\"}', 'en', 92),
(185, 'Elenor Mante', 'elenor-mante', 'Animi et dolorum sed aut magni vero. Repudiandae sunt consectetur ea pariatur voluptatem optio officiis. Assumenda assumenda eum sequi a voluptatibus temporibus facere.', 'Omnis consectetur aut perferendis ex provident earum. Voluptatum ab fugit impedit praesentium rerum omnis. Amet eum et ad doloribus voluptatem. Esse sapiente culpa omnis velit fugit nihil soluta.', NULL, '{\"title\":\"Elenor Mante\",\"keywords\":\"Elenor Mante\",\"description\":\"Elenor Mante\"}', 'vi', 93),
(186, 'Duane Heidenreich II', 'duane-heidenreich-ii', 'Quia laborum quos labore porro quas. Nobis et quia sequi. Consequatur voluptatem quia dolores et ad laborum eaque. Sit rerum aut ea fugiat blanditiis fugit est.', 'Quas minima repellat omnis necessitatibus. Sit doloremque beatae qui repellendus amet voluptas. Eaque quas minima nulla vel.', NULL, '{\"title\":\"Duane Heidenreich II\",\"keywords\":\"Duane Heidenreich II\",\"description\":\"Duane Heidenreich II\"}', 'en', 93),
(187, 'Dr. Dulce Boyle DVM', 'dr-dulce-boyle-dvm', 'Dolorem aut rerum voluptas laboriosam aliquid vero. Et illum doloremque corporis vel autem tenetur maxime est.', 'Iste tempore quo possimus cupiditate fuga. Quo consequatur consequatur quam rerum reiciendis quia. Deleniti architecto id in consequatur et molestias. Labore qui debitis corrupti.', NULL, '{\"title\":\"Dr. Dulce Boyle DVM\",\"keywords\":\"Dr. Dulce Boyle DVM\",\"description\":\"Dr. Dulce Boyle DVM\"}', 'vi', 94),
(188, 'Ms. Verlie Lind DVM', 'ms-verlie-lind-dvm', 'Consequatur consectetur in est. Alias molestiae odio culpa optio reiciendis laudantium beatae ut. Mollitia ea neque labore nihil eveniet accusamus.', 'Id rerum odit cupiditate sit omnis dignissimos deserunt. Dolore dolores quos inventore velit dolores. Occaecati repellendus aut ea suscipit itaque facilis quasi.', NULL, '{\"title\":\"Ms. Verlie Lind DVM\",\"keywords\":\"Ms. Verlie Lind DVM\",\"description\":\"Ms. Verlie Lind DVM\"}', 'en', 94),
(189, 'Miss Cordie Braun', 'miss-cordie-braun', 'Non blanditiis in ut quidem. Eveniet molestias sit suscipit possimus. Ad numquam nihil possimus ea rem in alias reiciendis. Autem voluptatem occaecati aliquam fugiat.', 'Voluptatum atque quas est rerum. Sit sit ut quis aut sapiente eveniet. Qui aut earum ea animi molestiae dolorem enim.', NULL, '{\"title\":\"Miss Cordie Braun\",\"keywords\":\"Miss Cordie Braun\",\"description\":\"Miss Cordie Braun\"}', 'vi', 95),
(190, 'Mrs. Vella Runolfsson', 'mrs-vella-runolfsson', 'Nisi aut autem beatae facilis. Eaque facere dolor quis fuga laborum eos excepturi. Culpa molestias ipsa asperiores et in. Et et saepe quo repellendus sed.', 'Perspiciatis sit iste est est provident quia. Minima voluptates recusandae laudantium impedit ipsam nulla saepe quod. Reiciendis animi placeat ipsum maiores. Repudiandae accusamus et perspiciatis ratione itaque distinctio.', NULL, '{\"title\":\"Mrs. Vella Runolfsson\",\"keywords\":\"Mrs. Vella Runolfsson\",\"description\":\"Mrs. Vella Runolfsson\"}', 'en', 95),
(191, 'Maryam Schiller', 'maryam-schiller', 'Libero qui ratione repudiandae iusto magni et et reiciendis. Non tempore voluptatum nobis pariatur laudantium corrupti. Pariatur et aut alias qui cupiditate.', 'Quisquam et ut earum ad ut. Ut debitis vel assumenda. Aut quia non corporis commodi enim repellendus et inventore. Animi molestiae quisquam velit dicta aliquam et dolorem.', NULL, '{\"title\":\"Maryam Schiller\",\"keywords\":\"Maryam Schiller\",\"description\":\"Maryam Schiller\"}', 'vi', 96),
(192, 'Miss Mallie Collins', 'miss-mallie-collins', 'Illo voluptatem inventore sit ut ab asperiores adipisci. Modi expedita odio exercitationem itaque. Et consectetur consequuntur quia esse ullam voluptatem minima.', 'Nisi ad eos facilis provident cupiditate. Ipsum qui pariatur dicta atque doloremque voluptas laboriosam et. Et repellat omnis quo.', NULL, '{\"title\":\"Miss Mallie Collins\",\"keywords\":\"Miss Mallie Collins\",\"description\":\"Miss Mallie Collins\"}', 'en', 96),
(193, 'Molly Reynolds', 'molly-reynolds', 'Sit delectus aliquam quia dolorum tenetur numquam. Ea natus aut dignissimos et ratione. Ut culpa ut molestiae perferendis. Sit laboriosam laborum consequatur nihil.', 'Culpa illum repellendus ut. Quasi omnis enim vero sit incidunt distinctio et. Autem ipsa iure rerum qui vitae esse pariatur. Blanditiis fugit deleniti veritatis est eligendi.', NULL, '{\"title\":\"Molly Reynolds\",\"keywords\":\"Molly Reynolds\",\"description\":\"Molly Reynolds\"}', 'vi', 97),
(194, 'Prof. Marilyne Carroll', 'prof-marilyne-carroll', 'Omnis repudiandae cupiditate quaerat in tenetur dolor excepturi. Nesciunt voluptas iste magnam reiciendis modi dolorem. Non fuga et quo suscipit.', 'Iusto quia est error aliquid fugiat iste laudantium. Totam voluptatem distinctio asperiores ut. Molestias minima voluptate hic quia in exercitationem.', NULL, '{\"title\":\"Prof. Marilyne Carroll\",\"keywords\":\"Prof. Marilyne Carroll\",\"description\":\"Prof. Marilyne Carroll\"}', 'en', 97),
(195, 'Gregory Beahan', 'gregory-beahan', 'Iure quo corporis ut. Fugiat reprehenderit quia nam in et sunt perspiciatis. Dolorum consequuntur autem aliquid itaque incidunt inventore non sed.', 'Nisi eveniet eveniet quia consequatur autem ducimus. Laborum rerum non sint vero qui aperiam facilis. Tempore recusandae aut aut modi neque perferendis eius. Veniam illo corrupti amet mollitia et voluptatibus atque.', NULL, '{\"title\":\"Gregory Beahan\",\"keywords\":\"Gregory Beahan\",\"description\":\"Gregory Beahan\"}', 'vi', 98),
(196, 'Issac Goyette', 'issac-goyette', 'Rerum ipsa aperiam sunt odit. Distinctio excepturi sunt incidunt qui iure. Est dolorum ea qui corrupti ratione autem.', 'Ut ut nulla quia ullam quia. Id non aut et incidunt reiciendis temporibus. Consequatur maxime cupiditate totam molestiae a alias eos.', NULL, '{\"title\":\"Issac Goyette\",\"keywords\":\"Issac Goyette\",\"description\":\"Issac Goyette\"}', 'en', 98),
(197, 'Alejandra Erdman', 'alejandra-erdman', 'Quisquam ut voluptatum eum. Sed vel accusantium ipsum magni. Quam qui inventore saepe eos eligendi error veritatis quas. Rerum nihil sit aspernatur odit.', '<p>Quia minima dolorum vitae dignissimos perspiciatis aliquam adipisci qui. Cupiditate quasi odit quidem vel perspiciatis reprehenderit. Occaecati dolore assumenda iste quo est saepe odit aperiam.</p>', '[{\"name\":null,\"value\":null}]', '{\"title\":\"Alejandra Erdman\",\"keywords\":\"Alejandra Erdman\",\"description\":\"Alejandra Erdman\"}', 'vi', 99),
(198, 'Evelyn Swaniawski III', 'alejandra-erdman', 'Blanditiis rerum ex ut. Placeat repellat explicabo modi. Dolorum aut aliquid laudantium veritatis itaque velit molestias. Aperiam a quis dolore ratione.', '<p>Sunt sit magni sunt temporibus nesciunt. Provident consequatur fugiat ut omnis ut. Assumenda doloremque culpa aut omnis.</p>', '[{\"name\":null,\"value\":null}]', '{\"title\":\"Evelyn Swaniawski III\",\"keywords\":\"Evelyn Swaniawski III\",\"description\":\"Evelyn Swaniawski III\"}', 'en', 99),
(199, 'Juliana Bailey IV', 'juliana-bailey-iv', 'Dolorem beatae reiciendis maxime sint aspernatur quo. Magnam fugit officia excepturi magni qui quia sit. Dolor ratione velit autem. Facere eaque natus sunt doloremque.', '<p>Cupiditate voluptas accusantium aut laborum. Mollitia beatae voluptates sunt sit distinctio quidem. Doloremque nihil et deserunt et molestiae.</p>', '[{\"name\":\"T\\u00ecnh tr\\u1ea1ng\",\"value\":\"C\\u00f2n h\\u00e0ng\"}]', '{\"title\":\"Juliana Bailey IV\",\"keywords\":\"Juliana Bailey IV\",\"description\":\"Juliana Bailey IV\"}', 'vi', 100),
(200, 'Miss Edwina Rohan Sr.', 'juliana-bailey-iv', 'Non fugiat odio rerum id. Numquam earum corrupti quo pariatur dolores est. Aut soluta minus omnis officia. Nesciunt commodi ut rerum facilis qui.', '<p>Consectetur laborum voluptas ut minima dolorem. Provident aut est officiis et illum sit laboriosam. Labore ut ut voluptate enim modi. Recusandae ducimus voluptatum dolorem id.</p>', '[{\"name\":\"Status\",\"value\":\"check in\"}]', '{\"title\":\"Miss Edwina Rohan Sr.\",\"keywords\":\"Miss Edwina Rohan Sr.\",\"description\":\"Miss Edwina Rohan Sr.\"}', 'en', 100);

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
(1, 'admin', 'Administrator', NULL, 1, 'publish', '2018-04-01 18:13:35', '2018-04-01 18:13:35'),
(2, 'san-pham', 'Sản phẩm', NULL, 1, 'publish', '2018-04-01 18:13:35', '2018-04-01 18:13:35'),
(3, 'sales', 'Bán hàng', NULL, 1, 'publish', '2018-04-01 18:13:35', '2018-04-01 18:13:35'),
(4, 'wms', 'Kho hàng', NULL, 1, 'publish', '2018-04-01 18:13:35', '2018-04-01 18:13:35'),
(5, 'tin-tuc', 'Tin tức', NULL, 1, 'publish', '2018-04-01 18:13:35', '2018-04-01 18:13:35'),
(6, 'dich-vu', 'Dịch vụ', NULL, 1, 'publish', '2018-04-01 18:13:35', '2018-04-01 18:13:35'),
(7, 'pages', 'Trang tĩnh', NULL, 1, 'publish', '2018-04-01 18:13:35', '2018-04-01 18:13:35'),
(8, 'photos', 'Hình ảnh', NULL, 1, 'publish', '2018-04-01 18:13:35', '2018-04-01 18:13:35'),
(9, 'links', 'Liên kết', NULL, 1, 'publish', '2018-04-01 18:13:35', '2018-04-01 18:13:35'),
(10, 'registers', 'Đăng ký', NULL, 1, 'publish', '2018-04-01 18:13:36', '2018-04-01 18:13:36');

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
(1, 'language', 'vi'),
(2, 'date_custom_format', NULL),
(3, 'product_per_page', '21'),
(4, 'thumbs', '{\"product\":{\"_small\":{\"width\":\"300\",\"height\":\"300\"},\"_medium\":{\"width\":\"600\",\"height\":\"600\"},\"_large\":{\"width\":\"1000\",\"height\":\"1000\"}}}'),
(5, 'post_per_page', '10'),
(6, 'site_name', NULL),
(7, 'site_slogan', NULL),
(8, 'site_address', NULL),
(9, 'site_email', NULL),
(10, 'site_phone', NULL),
(11, 'site_fax', NULL),
(12, 'site_hotline', NULL),
(13, 'site_url', NULL),
(14, 'site_copyright', 'Copyright @2018'),
(15, 'fanpage', 'https://www.facebook.com/facebook'),
(16, 'google_coordinates', NULL),
(17, 'email_host', 'smtp.gmail.com'),
(18, 'email_port', '587'),
(19, 'email_smtpsecure', 'tls'),
(20, 'email_username', 'quochai.coder'),
(21, 'email_password', '123qwe@qhai'),
(22, 'email_to', 'quochai.coder@gmail.com'),
(23, 'email_cc', NULL),
(24, 'email_bcc', NULL),
(25, 'script_head', NULL),
(26, 'script_body', NULL),
(27, 'date_format', 'd/m/Y');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `suppliers`
--

CREATE TABLE `suppliers` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
(1, 'voquochai', '$2y$10$JxiDKAiGkLOoBmJCrhDsNO85f1.CKZk2ajpMNsWdFcIOJe0riX3Ja', 'Võ Quốc Hải', NULL, 'quochainina@gmail.com', NULL, NULL, 1, 'publish', 'lKwQudJVKD', '2018-04-01 18:13:34', '2018-04-01 18:13:34');

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
  `code` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `store_code` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
-- Cấu trúc bảng cho bảng `wms_imports`
--

CREATE TABLE `wms_imports` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `store_code` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
-- Cấu trúc bảng cho bảng `wms_stores`
--

CREATE TABLE `wms_stores` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` char(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

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
  ADD PRIMARY KEY (`id`);

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
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `wms_imports`
--
ALTER TABLE `wms_imports`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `wms_stores`
--
ALTER TABLE `wms_stores`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT cho bảng `attribute_languages`
--
ALTER TABLE `attribute_languages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT cho bảng `category_languages`
--
ALTER TABLE `category_languages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;
--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT cho bảng `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT cho bảng `page_languages`
--
ALTER TABLE `page_languages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT cho bảng `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `photos`
--
ALTER TABLE `photos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT cho bảng `photo_languages`
--
ALTER TABLE `photo_languages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT cho bảng `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;
--
-- AUTO_INCREMENT cho bảng `post_languages`
--
ALTER TABLE `post_languages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;
--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;
--
-- AUTO_INCREMENT cho bảng `product_languages`
--
ALTER TABLE `product_languages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=201;
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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT cho bảng `wms_imports`
--
ALTER TABLE `wms_imports`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
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

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
