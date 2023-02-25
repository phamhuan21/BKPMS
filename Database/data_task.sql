-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th1 29, 2023 lúc 02:32 PM
-- Phiên bản máy phục vụ: 10.4.24-MariaDB
-- Phiên bản PHP: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `data_task`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `attendance`
--

CREATE TABLE `attendance` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `note` text NOT NULL,
  `check_in` timestamp NOT NULL DEFAULT current_timestamp(),
  `check_out` timestamp NULL DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `attendance`
--

INSERT INTO `attendance` (`id`, `user_id`, `note`, `check_in`, `check_out`, `created`) VALUES
(4, 3, '', '2022-09-20 04:09:56', '2022-09-20 04:10:12', '2022-09-20 04:09:56'),
(5, 3, '', '2022-09-20 04:10:41', '2022-09-20 04:10:43', '2022-09-20 04:10:41');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `date_formats`
--

CREATE TABLE `date_formats` (
  `id` int(11) NOT NULL,
  `format` text NOT NULL,
  `js_format` text NOT NULL,
  `description` text NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `date_formats`
--

INSERT INTO `date_formats` (`id`, `format`, `js_format`, `description`, `created`) VALUES
(1, 'd-m-Y', 'DD-MM-YYYY', 'd-m-Y (18-05-2020)', '2020-05-18 01:50:13'),
(2, 'm-d-Y', 'MM-DD-YYYY', 'm-d-Y (05-18-2020)', '2020-05-18 01:50:13'),
(3, 'Y-m-d', 'YYYY-MM-DD', 'Y-m-d (2020-05-18)', '2020-05-18 01:50:13'),
(4, 'd.m.Y', 'DD.MM.YYYY', 'd.m.Y (18.05.2020)', '2020-05-18 01:50:13'),
(5, 'm.d.Y', 'MM.DD.YYYY', 'm.d.Y (05.18.2020)', '2020-05-18 01:50:13'),
(6, 'Y.m.d', 'YYYY.MM.DD', 'Y.m.d (2020.05.18)', '2020-05-18 01:50:13'),
(7, 'd/m/Y', 'DD/MM/YYYY', 'd/m/Y (18/05/2020)', '2020-05-18 01:50:13'),
(8, 'm/d/Y', 'MM/DD/YYYY', 'm/d/Y (05/18/2020)', '2020-05-18 01:50:13'),
(9, 'Y/m/d', 'YYYY/MM/DD', 'Y/m/d (2020/05/18)', '2020-05-18 01:50:13'),
(10, 'd-M-Y', 'DD-MMM-YYYY', 'd-M-Y (18-May-2020)', '2020-05-18 01:50:13'),
(11, 'd/M/Y', 'DD/MMM/YYYY', 'd/M/Y (18/May/2020)', '2020-05-18 01:50:13'),
(12, 'd.M.Y', 'DD.MMM.YYYY', 'd.M.Y (18.May.2020)', '2020-05-18 01:50:13'),
(13, 'd-M-Y', 'DD-MMM-YYYY', 'd-M-Y (18-May-2020)', '2020-05-18 01:50:13'),
(14, 'd M Y', 'DD MMM YYYY', 'd M Y (18 May 2020)', '2020-05-18 01:50:13');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `email_templates`
--

CREATE TABLE `email_templates` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `subject` text NOT NULL,
  `message` text NOT NULL,
  `variables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `email_templates`
--

INSERT INTO `email_templates` (`id`, `name`, `subject`, `message`, `variables`) VALUES
(1, 'new_user_registration', 'Welcome', '<p>Welcome to the {COMPANY_NAME}, This is an automatically generated email to inform you. Below are the credentials for your work dashboard.</p>\r\n<p>Login credentials</p>\r\n<p>Email: {LOGIN_EMAIL}</p>\r\n<p>Password: {LOGIN_PASSWORD}</p>\r\n<p><a href=\"{DASHBOARD_URL}\">Login Now</a></p>', '{COMPANY_NAME}, {DASHBOARD_URL}, {LOGO_URL}, {LOGIN_EMAIL}, {LOGIN_PASSWORD}'),
(2, 'forgot_password', 'Reset password', '<p>Hello,</p>\r\n<p>A password reset request has been created for your account.</p>\r\n<p>Please click on the following link to reset your password: {RESET_PASSWORD_LINK}</p>', '{COMPANY_NAME}, {DASHBOARD_URL}, {LOGO_URL}, {RESET_PASSWORD_LINK}'),
(3, 'email_verification', 'Confirm your email address', '<p>Welcome to the {COMPANY_NAME},</p>\r\n<p>Please confirm your email to activate your account.</p>\r\n<p>Please click on the following link to confirm your email address: {EMAIL_CONFIRMATION_LINK}</p>', '{COMPANY_NAME}, {DASHBOARD_URL}, {LOGO_URL}, {EMAIL_CONFIRMATION_LINK}'),
(4, 'new_project', 'New project assigned', '<p>Hello,</p>\r\n<p>New project {PROJECT_TITLE} is assigned to you.</p>', '{COMPANY_NAME}, {DASHBOARD_URL}, {LOGO_URL},  {PROJECT_TITLE}, {PROJECT_DESCRIPTION}, {STARTING_DATE}, {ENDING_DATE}, {BUDGET}, {PROJECT_URL}'),
(5, 'new_task', 'New task assigned', '<p>Hello,</p>\r\n<p>New task {TASK_TITLE} is assigned to you.</p>', '{COMPANY_NAME}, {DASHBOARD_URL}, {LOGO_URL}, {TASK_TITLE}, {TASK_DESCRIPTION}, {STARTING_DATE}, {DUE_DATE}, {TASK_URL}'),
(6, 'new_meeting', 'New meeting scheduled', '<p>Hello,</p>\r\n<p>New meeting {meeting_TITLE} is scheduled.</p>', '{COMPANY_NAME}, {DASHBOARD_URL}, {LOGO_URL}, {MEETING_TITLE}, {STARTING_DATE_AND_TIME}, {DURATION}, {MEETING_URL}'),
(7, 'new_invoice', 'New invoice received', '<p>Hello,</p>\r\n<p>New invoice {INVOICE_ID} received.</p>', '{COMPANY_NAME}, {DASHBOARD_URL}, {LOGO_URL}, {INVOICE_URL}, {INVOICE_NUMBER}, {INVOICE_AMOUNT}, {INVOICE_DATE}, {INVOICE_DUE_DATE}'),
(8, 'new_estimate', 'New estimate received', '<p>Hello,</p>\r\n<p>New estimate {ESTIMATE_ID} received.</p>', '{COMPANY_NAME}, {DASHBOARD_URL}, {LOGO_URL}, {ESTIMATE_URL}, {ESTIMATE_NUMBER}, {ESTIMATE_AMOUNT}, {ESTIMATE_DATE}, {ESTIMATE_DUE_DATE}');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `expenses`
--

CREATE TABLE `expenses` (
  `id` int(11) NOT NULL,
  `description` text NOT NULL,
  `date` date NOT NULL,
  `amount` text NOT NULL,
  `team_member_id` int(11) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `receipt` text NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `groups`
--

CREATE TABLE `groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(2, 'members', 'General User'),
(3, 'client', 'Clients');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `invoices`
--

CREATE TABLE `invoices` (
  `id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `from_id` int(11) NOT NULL,
  `to_id` int(11) NOT NULL,
  `items_id` text NOT NULL,
  `products_id` text NOT NULL,
  `amount` text NOT NULL,
  `note` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `tax` text NOT NULL,
  `invoice_date` date NOT NULL,
  `due_date` date NOT NULL,
  `payment_type` text NOT NULL,
  `payment_date` date NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `type` varchar(100) DEFAULT 'invoice',
  `receipt` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `invoices`
--

INSERT INTO `invoices` (`id`, `created_by`, `from_id`, `to_id`, `items_id`, `products_id`, `amount`, `note`, `status`, `tax`, `invoice_date`, `due_date`, `payment_type`, `payment_date`, `created`, `type`, `receipt`) VALUES
(2, 1, 1, 2, '2', '', '3000', '', 0, '', '2023-01-19', '2023-01-13', '', '0000-00-00', '2023-01-29 13:27:16', 'invoice', NULL),
(3, 1, 1, 2, '3', '', '10000', 'a', 1, '', '2023-01-29', '2023-01-29', '', '0000-00-00', '2023-01-29 13:28:22', 'invoice', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `languages`
--

CREATE TABLE `languages` (
  `id` int(11) NOT NULL,
  `language` text NOT NULL,
  `short_code` varchar(256) NOT NULL DEFAULT 'en',
  `active` int(11) NOT NULL DEFAULT 0,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `languages`
--

INSERT INTO `languages` (`id`, `language`, `short_code`, `active`, `created`, `status`) VALUES
(1, 'english', 'en', 0, '2021-01-19 19:04:57', 1),
(9, 'vietNam', 'vn', 0, '2022-09-16 15:14:24', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `leads`
--

CREATE TABLE `leads` (
  `id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `company` text NOT NULL,
  `value` text NOT NULL,
  `source` text NOT NULL,
  `email` text NOT NULL,
  `mobile` text NOT NULL,
  `assigned` text NOT NULL,
  `status` text NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `leads`
--

INSERT INTO `leads` (`id`, `created_by`, `company`, `value`, `source`, `email`, `mobile`, `assigned`, `status`, `created`) VALUES
(1, 1, 'Shopiki', '500000000', 'Facebook', 'hoangngoc100899@gmail.com', '', '3', 'discussion', '2022-09-20 13:23:01');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `leaves`
--

CREATE TABLE `leaves` (
  `id` int(11) NOT NULL,
  `leave_reason` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `leave_days` int(11) NOT NULL,
  `starting_date` date NOT NULL,
  `ending_date` date NOT NULL,
  `status` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `leaves`
--

INSERT INTO `leaves` (`id`, `leave_reason`, `user_id`, `leave_days`, `starting_date`, `ending_date`, `status`, `created`) VALUES
(2, 'em bị ốm', 3, 1, '2022-09-21', '2022-09-21', 1, '2022-09-20 13:17:04');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `media_files`
--

CREATE TABLE `media_files` (
  `id` int(11) NOT NULL,
  `type` text NOT NULL,
  `type_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `file_name` text NOT NULL,
  `file_type` text NOT NULL,
  `file_size` text NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `media_files`
--

INSERT INTO `media_files` (`id`, `type`, `type_id`, `user_id`, `file_name`, `file_type`, `file_size`, `created`) VALUES
(1, 'project', 1, 1, 'jpg2png.zip', '.zip', '22.11', '2022-09-20 13:13:50');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `meetings`
--

CREATE TABLE `meetings` (
  `id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `duration` int(11) NOT NULL,
  `title` text NOT NULL,
  `users` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `starting_date_and_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `meetings`
--

INSERT INTO `meetings` (`id`, `created_by`, `duration`, `title`, `users`, `status`, `starting_date_and_time`, `created`) VALUES
(0, 1, 44, 'cuc hp bt thng', '2,4', 0, '2023-01-07 17:00:00', '2023-01-08 06:39:03'),
(0, 1, 44, 'cuc hp bt thng', '2,4', 0, '2023-01-07 17:00:00', '2023-01-08 06:39:08'),
(0, 1, 44, 'cuc hp bt thng', '2,4', 0, '2023-01-07 17:00:00', '2023-01-08 06:39:08'),
(0, 1, 50, 'NGUUUUUU', '2,4', 0, '2023-01-08 17:00:00', '2023-01-09 15:39:17'),
(0, 1, 50, 'NGUUUUUU', '2,4', 0, '2023-01-08 17:00:00', '2023-01-09 15:39:23'),
(0, 1, 50, 'NGUUUUUU', '2,4', 0, '2023-01-08 17:00:00', '2023-01-09 15:39:28');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `type` text NOT NULL,
  `from_id` int(11) NOT NULL,
  `to_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `is_read` int(11) DEFAULT 0,
  `created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `version` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`version`) VALUES
(10);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `notes`
--

CREATE TABLE `notes` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `notification` text NOT NULL,
  `type` text NOT NULL,
  `type_id` int(11) NOT NULL,
  `from_id` int(11) NOT NULL,
  `to_id` int(11) NOT NULL,
  `is_read` int(11) NOT NULL DEFAULT 0,
  `created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `notifications`
--

INSERT INTO `notifications` (`id`, `notification`, `type`, `type_id`, `from_id`, `to_id`, `is_read`, `created`) VALUES
(3, '<span class=\"text-info\">test thôi</span>', 'new_project', 1, 1, 1, 1, '2022-09-17 08:18:21'),
(4, '1', 'project_status', 1, 1, 1, 1, '2022-09-17 08:44:16'),
(6, 'Cuc hp lnh o cp cao', 'new_meeting', 4, 1, 1, 0, '2022-09-19 13:49:10'),
(7, 'Cuc hp lnh o cp cao', 'new_meeting', 4, 1, 2, 0, '2022-09-19 13:49:12'),
(11, 'Leave request received', 'leave_request', 1, 3, 1, 0, '2022-09-19 15:01:08'),
(12, '<span class=\"text-info\">asassasa</span>', 'new_task', 2, 1, 3, 0, '2022-09-19 15:05:10'),
(13, '<span class=\"text-info\">asassasa</span>', 'new_task', 2, 1, 2, 0, '2022-09-19 15:05:10'),
(14, 'test', 'new_meeting', 6, 1, 3, 0, '2022-09-20 03:45:31'),
(15, '1', 'task_status', 1, 1, 2, 0, '2022-09-20 13:13:07'),
(16, '<span class=\"text-info\">jpg2png.zip</span>', 'project_file', 1, 1, 3, 0, '2022-09-20 13:13:50'),
(17, '<span class=\"text-info\">jpg2png.zip</span>', 'project_file', 1, 1, 2, 0, '2022-09-20 13:13:50'),
(18, 'Leave request received', 'leave_request', 2, 3, 1, 0, '2022-09-20 13:17:04'),
(19, 'leave request accepted', 'leave_request_accepted', 2, 1, 3, 0, '2022-09-20 13:20:42'),
(20, 'Shopiki', 'new_lead', 1, 1, 3, 0, '2022-09-20 13:23:01'),
(21, '<span class=\"text-info\">Dự án công ty monstarlab</span>', 'new_project', 2, 1, 2, 0, '2023-01-04 15:43:57'),
(22, '<span class=\"text-info\">Dự án công ty monstarlab</span>', 'new_project', 2, 1, 1, 0, '2023-01-04 15:43:57'),
(23, '<span class=\"text-info\">Dự án công ty monstarlab</span>', 'new_project', 2, 1, 3, 0, '2023-01-04 15:43:57'),
(24, 'Cuc hp d n Monstarlab', 'new_meeting', 7, 1, 3, 0, '2023-01-05 16:06:31'),
(25, 'Cuc hp d n Monstarlab', 'new_meeting', 7, 1, 4, 0, '2023-01-05 16:06:32'),
(26, '<span class=\"text-info\">dddddddddddd</span>', 'new_project', 3, 1, 2, 0, '2023-01-09 15:45:25'),
(27, '<span class=\"text-info\">dddddddddddd</span>', 'new_project', 3, 1, 6, 0, '2023-01-09 15:45:26'),
(28, '<span class=\"text-info\">dddddddddddd</span>', 'new_project', 3, 1, 6, 0, '2023-01-09 15:45:27'),
(29, 'INV-000002', 'new_invoice', 2, 1, 2, 0, '2023-01-29 13:27:16'),
(30, 'INV-000003', 'new_invoice', 3, 1, 2, 0, '2023-01-29 13:28:22');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `priorities`
--

CREATE TABLE `priorities` (
  `id` int(11) NOT NULL,
  `title` text NOT NULL,
  `class` text NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `priorities`
--

INSERT INTO `priorities` (`id`, `title`, `class`, `created`) VALUES
(1, 'Low', 'info', '2020-05-30 09:54:56'),
(2, 'Medium', 'warning', '2020-05-30 09:54:56'),
(3, 'High', 'danger', '2020-05-30 09:55:08');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `price` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `projects`
--

CREATE TABLE `projects` (
  `id` int(11) NOT NULL,
  `client_id` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `title` text NOT NULL,
  `description` text NOT NULL,
  `starting_date` date NOT NULL,
  `ending_date` date NOT NULL,
  `status` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `budget` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `projects`
--

INSERT INTO `projects` (`id`, `client_id`, `created_by`, `title`, `description`, `starting_date`, `ending_date`, `status`, `created`, `budget`) VALUES
(1, 4, 1, 'Dự án website tập đoàn MTV Hà Tây', 'Dự án quan trọng các khách hàng tiềm năng', '2022-09-17', '2022-09-22', 2, '2022-09-17 08:18:21', '50000'),
(2, 2, 1, 'Dự án công ty monstarlab', 'Xây dựng website phim ảnh Nhật Bản', '2023-01-04', '2023-01-04', 1, '2023-01-04 15:43:57', '3000'),
(3, 2, 1, 'dddddddddddd', 'dddddddddddd', '2023-01-09', '2023-02-24', 1, '2023-01-09 15:45:25', '10000');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `project_status`
--

CREATE TABLE `project_status` (
  `id` int(11) NOT NULL,
  `title` text NOT NULL,
  `class` text NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `project_status`
--

INSERT INTO `project_status` (`id`, `title`, `class`, `created`) VALUES
(1, 'Not Started', 'danger', '2020-05-30 09:50:12'),
(2, 'On Going', 'info', '2020-05-30 09:50:12'),
(3, 'Finished', 'success', '2020-05-30 09:50:54');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `project_users`
--

CREATE TABLE `project_users` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `project_users`
--

INSERT INTO `project_users` (`id`, `user_id`, `project_id`, `created`) VALUES
(11, 6, 3, '2023-01-29 13:17:14'),
(12, 1, 2, '2023-01-29 13:17:25');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `type` text NOT NULL,
  `value` text DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `settings`
--

INSERT INTO `settings` (`id`, `type`, `value`, `created`) VALUES
(1, 'general', '{\"company_name\":\"BKPMS\",\"footer_text\":\"BKPMS - Hedspi 2023 \\u2764\\ufe0f\\ufe0f\",\"google_analytics\":\"\",\"currency_code\":\"USD\",\"currency_symbol\":\"$\",\"mysql_timezone\":\"+07:00\",\"php_timezone\":\"Asia\\/Ho_Chi_Minh\",\"date_format\":\"d-m-Y\",\"time_format\":\"H:i\",\"date_format_js\":\"DD-MM-YYYY\",\"time_format_js\":\"H:mm\",\"file_upload_format\":\"jpg|png|jpeg|zip|doc|pdf\",\"default_language\":\"vietNam\",\"full_logo\":\"logoaa.png\",\"half_logo\":\"f5219ab8e28926d77f98.png\",\"favicon\":\"f5219ab8e28926d77f981.png\",\"email_activation\":\"1\",\"theme_color\":\"#f25050\"}', '2020-05-18 06:15:11'),
(2, 'email', '{\"smtp_host\":\"smtp.gmail.com.\",\"smtp_port\":\"465\",\"smtp_username\":\"thiensuquanquan@gmail.com\",\"smtp_password\":\"fvxbjbbuqjnffekf\",\"smtp_encryption\":\"ssl\",\"email_library\":\"phpmailer\",\"from_email\":\"thiensuquanquan@gmail.com\"}', '2020-05-18 06:15:11'),
(3, 'permissions', '{\"project_view\":1,\"project_create\":0,\"project_edit\":0,\"project_delete\":0,\"task_view\":1,\"task_create\":0,\"task_edit\":0,\"task_delete\":0,\"user_view\":1,\"client_view\":0,\"setting_view\":0,\"setting_update\":0,\"todo_view\":1,\"notes_view\":1,\"chat_view\":1,\"chat_delete\":1,\"team_members_and_client_can_chat\":0,\"task_status\":1,\"project_budget\":0,\"gantt_view\":1,\"gantt_edit\":0,\"calendar_view\":1,\"meetings_view\":1,\"meetings_create\":0,\"meetings_edit\":0,\"meetings_delete\":0,\"lead_view\":0,\"lead_create\":0,\"lead_edit\":0,\"lead_delete\":0}', '2020-05-18 06:15:11'),
(4, 'system_version', '5.5', '2020-05-18 06:15:11'),
(5, 'clients_permissions', '{\"project_view\":0,\"project_create\":0,\"project_edit\":0,\"project_delete\":0,\"task_view\":0,\"task_create\":0,\"task_edit\":0,\"task_delete\":0,\"user_view\":0,\"client_view\":0,\"setting_view\":0,\"setting_update\":0,\"todo_view\":0,\"notes_view\":0,\"chat_view\":1,\"chat_delete\":0,\"team_members_and_client_can_chat\":0,\"task_status\":0,\"project_budget\":0,\"gantt_view\":0,\"gantt_edit\":0,\"calendar_view\":0,\"meetings_view\":0,\"meetings_create\":0,\"meetings_edit\":0,\"meetings_delete\":0,\"lead_view\":0,\"lead_create\":0,\"lead_edit\":0,\"lead_delete\":0}', '2021-01-20 06:06:37'),
(6, 'company_1', '{\"company_name\":\"BKPMS\",\"address\":\"1 \\u0110\\u1ea1i C\\u1ed3 Vi\\u1ec7t, B\\u00e1ch Khoa, Hai B\\u00e0 Tr\\u01b0ng, H\\u00e0 N\\u1ed9i\",\"city\":\"H\\u00e0 N\\u1ed9i\",\"state\":\"California\",\"country\":\"Vi\\u1ec7t Nam\",\"zip_code\":\"94039\"}', '2021-03-25 09:17:13'),
(7, 'company_2', '{\"company_name\":\"shoppe\",\"address\":\"\",\"city\":\"\",\"state\":\"\",\"country\":\"\",\"zip_code\":\"\"}', '2022-09-19 13:45:42'),
(8, 'company_4', '{\"company_name\":\"Monstar lab tech\",\"address\":\"\",\"city\":\"\",\"state\":\"\",\"country\":\"\",\"zip_code\":\"\"}', '2023-01-05 15:47:20');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tasks`
--

CREATE TABLE `tasks` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `title` text NOT NULL,
  `description` text NOT NULL,
  `starting_date` date DEFAULT NULL,
  `due_date` date NOT NULL,
  `priority` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `tasks`
--

INSERT INTO `tasks` (`id`, `project_id`, `created_by`, `title`, `description`, `starting_date`, `due_date`, `priority`, `status`, `created`) VALUES
(1, 1, 1, 'tạo màn đăng nhập', 'abv', '2022-09-20', '2022-09-21', 1, 3, '2022-09-17 08:48:41'),
(2, 1, 1, 'asassasa', 'asaassa', '2022-09-19', '2022-09-22', 2, 1, '2022-09-19 15:05:10');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `task_status`
--

CREATE TABLE `task_status` (
  `id` int(11) NOT NULL,
  `title` text NOT NULL,
  `class` text NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `task_status`
--

INSERT INTO `task_status` (`id`, `title`, `class`, `created`) VALUES
(1, 'Todo', 'info', '2020-05-30 09:51:54'),
(2, 'In Progress', 'warning', '2020-05-30 09:53:20'),
(3, 'In Review', 'info', '2020-05-30 09:51:54'),
(4, 'Completed', 'success', '2020-05-30 09:52:20');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `task_users`
--

CREATE TABLE `task_users` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `task_users`
--

INSERT INTO `task_users` (`id`, `user_id`, `task_id`, `created`) VALUES
(7, 1, 1, '2022-09-20 13:13:07');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `taxes`
--

CREATE TABLE `taxes` (
  `id` int(11) NOT NULL,
  `saas_id` int(11) NOT NULL,
  `title` text NOT NULL,
  `tax` text NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `timesheet`
--

CREATE TABLE `timesheet` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `note` text NOT NULL,
  `starting_time` timestamp NULL DEFAULT NULL,
  `ending_time` timestamp NULL DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `time_formats`
--

CREATE TABLE `time_formats` (
  `id` int(11) NOT NULL,
  `format` text NOT NULL,
  `js_format` text NOT NULL,
  `description` text NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `time_formats`
--

INSERT INTO `time_formats` (`id`, `format`, `js_format`, `description`, `created`) VALUES
(1, 'h:i A', 'hh:mm A', '12 Hour', '2020-05-18 01:33:44'),
(4, 'H:i', 'H:mm', '24 Hour', '2020-05-18 01:34:36');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `todo`
--

CREATE TABLE `todo` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `todo` text NOT NULL,
  `due_date` date DEFAULT NULL,
  `done` int(11) NOT NULL DEFAULT 0,
  `created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(254) NOT NULL,
  `activation_selector` varchar(255) DEFAULT NULL,
  `activation_code` varchar(255) DEFAULT NULL,
  `forgotten_password_selector` varchar(255) DEFAULT NULL,
  `forgotten_password_code` varchar(255) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_selector` varchar(255) DEFAULT NULL,
  `remember_code` varchar(255) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `profile` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `email`, `activation_selector`, `activation_code`, `forgotten_password_selector`, `forgotten_password_code`, `forgotten_password_time`, `remember_selector`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`, `profile`) VALUES
(1, '127.0.0.1', 'chieumu1999@gmail.com', '$2y$12$Q6x7bvPXTrLYPfmKhRUu0Oio4kPY7C5Zi/FdHpqwoQ2xG/meMClHm', 'chieumu1999@gmail.com', NULL, '', NULL, NULL, NULL, '38c48b6b8361ef10ae060f611c976c377c27717e', '$2y$10$FwUVlyyBRpOGnadcbvI1T.pK8kv3UACjTJ996LP43VabpRfKiPkDC', 1268889823, 1674997544, 1, 'Phạm', 'Hùng', NULL, '01213281998', NULL),
(2, '::1', 'thiensuquanquan@gmail.com', '$2y$10$IT58gTFnx/G6Vu5JMPwhNuLqqIuly/1wIsn4P.Rg/gak8SwHqQekS', 'thiensuquanquan@gmail.com', NULL, NULL, NULL, NULL, NULL, 'a986dc35be5dcdf1904999656cd0ad21323872da', '$2y$10$XnLOA3H4EfRhNlI6FjgXreFrUws/DOE35C.83bVlClKytsj0LFalK', 1663595142, 1674997489, 1, 'Phạm', 'Huấn', '', '0968646031', NULL),
(4, '::1', 'huan.pt176771@sis.hust.edu.vn', '$2y$10$i7ctsQGrrFxuFnRUjyZwZOKx/I/0D8qyVaQSCyJ/vLmdVjuZ.Sdvy', 'huan.pt176771@sis.hust.edu.vn', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1672933640, NULL, 1, 'Phạm', 'Chiểu', 'Monstar lab tech', '', NULL),
(5, '::1', 'dinhchieu315@gmail.com', '$2y$10$af06/y6jjvbTyhdt45Vu5.mqt3rWgfV0emZgO5e29vtWmp8QOh3ny', 'dinhchieu315@gmail.com', 'c6989076f09beba2fda2', '$2y$10$rqtsrFBJQXH7PHW0Nlj08O2ACmN.f1cevB.9CsE4oetnwSluJgZ9y', NULL, NULL, NULL, NULL, NULL, 1673278901, NULL, 0, 'Phạm', 'Khánh', NULL, '', NULL),
(6, '::1', 'chieudepzaj1999@gmail.com', '$2y$10$Y767DEixCjwhAsfPDQnjy.wspP1IgHrHlRbTbsZV6BJrqu3NcRNKq', 'chieudepzaj1999@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1673278984, NULL, 1, 'Huấn', 'Phạm', NULL, '0968646031', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users_groups`
--

CREATE TABLE `users_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `users_groups`
--

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 1, 1),
(2, 2, 3),
(4, 4, 3),
(5, 5, 2),
(6, 6, 1);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `date_formats`
--
ALTER TABLE `date_formats`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `leads`
--
ALTER TABLE `leads`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `leaves`
--
ALTER TABLE `leaves`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `media_files`
--
ALTER TABLE `media_files`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `priorities`
--
ALTER TABLE `priorities`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `project_status`
--
ALTER TABLE `project_status`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `project_users`
--
ALTER TABLE `project_users`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `task_status`
--
ALTER TABLE `task_status`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `task_users`
--
ALTER TABLE `task_users`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `timesheet`
--
ALTER TABLE `timesheet`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `time_formats`
--
ALTER TABLE `time_formats`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `todo`
--
ALTER TABLE `todo`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_email` (`email`),
  ADD UNIQUE KEY `uc_activation_selector` (`activation_selector`),
  ADD UNIQUE KEY `uc_forgotten_password_selector` (`forgotten_password_selector`),
  ADD UNIQUE KEY `uc_remember_selector` (`remember_selector`);

--
-- Chỉ mục cho bảng `users_groups`
--
ALTER TABLE `users_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  ADD KEY `fk_users_groups_users1_idx` (`user_id`),
  ADD KEY `fk_users_groups_groups1_idx` (`group_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `date_formats`
--
ALTER TABLE `date_formats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT cho bảng `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `groups`
--
ALTER TABLE `groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `leads`
--
ALTER TABLE `leads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `leaves`
--
ALTER TABLE `leaves`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT cho bảng `media_files`
--
ALTER TABLE `media_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `notes`
--
ALTER TABLE `notes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT cho bảng `priorities`
--
ALTER TABLE `priorities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `project_status`
--
ALTER TABLE `project_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `project_users`
--
ALTER TABLE `project_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `task_status`
--
ALTER TABLE `task_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `task_users`
--
ALTER TABLE `task_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `timesheet`
--
ALTER TABLE `timesheet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `time_formats`
--
ALTER TABLE `time_formats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `todo`
--
ALTER TABLE `todo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `users_groups`
--
ALTER TABLE `users_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `users_groups`
--
ALTER TABLE `users_groups`
  ADD CONSTRAINT `fk_users_groups_groups1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_groups_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
