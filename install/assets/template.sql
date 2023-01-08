-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 07, 2022 at 02:15 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `high_test`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `note` text NOT NULL,
  `check_in` timestamp NOT NULL DEFAULT current_timestamp(),
  `check_out` timestamp NULL DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `date_formats`
--

CREATE TABLE `date_formats` (
  `id` int(11) NOT NULL,
  `format` text NOT NULL,
  `js_format` text NOT NULL,
  `description` text NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `date_formats`
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
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `subject` text NOT NULL,
  `message` text NOT NULL,
  `variables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `name`, `subject`, `message`, `variables`) VALUES
(1, 'new_user_registration', 'Welcome', '<p>Welcome to the {COMPANY_NAME}, This is an automatically generated email to inform you. Below are the credentials for your work dashboard.</p>\r\n<p>Login credentials</p>\r\n<p>Email: {LOGIN_EMAIL}</p>\r\n<p>Password: {LOGIN_PASSWORD}</p>\r\n<p><a href=\"{DASHBOARD_URL}\">Login Now</a></p>', '{COMPANY_NAME}, {DASHBOARD_URL}, {LOGO_URL}, {LOGIN_EMAIL}, {LOGIN_PASSWORD}'),
(2, 'forgot_password', 'Reset password', '<p>Hello,</p>\r\n<p>A password reset request has been created for your account.</p>\r\n<p>Please click on the following link to reset your password: {RESET_PASSWORD_LINK}</p>', '{COMPANY_NAME}, {DASHBOARD_URL}, {LOGO_URL}, {RESET_PASSWORD_LINK}'),
(3, 'email_verification', 'Confirm your email address', '<p>Welcome to the {COMPANY_NAME},</p>\r\n<p>Please confirm your email to activate your account.</p>\r\n<p>Please click on the following link to confirm your email address: {EMAIL_CONFIRMATION_LINK}</p>', '{COMPANY_NAME}, {DASHBOARD_URL}, {LOGO_URL}, {EMAIL_CONFIRMATION_LINK}'),
(4, 'new_project', 'New project assigned', '<p>Hello,</p>\r\n<p>New project {PROJET_TITLE} is assigned to you.</p>', '{COMPANY_NAME}, {DASHBOARD_URL}, {LOGO_URL},  {PROJECT_TITLE}, {PROJECT_DESCRIPTION}, {STARTING_DATE}, {ENDING_DATE}, {BUDGET}, {PROJECT_URL}'),
(5, 'new_task', 'New task assigned', '<p>Hello,</p>\r\n<p>New task {TASK_TITLE} is assigned to you.</p>', '{COMPANY_NAME}, {DASHBOARD_URL}, {LOGO_URL}, {TASK_TITLE}, {TASK_DESCRIPTION}, {STARTING_DATE}, {DUE_DATE}, {TASK_URL}'),
(6, 'new_meeting', 'New meeting scheduled', '<p>Hello,</p>\r\n<p>New meeting {meeting_TITLE} is scheduled.</p>', '{COMPANY_NAME}, {DASHBOARD_URL}, {LOGO_URL}, {MEETING_TITLE}, {STARTING_DATE_AND_TIME}, {DURATION}, {MEETING_URL}'),
(7, 'new_invoice', 'New invoice received', '<p>Hello,</p>\r\n<p>New invoice {INVOICE_ID} received.</p>', '{COMPANY_NAME}, {DASHBOARD_URL}, {LOGO_URL}, {INVOICE_URL}, {INVOICE_NUMBER}, {INVOICE_AMOUNT}, {INVOICE_DATE}, {INVOICE_DUE_DATE}'),
(8, 'new_estimate', 'New estimate received', '<p>Hello,</p>\r\n<p>New estimate {ESTIMATE_ID} received.</p>', '{COMPANY_NAME}, {DASHBOARD_URL}, {LOGO_URL}, {ESTIMATE_URL}, {ESTIMATE_NUMBER}, {ESTIMATE_AMOUNT}, {ESTIMATE_DATE}, {ESTIMATE_DUE_DATE}');

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
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
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(2, 'members', 'General User'),
(3, 'client', 'Clients');

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
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

-- --------------------------------------------------------

--
-- Table structure for table `languages`
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
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `language`, `short_code`, `active`, `created`, `status`) VALUES
(1, 'english', 'en', 0, '2021-01-19 19:04:57', 1),
(2, 'hindi', 'en', 0, '2021-01-19 19:04:57', 1),
(3, 'italian', 'en', 0, '2021-01-19 19:04:57', 1),
(4, 'spanish', 'en', 0, '2021-01-19 19:04:57', 1),
(5, 'french', 'en', 0, '2021-01-19 19:04:57', 1);

-- --------------------------------------------------------

--
-- Table structure for table `leads`
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

-- --------------------------------------------------------

--
-- Table structure for table `leaves`
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

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE `login_attempts` (
  `id` int(11) UNSIGNED NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `media_files`
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

-- --------------------------------------------------------

--
-- Table structure for table `meetings`
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

-- --------------------------------------------------------

--
-- Table structure for table `messages`
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
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `version` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`version`) VALUES
(10);

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE `notes` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
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

-- --------------------------------------------------------

--
-- Table structure for table `priorities`
--

CREATE TABLE `priorities` (
  `id` int(11) NOT NULL,
  `title` text NOT NULL,
  `class` text NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `priorities`
--

INSERT INTO `priorities` (`id`, `title`, `class`, `created`) VALUES
(1, 'Low', 'info', '2020-05-30 09:54:56'),
(2, 'Medium', 'warning', '2020-05-30 09:54:56'),
(3, 'High', 'danger', '2020-05-30 09:55:08');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `price` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `projects`
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

-- --------------------------------------------------------

--
-- Table structure for table `project_status`
--

CREATE TABLE `project_status` (
  `id` int(11) NOT NULL,
  `title` text NOT NULL,
  `class` text NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `project_status`
--

INSERT INTO `project_status` (`id`, `title`, `class`, `created`) VALUES
(1, 'Not Started', 'danger', '2020-05-30 09:50:12'),
(2, 'On Going', 'info', '2020-05-30 09:50:12'),
(3, 'Finished', 'success', '2020-05-30 09:50:54');

-- --------------------------------------------------------

--
-- Table structure for table `project_users`
--

CREATE TABLE `project_users` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `type` text NOT NULL,
  `value` text DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `type`, `value`, `created`) VALUES
(1, 'general', '{\"company_name\":\"HIGH\",\"footer_text\":\"HIGH - All Rights Reserved\",\"google_analytics\":\"\",\"currency_code\":\"USD\",\"currency_symbol\":\"$\",\"mysql_timezone\":\"+05:30\",\"php_timezone\":\"Asia\\/Kolkata\",\"date_format\":\"d M Y\",\"time_format\":\"h:i A\",\"date_format_js\":\"DD MMM YYYY\",\"time_format_js\":\"hh:mm A\",\"file_upload_format\":\"jpg|png|jpeg|zip|doc|pdf\",\"default_language\":\"english\",\"full_logo\":\"logo.png\",\"half_logo\":\"logo-half.png\",\"favicon\":\"favicon.png\",\"email_activation\":\"0\",\"theme_color\":\"#e52165\"}', '2020-05-18 06:15:11'),
(2, 'email', '', '2020-05-18 06:15:11'),
(3, 'permissions', '{\"project_view\":1,\"project_create\":1,\"project_edit\":1,\"project_delete\":1,\"task_view\":1,\"task_create\":1,\"task_edit\":1,\"task_delete\":1,\"user_view\":1,\"client_view\":1,\"setting_view\":0,\"setting_update\":0,\"todo_view\":1,\"notes_view\":1,\"chat_view\":1,\"chat_delete\":1,\"team_members_and_client_can_chat\":1,\"task_status\":1,\"project_budget\":1,\"gantt_view\":1,\"gantt_edit\":1,\"calendar_view\":1,\"meetings_view\":1,\"meetings_create\":1,\"meetings_edit\":1,\"meetings_delete\":1,\"lead_view\":1,\"lead_create\":1,\"lead_edit\":1,\"lead_delete\":1}', '2020-05-18 06:15:11'),
(4, 'system_version', '5.5', '2020-05-18 06:15:11'),
(5, 'clients_permissions', '{\"project_view\":1,\"project_create\":1,\"project_edit\":1,\"project_delete\":1,\"task_view\":1,\"task_create\":1,\"task_edit\":1,\"task_delete\":1,\"user_view\":1,\"client_view\":1,\"setting_view\":0,\"setting_update\":0,\"todo_view\":1,\"notes_view\":1,\"chat_view\":1,\"chat_delete\":1,\"team_members_and_client_can_chat\":1,\"task_status\":1,\"project_budget\":1,\"gantt_view\":1,\"gantt_edit\":1,\"calendar_view\":1,\"meetings_view\":1,\"meetings_create\":1,\"meetings_edit\":1,\"meetings_delete\":1,\"lead_view\":1,\"lead_create\":1,\"lead_edit\":1,\"lead_delete\":1}', '2021-01-20 06:06:37'),
(6, 'company_1', '{\"company_name\":\"HIGH\",\"address\":\"1600 Amphitheatre Parkway\",\"city\":\"Mountain View\",\"state\":\"California\",\"country\":\"United States\",\"zip_code\":\"94039\"}', '2021-03-25 09:17:13');

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
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

-- --------------------------------------------------------

--
-- Table structure for table `task_status`
--

CREATE TABLE `task_status` (
  `id` int(11) NOT NULL,
  `title` text NOT NULL,
  `class` text NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `task_status`
--

INSERT INTO `task_status` (`id`, `title`, `class`, `created`) VALUES
(1, 'Todo', 'info', '2020-05-30 09:51:54'),
(2, 'In Progress', 'warning', '2020-05-30 09:53:20'),
(3, 'In Review', 'info', '2020-05-30 09:51:54'),
(4, 'Completed', 'success', '2020-05-30 09:52:20');

-- --------------------------------------------------------

--
-- Table structure for table `task_users`
--

CREATE TABLE `task_users` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
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
-- Table structure for table `timesheet`
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
-- Table structure for table `time_formats`
--

CREATE TABLE `time_formats` (
  `id` int(11) NOT NULL,
  `format` text NOT NULL,
  `js_format` text NOT NULL,
  `description` text NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `time_formats`
--

INSERT INTO `time_formats` (`id`, `format`, `js_format`, `description`, `created`) VALUES
(1, 'h:i A', 'hh:mm A', '12 Hour', '2020-05-18 01:33:44'),
(4, 'H:i', 'H:mm', '24 Hour', '2020-05-18 01:34:36');

-- --------------------------------------------------------

--
-- Table structure for table `todo`
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
-- Table structure for table `users`
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
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `email`, `activation_selector`, `activation_code`, `forgotten_password_selector`, `forgotten_password_code`, `forgotten_password_time`, `remember_selector`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`, `profile`) VALUES
(1, '127.0.0.1', '%ADMINEMAIL%', '%ADMINPASSWORD%', '%ADMINEMAIL%', NULL, '', NULL, NULL, NULL, '24d8ab7878e48548b08b6ace0db7521e56802e3c', '$2y$10$xHU14D2g0rekEOolDQnd..QAVv8NcOkPDSu57O6az9GpHyQX5AVC6', 1268889823, 1637584106, 1, 'Admin', 'Main', NULL, '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users_groups`
--

CREATE TABLE `users_groups` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users_groups`
--

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `date_formats`
--
ALTER TABLE `date_formats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leads`
--
ALTER TABLE `leads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leaves`
--
ALTER TABLE `leaves`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `media_files`
--
ALTER TABLE `media_files`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `meetings`
--
ALTER TABLE `meetings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `priorities`
--
ALTER TABLE `priorities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_status`
--
ALTER TABLE `project_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `project_users`
--
ALTER TABLE `project_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `task_status`
--
ALTER TABLE `task_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `task_users`
--
ALTER TABLE `task_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `timesheet`
--
ALTER TABLE `timesheet`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `time_formats`
--
ALTER TABLE `time_formats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `todo`
--
ALTER TABLE `todo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_email` (`email`),
  ADD UNIQUE KEY `uc_activation_selector` (`activation_selector`),
  ADD UNIQUE KEY `uc_forgotten_password_selector` (`forgotten_password_selector`),
  ADD UNIQUE KEY `uc_remember_selector` (`remember_selector`);

--
-- Indexes for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  ADD KEY `fk_users_groups_users1_idx` (`user_id`),
  ADD KEY `fk_users_groups_groups1_idx` (`group_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `date_formats`
--
ALTER TABLE `date_formats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `leads`
--
ALTER TABLE `leads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leaves`
--
ALTER TABLE `leaves`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `media_files`
--
ALTER TABLE `media_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `meetings`
--
ALTER TABLE `meetings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `priorities`
--
ALTER TABLE `priorities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `project_status`
--
ALTER TABLE `project_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `project_users`
--
ALTER TABLE `project_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `task_status`
--
ALTER TABLE `task_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `task_users`
--
ALTER TABLE `task_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `timesheet`
--
ALTER TABLE `timesheet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `time_formats`
--
ALTER TABLE `time_formats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `todo`
--
ALTER TABLE `todo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users_groups`
--
ALTER TABLE `users_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD CONSTRAINT `fk_users_groups_groups1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_groups_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
