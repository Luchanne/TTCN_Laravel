-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 29, 2022 lúc 07:42 AM
-- Phiên bản máy phục vụ: 10.4.24-MariaDB
-- Phiên bản PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `laravel`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `carts`
--

INSERT INTO `carts` (`id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 36, NULL, NULL),
(2, 37, NULL, NULL),
(3, 39, NULL, NULL),
(4, 38, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart_products`
--

CREATE TABLE `cart_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_size` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_quantity` smallint(6) NOT NULL,
  `product_price` double NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `cart_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `name`, `parent_id`, `created_at`, `updated_at`) VALUES
(11, 'Đồ cho nam', NULL, '2022-12-15 00:22:09', '2022-12-15 00:53:47'),
(13, 'Áo cho nam', 11, '2022-12-15 00:30:32', '2022-12-19 07:30:49'),
(25, 'Áo cho nữ', 26, '2022-12-19 07:06:59', '2022-12-19 07:30:40'),
(26, 'Đồ cho nữ', NULL, '2022-12-19 07:07:07', '2022-12-19 07:07:07'),
(27, 'Quần nam', 11, '2022-12-19 19:19:08', '2022-12-19 19:19:08'),
(28, 'Quần nữ', 26, '2022-12-19 19:19:22', '2022-12-19 19:19:22'),
(29, 'Váy nữ', 26, '2022-12-19 19:19:30', '2022-12-19 19:19:30'),
(30, 'Đồ cho bé', NULL, '2022-12-19 19:43:54', '2022-12-19 19:43:54'),
(31, 'Quần áo cho bé', 30, '2022-12-19 19:44:03', '2022-12-19 19:44:03');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category_product`
--

CREATE TABLE `category_product` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `category_product`
--

INSERT INTO `category_product` (`id`, `category_id`, `product_id`, `created_at`, `updated_at`) VALUES
(6, 13, 17, NULL, NULL),
(9, 13, 39, NULL, NULL),
(10, 13, 40, NULL, NULL),
(11, 13, 41, NULL, NULL),
(12, 13, 42, NULL, NULL),
(13, 25, 43, NULL, NULL),
(14, 25, 44, NULL, NULL),
(15, 25, 45, NULL, NULL),
(16, 25, 46, NULL, NULL),
(17, 25, 47, NULL, NULL),
(18, 25, 48, NULL, NULL),
(19, 25, 49, NULL, NULL),
(20, 13, 50, NULL, NULL),
(21, 27, 51, NULL, NULL),
(22, 27, 52, NULL, NULL),
(23, 27, 53, NULL, NULL),
(24, 27, 54, NULL, NULL),
(25, 27, 55, NULL, NULL),
(26, 27, 56, NULL, NULL),
(27, 27, 57, NULL, NULL),
(28, 28, 58, NULL, NULL),
(29, 28, 59, NULL, NULL),
(30, 28, 60, NULL, NULL),
(31, 29, 61, NULL, NULL),
(32, 29, 62, NULL, NULL),
(33, 29, 63, NULL, NULL),
(34, 31, 64, NULL, NULL),
(35, 31, 65, NULL, NULL),
(36, 31, 66, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` double NOT NULL,
  `expery_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `coupons`
--

INSERT INTO `coupons` (`id`, `name`, `type`, `value`, `expery_date`, `created_at`, `updated_at`) VALUES
(6, 'BigSale3', 'money', 25, '2022-12-30 17:00:00', '2022-12-19 00:44:29', '2022-12-21 23:56:29'),
(8, 'BigSale4', 'money', 25, '2022-12-30 17:00:00', '2022-12-25 23:34:53', '2022-12-25 23:34:53'),
(9, 'BIGSALE5', 'money', 50, '2022-12-30 17:00:00', '2022-12-25 23:35:06', '2022-12-25 23:36:05');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `coupon_user`
--

CREATE TABLE `coupon_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `value` double NOT NULL,
  `coupon_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `coupon_user`
--

INSERT INTO `coupon_user` (`id`, `user_id`, `value`, `coupon_id`, `created_at`, `updated_at`) VALUES
(1, 36, 25, 6, NULL, NULL),
(2, 36, 50, 9, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `images`
--

CREATE TABLE `images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `imageable_id` bigint(20) UNSIGNED NOT NULL,
  `imageable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `images`
--

INSERT INTO `images` (`id`, `url`, `imageable_id`, `imageable_type`, `created_at`, `updated_at`) VALUES
(49, '1671162118.jpg', 10, 'App\\Models\\User', '2022-12-15 20:41:58', '2022-12-15 20:41:58'),
(96, '1671500422.jpg', 43, 'App\\Models\\Product', '2022-12-19 18:40:23', '2022-12-19 18:40:23'),
(97, '1671500481.jpg', 42, 'App\\Models\\Product', '2022-12-19 18:41:21', '2022-12-19 18:41:21'),
(98, '1671500498.jpg', 41, 'App\\Models\\Product', '2022-12-19 18:41:38', '2022-12-19 18:41:38'),
(99, '1671500519.jpg', 40, 'App\\Models\\Product', '2022-12-19 18:41:59', '2022-12-19 18:41:59'),
(100, '1671500538.jpg', 39, 'App\\Models\\Product', '2022-12-19 18:42:18', '2022-12-19 18:42:18'),
(102, '1671500624.jpg', 17, 'App\\Models\\Product', '2022-12-19 18:43:44', '2022-12-19 18:43:44'),
(103, '1671500761.jpg', 44, 'App\\Models\\Product', '2022-12-19 18:46:02', '2022-12-19 18:46:02'),
(105, '1671500889.jpg', 46, 'App\\Models\\Product', '2022-12-19 18:48:09', '2022-12-19 18:48:09'),
(106, '1671501008.jpg', 45, 'App\\Models\\Product', '2022-12-19 18:50:08', '2022-12-19 18:50:08'),
(107, '1671501097.jpg', 47, 'App\\Models\\Product', '2022-12-19 18:51:37', '2022-12-19 18:51:37'),
(108, '1671501203.jpg', 48, 'App\\Models\\Product', '2022-12-19 18:53:23', '2022-12-19 18:53:23'),
(109, '1671501947.jpg', 49, 'App\\Models\\Product', '2022-12-19 19:05:47', '2022-12-19 19:05:47'),
(110, '1671502709.jpg', 50, 'App\\Models\\Product', '2022-12-19 19:18:29', '2022-12-19 19:18:29'),
(111, '1671502914.jpg', 51, 'App\\Models\\Product', '2022-12-19 19:21:54', '2022-12-19 19:21:54'),
(112, '1671503015.jpg', 52, 'App\\Models\\Product', '2022-12-19 19:23:35', '2022-12-19 19:23:35'),
(113, '1671503109.jpg', 53, 'App\\Models\\Product', '2022-12-19 19:25:09', '2022-12-19 19:25:09'),
(114, '1671503176.jpg', 54, 'App\\Models\\Product', '2022-12-19 19:26:16', '2022-12-19 19:26:16'),
(115, '1671503234.jpg', 55, 'App\\Models\\Product', '2022-12-19 19:27:14', '2022-12-19 19:27:14'),
(116, '1671503443.jpg', 56, 'App\\Models\\Product', '2022-12-19 19:30:43', '2022-12-19 19:30:43'),
(117, '1671503629.jpg', 57, 'App\\Models\\Product', '2022-12-19 19:33:49', '2022-12-19 19:33:49'),
(118, '1671503722.jpg', 58, 'App\\Models\\Product', '2022-12-19 19:35:22', '2022-12-19 19:35:22'),
(119, '1671503773.jpg', 59, 'App\\Models\\Product', '2022-12-19 19:36:13', '2022-12-19 19:36:13'),
(120, '1671503864.jpg', 60, 'App\\Models\\Product', '2022-12-19 19:37:44', '2022-12-19 19:37:44'),
(121, '1671503965.jpg', 61, 'App\\Models\\Product', '2022-12-19 19:39:25', '2022-12-19 19:39:25'),
(122, '1671504008.jpg', 62, 'App\\Models\\Product', '2022-12-19 19:40:08', '2022-12-19 19:40:08'),
(123, '1671504070.jpg', 63, 'App\\Models\\Product', '2022-12-19 19:41:11', '2022-12-19 19:41:11'),
(124, '1671504399.jpg', 64, 'App\\Models\\Product', '2022-12-19 19:46:39', '2022-12-19 19:46:39'),
(125, '1671504605.jpg', 65, 'App\\Models\\Product', '2022-12-19 19:50:05', '2022-12-19 19:50:05'),
(126, '1671504706.jpg', 66, 'App\\Models\\Product', '2022-12-19 19:51:46', '2022-12-19 19:51:46'),
(127, '1671512811.png', 37, 'App\\Models\\User', '2022-12-19 22:06:51', '2022-12-19 22:06:51'),
(128, '1671765908.jpg', 38, 'App\\Models\\User', '2022-12-22 20:25:08', '2022-12-22 20:25:08'),
(131, '1671186777.jpg', 36, 'App\\Models\\User', '2022-12-26 00:36:54', '2022-12-26 00:36:54');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2022_12_12_063258_create_permission_tables', 1),
(6, '2022_12_12_072707_create_products_table', 1),
(7, '2022_12_12_072931_create_categories_table', 1),
(8, '2022_12_12_074100_create_product_details_table', 1),
(9, '2022_12_12_074904_create_images_table', 1),
(10, '2022_12_12_075338_create_carts_table', 1),
(11, '2022_12_12_080642_create_cart_products_table', 1),
(12, '2022_12_12_081227_create_coupons_table', 1),
(13, '2022_12_12_081928_create_orders_table', 1),
(14, '2022_12_12_082530_create_product_orders_table', 1),
(15, '2022_12_12_082817_create_coupon_user_table', 1),
(16, '2022_12_14_112629_refactor_field_parent_id_in_categories_table', 2),
(17, '2022_12_20_032049_refactor_field_in_cart_products_table', 3),
(18, '2022_12_23_012328_remove_order_id_coupon_user_table', 4),
(19, '2022_12_23_012707_add_payment_in_orders_table', 4);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 36),
(1, 'App\\Models\\User', 38),
(5, 'App\\Models\\User', 37);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total` double NOT NULL,
  `ship` double NOT NULL,
  `customer_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `payment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `status`, `total`, `ship`, `customer_name`, `customer_email`, `customer_phone`, `customer_address`, `note`, `user_id`, `created_at`, `updated_at`, `payment`) VALUES
(3, 'hủy đơn', 230000, 30000, 'Luchan', 'nguynguyn450@gmail.com', '0586164102', '123 NT', 'hong', 36, '2022-12-22 19:07:27', '2022-12-22 20:32:04', 'monney'),
(4, 'chờ duyệt', 55000, 30000, 'Luchan1', 'nguynguyn4501@gmail.com', '05861641021', '123 NT', 'hong', 36, '2022-12-27 19:44:10', '2022-12-27 19:44:10', 'monney');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('nguynguyn432@gmail.com', '$2y$10$Y3CWZl3QxGMv9lv1FznXkuzPfLtHrQG9XwqYYHJkDetU0HBUIWB/O', '2022-12-13 18:19:07'),
('nguynguyn450@gmail.com', '$2y$10$gv2YfUgUGtq.3NOzlRIjDuThpsFWheokx9CTd/1B9eMT5GW.aB.hK', '2022-12-26 00:17:26');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `group` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `display_name`, `group`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'create-user', 'Create user', 'User', 'web', '2022-12-13 03:07:14', '2022-12-13 03:07:14'),
(2, 'update-user', 'Update user', 'User', 'web', '2022-12-13 03:07:14', '2022-12-13 03:07:14'),
(3, 'show-user', 'Show user', 'User', 'web', '2022-12-13 03:07:14', '2022-12-13 03:07:14'),
(4, 'delete-user', 'Delete user', 'User', 'web', '2022-12-13 03:07:14', '2022-12-13 03:07:14'),
(5, 'create-role', 'Create Role', 'Role', 'web', '2022-12-13 03:07:14', '2022-12-13 03:07:14'),
(6, 'update-role', 'Update Role', 'Role', 'web', '2022-12-13 03:07:14', '2022-12-13 03:07:14'),
(7, 'show-role', 'Show Role', 'Role', 'web', '2022-12-13 03:07:14', '2022-12-13 03:07:14'),
(8, 'delete-role', 'Delete Role', 'Role', 'web', '2022-12-13 03:07:14', '2022-12-13 03:07:14'),
(9, 'create-category', 'Create Category', 'Category', 'web', '2022-12-13 03:07:14', '2022-12-13 03:07:14'),
(10, 'update-category', 'Update Category', 'Category', 'web', '2022-12-13 03:07:14', '2022-12-13 03:07:14'),
(11, 'show-category', 'Show Category', 'Category', 'web', '2022-12-13 03:07:14', '2022-12-13 03:07:14'),
(12, 'delete-category', 'Delete Category', 'Category', 'web', '2022-12-13 03:07:14', '2022-12-13 03:07:14'),
(13, 'create-product', 'Create Product', 'Product', 'web', '2022-12-13 03:07:14', '2022-12-13 03:07:14'),
(14, 'update-product', 'Update Product', 'Product', 'web', '2022-12-13 03:07:14', '2022-12-13 03:07:14'),
(15, 'show-product', 'Show Product', 'Product', 'web', '2022-12-13 03:07:14', '2022-12-13 03:07:14'),
(16, 'delete-product', 'Delete Product', 'Product', 'web', '2022-12-13 03:07:14', '2022-12-13 03:07:14'),
(17, 'create-coupon', 'Create Coupon', 'Coupon', 'web', '2022-12-13 03:07:14', '2022-12-13 03:07:14'),
(18, 'update-coupon', 'Update Coupon', 'Coupon', 'web', '2022-12-13 03:07:14', '2022-12-13 03:07:14'),
(19, 'show-coupon', 'Show Coupon', 'Coupon', 'web', '2022-12-13 03:07:14', '2022-12-13 03:07:14'),
(20, 'delete-coupon', 'Delete Coupon', 'Coupon', 'web', '2022-12-13 03:07:14', '2022-12-13 03:07:14'),
(21, 'list-order', 'list order', 'orders', 'web', '2022-12-23 00:06:01', '2022-12-23 00:06:01'),
(22, 'update-order-status', 'Update order status', 'orders', 'web', '2022-12-23 00:06:01', '2022-12-23 00:06:01');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `sale` smallint(6) NOT NULL DEFAULT 0,
  `price` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `sale`, `price`, `created_at`, `updated_at`) VALUES
(17, 'Áo thun nam con mèo', '<p><strong>MÔ TẢ SẢN PHẨM</strong></p><p>Áo thun nam nữ oversize Lu Shop phong cách unisex form rộng tay ngắn, cổ tròn màu- -</p><p>&nbsp;Áo thun nam nữ oversize sử dụng chất vải cotton 65/35 co giãn 4 chiều. Là loại vải có đặc điểm mềm mịn, độ co giãn cao, khả năng thấm hút tốt và được dệt hoàn toàn từ sợi cây bông tự nhiên. Chất vải cotton cực kỳ thân thiện với làn da.&nbsp;</p><p>- Áo thun nam nữ form rộng cổ tròn thoải mái&nbsp;</p><p>- Áo phông unisex form rộng dễ phối đồ. Bạn có thể phối với quần jean, chân váy, … kết hợp với một đôi sneaker cho bạn tự tin xuống phố&nbsp;</p><p>- BẢNG SIZE SẢN PHẨM Áo thun nam nữ oversize Lu Shop phong cách unisex form rộng tay ngắn, cổ tròn màu trắng hình TNT-LAB trái tim xanh CỦA Lu Shop</p><p>- Quý khách vui lòng xem Áo phông nam nữ oversize tại Ảnh sản phẩm hoặc Bảng quy đổi kích cỡ&nbsp;</p><p><strong>- HƯỚNG DẪN CHỌN SIZE ÁO &nbsp;</strong></p><p>&nbsp; &nbsp;+ Size M: 46-53kg&nbsp;</p><p>&nbsp; &nbsp;+ Size L: 63-74kg&nbsp;</p><p>&nbsp; &nbsp;+ Size XL: 75-84kg</p>', 0, 125000, '2022-12-16 03:54:41', '2022-12-19 18:43:44'),
(39, 'Áo chó mặt siu nguuu', '<p><strong>MÔ TẢ SẢN PHẨM</strong></p><p>Áo thun nam nữ oversize Lu Shop phong cách unisex form rộng tay ngắn, cổ tròn màu- -</p><p>&nbsp;Áo thun nam nữ oversize sử dụng chất vải cotton 65/35 co giãn 4 chiều. Là loại vải có đặc điểm mềm mịn, độ co giãn cao, khả năng thấm hút tốt và được dệt hoàn toàn từ sợi cây bông tự nhiên. Chất vải cotton cực kỳ thân thiện với làn da.&nbsp;</p><p>- Áo thun nam nữ form rộng cổ tròn thoải mái&nbsp;</p><p>- Áo phông unisex form rộng dễ phối đồ. Bạn có thể phối với quần jean, chân váy, … kết hợp với một đôi sneaker cho bạn tự tin xuống phố&nbsp;</p><p>- BẢNG SIZE SẢN PHẨM Áo thun nam nữ oversize Lu Shop phong cách unisex form rộng tay ngắn, cổ tròn màu trắng hình TNT-LAB trái tim xanh CỦA Lu Shop</p><p>- Quý khách vui lòng xem Áo phông nam nữ oversize tại Ảnh sản phẩm hoặc Bảng quy đổi kích cỡ&nbsp;</p><p><strong>- HƯỚNG DẪN CHỌN SIZE ÁO &nbsp;</strong></p><p>&nbsp; &nbsp;+ Size M: 46-53kg&nbsp;</p><p>&nbsp; &nbsp;+ Size L: 63-74kg&nbsp;</p><p>&nbsp; &nbsp;+ Size XL: 75-84kg</p>', 10, 150000, '2022-12-19 02:55:49', '2022-12-19 18:42:18'),
(40, 'Áo phông nam', '<p><strong>MÔ TẢ SẢN PHẨM</strong></p><p>Áo thun nam nữ oversize Lu Shop phong cách unisex form rộng tay ngắn, cổ tròn màu- -</p><p>&nbsp;Áo thun nam nữ oversize sử dụng chất vải cotton 65/35 co giãn 4 chiều. Là loại vải có đặc điểm mềm mịn, độ co giãn cao, khả năng thấm hút tốt và được dệt hoàn toàn từ sợi cây bông tự nhiên. Chất vải cotton cực kỳ thân thiện với làn da.&nbsp;</p><p>- Áo thun nam nữ form rộng cổ tròn thoải mái&nbsp;</p><p>- Áo phông unisex form rộng dễ phối đồ. Bạn có thể phối với quần jean, chân váy, … kết hợp với một đôi sneaker cho bạn tự tin xuống phố&nbsp;</p><p>- BẢNG SIZE SẢN PHẨM Áo thun nam nữ oversize Lu Shop phong cách unisex form rộng tay ngắn, cổ tròn màu trắng hình TNT-LAB trái tim xanh CỦA Lu Shop</p><p>- Quý khách vui lòng xem Áo phông nam nữ oversize tại Ảnh sản phẩm hoặc Bảng quy đổi kích cỡ&nbsp;</p><p><strong>- HƯỚNG DẪN CHỌN SIZE ÁO &nbsp;</strong></p><p>&nbsp; &nbsp;+ Size M: 46-53kg&nbsp;</p><p>&nbsp; &nbsp;+ Size L: 63-74kg&nbsp;</p><p>&nbsp; &nbsp;+ Size XL: 75-84kg</p>', 25, 120000, '2022-12-19 02:56:16', '2022-12-19 18:41:59'),
(41, 'Mèo Chi', '<p><strong>MÔ TẢ SẢN PHẨM</strong></p><p>Áo thun nam nữ oversize Lu Shop phong cách unisex form rộng tay ngắn, cổ tròn màu- -</p><p>&nbsp;Áo thun nam nữ oversize sử dụng chất vải cotton 65/35 co giãn 4 chiều. Là loại vải có đặc điểm mềm mịn, độ co giãn cao, khả năng thấm hút tốt và được dệt hoàn toàn từ sợi cây bông tự nhiên. Chất vải cotton cực kỳ thân thiện với làn da.&nbsp;</p><p>- Áo thun nam nữ form rộng cổ tròn thoải mái&nbsp;</p><p>- Áo phông unisex form rộng dễ phối đồ. Bạn có thể phối với quần jean, chân váy, … kết hợp với một đôi sneaker cho bạn tự tin xuống phố&nbsp;</p><p>- BẢNG SIZE SẢN PHẨM Áo thun nam nữ oversize Lu Shop phong cách unisex form rộng tay ngắn, cổ tròn màu trắng hình TNT-LAB trái tim xanh CỦA Lu Shop</p><p>- Quý khách vui lòng xem Áo phông nam nữ oversize tại Ảnh sản phẩm hoặc Bảng quy đổi kích cỡ&nbsp;</p><p><strong>- HƯỚNG DẪN CHỌN SIZE ÁO &nbsp;</strong></p><p>&nbsp; &nbsp;+ Size M: 46-53kg&nbsp;</p><p>&nbsp; &nbsp;+ Size L: 63-74kg&nbsp;</p><p>&nbsp; &nbsp;+ Size XL: 75-84kg</p>', 20, 100000, '2022-12-19 02:56:44', '2022-12-19 18:41:38'),
(42, 'Áo mèo Ok', '<p><strong>MÔ TẢ SẢN PHẨM</strong></p><p>Áo thun nam nữ oversize Lu Shop phong cách unisex form rộng tay ngắn, cổ tròn màu- -</p><p>&nbsp;Áo thun nam nữ oversize sử dụng chất vải cotton 65/35 co giãn 4 chiều. Là loại vải có đặc điểm mềm mịn, độ co giãn cao, khả năng thấm hút tốt và được dệt hoàn toàn từ sợi cây bông tự nhiên. Chất vải cotton cực kỳ thân thiện với làn da.&nbsp;</p><p>- Áo thun nam nữ form rộng cổ tròn thoải mái&nbsp;</p><p>- Áo phông unisex form rộng dễ phối đồ. Bạn có thể phối với quần jean, chân váy, … kết hợp với một đôi sneaker cho bạn tự tin xuống phố&nbsp;</p><p>- BẢNG SIZE SẢN PHẨM Áo thun nam nữ oversize Lu Shop phong cách unisex form rộng tay ngắn, cổ tròn màu trắng hình TNT-LAB trái tim xanh CỦA Lu Shop</p><p>- Quý khách vui lòng xem Áo phông nam nữ oversize tại Ảnh sản phẩm hoặc Bảng quy đổi kích cỡ&nbsp;</p><p><strong>- HƯỚNG DẪN CHỌN SIZE ÁO &nbsp;</strong></p><p>&nbsp; &nbsp;+ Size M: 46-53kg&nbsp;</p><p>&nbsp; &nbsp;+ Size L: 63-74kg&nbsp;</p><p>&nbsp; &nbsp;+ Size XL: 75-84kg</p>', 20, 110000, '2022-12-19 02:57:08', '2022-12-19 18:41:21'),
(43, 'Áo phông nữ ngộ nghĩnh', '<p><strong>MÔ TẢ SẢN PHẨM</strong></p><p>Áo thun nam nữ oversize Lu Shop phong cách unisex form rộng tay ngắn, cổ tròn màu- -</p><p>&nbsp;Áo thun nam nữ oversize sử dụng chất vải cotton 65/35 co giãn 4 chiều. Là loại vải có đặc điểm mềm mịn, độ co giãn cao, khả năng thấm hút tốt và được dệt hoàn toàn từ sợi cây bông tự nhiên. Chất vải cotton cực kỳ thân thiện với làn da.&nbsp;</p><p>- Áo thun nam nữ form rộng cổ tròn thoải mái&nbsp;</p><p>- Áo phông unisex form rộng dễ phối đồ. Bạn có thể phối với quần jean, chân váy, … kết hợp với một đôi sneaker cho bạn tự tin xuống phố&nbsp;</p><p>- BẢNG SIZE SẢN PHẨM Áo thun nam nữ oversize Lu Shop phong cách unisex form rộng tay ngắn, cổ tròn màu trắng hình TNT-LAB trái tim xanh CỦA Lu Shop</p><p>- Quý khách vui lòng xem Áo phông nam nữ oversize tại Ảnh sản phẩm hoặc Bảng quy đổi kích cỡ&nbsp;</p><p><strong>- HƯỚNG DẪN CHỌN SIZE ÁO &nbsp;</strong></p><p>&nbsp; &nbsp;+ Size M: 46-53kg&nbsp;</p><p>&nbsp; &nbsp;+ Size L: 63-74kg&nbsp;</p><p>&nbsp; &nbsp;+ Size XL: 75-84kg</p>', 0, 100000, '2022-12-19 09:06:18', '2022-12-19 18:40:23'),
(44, 'Áo thun nữ con mèo', '<p><strong>MÔ TẢ SẢN PHẨM</strong></p><p>Áo thun nam nữ oversize Lu Shop phong cách unisex form rộng tay ngắn, cổ tròn màu- -</p><p>&nbsp;Áo thun nam nữ oversize sử dụng chất vải cotton 65/35 co giãn 4 chiều. Là loại vải có đặc điểm mềm mịn, độ co giãn cao, khả năng thấm hút tốt và được dệt hoàn toàn từ sợi cây bông tự nhiên. Chất vải cotton cực kỳ thân thiện với làn da.&nbsp;</p><p>- Áo thun nam nữ form rộng cổ tròn thoải mái&nbsp;</p><p>- Áo phông unisex form rộng dễ phối đồ. Bạn có thể phối với quần jean, chân váy, … kết hợp với một đôi sneaker cho bạn tự tin xuống phố&nbsp;</p><p>- BẢNG SIZE SẢN PHẨM Áo thun nam nữ oversize Lu Shop phong cách unisex form rộng tay ngắn, cổ tròn màu trắng hình TNT-LAB trái tim xanh CỦA Lu Shop</p><p>- Quý khách vui lòng xem Áo phông nam nữ oversize tại Ảnh sản phẩm hoặc Bảng quy đổi kích cỡ&nbsp;</p><p><strong>- HƯỚNG DẪN CHỌN SIZE ÁO &nbsp;</strong></p><p>&nbsp; &nbsp;+ Size M: 46-53kg&nbsp;</p><p>&nbsp; &nbsp;+ Size L: 63-74kg&nbsp;</p><p>&nbsp; &nbsp;+ Size XL: 75-84kg</p>', 30, 150000, '2022-12-19 18:46:01', '2022-12-19 18:46:01'),
(45, 'Áo thun nữ hình chú gà con', '<p><strong>MÔ TẢ SẢN PHẨM</strong></p><p>Áo thun nam nữ oversize Lu Shop phong cách unisex form rộng tay ngắn, cổ tròn màu- -</p><p>&nbsp;Áo thun nam nữ oversize sử dụng chất vải cotton 65/35 co giãn 4 chiều. Là loại vải có đặc điểm mềm mịn, độ co giãn cao, khả năng thấm hút tốt và được dệt hoàn toàn từ sợi cây bông tự nhiên. Chất vải cotton cực kỳ thân thiện với làn da.&nbsp;</p><p>- Áo thun nam nữ form rộng cổ tròn thoải mái&nbsp;</p><p>- Áo phông unisex form rộng dễ phối đồ. Bạn có thể phối với quần jean, chân váy, … kết hợp với một đôi sneaker cho bạn tự tin xuống phố&nbsp;</p><p>- BẢNG SIZE SẢN PHẨM Áo thun nam nữ oversize Lu Shop phong cách unisex form rộng tay ngắn, cổ tròn màu trắng hình TNT-LAB trái tim xanh CỦA Lu Shop</p><p>- Quý khách vui lòng xem Áo phông nam nữ oversize tại Ảnh sản phẩm hoặc Bảng quy đổi kích cỡ&nbsp;</p><p><strong>- HƯỚNG DẪN CHỌN SIZE ÁO &nbsp;</strong></p><p>&nbsp; &nbsp;+ Size M: 46-53kg&nbsp;</p><p>&nbsp; &nbsp;+ Size L: 63-74kg&nbsp;</p><p>&nbsp; &nbsp;+ Size XL: 75-84kg</p>', 20, 125000, '2022-12-19 18:47:10', '2022-12-19 18:50:08'),
(46, 'Áo thun nữ form rộng', '<p><strong>MÔ TẢ SẢN PHẨM</strong></p><p>Áo thun nam nữ oversize Lu Shop phong cách unisex form rộng tay ngắn, cổ tròn màu- -</p><p>&nbsp;Áo thun nam nữ oversize sử dụng chất vải cotton 65/35 co giãn 4 chiều. Là loại vải có đặc điểm mềm mịn, độ co giãn cao, khả năng thấm hút tốt và được dệt hoàn toàn từ sợi cây bông tự nhiên. Chất vải cotton cực kỳ thân thiện với làn da.&nbsp;</p><p>- Áo thun nam nữ form rộng cổ tròn thoải mái&nbsp;</p><p>- Áo phông unisex form rộng dễ phối đồ. Bạn có thể phối với quần jean, chân váy, … kết hợp với một đôi sneaker cho bạn tự tin xuống phố&nbsp;</p><p>- BẢNG SIZE SẢN PHẨM Áo thun nam nữ oversize Lu Shop phong cách unisex form rộng tay ngắn, cổ tròn màu trắng hình TNT-LAB trái tim xanh CỦA Lu Shop</p><p>- Quý khách vui lòng xem Áo phông nam nữ oversize tại Ảnh sản phẩm hoặc Bảng quy đổi kích cỡ&nbsp;</p><p><strong>- HƯỚNG DẪN CHỌN SIZE ÁO &nbsp;</strong></p><p>&nbsp; &nbsp;+ Size M: 46-53kg&nbsp;</p><p>&nbsp; &nbsp;+ Size L: 63-74kg&nbsp;</p><p>&nbsp; &nbsp;+ Size XL: 75-84kg</p>', 10, 250000, '2022-12-19 18:48:09', '2022-12-19 18:48:09'),
(47, 'Áo nữ giả 2 cổ hình trái bơ', '<p><strong>MÔ TẢ SẢN PHẨM</strong></p><p>Áo thun nam nữ oversize Lu Shop phong cách unisex form rộng tay ngắn, cổ tròn màu- -</p><p>&nbsp;Áo thun nam nữ oversize sử dụng chất vải cotton 65/35 co giãn 4 chiều. Là loại vải có đặc điểm mềm mịn, độ co giãn cao, khả năng thấm hút tốt và được dệt hoàn toàn từ sợi cây bông tự nhiên. Chất vải cotton cực kỳ thân thiện với làn da.&nbsp;</p><p>- Áo thun nam nữ form rộng cổ tròn thoải mái&nbsp;</p><p>- Áo phông unisex form rộng dễ phối đồ. Bạn có thể phối với quần jean, chân váy, … kết hợp với một đôi sneaker cho bạn tự tin xuống phố&nbsp;</p><p>- BẢNG SIZE SẢN PHẨM Áo thun nam nữ oversize Lu Shop phong cách unisex form rộng tay ngắn, cổ tròn màu trắng hình TNT-LAB trái tim xanh CỦA Lu Shop</p><p>- Quý khách vui lòng xem Áo phông nam nữ oversize tại Ảnh sản phẩm hoặc Bảng quy đổi kích cỡ&nbsp;</p><p><strong>- HƯỚNG DẪN CHỌN SIZE ÁO &nbsp;</strong></p><p>&nbsp; &nbsp;+ Size M: 46-53kg&nbsp;</p><p>&nbsp; &nbsp;+ Size L: 63-74kg&nbsp;</p><p>&nbsp; &nbsp;+ Size XL: 75-84kg</p>', 0, 120000, '2022-12-19 18:51:37', '2022-12-19 18:51:37'),
(48, 'Áo Scooby form rộng cute', '<p><strong>MÔ TẢ SẢN PHẨM</strong></p><p>Áo thun nam nữ oversize Lu Shop phong cách unisex form rộng tay ngắn, cổ tròn màu- -</p><p>&nbsp;Áo thun nam nữ oversize sử dụng chất vải cotton 65/35 co giãn 4 chiều. Là loại vải có đặc điểm mềm mịn, độ co giãn cao, khả năng thấm hút tốt và được dệt hoàn toàn từ sợi cây bông tự nhiên. Chất vải cotton cực kỳ thân thiện với làn da.&nbsp;</p><p>- Áo thun nam nữ form rộng cổ tròn thoải mái&nbsp;</p><p>- Áo phông unisex form rộng dễ phối đồ. Bạn có thể phối với quần jean, chân váy, … kết hợp với một đôi sneaker cho bạn tự tin xuống phố&nbsp;</p><p>- BẢNG SIZE SẢN PHẨM Áo thun nam nữ oversize Lu Shop phong cách unisex form rộng tay ngắn, cổ tròn màu trắng hình TNT-LAB trái tim xanh CỦA Lu Shop</p><p>- Quý khách vui lòng xem Áo phông nam nữ oversize tại Ảnh sản phẩm hoặc Bảng quy đổi kích cỡ&nbsp;</p><p><strong>- HƯỚNG DẪN CHỌN SIZE ÁO &nbsp;</strong></p><p>&nbsp; &nbsp;+ Size M: 46-53kg&nbsp;</p><p>&nbsp; &nbsp;+ Size L: 63-74kg&nbsp;</p><p>&nbsp; &nbsp;+ Size XL: 75-84kg</p>', 15, 150000, '2022-12-19 18:53:23', '2022-12-19 18:53:23'),
(49, 'Áo Hoodie Gấu cute', '<p><strong>MÔ TẢ SẢN PHẨM</strong></p><p>Áo thun nam nữ oversize Lu Shop phong cách unisex form rộng tay ngắn, cổ tròn màu- -</p><p>&nbsp;Áo thun nam nữ oversize sử dụng chất vải cotton 65/35 co giãn 4 chiều. Là loại vải có đặc điểm mềm mịn, độ co giãn cao, khả năng thấm hút tốt và được dệt hoàn toàn từ sợi cây bông tự nhiên. Chất vải cotton cực kỳ thân thiện với làn da.&nbsp;</p><p>- Áo thun nam nữ form rộng cổ tròn thoải mái&nbsp;</p><p>- Áo phông unisex form rộng dễ phối đồ. Bạn có thể phối với quần jean, chân váy, … kết hợp với một đôi sneaker cho bạn tự tin xuống phố&nbsp;</p><p>- BẢNG SIZE SẢN PHẨM Áo thun nam nữ oversize Lu Shop phong cách unisex form rộng tay ngắn, cổ tròn màu trắng hình TNT-LAB trái tim xanh CỦA Lu Shop</p><p>- Quý khách vui lòng xem Áo phông nam nữ oversize tại Ảnh sản phẩm hoặc Bảng quy đổi kích cỡ&nbsp;</p><p><strong>- HƯỚNG DẪN CHỌN SIZE ÁO &nbsp;</strong></p><p>&nbsp; &nbsp;+ Size M: 46-53kg&nbsp;</p><p>&nbsp; &nbsp;+ Size L: 63-74kg&nbsp;</p><p>&nbsp; &nbsp;+ Size XL: 75-84kg</p>', 10, 145000, '2022-12-19 19:05:47', '2022-12-19 19:05:47'),
(50, 'Áo khoác nam đen', '<p><strong>MÔ TẢ SẢN PHẨM</strong></p><p>Áo thun nam nữ oversize Lu Shop phong cách unisex form rộng tay ngắn, cổ tròn màu- -</p><p>&nbsp;Áo thun nam nữ oversize sử dụng chất vải cotton 65/35 co giãn 4 chiều. Là loại vải có đặc điểm mềm mịn, độ co giãn cao, khả năng thấm hút tốt và được dệt hoàn toàn từ sợi cây bông tự nhiên. Chất vải cotton cực kỳ thân thiện với làn da.&nbsp;</p><p>- Áo thun nam nữ form rộng cổ tròn thoải mái&nbsp;</p><p>- Áo phông unisex form rộng dễ phối đồ. Bạn có thể phối với quần jean, chân váy, … kết hợp với một đôi sneaker cho bạn tự tin xuống phố&nbsp;</p><p>- BẢNG SIZE SẢN PHẨM Áo thun nam nữ oversize Lu Shop phong cách unisex form rộng tay ngắn, cổ tròn màu trắng hình TNT-LAB trái tim xanh CỦA Lu Shop</p><p>- Quý khách vui lòng xem Áo phông nam nữ oversize tại Ảnh sản phẩm hoặc Bảng quy đổi kích cỡ&nbsp;</p><p><strong>- HƯỚNG DẪN CHỌN SIZE ÁO &nbsp;</strong></p><p>&nbsp; &nbsp;+ Size M: 46-53kg&nbsp;</p><p>&nbsp; &nbsp;+ Size L: 63-74kg&nbsp;</p><p>&nbsp; &nbsp;+ Size XL: 75-84kg</p>', 15, 175000, '2022-12-19 19:18:29', '2022-12-19 19:18:29'),
(51, 'Quần Jogger nam vải kaki', '<p><strong>MÔ TẢ SẢN PHẨM</strong></p><p>Áo thun nam nữ oversize Lu Shop phong cách unisex form rộng tay ngắn, cổ tròn màu- -</p><p>&nbsp;Áo thun nam nữ oversize sử dụng chất vải cotton 65/35 co giãn 4 chiều. Là loại vải có đặc điểm mềm mịn, độ co giãn cao, khả năng thấm hút tốt và được dệt hoàn toàn từ sợi cây bông tự nhiên. Chất vải cotton cực kỳ thân thiện với làn da.&nbsp;</p><p>- Áo thun nam nữ form rộng cổ tròn thoải mái&nbsp;</p><p>- Áo phông unisex form rộng dễ phối đồ. Bạn có thể phối với quần jean, chân váy, … kết hợp với một đôi sneaker cho bạn tự tin xuống phố&nbsp;</p><p>- BẢNG SIZE SẢN PHẨM Áo thun nam nữ oversize Lu Shop phong cách unisex form rộng tay ngắn, cổ tròn màu trắng hình TNT-LAB trái tim xanh CỦA Lu Shop</p><p>- Quý khách vui lòng xem Áo phông nam nữ oversize tại Ảnh sản phẩm hoặc Bảng quy đổi kích cỡ&nbsp;</p><p><strong>- HƯỚNG DẪN CHỌN SIZE ÁO &nbsp;</strong></p><p>&nbsp; &nbsp;+ Size M: 46-53kg&nbsp;</p><p>&nbsp; &nbsp;+ Size L: 63-74kg&nbsp;</p><p>&nbsp; &nbsp;+ Size XL: 75-84kg</p>', 20, 250000, '2022-12-19 19:21:54', '2022-12-19 19:21:54'),
(52, 'Quần dài nam', '<p><strong>MÔ TẢ SẢN PHẨM</strong></p><p>Áo thun nam nữ oversize Lu Shop phong cách unisex form rộng tay ngắn, cổ tròn màu- -</p><p>&nbsp;Áo thun nam nữ oversize sử dụng chất vải cotton 65/35 co giãn 4 chiều. Là loại vải có đặc điểm mềm mịn, độ co giãn cao, khả năng thấm hút tốt và được dệt hoàn toàn từ sợi cây bông tự nhiên. Chất vải cotton cực kỳ thân thiện với làn da.&nbsp;</p><p>- Áo thun nam nữ form rộng cổ tròn thoải mái&nbsp;</p><p>- Áo phông unisex form rộng dễ phối đồ. Bạn có thể phối với quần jean, chân váy, … kết hợp với một đôi sneaker cho bạn tự tin xuống phố&nbsp;</p><p>- BẢNG SIZE SẢN PHẨM Áo thun nam nữ oversize Lu Shop phong cách unisex form rộng tay ngắn, cổ tròn màu trắng hình TNT-LAB trái tim xanh CỦA Lu Shop</p><p>- Quý khách vui lòng xem Áo phông nam nữ oversize tại Ảnh sản phẩm hoặc Bảng quy đổi kích cỡ&nbsp;</p><p><strong>- HƯỚNG DẪN CHỌN SIZE ÁO &nbsp;</strong></p><p>&nbsp; &nbsp;+ Size M: 46-53kg&nbsp;</p><p>&nbsp; &nbsp;+ Size L: 63-74kg&nbsp;</p><p>&nbsp; &nbsp;+ Size XL: 75-84kg</p>', 15, 180000, '2022-12-19 19:23:35', '2022-12-19 19:23:35'),
(53, 'Quần Jean nam ống rộng', '<p><strong>MÔ TẢ SẢN PHẨM</strong></p><p>Áo thun nam nữ oversize Lu Shop phong cách unisex form rộng tay ngắn, cổ tròn màu- -</p><p>&nbsp;Áo thun nam nữ oversize sử dụng chất vải cotton 65/35 co giãn 4 chiều. Là loại vải có đặc điểm mềm mịn, độ co giãn cao, khả năng thấm hút tốt và được dệt hoàn toàn từ sợi cây bông tự nhiên. Chất vải cotton cực kỳ thân thiện với làn da.&nbsp;</p><p>- Áo thun nam nữ form rộng cổ tròn thoải mái&nbsp;</p><p>- Áo phông unisex form rộng dễ phối đồ. Bạn có thể phối với quần jean, chân váy, … kết hợp với một đôi sneaker cho bạn tự tin xuống phố&nbsp;</p><p>- BẢNG SIZE SẢN PHẨM Áo thun nam nữ oversize Lu Shop phong cách unisex form rộng tay ngắn, cổ tròn màu trắng hình TNT-LAB trái tim xanh CỦA Lu Shop</p><p>- Quý khách vui lòng xem Áo phông nam nữ oversize tại Ảnh sản phẩm hoặc Bảng quy đổi kích cỡ&nbsp;</p><p><strong>- HƯỚNG DẪN CHỌN SIZE ÁO &nbsp;</strong></p><p>&nbsp; &nbsp;+ Size M: 46-53kg&nbsp;</p><p>&nbsp; &nbsp;+ Size L: 63-74kg&nbsp;</p><p>&nbsp; &nbsp;+ Size XL: 75-84kg</p>', 0, 190000, '2022-12-19 19:25:09', '2022-12-19 19:25:09'),
(54, 'Quần jean nam chất xịn Julido', '<p><strong>MÔ TẢ SẢN PHẨM</strong></p><p>Áo thun nam nữ oversize Lu Shop phong cách unisex form rộng tay ngắn, cổ tròn màu- -</p><p>&nbsp;Áo thun nam nữ oversize sử dụng chất vải cotton 65/35 co giãn 4 chiều. Là loại vải có đặc điểm mềm mịn, độ co giãn cao, khả năng thấm hút tốt và được dệt hoàn toàn từ sợi cây bông tự nhiên. Chất vải cotton cực kỳ thân thiện với làn da.&nbsp;</p><p>- Áo thun nam nữ form rộng cổ tròn thoải mái&nbsp;</p><p>- Áo phông unisex form rộng dễ phối đồ. Bạn có thể phối với quần jean, chân váy, … kết hợp với một đôi sneaker cho bạn tự tin xuống phố&nbsp;</p><p>- BẢNG SIZE SẢN PHẨM Áo thun nam nữ oversize Lu Shop phong cách unisex form rộng tay ngắn, cổ tròn màu trắng hình TNT-LAB trái tim xanh CỦA Lu Shop</p><p>- Quý khách vui lòng xem Áo phông nam nữ oversize tại Ảnh sản phẩm hoặc Bảng quy đổi kích cỡ&nbsp;</p><p><strong>- HƯỚNG DẪN CHỌN SIZE ÁO &nbsp;</strong></p><p>&nbsp; &nbsp;+ Size M: 46-53kg&nbsp;</p><p>&nbsp; &nbsp;+ Size L: 63-74kg&nbsp;</p><p>&nbsp; &nbsp;+ Size XL: 75-84kg</p>', 10, 200000, '2022-12-19 19:26:16', '2022-12-19 19:26:16'),
(55, 'Quần tây nam dài đẹp', '<p><strong>MÔ TẢ SẢN PHẨM</strong></p><p>Áo thun nam nữ oversize Lu Shop phong cách unisex form rộng tay ngắn, cổ tròn màu- -</p><p>&nbsp;Áo thun nam nữ oversize sử dụng chất vải cotton 65/35 co giãn 4 chiều. Là loại vải có đặc điểm mềm mịn, độ co giãn cao, khả năng thấm hút tốt và được dệt hoàn toàn từ sợi cây bông tự nhiên. Chất vải cotton cực kỳ thân thiện với làn da.&nbsp;</p><p>- Áo thun nam nữ form rộng cổ tròn thoải mái&nbsp;</p><p>- Áo phông unisex form rộng dễ phối đồ. Bạn có thể phối với quần jean, chân váy, … kết hợp với một đôi sneaker cho bạn tự tin xuống phố&nbsp;</p><p>- BẢNG SIZE SẢN PHẨM Áo thun nam nữ oversize Lu Shop phong cách unisex form rộng tay ngắn, cổ tròn màu trắng hình TNT-LAB trái tim xanh CỦA Lu Shop</p><p>- Quý khách vui lòng xem Áo phông nam nữ oversize tại Ảnh sản phẩm hoặc Bảng quy đổi kích cỡ&nbsp;</p><p><strong>- HƯỚNG DẪN CHỌN SIZE ÁO &nbsp;</strong></p><p>&nbsp; &nbsp;+ Size M: 46-53kg&nbsp;</p><p>&nbsp; &nbsp;+ Size L: 63-74kg&nbsp;</p><p>&nbsp; &nbsp;+ Size XL: 75-84kg</p>', 10, 150000, '2022-12-19 19:27:14', '2022-12-19 19:27:14'),
(56, 'Quần âu nam', '<p><strong>MÔ TẢ SẢN PHẨM</strong></p><p>Áo thun nam nữ oversize Lu Shop phong cách unisex form rộng tay ngắn, cổ tròn màu- -</p><p>&nbsp;Áo thun nam nữ oversize sử dụng chất vải cotton 65/35 co giãn 4 chiều. Là loại vải có đặc điểm mềm mịn, độ co giãn cao, khả năng thấm hút tốt và được dệt hoàn toàn từ sợi cây bông tự nhiên. Chất vải cotton cực kỳ thân thiện với làn da.&nbsp;</p><p>- Áo thun nam nữ form rộng cổ tròn thoải mái&nbsp;</p><p>- Áo phông unisex form rộng dễ phối đồ. Bạn có thể phối với quần jean, chân váy, … kết hợp với một đôi sneaker cho bạn tự tin xuống phố&nbsp;</p><p>- BẢNG SIZE SẢN PHẨM Áo thun nam nữ oversize Lu Shop phong cách unisex form rộng tay ngắn, cổ tròn màu trắng hình TNT-LAB trái tim xanh CỦA Lu Shop</p><p>- Quý khách vui lòng xem Áo phông nam nữ oversize tại Ảnh sản phẩm hoặc Bảng quy đổi kích cỡ&nbsp;</p><p><strong>- HƯỚNG DẪN CHỌN SIZE ÁO &nbsp;</strong></p><p>&nbsp; &nbsp;+ Size M: 46-53kg&nbsp;</p><p>&nbsp; &nbsp;+ Size L: 63-74kg&nbsp;</p><p>&nbsp; &nbsp;+ Size XL: 75-84kg</p>', 10, 150000, '2022-12-19 19:30:43', '2022-12-19 19:30:43'),
(57, 'Quần short nam đẹp', '<p><strong>MÔ TẢ SẢN PHẨM</strong></p><p>Áo thun nam nữ oversize Lu Shop phong cách unisex form rộng tay ngắn, cổ tròn màu- -</p><p>&nbsp;Áo thun nam nữ oversize sử dụng chất vải cotton 65/35 co giãn 4 chiều. Là loại vải có đặc điểm mềm mịn, độ co giãn cao, khả năng thấm hút tốt và được dệt hoàn toàn từ sợi cây bông tự nhiên. Chất vải cotton cực kỳ thân thiện với làn da.&nbsp;</p><p>- Áo thun nam nữ form rộng cổ tròn thoải mái&nbsp;</p><p>- Áo phông unisex form rộng dễ phối đồ. Bạn có thể phối với quần jean, chân váy, … kết hợp với một đôi sneaker cho bạn tự tin xuống phố&nbsp;</p><p>- BẢNG SIZE SẢN PHẨM Áo thun nam nữ oversize Lu Shop phong cách unisex form rộng tay ngắn, cổ tròn màu trắng hình TNT-LAB trái tim xanh CỦA Lu Shop</p><p>- Quý khách vui lòng xem Áo phông nam nữ oversize tại Ảnh sản phẩm hoặc Bảng quy đổi kích cỡ&nbsp;</p><p><strong>- HƯỚNG DẪN CHỌN SIZE ÁO &nbsp;</strong></p><p>&nbsp; &nbsp;+ Size M: 46-53kg&nbsp;</p><p>&nbsp; &nbsp;+ Size L: 63-74kg&nbsp;</p><p>&nbsp; &nbsp;+ Size XL: 75-84kg</p>', 15, 170000, '2022-12-19 19:33:48', '2022-12-19 19:33:48'),
(58, 'Quần jean nữ', '<p><strong>MÔ TẢ SẢN PHẨM</strong></p><p>Áo thun nam nữ oversize Lu Shop phong cách unisex form rộng tay ngắn, cổ tròn màu- -</p><p>&nbsp;Áo thun nam nữ oversize sử dụng chất vải cotton 65/35 co giãn 4 chiều. Là loại vải có đặc điểm mềm mịn, độ co giãn cao, khả năng thấm hút tốt và được dệt hoàn toàn từ sợi cây bông tự nhiên. Chất vải cotton cực kỳ thân thiện với làn da.&nbsp;</p><p>- Áo thun nam nữ form rộng cổ tròn thoải mái&nbsp;</p><p>- Áo phông unisex form rộng dễ phối đồ. Bạn có thể phối với quần jean, chân váy, … kết hợp với một đôi sneaker cho bạn tự tin xuống phố&nbsp;</p><p>- BẢNG SIZE SẢN PHẨM Áo thun nam nữ oversize Lu Shop phong cách unisex form rộng tay ngắn, cổ tròn màu trắng hình TNT-LAB trái tim xanh CỦA Lu Shop</p><p>- Quý khách vui lòng xem Áo phông nam nữ oversize tại Ảnh sản phẩm hoặc Bảng quy đổi kích cỡ&nbsp;</p><p><strong>- HƯỚNG DẪN CHỌN SIZE ÁO &nbsp;</strong></p><p>&nbsp; &nbsp;+ Size M: 46-53kg&nbsp;</p><p>&nbsp; &nbsp;+ Size L: 63-74kg&nbsp;</p><p>&nbsp; &nbsp;+ Size XL: 75-84kg</p>', 10, 150000, '2022-12-19 19:35:22', '2022-12-19 19:35:22'),
(59, 'Quần nữ ống rộng', '<p><strong>MÔ TẢ SẢN PHẨM</strong></p><p>Áo thun nam nữ oversize Lu Shop phong cách unisex form rộng tay ngắn, cổ tròn màu- -</p><p>&nbsp;Áo thun nam nữ oversize sử dụng chất vải cotton 65/35 co giãn 4 chiều. Là loại vải có đặc điểm mềm mịn, độ co giãn cao, khả năng thấm hút tốt và được dệt hoàn toàn từ sợi cây bông tự nhiên. Chất vải cotton cực kỳ thân thiện với làn da.&nbsp;</p><p>- Áo thun nam nữ form rộng cổ tròn thoải mái&nbsp;</p><p>- Áo phông unisex form rộng dễ phối đồ. Bạn có thể phối với quần jean, chân váy, … kết hợp với một đôi sneaker cho bạn tự tin xuống phố&nbsp;</p><p>- BẢNG SIZE SẢN PHẨM Áo thun nam nữ oversize Lu Shop phong cách unisex form rộng tay ngắn, cổ tròn màu trắng hình TNT-LAB trái tim xanh CỦA Lu Shop</p><p>- Quý khách vui lòng xem Áo phông nam nữ oversize tại Ảnh sản phẩm hoặc Bảng quy đổi kích cỡ&nbsp;</p><p><strong>- HƯỚNG DẪN CHỌN SIZE ÁO &nbsp;</strong></p><p>&nbsp; &nbsp;+ Size M: 46-53kg&nbsp;</p><p>&nbsp; &nbsp;+ Size L: 63-74kg&nbsp;</p><p>&nbsp; &nbsp;+ Size XL: 75-84kg</p>', 10, 170000, '2022-12-19 19:36:13', '2022-12-19 19:36:13'),
(60, 'Quần tây nữ', '<p><strong>MÔ TẢ SẢN PHẨM</strong></p><p>Áo thun nam nữ oversize Lu Shop phong cách unisex form rộng tay ngắn, cổ tròn màu- -</p><p>&nbsp;Áo thun nam nữ oversize sử dụng chất vải cotton 65/35 co giãn 4 chiều. Là loại vải có đặc điểm mềm mịn, độ co giãn cao, khả năng thấm hút tốt và được dệt hoàn toàn từ sợi cây bông tự nhiên. Chất vải cotton cực kỳ thân thiện với làn da.&nbsp;</p><p>- Áo thun nam nữ form rộng cổ tròn thoải mái&nbsp;</p><p>- Áo phông unisex form rộng dễ phối đồ. Bạn có thể phối với quần jean, chân váy, … kết hợp với một đôi sneaker cho bạn tự tin xuống phố&nbsp;</p><p>- BẢNG SIZE SẢN PHẨM Áo thun nam nữ oversize Lu Shop phong cách unisex form rộng tay ngắn, cổ tròn màu trắng hình TNT-LAB trái tim xanh CỦA Lu Shop</p><p>- Quý khách vui lòng xem Áo phông nam nữ oversize tại Ảnh sản phẩm hoặc Bảng quy đổi kích cỡ&nbsp;</p><p><strong>- HƯỚNG DẪN CHỌN SIZE ÁO &nbsp;</strong></p><p>&nbsp; &nbsp;+ Size M: 46-53kg&nbsp;</p><p>&nbsp; &nbsp;+ Size L: 63-74kg&nbsp;</p><p>&nbsp; &nbsp;+ Size XL: 75-84kg</p>', 20, 180000, '2022-12-19 19:37:44', '2022-12-19 19:37:44'),
(61, 'Đầm trắng thanh lịch', '<p><strong>MÔ TẢ SẢN PHẨM</strong></p><p>Áo thun nam nữ oversize Lu Shop phong cách unisex form rộng tay ngắn, cổ tròn màu- -</p><p>&nbsp;Áo thun nam nữ oversize sử dụng chất vải cotton 65/35 co giãn 4 chiều. Là loại vải có đặc điểm mềm mịn, độ co giãn cao, khả năng thấm hút tốt và được dệt hoàn toàn từ sợi cây bông tự nhiên. Chất vải cotton cực kỳ thân thiện với làn da.&nbsp;</p><p>- Áo thun nam nữ form rộng cổ tròn thoải mái&nbsp;</p><p>- Áo phông unisex form rộng dễ phối đồ. Bạn có thể phối với quần jean, chân váy, … kết hợp với một đôi sneaker cho bạn tự tin xuống phố&nbsp;</p><p>- BẢNG SIZE SẢN PHẨM Áo thun nam nữ oversize Lu Shop phong cách unisex form rộng tay ngắn, cổ tròn màu trắng hình TNT-LAB trái tim xanh CỦA Lu Shop</p><p>- Quý khách vui lòng xem Áo phông nam nữ oversize tại Ảnh sản phẩm hoặc Bảng quy đổi kích cỡ&nbsp;</p><p><strong>- HƯỚNG DẪN CHỌN SIZE ÁO &nbsp;</strong></p><p>&nbsp; &nbsp;+ Size M: 46-53kg&nbsp;</p><p>&nbsp; &nbsp;+ Size L: 63-74kg&nbsp;</p><p>&nbsp; &nbsp;+ Size XL: 75-84kg</p>', 20, 450000, '2022-12-19 19:39:25', '2022-12-19 19:39:25'),
(62, 'Váy nữ công sở', '<p><strong>MÔ TẢ SẢN PHẨM</strong></p><p>Áo thun nam nữ oversize Lu Shop phong cách unisex form rộng tay ngắn, cổ tròn màu- -</p><p>&nbsp;Áo thun nam nữ oversize sử dụng chất vải cotton 65/35 co giãn 4 chiều. Là loại vải có đặc điểm mềm mịn, độ co giãn cao, khả năng thấm hút tốt và được dệt hoàn toàn từ sợi cây bông tự nhiên. Chất vải cotton cực kỳ thân thiện với làn da.&nbsp;</p><p>- Áo thun nam nữ form rộng cổ tròn thoải mái&nbsp;</p><p>- Áo phông unisex form rộng dễ phối đồ. Bạn có thể phối với quần jean, chân váy, … kết hợp với một đôi sneaker cho bạn tự tin xuống phố&nbsp;</p><p>- BẢNG SIZE SẢN PHẨM Áo thun nam nữ oversize Lu Shop phong cách unisex form rộng tay ngắn, cổ tròn màu trắng hình TNT-LAB trái tim xanh CỦA Lu Shop</p><p>- Quý khách vui lòng xem Áo phông nam nữ oversize tại Ảnh sản phẩm hoặc Bảng quy đổi kích cỡ&nbsp;</p><p><strong>- HƯỚNG DẪN CHỌN SIZE ÁO &nbsp;</strong></p><p>&nbsp; &nbsp;+ Size M: 46-53kg&nbsp;</p><p>&nbsp; &nbsp;+ Size L: 63-74kg&nbsp;</p><p>&nbsp; &nbsp;+ Size XL: 75-84kg</p>', 10, 150000, '2022-12-19 19:40:08', '2022-12-19 19:40:08'),
(63, 'Váy nữ thời trang công sở', '<p><strong>MÔ TẢ SẢN PHẨM</strong></p><p>Áo thun nam nữ oversize Lu Shop phong cách unisex form rộng tay ngắn, cổ tròn màu- -</p><p>&nbsp;Áo thun nam nữ oversize sử dụng chất vải cotton 65/35 co giãn 4 chiều. Là loại vải có đặc điểm mềm mịn, độ co giãn cao, khả năng thấm hút tốt và được dệt hoàn toàn từ sợi cây bông tự nhiên. Chất vải cotton cực kỳ thân thiện với làn da.&nbsp;</p><p>- Áo thun nam nữ form rộng cổ tròn thoải mái&nbsp;</p><p>- Áo phông unisex form rộng dễ phối đồ. Bạn có thể phối với quần jean, chân váy, … kết hợp với một đôi sneaker cho bạn tự tin xuống phố&nbsp;</p><p>- BẢNG SIZE SẢN PHẨM Áo thun nam nữ oversize Lu Shop phong cách unisex form rộng tay ngắn, cổ tròn màu trắng hình TNT-LAB trái tim xanh CỦA Lu Shop</p><p>- Quý khách vui lòng xem Áo phông nam nữ oversize tại Ảnh sản phẩm hoặc Bảng quy đổi kích cỡ&nbsp;</p><p><strong>- HƯỚNG DẪN CHỌN SIZE ÁO &nbsp;</strong></p><p>&nbsp; &nbsp;+ Size M: 46-53kg&nbsp;</p><p>&nbsp; &nbsp;+ Size L: 63-74kg&nbsp;</p><p>&nbsp; &nbsp;+ Size XL: 75-84kg</p>', 10, 290000, '2022-12-19 19:41:10', '2022-12-19 19:41:10'),
(64, 'Quần áo Batman', '<p><strong>MÔ TẢ SẢN PHẨM</strong></p><p>Áo thun nam nữ oversize Lu Shop phong cách unisex form rộng tay ngắn, cổ tròn màu- -</p><p>&nbsp;Áo thun nam nữ oversize sử dụng chất vải cotton 65/35 co giãn 4 chiều. Là loại vải có đặc điểm mềm mịn, độ co giãn cao, khả năng thấm hút tốt và được dệt hoàn toàn từ sợi cây bông tự nhiên. Chất vải cotton cực kỳ thân thiện với làn da.&nbsp;</p><p>- Áo thun nam nữ form rộng cổ tròn thoải mái&nbsp;</p><p>- Áo phông unisex form rộng dễ phối đồ. Bạn có thể phối với quần jean, chân váy, … kết hợp với một đôi sneaker cho bạn tự tin xuống phố&nbsp;</p><p>- BẢNG SIZE SẢN PHẨM Áo thun nam nữ oversize Lu Shop phong cách unisex form rộng tay ngắn, cổ tròn màu trắng hình TNT-LAB trái tim xanh CỦA Lu Shop</p><p>- Quý khách vui lòng xem Áo phông nam nữ oversize tại Ảnh sản phẩm hoặc Bảng quy đổi kích cỡ&nbsp;</p><p><strong>- HƯỚNG DẪN CHỌN SIZE ÁO &nbsp;</strong></p><p>&nbsp; &nbsp;+ Size M: 46-53kg&nbsp;</p><p>&nbsp; &nbsp;+ Size L: 63-74kg&nbsp;</p><p>&nbsp; &nbsp;+ Size XL: 75-84kg</p>', 10, 190000, '2022-12-19 19:46:39', '2022-12-19 19:46:39'),
(65, 'Bộ bé trai thêu hình cá mập', '<p><strong>MÔ TẢ SẢN PHẨM</strong></p><p>Áo thun nam nữ oversize Lu Shop phong cách unisex form rộng tay ngắn, cổ tròn màu- -</p><p>&nbsp;Áo thun nam nữ oversize sử dụng chất vải cotton 65/35 co giãn 4 chiều. Là loại vải có đặc điểm mềm mịn, độ co giãn cao, khả năng thấm hút tốt và được dệt hoàn toàn từ sợi cây bông tự nhiên. Chất vải cotton cực kỳ thân thiện với làn da.&nbsp;</p><p>- Áo thun nam nữ form rộng cổ tròn thoải mái&nbsp;</p><p>- Áo phông unisex form rộng dễ phối đồ. Bạn có thể phối với quần jean, chân váy, … kết hợp với một đôi sneaker cho bạn tự tin xuống phố&nbsp;</p><p>- BẢNG SIZE SẢN PHẨM Áo thun nam nữ oversize Lu Shop phong cách unisex form rộng tay ngắn, cổ tròn màu trắng hình TNT-LAB trái tim xanh CỦA Lu Shop</p><p>- Quý khách vui lòng xem Áo phông nam nữ oversize tại Ảnh sản phẩm hoặc Bảng quy đổi kích cỡ&nbsp;</p><p><strong>- HƯỚNG DẪN CHỌN SIZE ÁO &nbsp;</strong></p><p>&nbsp; &nbsp;+ Size M: 46-53kg&nbsp;</p><p>&nbsp; &nbsp;+ Size L: 63-74kg&nbsp;</p><p>&nbsp; &nbsp;+ Size XL: 75-84kg</p>', 0, 75000, '2022-12-19 19:50:05', '2022-12-19 19:50:05'),
(66, 'Quần áo bé nam xịn', '<p><strong>MÔ TẢ SẢN PHẨM</strong></p><p>Áo thun nam nữ oversize Lu Shop phong cách unisex form rộng tay ngắn, cổ tròn màu- -</p><p>&nbsp;Áo thun nam nữ oversize sử dụng chất vải cotton 65/35 co giãn 4 chiều. Là loại vải có đặc điểm mềm mịn, độ co giãn cao, khả năng thấm hút tốt và được dệt hoàn toàn từ sợi cây bông tự nhiên. Chất vải cotton cực kỳ thân thiện với làn da.&nbsp;</p><p>- Áo thun nam nữ form rộng cổ tròn thoải mái&nbsp;</p><p>- Áo phông unisex form rộng dễ phối đồ. Bạn có thể phối với quần jean, chân váy, … kết hợp với một đôi sneaker cho bạn tự tin xuống phố&nbsp;</p><p>- BẢNG SIZE SẢN PHẨM Áo thun nam nữ oversize Lu Shop phong cách unisex form rộng tay ngắn, cổ tròn màu trắng hình TNT-LAB trái tim xanh CỦA Lu Shop</p><p>- Quý khách vui lòng xem Áo phông nam nữ oversize tại Ảnh sản phẩm hoặc Bảng quy đổi kích cỡ&nbsp;</p><p><strong>- HƯỚNG DẪN CHỌN SIZE ÁO &nbsp;</strong></p><p>&nbsp; &nbsp;+ Size M: 46-53kg&nbsp;</p><p>&nbsp; &nbsp;+ Size L: 63-74kg&nbsp;</p><p>&nbsp; &nbsp;+ Size XL: 75-84kg</p>', 10, 100000, '2022-12-19 19:51:46', '2022-12-19 19:51:46');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_details`
--

CREATE TABLE `product_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `size` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` smallint(6) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product_details`
--

INSERT INTO `product_details` (`id`, `size`, `quantity`, `created_at`, `updated_at`, `product_id`) VALUES
(88, 'M', 100, NULL, NULL, 43),
(89, 'XL', 100, NULL, NULL, 43),
(90, 'L', 100, NULL, NULL, 43),
(91, 'S', 100, NULL, NULL, 43),
(92, 'M', 100, NULL, NULL, 42),
(93, 'M', 100, NULL, NULL, 41),
(94, 'L', 100, NULL, NULL, 41),
(95, 'M', 100, NULL, NULL, 40),
(96, 'L', 100, NULL, NULL, 40),
(97, 'XL', 100, NULL, NULL, 40),
(98, 'M', 100, NULL, NULL, 39),
(103, 'M', 100, NULL, NULL, 17),
(104, 'M', 100, NULL, NULL, 44),
(105, 'XL', 100, NULL, NULL, 44),
(106, 'S', 100, NULL, NULL, 44),
(107, 'L', 100, NULL, NULL, 44),
(112, 'M', 100, NULL, NULL, 46),
(113, 'L', 100, NULL, NULL, 46),
(114, 'XL', 100, NULL, NULL, 46),
(115, 'M', 100, NULL, NULL, 45),
(116, 'XL', 100, NULL, NULL, 45),
(117, 'L', 1, NULL, NULL, 45),
(118, 'S', 1, NULL, NULL, 45),
(119, 'M', 1, NULL, NULL, 47),
(120, 'L', 1, NULL, NULL, 47),
(121, 'XL', 1, NULL, NULL, 47),
(122, 'S', 1, NULL, NULL, 47),
(123, 'M', 1, NULL, NULL, 48),
(124, 'XL', 1, NULL, NULL, 48),
(125, 'L', 1, NULL, NULL, 48),
(126, 'S', 1, NULL, NULL, 48),
(127, 'M', 1, NULL, NULL, 49),
(128, 'L', 1, NULL, NULL, 49),
(129, 'XL', 1, NULL, NULL, 49),
(130, 'S', 1, NULL, NULL, 49),
(131, 'M', 1, NULL, NULL, 50),
(132, 'XS', 1, NULL, NULL, 50),
(133, 'S', 1, NULL, NULL, 50),
(134, 'XL', 1, NULL, NULL, 50),
(135, 'M', 1, NULL, NULL, 51),
(136, 'XS', 1, NULL, NULL, 51),
(137, 'S', 1, NULL, NULL, 51),
(138, 'L', 1, NULL, NULL, 51),
(139, 'XL', 1, NULL, NULL, 51),
(140, 'M', 1, NULL, NULL, 52),
(141, 'XL', 1, NULL, NULL, 52),
(142, 'L', 1, NULL, NULL, 52),
(143, 'XS', 1, NULL, NULL, 52),
(144, 'M', 1, NULL, NULL, 53),
(145, 'XS', 1, NULL, NULL, 53),
(146, 'S', 1, NULL, NULL, 53),
(147, 'XL', 1, NULL, NULL, 53),
(148, 'M', 1, NULL, NULL, 54),
(149, 'XL', 1, NULL, NULL, 54),
(150, 'S', 1, NULL, NULL, 54),
(151, 'XS', 1, NULL, NULL, 54),
(152, 'M', 1, NULL, NULL, 55),
(153, 'L', 1, NULL, NULL, 55),
(154, 'XS', 1, NULL, NULL, 55),
(155, 'XS', 1, NULL, NULL, 55),
(156, 'M', 1, NULL, NULL, 56),
(157, 'L', 1, NULL, NULL, 56),
(158, 'XL', 1, NULL, NULL, 56),
(159, 'XS', 1, NULL, NULL, 56),
(160, 'M', 1, NULL, NULL, 57),
(161, 'XL', 1, NULL, NULL, 57),
(162, 'XS', 1, NULL, NULL, 57),
(163, 'L', 1, NULL, NULL, 57),
(164, 'M', 1, NULL, NULL, 58),
(165, 'XL', 1, NULL, NULL, 58),
(166, 'XS', 1, NULL, NULL, 58),
(167, 'S', 1, NULL, NULL, 58),
(168, 'M', 1, NULL, NULL, 59),
(169, 'XL', 1, NULL, NULL, 59),
(170, 'XS', 1, NULL, NULL, 59),
(171, 'L', 1, NULL, NULL, 59),
(172, 'M', 1, NULL, NULL, 60),
(173, 'L', 1, NULL, NULL, 60),
(174, 'XL', 1, NULL, NULL, 60),
(175, 'XS', 1, NULL, NULL, 60),
(176, 'M', 1, NULL, NULL, 61),
(177, 'L', 1, NULL, NULL, 61),
(178, 'XL', 1, NULL, NULL, 61),
(179, 'M', 1, NULL, NULL, 62),
(180, 'XL', 1, NULL, NULL, 62),
(181, 'L', 1, NULL, NULL, 62),
(182, 'XS', 1, NULL, NULL, 62),
(183, 'M', 1, NULL, NULL, 63),
(184, 'L', 1, NULL, NULL, 63),
(185, 'XL', 1, NULL, NULL, 63),
(186, 'XS', 1, NULL, NULL, 63),
(187, 'M', 1, NULL, NULL, 64),
(188, 'S', 1, NULL, NULL, 64),
(189, 'XS', 1, NULL, NULL, 64),
(190, 'M', 1, NULL, NULL, 65),
(191, 'XS', 1, NULL, NULL, 65),
(192, 'S', 1, NULL, NULL, 65),
(193, 'M', 1, NULL, NULL, 66),
(194, 'XS', 1, NULL, NULL, 66),
(195, 'S', 1, NULL, NULL, 66);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_orders`
--

CREATE TABLE `product_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_size` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_quantity` smallint(6) NOT NULL,
  `product_price` double NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `group` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `group`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'super-admin', 'Super Admin', 'system', 'web', '2022-12-13 03:07:14', '2022-12-13 03:07:14'),
(2, 'admin', 'Admin', 'system', 'web', '2022-12-13 03:07:14', '2022-12-13 03:07:14'),
(3, 'employee', 'Employee', 'system', 'web', '2022-12-13 03:07:14', '2022-12-13 03:30:22'),
(4, 'manager', 'Manager', 'system', 'web', '2022-12-13 03:07:14', '2022-12-13 03:29:53'),
(5, 'user', 'User', 'system', 'web', '2022-12-13 03:07:14', '2022-12-13 03:27:01');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'male',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `address`, `gender`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Pansy Stehr', 'mclaughlin.jamie@example.net', '279-688-2105', '29864 Becker View Apt. 695\nEast Noelburgh, IL 71196', 'male', '2022-12-13 03:04:46', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '4xS6jDW0BU', '2022-12-13 03:04:46', '2022-12-13 03:04:46'),
(6, 'Dr. Mekhi Thiel', 'damion.lakin@example.com', '1-636-626-5904', '3607 Monserrate Station\nLake Mertieton, SD 70362-8092', 'male', '2022-12-13 03:04:46', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'pvb1UECRba', '2022-12-13 03:04:46', '2022-12-13 03:04:46'),
(10, 'Bettye Christiansen', 'ismael.gleichner@example.com', '+1-253-696-7808', '5011 Flatley Creek Apt. 721\r\nPort Freida, NJ 77722', 'male', '2022-12-13 03:04:46', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'ne5otuqIh2', '2022-12-13 03:04:46', '2022-12-15 20:41:58'),
(36, 'Luchan', 'nguynguyn432@gmail.com', '1234567', 'NT', 'male', NULL, '$2y$10$RYfqHyug0G.X9se9HuYW0efNPVsjJ2IxFqZkdnjTed/aTBSAVgs8q', NULL, '2022-12-15 21:20:24', '2022-12-15 21:20:24'),
(37, 'LuChan1', 'nguynguyn450@gmail.com', '0586164102', NULL, 'male', NULL, '$2y$10$GyxXQ.cKXzkRysXweNEmtuBtvl9jiSnwjLjsi0y5Fz4V1efjXfsgW', NULL, '2022-12-19 22:06:51', '2022-12-19 22:06:51'),
(38, 'Luchan nè', 'admin@gmail.com', '012345678910', 'Nha Trang', 'male', NULL, '$2y$10$hunfw2JKThHPBnT2iTQzGusK36ej3..4Y0Wd0s6zRfKf1Nzq9IQD6', NULL, '2022-12-22 20:25:08', '2022-12-22 20:25:08'),
(39, 'huyhq', 'huyhq@gmail.com', '22222244', NULL, 'male', NULL, '$2y$10$cpZ9/tPmyOeZl6FFvrBDqu4aw/Cr98NnayOqb0VTWDxGln7WjU0pC', NULL, '2022-12-23 01:32:43', '2022-12-23 01:32:43');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_user_id_foreign` (`user_id`);

--
-- Chỉ mục cho bảng `cart_products`
--
ALTER TABLE `cart_products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_products_product_id_foreign` (`product_id`),
  ADD KEY `cart_products_cart_id_foreign` (`cart_id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `category_product`
--
ALTER TABLE `category_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_product_category_id_foreign` (`category_id`),
  ADD KEY `category_product_product_id_foreign` (`product_id`);

--
-- Chỉ mục cho bảng `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_name_unique` (`name`);

--
-- Chỉ mục cho bảng `coupon_user`
--
ALTER TABLE `coupon_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `coupon_user_user_id_foreign` (`user_id`),
  ADD KEY `coupon_user_coupon_id_foreign` (`coupon_id`);

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Chỉ mục cho bảng `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Chỉ mục cho bảng `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

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
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Chỉ mục cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `product_details`
--
ALTER TABLE `product_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_details_product_id_foreign` (`product_id`);

--
-- Chỉ mục cho bảng `product_orders`
--
ALTER TABLE `product_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_orders_order_id_foreign` (`order_id`),
  ADD KEY `product_orders_user_id_foreign` (`user_id`);

--
-- Chỉ mục cho bảng `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Chỉ mục cho bảng `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_phone_unique` (`phone`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `cart_products`
--
ALTER TABLE `cart_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT cho bảng `category_product`
--
ALTER TABLE `category_product`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT cho bảng `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `coupon_user`
--
ALTER TABLE `coupon_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `images`
--
ALTER TABLE `images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT cho bảng `product_details`
--
ALTER TABLE `product_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=198;

--
-- AUTO_INCREMENT cho bảng `product_orders`
--
ALTER TABLE `product_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `cart_products`
--
ALTER TABLE `cart_products`
  ADD CONSTRAINT `cart_products_cart_id_foreign` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `category_product`
--
ALTER TABLE `category_product`
  ADD CONSTRAINT `category_product_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `category_product_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `coupon_user`
--
ALTER TABLE `coupon_user`
  ADD CONSTRAINT `coupon_user_coupon_id_foreign` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `coupon_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `product_details`
--
ALTER TABLE `product_details`
  ADD CONSTRAINT `product_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `product_orders`
--
ALTER TABLE `product_orders`
  ADD CONSTRAINT `product_orders_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `product_orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
