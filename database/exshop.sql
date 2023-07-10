-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 31, 2022 lúc 05:55 PM
-- Phiên bản máy phục vụ: 10.4.22-MariaDB
-- Phiên bản PHP: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `exshop`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `banners`
--

INSERT INTO `banners` (`id`, `title`, `slug`, `photo`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Banner 1', 'banner 1', '/storage/photos/1/Banner/banner-01.jpg', '<h2><span style=\"font-weight: bold; color: rgb(99, 99, 99);\">Up to 10%</span></h2>', 'active', '2022-10-14 01:47:38', '2022-10-30 07:54:10'),
(2, 'Banner 2', 'banner 2', '/storage/photos/1/Banner/banner-07.jpg', '<p>Up to 90%</p>', 'active', '2022-10-14 01:50:23', '2022-10-30 07:54:31'),
(4, 'Banner', 'banner 3', '/storage/photos/1/Banner/banner-06.jpg', '<h2><span style=\"color: rgb(156, 0, 255); font-size: 2rem; font-weight: bold;\">Up to 40%</span><br></h2><h2><span style=\"color: rgb(156, 0, 255);\"></span></h2>', 'active', '2022-10-17 20:46:59', '2022-08-17 20:46:59'),
(5, 'baner mới', 'baner-moi', '/storage/photos/1/Logo1.png', '<p>tuyệt</p>', 'inactive', '2022-10-28 11:19:59', '2022-10-31 08:18:48');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `brands`
--

INSERT INTO `brands` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Adidas', 'adidas', 'active', '2022-10-14 04:23:00', '2022-10-14 04:23:00'),
(2, 'Nike', 'nike', 'active', '2022-10-14 04:23:08', '2022-10-14 04:23:08'),
(3, 'Kappa', 'kappa', 'active', '2022-10-14 04:23:48', '2022-10-14 04:23:48'),
(4, 'Prada', 'prada', 'active', '2022-10-14 04:24:08', '2022-10-14 04:24:08'),
(6, 'Brand', 'brand', 'active', '2022-10-17 20:50:31', '2022-10-17 20:50:31');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` double(8,2) NOT NULL,
  `status` enum('new','progress','delivered','cancel') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `quantity` int(11) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `carts`
--

INSERT INTO `carts` (`id`, `product_id`, `order_id`, `user_id`, `price`, `status`, `quantity`, `amount`, `created_at`, `updated_at`) VALUES
(17, 9, NULL, 31, 190.00, 'new', 1, 190.00, '2022-10-31 09:20:25', '2022-10-31 09:24:41'),
(18, 3, NULL, 31, 2850.00, 'new', 2, 6000.00, '2022-10-31 09:23:15', '2022-10-31 09:24:41'),
(19, 8, 10, 31, 200.00, 'new', 1, 200.00, '2022-10-31 09:25:45', '2022-10-31 09:26:46');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_parent` tinyint(1) NOT NULL DEFAULT 1,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `added_by` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `title`, `slug`, `summary`, `photo`, `is_parent`, `parent_id`, `added_by`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Thời trang nam', 'Thời trang nam', NULL, '/storage/photos/1/Category/mini-banner1.jpg', 1, NULL, NULL, 'active', '2022-10-14 04:26:15', '2022-10-30 08:02:07'),
(2, 'Thời trang nữ', 'Thời trang nữ', NULL, '/storage/photos/1/Category/mini-banner2.jpg', 1, NULL, NULL, 'active', '2022-10-14 04:26:40', '2022-10-30 08:02:25'),
(3, 'Đồ trẻ em', 'Đồ trẻ em', NULL, '/storage/photos/1/Category/mini-banner3.jpg', 1, NULL, NULL, 'active', '2022-10-14 04:27:10', '2022-10-30 08:02:45'),
(4, 'Áo Phông', 'áo phông', NULL, NULL, 0, 1, NULL, 'active', '2022-10-14 04:32:14', '2022-10-30 08:03:01'),
(5, 'Quần Jean', 'quần jean', NULL, NULL, 0, 1, NULL, 'active', '2022-10-14 04:32:49', '2022-10-30 08:03:41'),
(6, 'Áo len & Áo khoác', 'áo len & áo khoác', NULL, NULL, 0, 1, NULL, 'active', '2022-10-14 04:33:37', '2022-10-30 08:04:20');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('fixed','percent') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'fixed',
  `value` decimal(20,2) NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `coupons`
--

INSERT INTO `coupons` (`id`, `code`, `type`, `value`, `status`, `created_at`, `updated_at`) VALUES
(6, '20-10', 'fixed', '5.00', 'active', '2022-10-30 08:20:43', '2022-10-30 08:20:43'),
(7, '31-10', 'fixed', '7.00', 'active', '2022-10-30 08:20:54', '2022-10-30 08:20:54'),
(8, '20-11', 'fixed', '10.00', 'active', '2022-10-30 08:21:10', '2022-10-30 08:21:10'),
(9, '10-10', 'fixed', '8.00', 'active', '2022-10-30 08:21:32', '2022-10-30 08:21:32');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `messages`
--

CREATE TABLE `messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `messages`
--

INSERT INTO `messages` (`id`, `name`, `subject`, `email`, `photo`, `phone`, `message`, `read_at`, `created_at`, `updated_at`) VALUES
(4, 'm biết bố m là ai không', 'Không biết ghi gì', 'bebutime@gmail.com', NULL, '098888880', 'Gửi thế thôi không biết nhắn gì', NULL, '2022-10-31 09:35:14', '2022-10-31 09:35:14');

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
(1, '2022_10_12_000000_create_users_table', 1),
(2, '2022_10_12_100000_create_password_resets_table', 1),
(3, '2022_09_19_000000_create_failed_jobs_table', 1),
(4, '2022_10_10_021010_create_brands_table', 1),
(5, '2022_10_10_025334_create_banners_table', 1),
(6, '2022_10_10_112147_create_categories_table', 1),
(7, '2022_10_11_063857_create_products_table', 1),
(8, '2022_10_12_073132_create_post_categories_table', 1),
(9, '2022_10_12_073701_create_post_tags_table', 1),
(10, '2022_10_12_083638_create_posts_table', 1),
(11, '2022_10_13_151329_create_messages_table', 1),
(12, '2022_10_14_023748_create_shippings_table', 1),
(13, '2022_10_15_054356_create_orders_table', 1),
(14, '2022_10_15_102626_create_carts_table', 1),
(15, '2022_10_16_041623_create_notifications_table', 1),
(16, '2022_10_16_053240_create_coupons_table', 1),
(17, '2022_10_23_143757_create_wishlists_table', 1),
(18, '2022_10_24_074930_create_product_reviews_table', 1),
(19, '2022_10_24_131727_create_post_comments_table', 1),
(20, '2022_10_01_143408_create_settings_table', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('13561942-dcf2-44cc-b88d-f8b37497e62d', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/blog-detail\\/do-he\",\"fas\":\"fas fa-comment\"}', NULL, '2022-10-31 09:32:39', '2022-10-31 09:32:39'),
('51f9f2d1-2e94-4686-8ff9-c375710dda1f', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/8\",\"fas\":\"fa-file-alt\"}', NULL, '2022-10-30 10:35:50', '2022-10-30 10:35:50'),
('55bc8983-aa7f-4ac8-90fd-fe1cdd33a8c7', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/127.0.0.1:8000\\/admin\\/order\\/6\",\"fas\":\"fa-file-alt\"}', NULL, '2022-10-28 10:50:50', '2022-10-28 10:50:50'),
('57e68f48-da37-401a-bd4d-0b2119b3823e', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/blog-detail\\/do-he\",\"fas\":\"fas fa-comment\"}', NULL, '2022-10-31 09:31:52', '2022-10-31 09:31:52'),
('5bfaa07d-7e40-4e13-9cd8-602489cb3ba5', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/localhost:8000\\/product-detail\\/cotton-high-quality-kurt\",\"fas\":\"fa-star\"}', NULL, '2022-10-31 09:29:09', '2022-10-31 09:29:09'),
('737599aa-69b1-4a87-ba44-4ff3fed7e594', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/blog-detail\\/do-he\",\"fas\":\"fas fa-comment\"}', NULL, '2022-10-31 09:33:02', '2022-10-31 09:33:02'),
('7801937f-df60-4e59-984c-5d4c053bd881', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/localhost:8000\\/product-detail\\/cotton-high-quality-kurt\",\"fas\":\"fa-star\"}', NULL, '2022-10-31 09:30:34', '2022-10-31 09:30:34'),
('78be4162-ca35-4cd2-a940-9b634832315e', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/admin\\/order\\/9\",\"fas\":\"fa-file-alt\"}', NULL, '2022-10-31 09:24:40', '2022-10-31 09:24:40'),
('bbd021b4-42f4-4ace-86b9-6a1d7f9447e7', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Comment created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/blog-detail\\/do-he\",\"fas\":\"fas fa-comment\"}', NULL, '2022-10-31 09:32:15', '2022-10-31 09:32:15'),
('c3392937-324a-49a0-80bf-79f431d97511', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New Product Rating!\",\"actionURL\":\"http:\\/\\/localhost:8000\\/product-detail\\/cotton-high-quality-kurt\",\"fas\":\"fa-star\"}', NULL, '2022-10-31 09:30:00', '2022-10-31 09:30:00'),
('c97ccbe8-2921-410f-8532-46597fc90d74', 'App\\Notifications\\StatusNotification', 'App\\User', 1, '{\"title\":\"New order created\",\"actionURL\":\"http:\\/\\/localhost:8000\\/admin\\/order\\/10\",\"fas\":\"fa-file-alt\"}', NULL, '2022-10-31 09:26:46', '2022-10-31 09:26:46');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sub_total` double(8,2) NOT NULL,
  `shipping_id` bigint(20) UNSIGNED DEFAULT NULL,
  `coupon` double(8,2) DEFAULT NULL,
  `total_amount` double(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `payment_method` enum('cod','paypal') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'cod',
  `payment_status` enum('paid','unpaid') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unpaid',
  `status` enum('new','process','delivered','cancel') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address1` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `address2` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `order_number`, `user_id`, `sub_total`, `shipping_id`, `coupon`, `total_amount`, `quantity`, `payment_method`, `payment_status`, `status`, `first_name`, `last_name`, `email`, `phone`, `country`, `post_code`, `address1`, `address2`, `created_at`, `updated_at`) VALUES
(10, 'ORD-PDEVCZ2REV', 31, 200.00, 6, NULL, 205.00, 1, 'cod', 'unpaid', 'delivered', 'êrfera', 'ưèwewewe', 'sdewerwerwre@sdfsdfsdf', '2213122223234222323423421', 'CI', 'sdfgfdf', 'sdfđsffsdg', 'dsfgsd', '2022-10-31 09:26:46', '2022-10-31 09:53:56');

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
-- Cấu trúc bảng cho bảng `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quote` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tags` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `post_cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `post_tag_id` bigint(20) UNSIGNED DEFAULT NULL,
  `added_by` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `posts`
--

INSERT INTO `posts` (`id`, `title`, `slug`, `summary`, `description`, `quote`, `photo`, `tags`, `post_cat_id`, `post_tag_id`, `added_by`, `status`, `created_at`, `updated_at`) VALUES
(7, 'Tuần lễ thời trang thu đông', 'tuan-le-thoi-trang-thu-dong', '<p>Thời trang thu đông</p>', '<div dir=\"auto\" style=\"font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; color: rgb(5, 5, 5); font-size: 15px; white-space: pre-wrap;\">Lần thứ N đến với Tà Xùa. Nhưng lần này nó lạ lắm. Tâm trạng ko tốt hãy để cho không khí đất trời nơi đây cuốn đi. </div><div dir=\"auto\" style=\"font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; color: rgb(5, 5, 5); font-size: 15px; white-space: pre-wrap;\">Lần đầu tiên đi Tà Xùa mà đi 1 mình, hỏi mấy chiếc Homstay xinh đều hết phòng, may đc anh e ở <span style=\"font-family: inherit;\"><a class=\"x1i10hfl xjbqb8w x6umtig x1b1mbwd xaqea5y xav7gou x9f619 x1ypdohk xt0psk2 xe8uvvx xdj266r x11i5rnm xat24cr x1mh8g0r xexx8yu x4uap5 x18d9i69 xkhd6sd x16tdsg8 x1hl2dhg xggy1nq x1a2a7pz xt0b8zv x1qq9wsj xo1l8bm\" href=\"https://www.facebook.com/hashtag/may_home_t%C3%A0_x%C3%B9a?__eep__=6&amp;__cft__[0]=AZWKR85jKm22fhIQl_G8WsCbI4s2hdeapomAh5zbnB-WHyKcn6n0TtHLLAgA99lTQKKmxqgSo0QoIoT7Dxb8aMQwxMXMHgGuCqxxmbWIJpVR39P22UsfdbLmOc7ary96jT5lOlThyB4F8Fs8AS0nt-YnSgTi7QtNzw6B0g5XEj9okvzWFaSROa2Xojgm7DRDQUw&amp;__tn__=*NK-R\" role=\"link\" tabindex=\"0\" style=\"color: var(--accent); cursor: pointer; outline: none; list-style: none; border-width: 0px; border-style: initial; border-color: initial; margin: 0px; text-align: inherit; padding: 0px; -webkit-tap-highlight-color: transparent; touch-action: manipulation; display: inline; font-family: inherit;\">#May_home_Tà_xùa</a></span>  cho tá túc , hỗ trợ nhiệt tình cắm lều ở nơi mà có thể gọi là view đẹp đứng top Tà Xùa . </div><div dir=\"auto\" style=\"font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; color: rgb(5, 5, 5); font-size: 15px; white-space: pre-wrap;\">Dù lần này xịt mây nhưng Tà Xùa với e lần nào đến cũng đẹp. Tà Xùa là cả 1 bầu trời kỉ niệm.</div><div dir=\"auto\" style=\"font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; color: rgb(5, 5, 5); font-size: 15px; white-space: pre-wrap;\">Giữa tháng 11 e lại quay lại TX. Bác nào muốn đi cùng ib e, e tạo nhóm mình cùng đi nhé <span class=\"x3nfvp2 x1j61x8r x1fcty0u xdj266r xhhsvwb xat24cr xgzva0m xxymvpz xlup9mm x1kky2od\" style=\"width: 16px; display: inline-flex; margin: 0px 1px; height: 16px; vertical-align: middle; font-family: inherit;\"><img height=\"16\" width=\"16\" alt=\"🥰\" referrerpolicy=\"origin-when-cross-origin\" src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/tea/1/16/1f970.png\" style=\"border: 0px;\"></span></div>', '<p>Xin chào các bạn</p>', '/storage/photos/1/MV5BYTMzYTQ1NzAtOGY4OC00ZGM5LThiMmUtMzgzZjgzNzNjZjJmXkEyXkFqcGdeQXVyODk2ODI3MTU@._V1_.jpg', 'Thu Đông 2022', 6, NULL, 1, 'active', '2022-10-31 09:10:21', '2022-10-31 09:12:15'),
(8, 'Đồ hè', 'do-he', '<p>Giá rẻ bất ngờ</p>', '<div class=\"xdj266r x11i5rnm xat24cr x1mh8g0r x1vvkbs x126k92a\" style=\"margin: 0px; white-space: pre-wrap; overflow-wrap: break-word; font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; color: rgb(5, 5, 5); font-size: 15px;\"><div dir=\"auto\" style=\"font-family: inherit;\">Xây dựng website với Notion + Super.so</div></div><div class=\"x11i5rnm xat24cr x1mh8g0r x1vvkbs xtlvy1s x126k92a\" style=\"margin: 0.5em 0px 0px; white-space: pre-wrap; overflow-wrap: break-word; font-family: &quot;Segoe UI Historic&quot;, &quot;Segoe UI&quot;, Helvetica, Arial, sans-serif; color: rgb(5, 5, 5); font-size: 15px;\"><div dir=\"auto\" style=\"font-family: inherit;\">Nay mình tình cờ đọc được một bài trên Medium hướng dẫn xây dựng website nhanh chóng bằng notion + super.so, mình cũng <span style=\"font-family: inherit;\"><a tabindex=\"-1\" style=\"color: rgb(56, 88, 152); cursor: pointer; font-family: inherit;\"></a></span>đang muốn xây dựng một trang blog riêng nên cũng vào dọc thử. Kết quả sau khi dọc thử là xây được trang web như hình bên dưới, mình thấy công cụ này rất tiện cho anh em đang muốn tạo trang web riêng cho mình, mong rằng sẽ hữu ích với các bạn. Các bạn truy cập trang web thử nha :)))</div></div>', '<p>Đồ hè giá rẻ</p>', '/storage/photos/1/Products/1d60f-2.jpg', 'Hè 2022', 7, NULL, 1, 'active', '2022-10-31 09:11:52', '2022-10-31 09:11:52');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `post_categories`
--

CREATE TABLE `post_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `post_categories`
--

INSERT INTO `post_categories` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(6, 'Đồ thu đông', 'do-thu-dong', 'active', '2022-10-30 08:22:17', '2022-10-30 08:22:17'),
(7, 'Thời trang du lịch', 'thoi-trang-du-lich', 'active', '2022-10-30 08:22:31', '2022-10-30 08:22:31'),
(8, 'Thời trang văn phòng', 'thoi-trang-van-phong', 'active', '2022-10-30 08:22:44', '2022-10-30 08:22:44'),
(9, 'Đồ ngủ', 'do-ngu', 'active', '2022-10-30 08:23:07', '2022-10-30 08:23:07');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `post_comments`
--

CREATE TABLE `post_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `post_id` bigint(20) UNSIGNED DEFAULT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `replied_comment` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `post_comments`
--

INSERT INTO `post_comments` (`id`, `user_id`, `post_id`, `comment`, `status`, `replied_comment`, `parent_id`, `created_at`, `updated_at`) VALUES
(8, 31, 8, 'áo không đẹp HẾT', 'active', NULL, NULL, '2022-10-31 09:31:52', '2022-10-31 09:31:52'),
(9, 31, 8, 'ĐỪNG MUA PHÍ TIỀN', 'active', NULL, NULL, '2022-10-31 09:32:15', '2022-10-31 09:32:15'),
(10, 31, 8, 'KỆ', 'active', NULL, 9, '2022-10-31 09:32:39', '2022-10-31 09:32:39'),
(11, 31, 8, 'LMAOOOOO', 'active', NULL, 10, '2022-10-31 09:33:01', '2022-10-31 09:33:01');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `post_tags`
--

CREATE TABLE `post_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `post_tags`
--

INSERT INTO `post_tags` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(5, 'Hè 2022', 'he-2022', 'active', '2022-10-30 08:08:12', '2022-10-30 08:08:12'),
(6, '20-10', '20-10', 'active', '2022-10-30 08:08:25', '2022-10-30 08:08:25'),
(7, '31-10', '31-10', 'active', '2022-10-30 08:08:34', '2022-10-30 08:08:34'),
(8, 'Thu Đông 2022', 'thu-dong-2022', 'active', '2022-10-30 08:08:47', '2022-10-30 08:08:47');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 1,
  `size` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'M',
  `condition` enum('default','new','hot') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'inactive',
  `price` double(8,2) NOT NULL,
  `discount` double(8,2) NOT NULL,
  `is_featured` tinyint(1) NOT NULL,
  `cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `child_cat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `title`, `slug`, `summary`, `description`, `photo`, `stock`, `size`, `condition`, `status`, `price`, `discount`, `is_featured`, `cat_id`, `child_cat_id`, `brand_id`, `created_at`, `updated_at`) VALUES
(1, 'Áo đẹp', 'melange-casual-black', '<p style=\"text-align: justify; \"><font face=\"Open Sans, Arial, sans-serif\"><span style=\"font-size: 14px;\">Đồ đẹp lắm nè</span></font></p>', '<h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\"><span style=\"margin: 0px; padding: 0px; border: 0px; background: transparent; outline: 0px; vertical-align: top; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; text-align: justify;\">Áo thun</span><span style=\"color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; font-weight: 400; text-align: justify;\">&nbsp;là tên gọi của miền nam , còn miền bắc và trung gọi là áo phông . được làm từ nhiều chất liệu khác nhau như thun cá sấu , thun cá mập , thun trơn , thun lạnh , thun hạt mè . Được dệt từ sợi cotton 100% và 65% , ngoài ra còn được làm từ sợi pander . Màu sắc thì vô kể , tất cả các màu sắc đều có thể được nhuộm và làm nên những chiếc&nbsp;</span><span style=\"margin: 0px; padding: 0px; border: 0px; background: transparent; outline: 0px; vertical-align: top; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; text-align: justify;\">áo thun</span><span style=\"color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; font-weight: 400; text-align: justify;\">&nbsp;bắt mắt . Còn hoa văn họa tiết trên&nbsp;</span><span style=\"margin: 0px; padding: 0px; border: 0px; background: transparent; outline: 0px; vertical-align: top; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; text-align: justify;\">áo thun</span><span style=\"color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; font-weight: 400; text-align: justify;\">&nbsp;thì vô vàn , ngày xưa thì đơn giản chỉ là&nbsp;</span><span style=\"margin: 0px; padding: 0px; border: 0px; background: transparent; outline: 0px; vertical-align: top; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; text-align: justify;\">áo thun trắng trơn</span><span style=\"color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; font-weight: 400; text-align: justify;\">&nbsp;, sọc rất đơn giản , và không có nội dung nhiều .</span><br></h3>', '/storage/photos/1/Products/405b7-pmtk004t.jpg,/storage/photos/1/Products/43f35-2_2.jpg', 5, 'S,M,XL', 'new', 'active', 600.00, 10.00, 1, 1, 4, 4, '2022-09-14 04:38:26', '2022-10-30 08:35:24'),
(2, 'Áo phông cộc tay', 'white-sports-casual-t', '<p style=\"text-align: justify; \"><font face=\"Open Sans, Arial, sans-serif\"><span style=\"font-size: 14px;\">Đồ đẹp giá rẻ</span></font></p>', '<h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\"><span style=\"margin: 0px; padding: 0px; border: 0px; background: transparent; outline: 0px; vertical-align: top; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; text-align: justify;\">Áo thun</span><span style=\"color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; font-weight: 400; text-align: justify;\">&nbsp;là tên gọi của miền nam , còn miền bắc và trung gọi là áo phông . được làm từ nhiều chất liệu khác nhau như thun cá sấu , thun cá mập , thun trơn , thun lạnh , thun hạt mè . Được dệt từ sợi cotton 100% và 65% , ngoài ra còn được làm từ sợi pander . Màu sắc thì vô kể , tất cả các màu sắc đều có thể được nhuộm và làm nên những chiếc&nbsp;</span><span style=\"margin: 0px; padding: 0px; border: 0px; background: transparent; outline: 0px; vertical-align: top; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; text-align: justify;\">áo thun</span><span style=\"color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; font-weight: 400; text-align: justify;\">&nbsp;bắt mắt . Còn hoa văn họa tiết trên&nbsp;</span><span style=\"margin: 0px; padding: 0px; border: 0px; background: transparent; outline: 0px; vertical-align: top; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; text-align: justify;\">áo thun</span><span style=\"color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; font-weight: 400; text-align: justify;\">&nbsp;thì vô vàn , ngày xưa thì đơn giản chỉ là&nbsp;</span><span style=\"margin: 0px; padding: 0px; border: 0px; background: transparent; outline: 0px; vertical-align: top; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; text-align: justify;\">áo thun trắng trơn</span><span style=\"color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; font-weight: 400; text-align: justify;\">&nbsp;, sọc rất đơn giản , và không có nội dung nhiều .</span><br></h3>', '/storage/photos/1/Products/1d60f-2.jpg', 3, 'XL', 'hot', 'active', 400.00, 4.00, 1, 1, 4, 2, '2020-08-14 04:40:21', '2022-10-30 08:34:44'),
(3, 'Áo dài tay', 'summer-round-neck-t', '<p style=\"text-align: justify; \"><font face=\"Open Sans, Arial, sans-serif\"><span style=\"font-size: 14px;\">Áo dài tay nhiều mẫu</span></font></p>', '<h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\"><span style=\"margin: 0px; padding: 0px; border: 0px; background: transparent; outline: 0px; vertical-align: top; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; text-align: justify;\">Áo thun</span><span style=\"color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; font-weight: 400; text-align: justify;\">&nbsp;là tên gọi của miền nam , còn miền bắc và trung gọi là áo phông . được làm từ nhiều chất liệu khác nhau như thun cá sấu , thun cá mập , thun trơn , thun lạnh , thun hạt mè . Được dệt từ sợi cotton 100% và 65% , ngoài ra còn được làm từ sợi pander . Màu sắc thì vô kể , tất cả các màu sắc đều có thể được nhuộm và làm nên những chiếc&nbsp;</span><span style=\"margin: 0px; padding: 0px; border: 0px; background: transparent; outline: 0px; vertical-align: top; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; text-align: justify;\">áo thun</span><span style=\"color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; font-weight: 400; text-align: justify;\">&nbsp;bắt mắt . Còn hoa văn họa tiết trên&nbsp;</span><span style=\"margin: 0px; padding: 0px; border: 0px; background: transparent; outline: 0px; vertical-align: top; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; text-align: justify;\">áo thun</span><span style=\"color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; font-weight: 400; text-align: justify;\">&nbsp;thì vô vàn , ngày xưa thì đơn giản chỉ là&nbsp;</span><span style=\"margin: 0px; padding: 0px; border: 0px; background: transparent; outline: 0px; vertical-align: top; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; text-align: justify;\">áo thun trắng trơn</span><span style=\"color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; font-weight: 400; text-align: justify;\">&nbsp;, sọc rất đơn giản , và không có nội dung nhiều .</span><br></h3>', '/storage/photos/1/Products/02090-pms003a.jpg,/storage/photos/1/Products/01f42-pwt004b.jpg,/storage/photos/1/Products/01bc5-mpd006b.jpg,/storage/photos/1/Products/0122b-wsd000t.jpg', 6, 'S,M', 'hot', 'active', 3000.00, 5.00, 0, 2, NULL, 2, '2022-09-14 05:57:48', '2022-10-30 08:34:01'),
(4, 'Váy nữ', 'melange-ethnic-kurthi', '<p style=\"text-align: justify; \"><font face=\"Open Sans, Arial, sans-serif\"><span style=\"font-size: 14px;\">Đồ nữ giá rẻ</span></font></p>', '<h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\"><span style=\"margin: 0px; padding: 0px; border: 0px; background: transparent; outline: 0px; vertical-align: top; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; text-align: justify;\">Áo thun</span><span style=\"color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; font-weight: 400; text-align: justify;\">&nbsp;là tên gọi của miền nam , còn miền bắc và trung gọi là áo phông . được làm từ nhiều chất liệu khác nhau như thun cá sấu , thun cá mập , thun trơn , thun lạnh , thun hạt mè . Được dệt từ sợi cotton 100% và 65% , ngoài ra còn được làm từ sợi pander . Màu sắc thì vô kể , tất cả các màu sắc đều có thể được nhuộm và làm nên những chiếc&nbsp;</span><span style=\"margin: 0px; padding: 0px; border: 0px; background: transparent; outline: 0px; vertical-align: top; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; text-align: justify;\">áo thun</span><span style=\"color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; font-weight: 400; text-align: justify;\">&nbsp;bắt mắt . Còn hoa văn họa tiết trên&nbsp;</span><span style=\"margin: 0px; padding: 0px; border: 0px; background: transparent; outline: 0px; vertical-align: top; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; text-align: justify;\">áo thun</span><span style=\"color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; font-weight: 400; text-align: justify;\">&nbsp;thì vô vàn , ngày xưa thì đơn giản chỉ là&nbsp;</span><span style=\"margin: 0px; padding: 0px; border: 0px; background: transparent; outline: 0px; vertical-align: top; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; text-align: justify;\">áo thun trắng trơn</span><span style=\"color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; font-weight: 400; text-align: justify;\">&nbsp;, sọc rất đơn giản , và không có nội dung nhiều .</span><br></h3>', '/storage/photos/1/Products/0a402-image4xxl-3-.jpg,/storage/photos/1/Products/2282b-wsd008t.jpg,/storage/photos/1/Products/21951-image4xxl.jpg', 5, 'XL', 'default', 'active', 4000.00, 50.00, 0, 2, NULL, 1, '2022-09-14 06:04:13', '2022-10-30 08:33:13'),
(5, 'Quần áo cotton', 'cotton-high-quality-kurt', '<p style=\"text-align: justify; \"><font face=\"Open Sans, Arial, sans-serif\"><span style=\"font-size: 14px;\">Quần áo đẹp</span></font></p>', '<h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\"><span style=\"margin: 0px; padding: 0px; border: 0px; background: transparent; outline: 0px; vertical-align: top; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; text-align: justify;\">Áo thun</span><span style=\"color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; font-weight: 400; text-align: justify;\">&nbsp;là tên gọi của miền nam , còn miền bắc và trung gọi là áo phông . được làm từ nhiều chất liệu khác nhau như thun cá sấu , thun cá mập , thun trơn , thun lạnh , thun hạt mè . Được dệt từ sợi cotton 100% và 65% , ngoài ra còn được làm từ sợi pander . Màu sắc thì vô kể , tất cả các màu sắc đều có thể được nhuộm và làm nên những chiếc&nbsp;</span><span style=\"margin: 0px; padding: 0px; border: 0px; background: transparent; outline: 0px; vertical-align: top; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; text-align: justify;\">áo thun</span><span style=\"color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; font-weight: 400; text-align: justify;\">&nbsp;bắt mắt . Còn hoa văn họa tiết trên&nbsp;</span><span style=\"margin: 0px; padding: 0px; border: 0px; background: transparent; outline: 0px; vertical-align: top; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; text-align: justify;\">áo thun</span><span style=\"color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; font-weight: 400; text-align: justify;\">&nbsp;thì vô vàn , ngày xưa thì đơn giản chỉ là&nbsp;</span><span style=\"margin: 0px; padding: 0px; border: 0px; background: transparent; outline: 0px; vertical-align: top; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; text-align: justify;\">áo thun trắng trơn</span><span style=\"color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; font-weight: 400; text-align: justify;\">&nbsp;, sọc rất đơn giản , và không có nội dung nhiều .</span><br></h3>', '/storage/photos/1/Products/0455e-c1.jpg,/storage/photos/1/Products/04ec4-pmtk001t.jpg,/storage/photos/1/Products/086c2-a1.jpg,/storage/photos/1/Products/09a16-mpd000t_6.jpg,/storage/photos/1/Products/0c2d2-wbk012c-royal-blue.jpg', 0, 'M,XL', 'new', 'active', 4000.00, 10.00, 0, 3, NULL, 3, '2022-09-14 06:10:52', '2022-10-30 08:32:22'),
(6, 'Áo đẹp', 'ladies-cotton-kurti-sha', '<p><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">\"But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system,</span><br></p>', '<h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">Section 1.10.33 of \"de Finibus Bonorum et Malorum\", written by Cicero in 45 BC</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.\"</p><h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">1914 translation by H. Rackham</h3><p style=\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\">\"On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.\"</p>', '/storage/photos/1/Products/6a8b5-wsd013t.jpg,/storage/photos/1/Products/5ded8-image1xxl-5-.jpg,/storage/photos/1/Products/74840-image4xxl-6-.jpg', 6, 'M,L', 'hot', 'active', 6000.00, 3.00, 1, 3, NULL, 4, '2022-09-14 06:13:20', '2022-10-31 09:46:15'),
(7, 'Đồ trẻ em nam', 'gray-baby-rompers', '<p style=\"text-align: justify; \"><font face=\"Open Sans, Arial, sans-serif\"><span style=\"font-size: 14px;\">Đồ trẻ em đẹp</span></font></p>', '<h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\"><span style=\"margin: 0px; padding: 0px; border: 0px; background: transparent; outline: 0px; vertical-align: top; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; text-align: justify;\">Áo thun</span><span style=\"color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; font-weight: 400; text-align: justify;\">&nbsp;là tên gọi của miền nam , còn miền bắc và trung gọi là áo phông . được làm từ nhiều chất liệu khác nhau như thun cá sấu , thun cá mập , thun trơn , thun lạnh , thun hạt mè . Được dệt từ sợi cotton 100% và 65% , ngoài ra còn được làm từ sợi pander . Màu sắc thì vô kể , tất cả các màu sắc đều có thể được nhuộm và làm nên những chiếc&nbsp;</span><span style=\"margin: 0px; padding: 0px; border: 0px; background: transparent; outline: 0px; vertical-align: top; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; text-align: justify;\">áo thun</span><span style=\"color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; font-weight: 400; text-align: justify;\">&nbsp;bắt mắt . Còn hoa văn họa tiết trên&nbsp;</span><span style=\"margin: 0px; padding: 0px; border: 0px; background: transparent; outline: 0px; vertical-align: top; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; text-align: justify;\">áo thun</span><span style=\"color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; font-weight: 400; text-align: justify;\">&nbsp;thì vô vàn , ngày xưa thì đơn giản chỉ là&nbsp;</span><span style=\"margin: 0px; padding: 0px; border: 0px; background: transparent; outline: 0px; vertical-align: top; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; text-align: justify;\">áo thun trắng trơn</span><span style=\"color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; font-weight: 400; text-align: justify;\">&nbsp;, sọc rất đơn giản , và không có nội dung nhiều .</span><br></h3>', '/storage/photos/1/Products/08ec9-n3.jpg,/storage/photos/1/Products/07e30-mtk006b.jpg,/storage/photos/1/Products/18b18-wbk003b.jpg', 5, 'L', 'hot', 'active', 1999.00, 3.00, 0, 3, NULL, 1, '2022-09-14 06:23:33', '2022-10-30 08:30:58'),
(8, 'Áo trẻ em nữ', 'baby-girls-2-piece-yell', '<p style=\"text-align: justify; \"><font face=\"Open Sans, Arial, sans-serif\"><span style=\"font-size: 14px;\">Đồ đẹp giá rẻ</span></font></p>', '<h3 style=\"margin: 15px 0px; padding: 0px; font-weight: 700; font-size: 14px; font-family: &quot;Open Sans&quot;, Arial, sans-serif;\"><span style=\"margin: 0px; padding: 0px; border: 0px; background: transparent; outline: 0px; vertical-align: top; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; text-align: justify;\">Áo thun</span><span style=\"color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; font-weight: 400; text-align: justify;\">&nbsp;là tên gọi của miền nam , còn miền bắc và trung gọi là áo phông . được làm từ nhiều chất liệu khác nhau như thun cá sấu , thun cá mập , thun trơn , thun lạnh , thun hạt mè . Được dệt từ sợi cotton 100% và 65% , ngoài ra còn được làm từ sợi pander . Màu sắc thì vô kể , tất cả các màu sắc đều có thể được nhuộm và làm nên những chiếc&nbsp;</span><span style=\"margin: 0px; padding: 0px; border: 0px; background: transparent; outline: 0px; vertical-align: top; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; text-align: justify;\">áo thun</span><span style=\"color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; font-weight: 400; text-align: justify;\">&nbsp;bắt mắt . Còn hoa văn họa tiết trên&nbsp;</span><span style=\"margin: 0px; padding: 0px; border: 0px; background: transparent; outline: 0px; vertical-align: top; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; text-align: justify;\">áo thun</span><span style=\"color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; font-weight: 400; text-align: justify;\">&nbsp;thì vô vàn , ngày xưa thì đơn giản chỉ là&nbsp;</span><span style=\"margin: 0px; padding: 0px; border: 0px; background: transparent; outline: 0px; vertical-align: top; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; text-align: justify;\">áo thun trắng trơn</span><span style=\"color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; font-weight: 400; text-align: justify;\">&nbsp;, sọc rất đơn giản , và không có nội dung nhiều .</span><br></h3>', '/storage/photos/1/Products/calvin-klein.jpg,/storage/photos/1/Products/calvin.jpg,/storage/photos/1/Products/d3fdb-image2xxl-4-.jpg', 0, 'S', 'new', 'active', 200.00, 0.00, 0, 3, NULL, 2, '2022-09-14 06:25:42', '2022-10-31 09:53:56'),
(9, 'Áo nam', 'lorem-ipsum-is-simply', '<p style=\"text-align: justify; \"><font face=\"Open Sans, Arial, sans-serif\"><span style=\"font-size: 14px;\"><b>Thời trang giá rẻ</b></span></font></p>', '<p><span style=\"margin: 0px; padding: 0px; border: 0px; background: transparent; font-weight: bold; outline: 0px; vertical-align: top; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; text-align: justify;\">Áo thun</span><span style=\"color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; text-align: justify;\">&nbsp;là tên gọi của miền nam , còn miền bắc và trung gọi là áo phông . được làm từ nhiều chất liệu khác nhau như thun cá sấu , thun cá mập , thun trơn , thun lạnh , thun hạt mè . Được dệt từ sợi cotton 100% và 65% , ngoài ra còn được làm từ sợi pander . Màu sắc thì vô kể , tất cả các màu sắc đều có thể được nhuộm và làm nên những chiếc&nbsp;</span><span style=\"margin: 0px; padding: 0px; border: 0px; background: transparent; font-weight: bold; outline: 0px; vertical-align: top; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; text-align: justify;\">áo thun</span><span style=\"color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; text-align: justify;\">&nbsp;bắt mắt . Còn hoa văn họa tiết trên&nbsp;</span><span style=\"margin: 0px; padding: 0px; border: 0px; background: transparent; font-weight: bold; outline: 0px; vertical-align: top; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; text-align: justify;\">áo thun</span><span style=\"color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; text-align: justify;\">&nbsp;thì vô vàn , ngày xưa thì đơn giản chỉ là&nbsp;</span><span style=\"margin: 0px; padding: 0px; border: 0px; background: transparent; font-weight: bold; outline: 0px; vertical-align: top; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; text-align: justify;\">áo thun trắng trơn</span><span style=\"color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; text-align: justify;\">&nbsp;, sọc rất đơn giản , và không có nội dung nhiều .</span><br></p>', '/storage/photos/1/Products/0455e-c1.jpg,/storage/photos/1/Products/04776-pms000a.jpg,/storage/photos/1/Products/04ec4-pmtk001t.jpg,/storage/photos/1/Products/032f0-image3xxl-1-.jpg', 4, 'S,M,XL', 'new', 'active', 200.00, 5.00, 0, 1, 4, 3, '2022-09-15 06:52:44', '2022-10-30 08:29:09'),
(10, 'Áo thu đông nữ', 'lorem-ipsum-is-simply-2008183507-655', '<p style=\"text-align: justify; \"><font face=\"Open Sans, Arial, sans-serif\"><span style=\"font-size: 14px;\"><b>Thời trang giá rẻ</b></span></font></p>', '<p><span style=\"margin: 0px; padding: 0px; border: 0px; background: transparent; font-weight: bold; outline: 0px; vertical-align: top; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; text-align: justify;\">Áo thun</span><span style=\"color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; text-align: justify;\">&nbsp;là tên gọi của miền nam , còn miền bắc và trung gọi là áo phông . được làm từ nhiều chất liệu khác nhau như thun cá sấu , thun cá mập , thun trơn , thun lạnh , thun hạt mè . Được dệt từ sợi cotton 100% và 65% , ngoài ra còn được làm từ sợi pander . Màu sắc thì vô kể , tất cả các màu sắc đều có thể được nhuộm và làm nên những chiếc&nbsp;</span><span style=\"margin: 0px; padding: 0px; border: 0px; background: transparent; font-weight: bold; outline: 0px; vertical-align: top; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; text-align: justify;\">áo thun</span><span style=\"color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; text-align: justify;\">&nbsp;bắt mắt . Còn hoa văn họa tiết trên&nbsp;</span><span style=\"margin: 0px; padding: 0px; border: 0px; background: transparent; font-weight: bold; outline: 0px; vertical-align: top; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; text-align: justify;\">áo thun</span><span style=\"color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; text-align: justify;\">&nbsp;thì vô vàn , ngày xưa thì đơn giản chỉ là&nbsp;</span><span style=\"margin: 0px; padding: 0px; border: 0px; background: transparent; font-weight: bold; outline: 0px; vertical-align: top; color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; text-align: justify;\">áo thun trắng trơn</span><span style=\"color: rgb(51, 51, 51); font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; text-align: justify;\">&nbsp;, sọc rất đơn giản , và không có nội dung nhiều .</span><br></p><p><span style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\"><br></span><br></p>', '/storage/photos/1/Products/01f42-pwt004b.jpg,/storage/photos/1/Products/02090-pms003a.jpg,/storage/photos/1/Products/032f0-image3xxl-1-.jpg', 5, 'L,XL', 'hot', 'active', 300.00, 10.00, 0, 2, NULL, 3, '2022-09-17 20:50:07', '2022-10-30 08:27:51');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_reviews`
--

CREATE TABLE `product_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED DEFAULT NULL,
  `rate` tinyint(4) NOT NULL DEFAULT 0,
  `review` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_reviews`
--

INSERT INTO `product_reviews` (`id`, `user_id`, `product_id`, `rate`, `review`, `status`, `created_at`, `updated_at`) VALUES
(3, 31, 5, 4, 'áo rất đẹp, chất liệu rất tốt, không có gì để bàn', 'active', '2022-10-31 09:29:09', '2022-10-31 09:29:09'),
(4, 31, 5, 5, 'duy hùng rất đẹp, áo thì xấu', 'active', '2022-10-31 09:30:00', '2022-10-31 09:30:00'),
(5, 31, 5, 1, 'laksdslakjaaadasasdsdaasdasdasdaaasas', 'active', '2022-10-31 09:30:33', '2022-10-31 09:30:33');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_des` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `settings`
--

INSERT INTO `settings` (`id`, `description`, `short_des`, `logo`, `photo`, `address`, `phone`, `email`, `created_at`, `updated_at`) VALUES
(1, 'Hãy mua hàng đi chứ còn chờ đợi gì nữa', 'Exshop cái gì cũng có ,chỉ sợ bạn thiếu tiền', '/storage/photos/1/logo.png', '/storage/photos/1/blog3.jpg', 'Số 3 Cầu Giấy, Láng Hạ,Hà Nội', '+8494612672', 'exshop@gmail.com', NULL, '2022-10-29 18:54:38');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `shippings`
--

CREATE TABLE `shippings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `shippings`
--

INSERT INTO `shippings` (`id`, `type`, `price`, `status`, `created_at`, `updated_at`) VALUES
(5, 'Giao hàng nội địa', '2.00', 'active', '2022-10-30 08:14:09', '2022-10-30 08:14:09'),
(6, 'Giao hàng quốc tế', '5.00', 'active', '2022-10-30 08:14:26', '2022-10-30 08:14:26');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` enum('admin','user') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `photo`, `role`, `provider`, `provider_id`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Duy Hùng', 'admin@gmail.com', NULL, '$2y$10$GOGIJdzJydYJ5nAZ42iZNO3IL1fdvXoSPdUOH3Ajy5hRmi0xBmTzm', '/storage/photos/1/users/user1.jpg', 'admin', NULL, NULL, 'active', 'kCPMzdWkW9KoyIbiQFy1L7lk8DNVZCZoWRG6HY1UNOCV7AkYwzxBksptckny', NULL, '2022-09-15 06:47:13'),
(2, 'User', 'user@gmail.com', NULL, '$2y$10$10jB2lupSfvAUfocjguzSeN95LkwgZJUM7aQBdb2Op7XzJ.BhNoHq', '/storage/photos/1/users/user2.jpg', 'user', NULL, NULL, 'active', NULL, NULL, '2022-09-15 07:30:07'),
(30, 'duy hung', 'hung@gmail.com', NULL, '$2y$10$EJy3pW5ekA10k/5HlVAKF.V4nfnvZk6EtWBUDIpw3ITLImI/KA.l6', NULL, 'user', NULL, NULL, 'active', NULL, '2022-10-28 10:49:11', '2022-10-28 10:49:11'),
(31, 'duy hùng vip pro max ultra ultimate infinity plus galaxy okkkkkk', 'a@gmail.com', NULL, '$2y$10$MP2tIuU.LpBK9BYXbSqCBuWz/p08SsQtCIXlSEH2TWwc/6fkE1c32', NULL, 'user', NULL, NULL, 'active', NULL, '2022-10-31 09:18:14', '2022-10-31 09:18:14');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `cart_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` double(8,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `wishlists`
--

INSERT INTO `wishlists` (`id`, `product_id`, `cart_id`, `user_id`, `price`, `quantity`, `amount`, `created_at`, `updated_at`) VALUES
(3, 6, 19, 31, 5820.00, 1, 5820.00, '2022-10-31 09:20:43', '2022-10-31 09:25:45');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `banners_slug_unique` (`slug`);

--
-- Chỉ mục cho bảng `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `brands_slug_unique` (`slug`);

--
-- Chỉ mục cho bảng `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_product_id_foreign` (`product_id`),
  ADD KEY `carts_user_id_foreign` (`user_id`),
  ADD KEY `carts_order_id_foreign` (`order_id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_slug_unique` (`slug`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`),
  ADD KEY `categories_added_by_foreign` (`added_by`);

--
-- Chỉ mục cho bảng `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`);

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_order_number_unique` (`order_number`),
  ADD KEY `orders_user_id_foreign` (`user_id`),
  ADD KEY `orders_shipping_id_foreign` (`shipping_id`);

--
-- Chỉ mục cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Chỉ mục cho bảng `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`),
  ADD KEY `posts_post_cat_id_foreign` (`post_cat_id`),
  ADD KEY `posts_post_tag_id_foreign` (`post_tag_id`),
  ADD KEY `posts_added_by_foreign` (`added_by`);

--
-- Chỉ mục cho bảng `post_categories`
--
ALTER TABLE `post_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `post_categories_slug_unique` (`slug`);

--
-- Chỉ mục cho bảng `post_comments`
--
ALTER TABLE `post_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_comments_user_id_foreign` (`user_id`),
  ADD KEY `post_comments_post_id_foreign` (`post_id`);

--
-- Chỉ mục cho bảng `post_tags`
--
ALTER TABLE `post_tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `post_tags_slug_unique` (`slug`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_slug_unique` (`slug`),
  ADD KEY `products_brand_id_foreign` (`brand_id`),
  ADD KEY `products_cat_id_foreign` (`cat_id`),
  ADD KEY `products_child_cat_id_foreign` (`child_cat_id`);

--
-- Chỉ mục cho bảng `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_reviews_user_id_foreign` (`user_id`),
  ADD KEY `product_reviews_product_id_foreign` (`product_id`);

--
-- Chỉ mục cho bảng `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `shippings`
--
ALTER TABLE `shippings`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Chỉ mục cho bảng `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `wishlists_product_id_foreign` (`product_id`),
  ADD KEY `wishlists_user_id_foreign` (`user_id`),
  ADD KEY `wishlists_cart_id_foreign` (`cart_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `messages`
--
ALTER TABLE `messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `post_categories`
--
ALTER TABLE `post_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `post_comments`
--
ALTER TABLE `post_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `post_tags`
--
ALTER TABLE `post_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `product_reviews`
--
ALTER TABLE `product_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `shippings`
--
ALTER TABLE `shippings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT cho bảng `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `carts_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_shipping_id_foreign` FOREIGN KEY (`shipping_id`) REFERENCES `shippings` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_added_by_foreign` FOREIGN KEY (`added_by`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `posts_post_cat_id_foreign` FOREIGN KEY (`post_cat_id`) REFERENCES `post_categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `posts_post_tag_id_foreign` FOREIGN KEY (`post_tag_id`) REFERENCES `post_tags` (`id`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `post_comments`
--
ALTER TABLE `post_comments`
  ADD CONSTRAINT `post_comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `post_comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_cat_id_foreign` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `products_child_cat_id_foreign` FOREIGN KEY (`child_cat_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `product_reviews`
--
ALTER TABLE `product_reviews`
  ADD CONSTRAINT `product_reviews_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `product_reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `wishlists`
--
ALTER TABLE `wishlists`
  ADD CONSTRAINT `wishlists_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `wishlists_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `wishlists_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
