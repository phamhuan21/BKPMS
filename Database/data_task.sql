-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 26, 2023 at 05:05 PM
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
-- Database: `data_task`
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

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`id`, `user_id`, `note`, `check_in`, `check_out`, `created`) VALUES
(8, 1, 'Đi làm đúng giờ ra vào chuẩn thời gian', '2023-02-25 17:00:00', '2023-02-17 17:00:00', '2023-02-26 13:30:39');

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
(1, 'new_user_registration', 'Welcome', '<p>Chào mừng bạn đến với {COMPANY_NAME}. Đây là email được tạo tự động để thông báo cho bạn. Dưới đây là thông tin đăng nhập cho tổng quan công việc của bạn.</p>\n<p>Thông tin đăng nhập</p>\n<p>Email: {LOGIN_EMAIL}</p>\n<p>Mật khẩu: {LOGIN_PASSWORD}</p>\n<p><a href=\"{DASHBOARD_URL}\">Đăng nhập ngay</a></p>', '{COMPANY_NAME}, {DASHBOARD_URL}, {LOGO_URL}, {LOGIN_EMAIL}, {LOGIN_PASSWORD}'),
(2, 'forgot_password', 'Đặt lại mật khẩu', '<p>Xin chào,</p>\n<p>Yêu cầu đặt lại mật khẩu đã được tạo cho tài khoản của bạn.</p>\n<p>Vui lòng nhấp vào liên kết sau để đặt lại mật khẩu của bạn: {RESET_PASSWORD_LINK}</p>', '{COMPANY_NAME}, {DASHBOARD_URL}, {LOGO_URL}, {RESET_PASSWORD_LINK}'),
(3, 'email_verification', 'Xác nhận địa chỉ email của bạn', '<p>Chào mừng đến với {COMPANY_NAME},</p>\n<p>Vui lòng xác nhận email của bạn để kích hoạt tài khoản.</p>\n<p>Vui lòng nhấp vào liên kết sau để xác nhận địa chỉ email của bạn: {EMAIL_CONFIRMATION_LINK}</p>', '{COMPANY_NAME}, {DASHBOARD_URL}, {LOGO_URL}, {EMAIL_CONFIRMATION_LINK}'),
(4, 'new_project', 'Dự án mới', '<p>Xin chào,</p>\n<p>Dự án {PROJECT_TITLE} được giao cho bạn. </p>', '{COMPANY_NAME}, {DASHBOARD_URL}, {LOGO_URL},  {PROJECT_TITLE}, {PROJECT_DESCRIPTION}, {STARTING_DATE}, {ENDING_DATE}, {BUDGET}, {PROJECT_URL}'),
(5, 'new_task', 'Nhiệm vụ mới được giao', '<p>Xin chào,</p>\n<p>Nhiệm vụ mới {TASK_TITLE} được giao cho bạn.</p>', '{COMPANY_NAME}, {DASHBOARD_URL}, {LOGO_URL}, {TASK_TITLE}, {TASK_DESCRIPTION}, {STARTING_DATE}, {DUE_DATE}, {TASK_URL}'),
(6, 'new_meeting', 'Cuộc họp mới được lên lịch', '<p>Xin chào,</p>\n<p>Cuộc họp mới {MEETING_TITLE} đã được lên lịch.</p>', '{COMPANY_NAME}, {DASHBOARD_URL}, {LOGO_URL}, {MEETING_TITLE}, {STARTING_DATE_AND_TIME}, {DURATION}, {MEETING_URL}'),
(7, 'new_invoice', 'Đã nhận được hóa đơn mới', '<p>Xin chào,</p>\n<p>Đã nhận được hóa đơn mới {INVOICE_ID}.</p>', '{COMPANY_NAME}, {DASHBOARD_URL}, {LOGO_URL}, {INVOICE_URL}, {INVOICE_NUMBER}, {INVOICE_AMOUNT}, {INVOICE_DATE}, {INVOICE_DUE_DATE}'),
(8, 'new_estimate', 'New estimate received', '<p>Hello,</p>\n<p>New estimate {ESTIMATE_ID} received.</p>', '{COMPANY_NAME}, {DASHBOARD_URL}, {LOGO_URL}, {ESTIMATE_URL}, {ESTIMATE_NUMBER}, {ESTIMATE_AMOUNT}, {ESTIMATE_DATE}, {ESTIMATE_DUE_DATE}'),
(9, 'new_project_client', 'Dự án mới', '<p>Xin chào,</p>\n<p>Dự án {PROJECT_TITLE} được bắt đầu</p>', '{COMPANY_NAME}, {DASHBOARD_URL}, {LOGO_URL}, {ESTIMATE_URL}, {ESTIMATE_NUMBER}, {ESTIMATE_AMOUNT}, {ESTIMATE_DATE}, {ESTIMATE_DUE_DATE}');

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
(1, 'admin', 'Quản trị viên'),
(2, 'members', 'Thành viên nhóm'),
(3, 'client', 'Khách hàng');

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

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `created_by`, `from_id`, `to_id`, `items_id`, `products_id`, `amount`, `note`, `status`, `tax`, `invoice_date`, `due_date`, `payment_type`, `payment_date`, `created`, `type`, `receipt`) VALUES
(2, 1, 1, 2, '2', '', '3000', '', 0, '', '2023-01-19', '2023-01-13', '', '0000-00-00', '2023-01-29 13:27:16', 'invoice', NULL),
(3, 1, 1, 2, '3', '', '10000', 'a', 1, '', '2023-01-29', '2023-01-29', '', '0000-00-00', '2023-01-29 13:28:22', 'invoice', NULL);

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
(9, 'vietNam', 'vn', 0, '2022-09-16 15:14:24', 1);

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

--
-- Dumping data for table `leads`
--

INSERT INTO `leads` (`id`, `created_by`, `company`, `value`, `source`, `email`, `mobile`, `assigned`, `status`, `created`) VALUES
(1, 1, 'Shopiki', '500000000', 'Facebook', 'hoangngoc100899@gmail.com', '', '3', 'discussion', '2022-09-20 13:23:01'),
(2, 2, 'AvePoint Viet Nam', '43299293', 'fsffsdf', 'thiensuquanquan@gmail.com', '0906678656', '1', 'qualified', '2023-02-18 03:08:31');

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

--
-- Dumping data for table `leaves`
--

INSERT INTO `leaves` (`id`, `leave_reason`, `user_id`, `leave_days`, `starting_date`, `ending_date`, `status`, `created`) VALUES
(5, 'Hiện tại em bị ốm nhức đầu xin phép được nghỉ ạ.', 1, 3, '2023-02-26', '2023-02-28', 1, '2023-02-25 21:00:01'),
(6, 'Hiện tại gia đình tổ chức tiệc cưới em xin phép nghỉ hoàn thành công việc gia đình', 8, 9, '2023-03-19', '2023-02-28', 0, '2023-02-25 21:02:48');

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

--
-- Dumping data for table `media_files`
--

INSERT INTO `media_files` (`id`, `type`, `type_id`, `user_id`, `file_name`, `file_type`, `file_size`, `created`) VALUES
(1, 'project', 1, 1, 'jpg2png.zip', '.zip', '22.11', '2022-09-20 13:13:50'),
(5, 'project', 6, 2, 'Giới_thiệu.PNG', '.PNG', '61.84', '2023-02-25 11:10:44'),
(6, 'project', 6, 2, 'Hướng_dẫn_sử_dụng.PNG', '.PNG', '74.88', '2023-02-25 11:10:44'),
(7, 'project', 6, 2, 'Tin_tức.PNG', '.PNG', '98.71', '2023-02-25 11:10:45'),
(8, 'project', 6, 2, 'Trang_chủ.PNG', '.PNG', '145.4', '2023-02-25 11:10:45');

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

--
-- Dumping data for table `meetings`
--

INSERT INTO `meetings` (`id`, `created_by`, `duration`, `title`, `users`, `status`, `starting_date_and_time`, `created`) VALUES
(11, 2, 90, 'Dự án công ty công nghệ Toshiba', '9,12,13', 0, '2023-05-12 03:00:00', '2023-02-25 17:33:35'),
(12, 2, 120, 'Dự án công ty công nghệ Toshiba', '9,12,13', 0, '2023-02-25 17:00:00', '2023-02-26 06:18:05');

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

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `type`, `from_id`, `to_id`, `message`, `is_read`, `created`) VALUES
(2, 'project_comment', 2, 5, 'Các task vụ ngày màn hình cần fix hết css đúng theo khuôn mẫu', 0, '2023-02-20 16:13:25'),
(6, 'chat', 2, 1, 'Hiện tại đã đại đa số tôi đã hoàn thành task, còn nhiều lỗi tôi vẫn đang phải fix', 1, '2023-02-23 15:02:52'),
(7, 'chat', 1, 2, 'Tác vụ đã đạt đến đâu rồi', 1, '2023-02-23 15:03:12'),
(8, 'chat', 1, 2, 'Đã hoàn thành task chưa đồng chí', 1, '2023-02-23 15:04:46'),
(9, 'chat', 1, 2, 'Đã hoàn thành task chưa đồng chí', 1, '2023-02-23 15:04:58'),
(10, 'chat', 2, 1, 'Hiện tại đã đại đa số tôi đã hoàn thành task, còn nhiều lỗi tôi vẫn đang phải fix', 1, '2023-02-23 16:01:54'),
(11, 'chat', 1, 2, 'Các task vụ ngày màn hình cần fix hết css đúng theo khuôn mẫu', 1, '2023-02-23 16:02:05'),
(12, 'chat', 2, 1, 'Đã hoàn thành task chưa đồng chí', 1, '2023-02-23 16:02:13'),
(15, 'chat', 1, 2, 'Tác vụ đã đạt đến đâu rồi', 1, '2023-02-24 15:31:40'),
(16, 'chat', 2, 1, 'Tác vụ đã đạt đến đâu rồi', 1, '2023-02-24 15:31:52'),
(17, 'chat', 2, 1, 'Đã hoàn thành task chưa đồng chí', 1, '2023-02-24 15:32:06'),
(18, 'chat', 2, 1, 'Tác vụ đã đạt đến đâu rồi', 1, '2023-02-24 15:32:35'),
(19, 'chat', 1, 2, 'Xong rồi nhé', 1, '2023-02-24 15:32:43'),
(20, 'chat', 2, 1, 'Lô', 1, '2023-02-24 15:44:19'),
(21, 'chat', 1, 2, 'Lô', 1, '2023-02-24 15:44:55'),
(22, 'chat', 2, 1, 'Lô', 1, '2023-02-24 15:47:25'),
(23, 'chat', 1, 2, 'lô', 1, '2023-02-24 16:01:28'),
(24, 'chat', 2, 1, 'lô', 1, '2023-02-24 16:01:34'),
(25, 'chat', 1, 2, 'lô', 1, '2023-02-24 16:01:54'),
(26, 'chat', 2, 1, 'lô', 1, '2023-02-24 16:01:58'),
(27, 'chat', 1, 2, 'lô', 1, '2023-02-24 16:02:15'),
(28, 'chat', 2, 1, 'Đã hoàn thành task chưa đồng chí', 1, '2023-02-24 16:02:30'),
(29, 'chat', 1, 2, 'lô', 1, '2023-02-24 16:02:35'),
(30, 'chat', 1, 2, 'Đã hoàn thành task chưa đồng chí', 1, '2023-02-24 16:02:40'),
(31, 'chat', 2, 1, 'lô', 1, '2023-02-24 16:07:27'),
(32, 'chat', 2, 1, 'Các task vụ ngày màn hình cần fix hết css đúng theo khuôn mẫu', 1, '2023-02-24 16:07:41'),
(33, 'chat', 1, 2, 'lô', 1, '2023-02-24 16:07:52'),
(34, 'chat', 2, 1, 'Tác vụ đã đạt đến đâu rồi', 1, '2023-02-24 16:08:00'),
(35, 'chat', 1, 2, 'chat', 1, '2023-02-24 16:13:19'),
(36, 'chat', 1, 2, 'Đã hoàn thành task chưa đồng chí', 1, '2023-02-24 16:13:23'),
(37, 'chat', 2, 1, 'lô', 1, '2023-02-24 16:17:37'),
(38, 'project_comment', 2, 6, 'Dự án hiện tại đã được hoàn thành cáct tiến độ', 0, '2023-02-25 11:11:22'),
(39, 'project_comment', 2, 5, 'Chỉnh sửa các thông tin giỏ hàng chính xác theo quy định', 0, '2023-02-25 16:19:42'),
(40, 'chat', 2, 1, 'Hiện tại các màn cố gắng hoàn thành đúng tiến độ', 1, '2023-02-25 16:24:45'),
(41, 'chat', 1, 2, 'Các tác vụ đạt các yêu cầu đặt ra', 1, '2023-02-25 16:26:43'),
(42, 'chat', 2, 8, 'Task được giao hoàn thành chưa em', 1, '2023-02-25 20:26:16'),
(43, 'chat', 8, 2, 'Em gần hoàn thành xong rồi ạ', 1, '2023-02-25 20:27:37'),
(44, 'chat', 8, 2, 'Em đang sửa 1 vài lỗi là xong thôi', 1, '2023-02-25 20:27:49'),
(45, 'chat', 2, 8, 'Ok cố gắng lên em', 1, '2023-02-25 20:28:00');

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

--
-- Dumping data for table `notes`
--

INSERT INTO `notes` (`id`, `user_id`, `description`, `created`) VALUES
(4, 2, 'Khi làm đăng nhập vào website quản lý bán hàng, có một số ghi chú cần lưu ý để đảm bảo an toàn thông tin và dữ liệu của người dùng:\r\n\r\n1. Sử dụng mật khẩu mạnh: Mật khẩu nên được tạo từ các ký tự phức tạp và độ dài ít nhất 8 ký tự. Nên tránh sử dụng các từ thông dụng, tên hoặc ngày sinh, đặc biệt là các mật khẩu giống nhau trên nhiều tài khoản.\r\n\r\n2. Đăng nhập từ thiết bị tin cậy: Nên sử dụng thiết bị cá nhân để đăng nhập vào website quản lý bán hàng. Tránh sử dụng máy tính công cộng, thiết bị của người khác hoặc kết nối internet không an toàn.\r\n\r\n3. Cập nhật trình duyệt và phần mềm bảo mật: Nên sử dụng phiên bản mới nhất của trình duyệt web và các phần mềm bảo mật để đảm bảo an toàn thông tin truy cập.\r\n\r\n4. Đăng xuất đúng cách: Sau khi sử dụng website, nên đăng xuất tài khoản đúng cách để đảm bảo không ai có thể truy cập vào thông tin cá nhân của bạn.\r\n\r\n5. Kiểm tra hoạt động đăng nhập: Nếu website quản lý bán hàng có tính năng kiểm tra hoạt động đăng nhập, hãy sử dụng tính năng này để theo dõi các hoạt động đăng nhập trên tài khoản của bạn và phát hiện bất kỳ hoạt động nghi ngờ nào.\r\n\r\n6. Không chia sẻ thông tin đăng nhập: Nên tránh chia sẻ thông tin đăng nhập cho người khác, kể cả người thân hoặc bạn bè. Thông tin đăng nhập chỉ nên được sử dụng bởi chính người sở hữu tài khoản.\r\n\r\n7. Sử dụng tính năng bảo mật hai lớp: Nếu website quản lý bán hàng có tính năng bảo mật hai lớp, nên kích hoạt tính năng này để tăng cường bảo mật cho tài khoản của bạn. Tính năng này yêu cầu nhập một mã xác thực hoặc sử dụng thiết bị xác thực để đăng nhập vào tài khoản.', '2023-02-26 06:12:59'),
(5, 2, 'Khi lập danh mục sản phẩm cho website bán hàng, có một số ghi chú sau đây để lưu ý:\r\n\r\n1. Phân loại sản phẩm: Cần phân loại sản phẩm theo từng danh mục riêng biệt, ví dụ như: Thời trang, Điện tử, Đồ gia dụng,... để dễ dàng quản lý sản phẩm và giúp khách hàng tìm kiếm sản phẩm dễ dàng hơn.\r\n\r\n2. Tính năng tìm kiếm: Website bán hàng nên có tính năng tìm kiếm sản phẩm để giúp khách hàng tìm kiếm sản phẩm một cách nhanh chóng và thuận tiện.\r\n\r\n3. Mô tả sản phẩm: Mỗi sản phẩm nên có mô tả đầy đủ về thông tin sản phẩm, giá cả, hình ảnh sản phẩm và các thông tin khác liên quan để khách hàng có thể đánh giá sản phẩm một cách chính xác.\r\n\r\n4. Sắp xếp sản phẩm: Sản phẩm nên được sắp xếp theo thứ tự chữ cái hoặc theo giá để khách hàng có thể tìm kiếm sản phẩm một cách dễ dàng.\r\n\r\n5. Thông tin sản phẩm liên quan: Website bán hàng nên cung cấp thông tin sản phẩm liên quan để khách hàng có thể tìm kiếm và mua các sản phẩm liên quan tới sản phẩm đang xem.\r\n\r\n6. Thêm tính năng bình luận: Nên thêm tính năng bình luận để khách hàng có thể đánh giá và chia sẻ kinh nghiệm sử dụng sản phẩm, giúp tăng tính tương tác và độ tin cậy của sản phẩm.\r\n\r\n7. Cập nhật sản phẩm mới: Cần cập nhật các sản phẩm mới nhất, sản phẩm được giảm giá để khách hàng có thể tiện theo dõi và mua sắm một cách thuận tiện.', '2023-02-26 06:16:12');

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

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `notification`, `type`, `type_id`, `from_id`, `to_id`, `is_read`, `created`) VALUES
(124, '<span class=\"text-info\">Tạo tài khoản và đăng nhập</span>', 'new_task', 5, 2, 1, 0, '2023-02-25 10:55:09'),
(125, '<span class=\"text-info\">Tạo tài khoản và đăng nhập</span>', 'new_task', 5, 2, 19, 0, '2023-02-25 10:55:09'),
(126, '<span class=\"text-info\">Chia sẻ tài liệu giáo dục</span>', 'new_task', 6, 2, 11, 0, '2023-02-25 10:56:52'),
(127, '<span class=\"text-info\">Chia sẻ tài liệu giáo dục</span>', 'new_task', 6, 2, 19, 0, '2023-02-25 10:56:52'),
(128, '<span class=\"text-info\">Screenshot_(130).png</span>', 'project_file', 6, 2, 1, 0, '2023-02-25 11:04:55'),
(129, '<span class=\"text-info\">Screenshot_(130).png</span>', 'project_file', 6, 2, 11, 0, '2023-02-25 11:04:55'),
(130, '<span class=\"text-info\">Screenshot_(130).png</span>', 'project_file', 6, 2, 12, 0, '2023-02-25 11:04:55'),
(131, '<span class=\"text-info\">Screenshot_(130).png</span>', 'project_file', 6, 2, 7, 0, '2023-02-25 11:04:55'),
(132, '<span class=\"text-info\">Giới_thiệu.PNG</span>', 'project_file', 6, 2, 1, 0, '2023-02-25 11:10:44'),
(133, '<span class=\"text-info\">Giới_thiệu.PNG</span>', 'project_file', 6, 2, 11, 0, '2023-02-25 11:10:44'),
(134, '<span class=\"text-info\">Giới_thiệu.PNG</span>', 'project_file', 6, 2, 12, 0, '2023-02-25 11:10:44'),
(135, '<span class=\"text-info\">Giới_thiệu.PNG</span>', 'project_file', 6, 2, 7, 0, '2023-02-25 11:10:44'),
(136, '<span class=\"text-info\">Hướng_dẫn_sử_dụng.PNG</span>', 'project_file', 6, 2, 1, 0, '2023-02-25 11:10:44'),
(137, '<span class=\"text-info\">Hướng_dẫn_sử_dụng.PNG</span>', 'project_file', 6, 2, 11, 0, '2023-02-25 11:10:45'),
(138, '<span class=\"text-info\">Hướng_dẫn_sử_dụng.PNG</span>', 'project_file', 6, 2, 12, 0, '2023-02-25 11:10:45'),
(139, '<span class=\"text-info\">Hướng_dẫn_sử_dụng.PNG</span>', 'project_file', 6, 2, 7, 0, '2023-02-25 11:10:45'),
(140, '<span class=\"text-info\">Tin_tức.PNG</span>', 'project_file', 6, 2, 1, 0, '2023-02-25 11:10:45'),
(141, '<span class=\"text-info\">Tin_tức.PNG</span>', 'project_file', 6, 2, 11, 0, '2023-02-25 11:10:45'),
(142, '<span class=\"text-info\">Tin_tức.PNG</span>', 'project_file', 6, 2, 12, 0, '2023-02-25 11:10:45'),
(143, '<span class=\"text-info\">Tin_tức.PNG</span>', 'project_file', 6, 2, 7, 0, '2023-02-25 11:10:45'),
(144, '<span class=\"text-info\">Trang_chủ.PNG</span>', 'project_file', 6, 2, 1, 0, '2023-02-25 11:10:45'),
(145, '<span class=\"text-info\">Trang_chủ.PNG</span>', 'project_file', 6, 2, 11, 0, '2023-02-25 11:10:45'),
(146, '<span class=\"text-info\">Trang_chủ.PNG</span>', 'project_file', 6, 2, 12, 0, '2023-02-25 11:10:45'),
(147, '<span class=\"text-info\">Trang_chủ.PNG</span>', 'project_file', 6, 2, 7, 0, '2023-02-25 11:10:45'),
(148, '\"<span class=\"text-info\">Dự án hiện tại đã được hoàn thành cáct tiến độ</span>\"', 'project_comment', 6, 2, 1, 0, '2023-02-25 11:11:22'),
(149, '\"<span class=\"text-info\">Dự án hiện tại đã được hoàn thành cáct tiến độ</span>\"', 'project_comment', 6, 2, 11, 0, '2023-02-25 11:11:22'),
(150, '\"<span class=\"text-info\">Dự án hiện tại đã được hoàn thành cáct tiến độ</span>\"', 'project_comment', 6, 2, 12, 0, '2023-02-25 11:11:22'),
(151, '\"<span class=\"text-info\">Dự án hiện tại đã được hoàn thành cáct tiến độ</span>\"', 'project_comment', 6, 2, 7, 0, '2023-02-25 11:11:22'),
(159, '<span class=\"text-info\">Cung cấp khóa học trực tuyến:</span>', 'new_task', 7, 2, 1, 0, '2023-02-25 15:51:06'),
(160, '<span class=\"text-info\">Cung cấp khóa học trực tuyến:</span>', 'new_task', 7, 2, 11, 0, '2023-02-25 15:51:06'),
(161, '<span class=\"text-info\">Cung cấp khóa học trực tuyến:</span>', 'new_task', 7, 2, 7, 0, '2023-02-25 15:51:06'),
(162, '<span class=\"text-info\">Cập nhật thông tin về giáo dục</span>', 'new_task', 8, 2, 11, 0, '2023-02-25 15:56:22'),
(163, '<span class=\"text-info\">Cập nhật thông tin về giáo dục</span>', 'new_task', 8, 2, 7, 0, '2023-02-25 15:56:22'),
(164, '<span class=\"text-info\">Danh mục sản phẩm</span>', 'new_task', 9, 2, 11, 0, '2023-02-25 16:05:18'),
(165, '<span class=\"text-info\">Danh mục sản phẩm</span>', 'new_task', 9, 2, 14, 0, '2023-02-25 16:05:18'),
(166, '2', 'task_status', 9, 2, 11, 0, '2023-02-25 16:05:49'),
(167, '2', 'task_status', 9, 2, 14, 0, '2023-02-25 16:05:49'),
(168, '<span class=\"text-info\">Trang chi tiết sản phẩm:</span>', 'new_task', 10, 2, 1, 0, '2023-02-25 16:08:26'),
(169, '<span class=\"text-info\">Trang chi tiết sản phẩm:</span>', 'new_task', 10, 2, 8, 1, '2023-02-25 16:08:26'),
(170, '<span class=\"text-info\">Trang chi tiết sản phẩm:</span>', 'new_task', 10, 2, 11, 0, '2023-02-25 16:08:26'),
(171, '<span class=\"text-info\">Trang chi tiết sản phẩm:</span>', 'new_task', 10, 2, 14, 0, '2023-02-25 16:08:26'),
(172, '<span class=\"text-info\">Giỏ hàng</span>', 'new_task', 11, 2, 8, 1, '2023-02-25 16:09:04'),
(173, '<span class=\"text-info\">Giỏ hàng</span>', 'new_task', 11, 2, 11, 0, '2023-02-25 16:09:04'),
(174, '<span class=\"text-info\">Giỏ hàng</span>', 'new_task', 11, 2, 14, 0, '2023-02-25 16:09:04'),
(175, '<span class=\"text-info\">Thanh toán:</span>', 'new_task', 12, 2, 8, 1, '2023-02-25 16:09:47'),
(176, '<span class=\"text-info\">Thanh toán:</span>', 'new_task', 12, 2, 11, 0, '2023-02-25 16:09:47'),
(177, '<span class=\"text-info\">Thanh toán:</span>', 'new_task', 12, 2, 14, 0, '2023-02-25 16:09:47'),
(178, '<span class=\"text-info\">Đăng ký tài khoản</span>', 'new_task', 13, 2, 14, 0, '2023-02-25 16:10:40'),
(179, '<span class=\"text-info\">Đăng nhập:</span>', 'new_task', 14, 2, 14, 0, '2023-02-25 16:12:23'),
(180, '\"<span class=\"text-info\">Chỉnh sửa các thông tin giỏ hàng chính xác theo quy định</span>\"', 'project_comment', 5, 2, 1, 0, '2023-02-25 16:19:42'),
(181, '\"<span class=\"text-info\">Chỉnh sửa các thông tin giỏ hàng chính xác theo quy định</span>\"', 'project_comment', 5, 2, 8, 1, '2023-02-25 16:19:42'),
(182, '\"<span class=\"text-info\">Chỉnh sửa các thông tin giỏ hàng chính xác theo quy định</span>\"', 'project_comment', 5, 2, 11, 0, '2023-02-25 16:19:42'),
(183, '\"<span class=\"text-info\">Chỉnh sửa các thông tin giỏ hàng chính xác theo quy định</span>\"', 'project_comment', 5, 2, 12, 0, '2023-02-25 16:19:42'),
(184, '\"<span class=\"text-info\">Chỉnh sửa các thông tin giỏ hàng chính xác theo quy định</span>\"', 'project_comment', 5, 2, 13, 0, '2023-02-25 16:19:42'),
(185, '\"<span class=\"text-info\">Chỉnh sửa các thông tin giỏ hàng chính xác theo quy định</span>\"', 'project_comment', 5, 2, 14, 0, '2023-02-25 16:19:42'),
(186, '1', 'project_status', 5, 2, 1, 0, '2023-02-25 16:20:06'),
(187, '1', 'project_status', 5, 2, 2, 1, '2023-02-25 16:20:06'),
(188, '1', 'project_status', 5, 2, 8, 1, '2023-02-25 16:20:06'),
(189, '1', 'project_status', 5, 2, 11, 0, '2023-02-25 16:20:06'),
(190, '1', 'project_status', 5, 2, 12, 0, '2023-02-25 16:20:06'),
(191, '1', 'project_status', 5, 2, 13, 0, '2023-02-25 16:20:06'),
(192, '1', 'project_status', 5, 2, 14, 0, '2023-02-25 16:20:06'),
(193, '<span class=\"text-info\">Giảm giá và khuyến mãi</span>', 'new_task', 15, 2, 8, 1, '2023-02-25 16:37:36'),
(194, '<span class=\"text-info\">Giảm giá và khuyến mãi</span>', 'new_task', 15, 2, 11, 0, '2023-02-25 16:37:36'),
(195, '<span class=\"text-info\">Giảm giá và khuyến mãi</span>', 'new_task', 15, 2, 14, 0, '2023-02-25 16:37:36'),
(197, '2', 'task_status', 15, 2, 8, 1, '2023-02-25 16:39:04'),
(198, '2', 'task_status', 15, 2, 11, 0, '2023-02-25 16:39:04'),
(199, '2', 'task_status', 15, 2, 14, 0, '2023-02-25 16:39:04'),
(201, '<span class=\"text-info\">Đánh giá sản phẩm</span>', 'new_task', 17, 2, 8, 1, '2023-02-25 16:41:13'),
(202, '<span class=\"text-info\">Đánh giá sản phẩm</span>', 'new_task', 17, 2, 11, 0, '2023-02-25 16:41:13'),
(203, '<span class=\"text-info\">Đánh giá sản phẩm</span>', 'new_task', 17, 2, 14, 0, '2023-02-25 16:41:13'),
(204, '<span class=\"text-info\">Đăng ký tài khoản</span>', 'new_task', 18, 2, 12, 0, '2023-02-25 16:53:50'),
(205, '<span class=\"text-info\">Đăng ký tài khoản</span>', 'new_task', 18, 2, 13, 0, '2023-02-25 16:53:50'),
(206, '<span class=\"text-info\">Đăng ký tài khoản</span>', 'new_task', 18, 2, 10, 0, '2023-02-25 16:53:50'),
(207, '<span class=\"text-info\">Tìm kiếm và kết bạn</span>', 'new_task', 19, 2, 9, 0, '2023-02-25 16:54:39'),
(208, '<span class=\"text-info\">Tìm kiếm và kết bạn</span>', 'new_task', 19, 2, 10, 0, '2023-02-25 16:54:39'),
(209, '<span class=\"text-info\">Tường nhà</span>', 'new_task', 20, 2, 9, 0, '2023-02-25 16:56:49'),
(210, '<span class=\"text-info\">Tường nhà</span>', 'new_task', 20, 2, 12, 0, '2023-02-25 16:56:49'),
(211, '<span class=\"text-info\">Tường nhà</span>', 'new_task', 20, 2, 10, 0, '2023-02-25 16:56:49'),
(212, '3', 'task_status', 19, 2, 9, 0, '2023-02-25 16:58:28'),
(213, '3', 'task_status', 19, 2, 10, 0, '2023-02-25 16:58:28'),
(214, '<span class=\"text-info\">Thích và bình luận</span>', 'new_task', 21, 2, 9, 0, '2023-02-25 16:59:57'),
(215, '<span class=\"text-info\">Thích và bình luận</span>', 'new_task', 21, 2, 12, 0, '2023-02-25 16:59:57'),
(216, '<span class=\"text-info\">Thích và bình luận</span>', 'new_task', 21, 2, 10, 0, '2023-02-25 16:59:57'),
(217, '<span class=\"text-info\">Đăng ký và đăng nhập</span>', 'new_task', 22, 2, 11, 0, '2023-02-25 17:16:27'),
(218, '<span class=\"text-info\">Đăng ký và đăng nhập</span>', 'new_task', 22, 2, 12, 0, '2023-02-25 17:16:27'),
(219, '<span class=\"text-info\">Đăng ký và đăng nhập</span>', 'new_task', 22, 2, 17, 0, '2023-02-25 17:16:27'),
(220, '<span class=\"text-info\">Quản lý học sinh</span>', 'new_task', 23, 2, 13, 0, '2023-02-25 17:17:24'),
(221, '<span class=\"text-info\">Quản lý học sinh</span>', 'new_task', 23, 2, 17, 0, '2023-02-25 17:17:24'),
(222, '<span class=\"text-info\">Quản lý giáo viên</span>', 'new_task', 24, 2, 11, 0, '2023-02-25 17:18:47'),
(223, '<span class=\"text-info\">Quản lý giáo viên</span>', 'new_task', 24, 2, 13, 0, '2023-02-25 17:18:47'),
(224, '<span class=\"text-info\">Quản lý giáo viên</span>', 'new_task', 24, 2, 17, 0, '2023-02-25 17:18:47'),
(225, '<span class=\"text-info\">Quản lý lớp học</span>', 'new_task', 25, 2, 11, 0, '2023-02-25 17:20:07'),
(226, '<span class=\"text-info\">Quản lý lớp học</span>', 'new_task', 25, 2, 13, 0, '2023-02-25 17:20:07'),
(227, '<span class=\"text-info\">Quản lý lớp học</span>', 'new_task', 25, 2, 17, 0, '2023-02-25 17:20:07'),
(228, '<span class=\"text-info\">Quản lý điểm số</span>', 'new_task', 26, 2, 13, 0, '2023-02-25 17:21:05'),
(229, '<span class=\"text-info\">Quản lý điểm số</span>', 'new_task', 26, 2, 17, 0, '2023-02-25 17:21:05'),
(235, 'Dự án công ty công nghệ Toshiba', 'new_meeting', 11, 2, 9, 0, '2023-02-25 17:33:35'),
(236, 'Dự án công ty công nghệ Toshiba', 'new_meeting', 11, 2, 12, 0, '2023-02-25 17:33:35'),
(237, 'Dự án công ty công nghệ Toshiba', 'new_meeting', 11, 2, 13, 0, '2023-02-25 17:33:35'),
(238, 'Leave request received', 'leave_request', 5, 1, 2, 1, '2023-02-25 21:00:01'),
(239, 'leave request accepted', 'leave_request_accepted', 5, 2, 1, 0, '2023-02-25 21:01:38'),
(240, 'Leave request received', 'leave_request', 6, 8, 2, 1, '2023-02-25 21:02:48'),
(241, 'Dự án công ty công nghệ Toshiba', 'new_meeting', 12, 2, 9, 0, '2023-02-26 06:18:05'),
(242, 'Dự án công ty công nghệ Toshiba', 'new_meeting', 12, 2, 12, 0, '2023-02-26 06:18:05'),
(243, 'Dự án công ty công nghệ Toshiba', 'new_meeting', 12, 2, 13, 0, '2023-02-26 06:18:05');

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

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `client_id`, `created_by`, `title`, `description`, `starting_date`, `ending_date`, `status`, `created`, `budget`) VALUES
(5, 14, 2, 'Dự án công ty Monstarlab', 'Website bán hàng sản phẩm', '2023-02-09', '2023-08-26', 2, '2023-02-20 15:23:36', '2000'),
(6, 7, 2, 'Dự án công ty AvePoint Viet Nam', 'Xây dựng website giáo dục', '2022-05-22', '2022-11-08', 3, '2023-02-20 15:54:51', '50000'),
(35, 10, 2, 'Dự án công ty công nghệ Toshiba', 'Xây dựng website mạng xã hội Huchat', '2023-02-06', '2023-07-22', 1, '2023-02-25 09:59:28', '20000'),
(36, 17, 2, 'Dự án công ty phần mềm Hoàng Hà', 'Dự án website quản lý học sinh trường học', '2023-05-10', '2024-07-13', 1, '2023-02-25 10:03:14', '100000');

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

--
-- Dumping data for table `project_users`
--

INSERT INTO `project_users` (`id`, `user_id`, `project_id`, `created`) VALUES
(106, 1, 5, '2023-02-25 16:20:06'),
(107, 2, 5, '2023-02-25 16:20:06'),
(108, 8, 5, '2023-02-25 16:20:06'),
(109, 11, 5, '2023-02-25 16:20:06'),
(110, 12, 5, '2023-02-25 16:20:06'),
(111, 13, 5, '2023-02-25 16:20:06'),
(112, 1, 6, '2023-02-25 16:35:32'),
(113, 2, 6, '2023-02-25 16:35:32'),
(114, 11, 6, '2023-02-25 16:35:32'),
(115, 12, 6, '2023-02-25 16:35:32'),
(122, 9, 35, '2023-02-25 16:51:09'),
(123, 12, 35, '2023-02-25 16:51:09'),
(124, 13, 35, '2023-02-25 16:51:09'),
(125, 2, 36, '2023-02-25 17:12:47'),
(126, 11, 36, '2023-02-25 17:12:47'),
(127, 12, 36, '2023-02-25 17:12:47'),
(128, 13, 36, '2023-02-25 17:12:47');

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
(1, 'general', '{\"company_name\":\"BKPMS\",\"footer_text\":\"BKPMS - Hedspi 2023 \\u2764\\ufe0f\\ufe0f\",\"google_analytics\":\"\",\"currency_code\":\"USD\",\"currency_symbol\":\"$\",\"mysql_timezone\":\"+07:00\",\"php_timezone\":\"Asia\\/Ho_Chi_Minh\",\"date_format\":\"d-m-Y\",\"time_format\":\"H:i\",\"date_format_js\":\"DD-MM-YYYY\",\"time_format_js\":\"H:mm\",\"file_upload_format\":\"jpg|png|jpeg|zip|doc|pdf\",\"default_language\":\"vietNam\",\"full_logo\":\"logoaa.png\",\"half_logo\":\"f5219ab8e28926d77f98.png\",\"favicon\":\"f5219ab8e28926d77f981.png\",\"email_activation\":\"1\",\"theme_color\":\"#f25050\"}', '2020-05-18 06:15:11'),
(2, 'email', '{\"smtp_host\":\"smtp.gmail.com.\",\"smtp_port\":\"465\",\"smtp_username\":\"thiensuquanquan@gmail.com\",\"smtp_password\":\"fvxbjbbuqjnffekf\",\"smtp_encryption\":\"ssl\",\"email_library\":\"phpmailer\",\"from_email\":\"thiensuquanquan@gmail.com\"}', '2020-05-18 06:15:11'),
(3, 'permissions', '{\"project_view\":1,\"project_create\":0,\"project_edit\":0,\"project_delete\":0,\"task_view\":1,\"task_create\":0,\"task_edit\":0,\"task_delete\":0,\"user_view\":1,\"client_view\":0,\"setting_view\":0,\"setting_update\":0,\"todo_view\":1,\"notes_view\":1,\"chat_view\":1,\"chat_delete\":1,\"team_members_and_client_can_chat\":0,\"task_status\":1,\"project_budget\":0,\"gantt_view\":1,\"gantt_edit\":0,\"calendar_view\":1,\"meetings_view\":1,\"meetings_create\":0,\"meetings_edit\":0,\"meetings_delete\":0,\"lead_view\":0,\"lead_create\":0,\"lead_edit\":0,\"lead_delete\":0}', '2020-05-18 06:15:11'),
(4, 'system_version', '5.5', '2020-05-18 06:15:11'),
(5, 'clients_permissions', '{\"project_view\":0,\"project_create\":0,\"project_edit\":0,\"project_delete\":0,\"task_view\":0,\"task_create\":0,\"task_edit\":0,\"task_delete\":0,\"user_view\":0,\"client_view\":0,\"setting_view\":0,\"setting_update\":0,\"todo_view\":0,\"notes_view\":0,\"chat_view\":1,\"chat_delete\":0,\"team_members_and_client_can_chat\":0,\"task_status\":0,\"project_budget\":0,\"gantt_view\":0,\"gantt_edit\":0,\"calendar_view\":0,\"meetings_view\":0,\"meetings_create\":0,\"meetings_edit\":0,\"meetings_delete\":0,\"lead_view\":0,\"lead_create\":0,\"lead_edit\":0,\"lead_delete\":0}', '2021-01-20 06:06:37'),
(6, 'company_1', '{\"company_name\":\"C\\u00f4ng ty Ph\\u00e2n B\\u00f3n Hoa Sen\",\"address\":\"1 \\u0110\\u1ea1i C\\u1ed3 Vi\\u1ec7t, B\\u00e1ch Khoa, Hai B\\u00e0 Tr\\u01b0ng, H\\u00e0 N\\u1ed9i\",\"city\":\"H\\u00e0 N\\u1ed9i\",\"state\":\"California\",\"country\":\"Vi\\u1ec7t Nam\",\"zip_code\":\"94039\"}', '2021-03-25 09:17:13'),
(7, 'company_2', '{\"company_name\":\"shoppe\",\"address\":\"\",\"city\":\"\",\"state\":\"\",\"country\":\"\",\"zip_code\":\"\"}', '2022-09-19 13:45:42'),
(9, 'company_7', '{\"company_name\":\"AvePoint Viet Nam\",\"address\":\"\",\"city\":\"\",\"state\":\"\",\"country\":\"\",\"zip_code\":\"\"}', '2023-02-06 15:44:24'),
(11, 'company_4', '{\"company_name\":\"C\\u00f4ng ty TNHH Panasonic\",\"address\":\"\",\"city\":\"\",\"state\":\"\",\"country\":\"\",\"zip_code\":\"\"}', '2023-02-25 09:46:18'),
(12, 'company_10', '{\"company_name\":\"C\\u00f4ng ty c\\u00f4ng ngh\\u1ec7 Toshiba\",\"address\":\"\",\"city\":\"\",\"state\":\"\",\"country\":\"\",\"zip_code\":\"\"}', '2023-02-25 09:46:53'),
(13, 'company_14', '{\"company_name\":\"C\\u00f4ng ty Monstarb lab\",\"address\":\"\",\"city\":\"\",\"state\":\"\",\"country\":\"\",\"zip_code\":\"\"}', '2023-02-25 09:48:30'),
(14, 'company_15', '{\"company_name\":\"C\\u00f4ng ty Hawei\",\"address\":\"\",\"city\":\"\",\"state\":\"\",\"country\":\"\",\"zip_code\":\"\"}', '2023-02-25 09:49:27'),
(15, 'company_16', '{\"company_name\":\"C\\u00f4ng ty Luvina\",\"address\":\"\",\"city\":\"\",\"state\":\"\",\"country\":\"\",\"zip_code\":\"\"}', '2023-02-25 09:56:06'),
(16, 'company_17', '{\"company_name\":\"C\\u00f4ng ty ph\\u1ea7n m\\u1ec1m Ho\\u00e0ng H\\u00e0\",\"address\":\"\",\"city\":\"\",\"state\":\"\",\"country\":\"\",\"zip_code\":\"\"}', '2023-02-25 09:57:15'),
(17, 'company_18', '{\"company_name\":\"C\\u00f4ng ty c\\u00f4ng ngh\\u1ec7 Sam Sung\",\"address\":\"\",\"city\":\"\",\"state\":\"\",\"country\":\"\",\"zip_code\":\"\"}', '2023-02-25 10:11:44'),
(18, 'company_19', '{\"company_name\":\"C\\u00f4ng ty c\\u00f4ng ngh\\u1ec7 x\\u1ed5 s\\u1ed1 ki\\u00ean thi\\u1ebft\",\"address\":\"\",\"city\":\"\",\"state\":\"\",\"country\":\"\",\"zip_code\":\"\"}', '2023-02-25 10:13:22'),
(19, 'company_20', '{\"company_name\":\"C\\u00f4ng ty c\\u00f4ng ngh\\u1ec7 Ho\\u00e0ng Anh\",\"address\":\"\",\"city\":\"\",\"state\":\"\",\"country\":\"\",\"zip_code\":\"\"}', '2023-02-25 10:26:07');

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

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `project_id`, `created_by`, `title`, `description`, `starting_date`, `due_date`, `priority`, `status`, `created`) VALUES
(5, 6, 2, 'Tạo tài khoản và đăng nhập', 'Cho phép người dùng đăng ký tài khoản mới và đăng nhập vào trang web của bạn. Điều này sẽ cho phép người dùng theo dõi tiến trình học tập của họ và tiếp cận các tài nguyên đào tạo cá nhân hóa.', '2022-05-22', '2022-09-19', 2, 4, '2023-02-25 10:55:09'),
(6, 6, 2, 'Chia sẻ tài liệu giáo dục', 'Đăng tải các tài liệu giáo dục, bao gồm sách giáo khoa, bài giảng, bài tập, đề thi, v.v. Những tài liệu này có thể được sắp xếp theo chủ đề, lớp học và môn học.', '2022-06-03', '2022-07-11', 3, 4, '2023-02-25 10:56:52'),
(7, 6, 2, 'Cung cấp khóa học trực tuyến:', 'Cho phép người dùng đăng ký các khóa học trực tuyến. Các khóa học này có thể bao gồm các video học tập, bài tập, bài giảng, kiểm tra và đánh giá.', '2022-08-10', '2022-11-01', 2, 4, '2023-02-25 15:51:06'),
(8, 6, 2, 'Cập nhật thông tin về giáo dục', 'Cung cấp tin tức và bài viết mới nhất về giáo dục, bao gồm các chương trình giáo dục mới, các phương pháp giảng dạy mới và các xu hướng giáo dục.', '2022-09-07', '2022-11-08', 3, 4, '2023-02-25 15:56:22'),
(9, 5, 2, 'Danh mục sản phẩm', 'Danh mục sản phẩm giúp người dùng dễ dàng tìm kiếm sản phẩm theo danh mục.', '2023-05-27', '2023-06-09', 2, 1, '2023-02-25 16:05:18'),
(10, 5, 2, 'Trang chi tiết sản phẩm:', 'Trang chi tiết sản phẩm cung cấp thông tin chi tiết về sản phẩm, bao gồm mô tả, giá cả, hình ảnh, thông số kỹ thuật, đánh giá, v.v.', '2023-02-09', '2023-02-25', 2, 2, '2023-02-25 16:08:26'),
(11, 5, 2, 'Giỏ hàng', 'Chức năng giỏ hàng cho phép người dùng thêm sản phẩm vào giỏ hàng và xem tổng số tiền cần thanh toán.', '2023-02-16', '2023-03-09', 2, 2, '2023-02-25 16:09:04'),
(12, 5, 2, 'Thanh toán:', 'Chức năng thanh toán cho phép người dùng chọn phương thức thanh toán và nhập thông tin thanh toán.', '2023-03-09', '2023-03-12', 2, 1, '2023-02-25 16:09:47'),
(13, 5, 2, 'Đăng ký tài khoản', 'Chức năng đăng ký tài khoản cho phép người dùng tạo tài khoản để lưu trữ thông tin cá nhân, lịch sử mua hàng, đánh giá sản phẩm, v.v.', '2023-02-10', '2023-02-17', 1, 4, '2023-02-25 16:10:40'),
(14, 5, 2, 'Đăng nhập', 'Chức năng đăng nhập cho phép người dùng truy cập vào tài khoản của mình để xem thông tin cá nhân, lịch sử mua hàng, v.v.', '2023-02-10', '2023-04-15', 3, 3, '2023-02-25 16:12:23'),
(15, 5, 2, 'Giảm giá và khuyến mãi', 'Trang web bán hàng có thể cung cấp các chương trình giảm giá, khuyến mãi, mã giảm giá để thu hút khách hàng mua sản phẩm.', '2023-04-15', '2023-06-26', 2, 1, '2023-02-25 16:37:36'),
(17, 5, 2, 'Đánh giá sản phẩm', 'Chức năng đánh giá sản phẩm cho phép người dùng đánh giá và viết bình luận về sản phẩm mà họ đã mua.', '2023-06-16', '2023-08-26', 2, 1, '2023-02-25 16:41:13'),
(18, 35, 2, 'Đăng ký tài khoản', 'Chức năng đăng ký tài khoản cho phép người dùng tạo tài khoản trên trang web mạng xã hội để truy cập và sử dụng các tính năng của nó.', '2023-02-06', '2023-03-20', 2, 3, '2023-02-25 16:53:50'),
(19, 35, 2, 'Tìm kiếm và kết bạn', 'Trang web mạng xã hội cho phép người dùng tìm kiếm và kết bạn với những người có sở thích, chung tính cách hay mục tiêu giống nhau.', '2023-02-25', '2023-03-09', 2, 4, '2023-02-25 16:54:39'),
(20, 35, 2, 'Tường nhà', 'Chức năng tường nhà cho phép người dùng chia sẻ thông tin, cập nhật trạng thái, hình ảnh, video và các thông tin khác với bạn bè trên trang web mạng xã hội.', '2023-03-10', '2023-05-12', 2, 2, '2023-02-25 16:56:49'),
(21, 35, 2, 'Thích và bình luận', 'Chức năng thích và bình luận giúp người dùng có thể thể hiện cảm xúc và ý kiến của mình về các nội dung được chia sẻ trên trang web mạng xã hội', '2023-05-03', '2023-07-22', 2, 3, '2023-02-25 16:59:57'),
(22, 36, 2, 'Đăng ký và đăng nhập', 'Chức năng này cho phép giáo viên và học sinh đăng ký và đăng nhập để truy cập vào các tính năng của website.', '2023-05-10', '2023-06-17', 1, 1, '2023-02-25 17:16:27'),
(23, 36, 2, 'Quản lý học sinh', 'Chức năng này cho phép quản lý danh sách học sinh của lớp, thông tin học sinh bao gồm họ tên, ngày tháng năm sinh, địa chỉ, số điện thoại, hình ảnh, v.v.', '2023-06-15', '2023-07-06', 2, 1, '2023-02-25 17:17:24'),
(24, 36, 2, 'Quản lý giáo viên', 'Chức năng này cho phép quản lý danh sách giáo viên, thông tin giáo viên bao gồm họ tên, chức vụ, môn giảng dạy, thông tin liên hệ, v.v.', '2023-07-13', '2023-11-10', 2, 1, '2023-02-25 17:18:47'),
(25, 36, 2, 'Quản lý lớp học', 'Chức năng này cho phép quản lý thông tin lớp học, bao gồm tên lớp, niên khóa, phân lớp, danh sách học sinh, giáo viên phụ trách, v.v.', '2023-11-10', '2024-03-08', 3, 1, '2023-02-25 17:20:07'),
(26, 36, 2, 'Quản lý điểm số', 'Chức năng này cho phép quản lý điểm số của học sinh, bao gồm điểm kiểm tra, điểm thi, điểm rèn luyện, v.v.', '2024-01-12', '2024-07-13', 2, 1, '2023-02-25 17:21:05');

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

--
-- Dumping data for table `task_users`
--

INSERT INTO `task_users` (`id`, `user_id`, `task_id`, `created`) VALUES
(16, 1, 5, '2023-02-25 10:55:38'),
(17, 2, 5, '2023-02-25 10:55:38'),
(18, 2, 6, '2023-02-25 10:56:52'),
(19, 11, 6, '2023-02-25 10:56:52'),
(23, 2, 8, '2023-02-25 15:56:22'),
(24, 11, 8, '2023-02-25 15:56:22'),
(25, 1, 7, '2023-02-25 15:57:02'),
(26, 2, 7, '2023-02-25 15:57:02'),
(27, 11, 7, '2023-02-25 15:57:02'),
(34, 1, 10, '2023-02-25 16:08:26'),
(35, 8, 10, '2023-02-25 16:08:26'),
(36, 11, 10, '2023-02-25 16:08:26'),
(37, 8, 11, '2023-02-25 16:09:04'),
(38, 11, 11, '2023-02-25 16:09:04'),
(39, 8, 12, '2023-02-25 16:09:47'),
(40, 11, 12, '2023-02-25 16:09:47'),
(41, 2, 13, '2023-02-25 16:10:40'),
(43, 2, 14, '2023-02-25 16:22:42'),
(44, 2, 9, '2023-02-25 16:28:41'),
(45, 11, 9, '2023-02-25 16:28:41'),
(49, 8, 15, '2023-02-25 16:39:04'),
(50, 11, 15, '2023-02-25 16:39:04'),
(51, 8, 17, '2023-02-25 16:41:13'),
(52, 11, 17, '2023-02-25 16:41:13'),
(53, 12, 18, '2023-02-25 16:53:50'),
(54, 13, 18, '2023-02-25 16:53:50'),
(56, 9, 20, '2023-02-25 16:56:49'),
(57, 12, 20, '2023-02-25 16:56:49'),
(58, 9, 19, '2023-02-25 16:58:28'),
(59, 9, 21, '2023-02-25 16:59:57'),
(60, 12, 21, '2023-02-25 16:59:57'),
(61, 11, 22, '2023-02-25 17:16:27'),
(62, 12, 22, '2023-02-25 17:16:27'),
(63, 13, 23, '2023-02-25 17:17:24'),
(64, 11, 24, '2023-02-25 17:18:47'),
(65, 13, 24, '2023-02-25 17:18:47'),
(66, 11, 25, '2023-02-25 17:20:07'),
(67, 13, 25, '2023-02-25 17:20:07'),
(69, 13, 26, '2023-02-25 17:21:34');

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

--
-- Dumping data for table `timesheet`
--

INSERT INTO `timesheet` (`id`, `project_id`, `task_id`, `user_id`, `note`, `starting_time`, `ending_time`, `created`) VALUES
(6, 6, 7, 1, 'Các khóa học cần được cung cấp đầy đủ', '2023-08-09 17:00:00', '2023-10-31 17:00:00', '2023-02-25 20:31:35'),
(7, 36, 25, 11, 'Lan sẽ hoàn thành các chức năng quản lý lớp học bao gồm tên lớp niên khóa', '2023-11-09 17:00:00', '2024-01-05 17:00:00', '2023-02-25 20:33:23'),
(8, 36, 25, 13, 'Các chức năng danh sách học sinh giáo viên phụ trách', '2024-01-02 17:00:00', '2024-03-07 17:00:00', '2023-02-25 20:36:12'),
(9, 36, 26, 13, 'Chức năng này cho phép quản lý điểm số của học sinh, bao gồm điểm kiểm tra, điểm thi, điểm rèn luyện, v.v.', '2024-01-11 17:00:00', '2024-07-12 17:00:00', '2023-02-25 20:37:27'),
(10, 36, 26, 2, '', '2023-02-25 20:37:42', '2023-02-25 20:46:14', '2023-02-25 20:37:42'),
(11, 36, 26, 2, 'Tiếp tục làm tiếp', '2023-02-25 20:37:44', '2023-02-25 20:46:03', '2023-02-25 20:37:44'),
(12, 35, 20, 9, 'Chức năng tường nhà cho phép người dùng chia sẻ thông tin, cập nhật trạng thái, hình ảnh, video và các thông tin khác với bạn bè trên trang web mạng xã hội.', '2023-03-09 17:00:00', '2023-05-11 17:00:00', '2023-02-25 20:44:17'),
(13, 35, 20, 12, 'Chức năng tường nhà cho phép người dùng chia sẻ thông tin, cập nhật trạng thái, hình ảnh, video và các thông tin khác với bạn bè trên trang web mạng xã hội.', '2023-03-09 17:00:00', '2023-05-11 17:00:00', '2023-02-25 20:47:12'),
(14, 35, 19, 9, '', '2023-02-24 17:00:00', '2023-03-08 17:00:00', '2023-02-25 20:48:03'),
(15, 5, 13, 2, 'Chức năng đăng ký tài khoản cho phép người dùng tạo tài khoản để lưu trữ thông tin cá nhân, lịch sử mua hàng, đánh giá sản phẩm, v.v.', '2023-02-09 17:00:00', '2023-02-16 17:00:00', '2023-02-25 20:48:56'),
(16, 5, 11, 8, 'Chức năng giỏ hàng cho phép người dùng thêm sản phẩm vào giỏ hàng và xem tổng số tiền cần thanh toán.', '2023-02-15 17:00:00', '2023-03-08 17:00:00', '2023-02-25 20:49:44'),
(17, 35, 20, 2, '', '2023-02-26 10:32:34', '2023-02-26 10:32:37', '2023-02-26 10:32:34'),
(18, 35, 20, 2, '', '2023-02-26 10:32:41', NULL, '2023-02-26 10:32:41');

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

--
-- Dumping data for table `todo`
--

INSERT INTO `todo` (`id`, `user_id`, `todo`, `due_date`, `done`, `created`) VALUES
(3, 2, 'Dự án công ty Monstarlab: Danh mục sản phẩm', '2023-06-09', 0, '2023-02-25 20:50:57'),
(4, 2, 'Dự án công ty Monstarlab: Đăng nhập', '2023-04-15', 0, '2023-02-25 20:51:46'),
(5, 2, 'Dự án công ty Monstarlab: Đăng ký tài khoản', '2023-02-17', 1, '2023-02-25 20:52:23'),
(6, 2, 'Dự án công ty AvePoint Viet Nam : Cho phép người dùng đăng ký các khóa học trực tuyến. Các khóa học này có thể bao gồm các video học tập, bài tập, bài giảng, kiểm tra và đánh giá.', '2022-11-01', 1, '2023-02-25 20:53:41'),
(7, 2, 'Dự án công ty AvePoint Viet Nam: Chia sẻ tài liệu giáo dục', '2022-07-11', 1, '2023-02-25 20:54:43'),
(8, 2, 'Dự án công ty AvePoint Viet Nam: Tạo tài khoản và đăng nhập', '2022-09-09', 1, '2023-02-25 20:56:24');

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
(1, '127.0.0.1', 'chieumu1999@gmail.com', '$2y$10$axb7RrrmvW33C/3U9lifMOyf10ujXvftn.s1Ue0houXiRV.qwLCCG', 'chieumu1999@gmail.com', NULL, '', NULL, NULL, NULL, '618b236498aefdcdfffbcbdf0c3f2023a5c34dc7', '$2y$10$gG7Jl8y/FcHHNN70vkMQj.m1Q68idEiWorrNayMhSP1PcdipwF6kG', 1268889823, 1677342314, 1, 'Phạm', 'Chiểu', NULL, '01213281998', 'Chiểu.jpg'),
(2, '::1', 'thiensuquanquan@gmail.com', '$2y$12$GQVz1bhwGFZiPCVQcu.DKe0HzqpiYdA8w6r0wcjdRowRn7CKkptI6', 'thiensuquanquan@gmail.com', NULL, NULL, NULL, NULL, NULL, '739727c7a562e2bfd959f76102428a8f29703e33', '$2y$10$wBTTcMpWdQ.ua8PAgnTbje4yyCIehkm1DrJ1Bz11qPcJowmcFHFVi', 1663595142, 1677407150, 1, 'Phạm', 'Huấn', NULL, '0968646031', '324411894_696170042091221_1731149516947881607_n.jpg'),
(4, '::1', 'huan.pt176771@sis.hust.edu.vn', '$2y$10$DO1n8qKQkX9SEnYtTneKDeC50C.BtDbVj/8c6DzJxxgPPjmaHbUL2', 'huan.pt176771@sis.hust.edu.vn', NULL, NULL, '364e97aa2d0311b357e6', '$2y$10$zr57NprlgeyCoZI/YcYcGu0OpLpfpvCKA3twiKlqeg.7C8xnsbOAq', 1676993252, '3977b6bd45667ef2c10c09f313553948d1d184cd', '$2y$10$q185O5SpD9jy/kSUDZclx..MaL9LWgRfJ6cja/TOJHcTRK/Tt2jBm', 1672933640, 1676687597, 1, 'Phạm Hoài', 'An', 'Công ty TNHH Panasonic', '0123475121', NULL),
(7, '::1', 'thiensuquanquanno3@gmail.com', '$2y$10$c64cCfW6vuUvRGWgFhX.qeOf/MGxevfA9bI2bpwnBuqEunoIcMCz2', 'thiensuquanquanno3@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1675698264, NULL, 1, 'Phạm', 'Cường', 'AvePoint Viet Nam', '0123456789', NULL),
(8, '::1', 'thiensuquanquanq@gmail.com', '$2y$10$0KqZ2nEvbDYOAtO6FOylt.1UDIgJVfaXmajZwjIt0aJrChqIaNTJy', 'thiensuquanquanq@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1676909148, NULL, 1, 'Phạm', 'Hoàng', NULL, '0987713491', 'Hoàng.jpg'),
(9, '::1', 'thiensuquanquan2@gmail.com', '$2y$10$86J920Uh.bElyenqrwrngujIhNlrmQsK6HkT5KeiFYWt8VN4OceHe', 'thiensuquanquan2@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1676909192, NULL, 1, 'Phạm', 'Hảo', NULL, '0123456789', 'Cương.jpg'),
(10, '::1', 'thiensuquanquann3@gmail.com', '$2y$10$WBYYGDN9Hy9efWFxTOrNJeGYMck7ZXQdXD5CQU.mp9yJ5UzByM0/W', 'thiensuquanquann3@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1676909299, NULL, 1, 'Nguyễn', 'Cương', 'Công ty công nghệ Toshiba', '01213281998', NULL),
(11, '::1', 'phamlan1998216@gmail.com', '$2y$10$lGEWFJqsy5IDldZL.H9P6u2KL12SRG/0lu5fIdgs7ZeM5uf9z8Thi', 'phamlan1998216@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1677058675, NULL, 1, 'Phạm', 'Lan', NULL, '0968646031', 'Lan.jpg'),
(12, '::1', 'thiensuquanquan1@gmail.com', '$2y$10$oKxx1ek1igCSv3f5z3nwB.b16o/aUTw6YhUzkhuXY8oNSPF0kA5ZO', 'thiensuquanquan1@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1677317699, NULL, 1, 'Phạm', 'Huấn 1', NULL, '0123456789', 'Hoàng1.jpg'),
(13, '::1', 'thiensuquanquan3@gmail.com', '$2y$10$TvdGIP064D4qbfIK1itE.ec3W.q4YGDFZ.bD2N4JvO467gR71cvFy', 'thiensuquanquan3@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1677317818, NULL, 1, 'Phạm', 'Huấn 2', NULL, '01203123123', 'Huấn_2.jpg'),
(14, '::1', 'thiensuquanquan4@gmail.com', '$2y$10$U7hZCwVm9ksmxa3xxzOtOODJc.d7UuqV0Nkt/PLskT7ayCHan/fUm', 'thiensuquanquan4@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1677318510, NULL, 1, 'Nguyễn Thành', 'Long', 'Công ty Monstarb lab', '0968646342', NULL),
(15, '::1', 'hawei@gmail.com', '$2y$10$AdJVA9ngCt4JTv0gsQkLk.SNv7qtXuz8gyTZl8Egy7SvGrmCkjp6K', 'hawei@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1677318567, NULL, 1, 'Lý Hạo', 'Phong', 'Công ty Hawei', '0988888888', NULL),
(16, '::1', 'baoanh@luvina.com', '$2y$10$NkF.JWqj4nnAcuB81UfQ5eBBNdKjbbYDuh2jXQZBaZJa2z4jPk46e', 'baoanh@luvina.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1677318966, NULL, 1, 'Phạm Bảo', 'Anh', 'Công ty Luvina', '0967646032', NULL),
(17, '::1', 'anhtuan@gmail.com', '$2y$10$q4mFI34jc6.8sFb4bRVxu.cXgA6npVi8i7Zloh/lh7qromRG3vzfm', 'anhtuan@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1677319035, NULL, 1, 'Phạm Anh', 'Tuấn', 'Công ty phần mềm Hoàng Hà', '01213281967', NULL),
(18, '::1', 'anhhoan@samsung.com', '$2y$10$6CNzHNaDLELHg5owuAYa5.UpS5SmEwxkCJb1w35hvdDPXXjzFxKea', 'anhhoan@samsung.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1677319904, NULL, 1, 'Phạm Anh', 'Hoàn', 'Công ty công nghệ Sam Sung', '0312312421', NULL),
(19, '::1', 'haothien@gmail.com', '$2y$10$ybSd9m6AuTN9OWZmxWNe7u0aNbH5JN5e0kNkrWJWhVndp5WIrBNr2', 'haothien@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1677320002, NULL, 1, 'Lý Hạo', 'Thiên', 'Công ty công nghệ xổ số kiên thiết', '0394567283', NULL),
(20, '::1', 'anhquan@gmail.com', '$2y$10$FxoGdGx3rxqWqKI4/w39AuZZ8JiBMVEKv1rrv.Zbg9YbdcvQJB9iq', 'anhquan@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1677320767, NULL, 1, 'Phạm Anh', 'Quân', 'Công ty công nghệ Hoàng Anh', '0122324124', NULL);

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
(22, 1, 2),
(7, 2, 1),
(19, 4, 3),
(8, 7, 3),
(10, 8, 2),
(11, 9, 2),
(12, 10, 3),
(18, 11, 2),
(20, 12, 2),
(21, 13, 2),
(23, 14, 3),
(24, 15, 3),
(25, 16, 3),
(26, 17, 3),
(27, 18, 3),
(28, 19, 3),
(29, 20, 3);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `date_formats`
--
ALTER TABLE `date_formats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `leads`
--
ALTER TABLE `leads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `leaves`
--
ALTER TABLE `leaves`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `media_files`
--
ALTER TABLE `media_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `meetings`
--
ALTER TABLE `meetings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=254;

--
-- AUTO_INCREMENT for table `priorities`
--
ALTER TABLE `priorities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `project_status`
--
ALTER TABLE `project_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `project_users`
--
ALTER TABLE `project_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `task_status`
--
ALTER TABLE `task_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `task_users`
--
ALTER TABLE `task_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `timesheet`
--
ALTER TABLE `timesheet`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `time_formats`
--
ALTER TABLE `time_formats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `todo`
--
ALTER TABLE `todo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `users_groups`
--
ALTER TABLE `users_groups`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

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
