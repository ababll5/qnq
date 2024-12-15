-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2020-03-10 13:05:26
-- 服务器版本： 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tour`
--

-- --------------------------------------------------------

--
-- 表的结构 `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can add permission', 2, 'add_permission'),
(5, 'Can change permission', 2, 'change_permission'),
(6, 'Can delete permission', 2, 'delete_permission'),
(7, 'Can add group', 3, 'add_group'),
(8, 'Can change group', 3, 'change_group'),
(9, 'Can delete group', 3, 'delete_group'),
(10, 'Can add user', 4, 'add_user'),
(11, 'Can change user', 4, 'change_user'),
(12, 'Can delete user', 4, 'delete_user'),
(13, 'Can add content type', 5, 'add_contenttype'),
(14, 'Can change content type', 5, 'change_contenttype'),
(15, 'Can delete content type', 5, 'delete_contenttype'),
(16, 'Can add session', 6, 'add_session'),
(17, 'Can change session', 6, 'change_session'),
(18, 'Can delete session', 6, 'delete_session'),
(19, 'Can add 旅游攻略', 7, 'add_article'),
(20, 'Can change 旅游攻略', 7, 'change_article'),
(21, 'Can delete 旅游攻略', 7, 'delete_article'),
(22, 'Can add 评论', 8, 'add_comment'),
(23, 'Can change 评论', 8, 'change_comment'),
(24, 'Can delete 评论', 8, 'delete_comment'),
(25, 'Can add 用户', 9, 'add_extuser'),
(26, 'Can change 用户', 9, 'change_extuser'),
(27, 'Can delete 用户', 9, 'delete_extuser'),
(28, 'Can add 酒店', 10, 'add_hotel'),
(29, 'Can change 酒店', 10, 'change_hotel'),
(30, 'Can delete 酒店', 10, 'delete_hotel'),
(31, 'Can add 评分', 11, 'add_score'),
(32, 'Can change 评分', 11, 'change_score'),
(33, 'Can delete 评分', 11, 'delete_score'),
(34, 'Can add 景点', 12, 'add_view'),
(35, 'Can change 景点', 12, 'change_view'),
(36, 'Can delete 景点', 12, 'delete_view'),
(37, 'Can add 订单', 13, 'add_order'),
(38, 'Can change 订单', 13, 'change_order'),
(39, 'Can delete 订单', 13, 'delete_order');

-- --------------------------------------------------------

--
-- 表的结构 `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$36000$JN4camcfD7uL$vaEAcoPjlLH7PMjkTlJVP1BPRT7idAwK1TDTyGAOqXA=', '2020-02-14 06:10:20.542116', 1, 'False', '', '', 'admin@126.com', 1, 1, '2020-02-11 12:56:29.001807'),
(2, 'pbkdf2_sha256$36000$IlGkSJYzHJzW$vOMAS+iXg3gPhG3fiK9HuVjD1SvmOZpMqXCTpLGtr5Q=', '2020-02-14 08:30:33.969214', 0, 'test', '', '', '879510745@128.com', 0, 1, '2020-02-14 07:00:01.879859'),
(3, 'pbkdf2_sha256$36000$cITkT0WlLITd$JaLtPT66YEUAsQj2VvcjRFnVVb+ntg8I23f2RGjtguw=', '2020-03-09 11:54:13.449810', 0, 'qaz', '', '', '123@126.com', 0, 1, '2020-03-09 11:54:13.001784');

-- --------------------------------------------------------

--
-- 表的结构 `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2020-02-11 13:09:23.594062', '1', '云南-昆明-大明湖-1', 1, '[{\"added\": {}}]', 12, 1),
(2, '2020-02-11 13:18:47.555136', '1', '昆明泉世纪大酒店', 1, '[{\"added\": {}}]', 10, 1),
(3, '2020-02-11 13:21:18.704987', '2', '润恒大酒店(人民西路店)', 1, '[{\"added\": {}}]', 10, 1),
(4, '2020-02-14 06:12:55.548603', '1', '云南-昆明-翠湖公园-1', 2, '[{\"changed\": {\"fields\": [\"img\", \"view_name\", \"view_desc\"]}}]', 12, 1),
(5, '2020-02-14 06:13:51.746115', '2', '云南-昆明-大观楼-2', 1, '[{\"added\": {}}]', 12, 1),
(6, '2020-02-14 06:14:34.859114', '3', '云南-昆明-海埂公园-3', 1, '[{\"added\": {}}]', 12, 1),
(7, '2020-02-14 06:15:17.255040', '4', '云南-昆明-海埂公园-4', 1, '[{\"added\": {}}]', 12, 1),
(8, '2020-02-14 06:15:42.303219', '4', '云南-昆明-金殿-4', 2, '[{\"changed\": {\"fields\": [\"view_name\", \"view_desc\"]}}]', 12, 1),
(9, '2020-02-14 06:16:24.858184', '5', '云南-昆明-金马碧鸡坊-5', 1, '[{\"added\": {}}]', 12, 1),
(10, '2020-02-14 06:17:16.845460', '6', '云南-昆明-西山风景区-6', 1, '[{\"added\": {}}]', 12, 1),
(11, '2020-02-14 06:17:55.347321', '7', '云南-昆明-园通寺-7', 1, '[{\"added\": {}}]', 12, 1),
(12, '2020-02-14 06:18:40.760535', '8', '云南-昆明-云南民族村-8', 1, '[{\"added\": {}}]', 12, 1),
(13, '2020-02-14 06:19:25.740618', '9', '云南-昆明-云南省博物馆-9', 1, '[{\"added\": {}}]', 12, 1),
(14, '2020-02-14 06:31:18.098902', '9', '云南-云南省昆明市广福路6393号-云南省博物馆-9', 2, '[{\"changed\": {\"fields\": [\"city\", \"view_desc\"]}}]', 12, 1),
(15, '2020-02-14 06:31:34.741759', '8', '云南-昆明市西南郊-云南民族村-8', 2, '[{\"changed\": {\"fields\": [\"city\"]}}]', 12, 1),
(16, '2020-02-14 06:31:49.870553', '7', '云南-昆明圆通街-园通寺-7', 2, '[{\"changed\": {\"fields\": [\"city\", \"view_desc\"]}}]', 12, 1),
(17, '2020-02-14 06:32:04.250305', '6', '云南-昆明市西郊滇池畔-西山风景区-6', 2, '[{\"changed\": {\"fields\": [\"city\", \"view_desc\"]}}]', 12, 1),
(18, '2020-02-14 06:32:17.990033', '5', '云南-昆明市中心三市街与金碧路汇处-金马碧鸡坊-5', 2, '[{\"changed\": {\"fields\": [\"city\", \"view_desc\"]}}]', 12, 1),
(19, '2020-02-14 06:32:35.013931', '4', '云南-昆明区东北郊7公里处的鸣凤山麓-金殿-4', 2, '[{\"changed\": {\"fields\": [\"city\", \"view_desc\"]}}]', 12, 1),
(20, '2020-02-14 06:32:47.353581', '3', '云南-昆明西山区滇池路1318号-海埂公园-3', 2, '[{\"changed\": {\"fields\": [\"city\", \"view_desc\"]}}]', 12, 1),
(21, '2020-02-14 06:32:59.447236', '2', '云南-昆明西山区大观路284号大观公园-大观楼-2', 2, '[{\"changed\": {\"fields\": [\"city\", \"view_desc\"]}}]', 12, 1),
(22, '2020-02-14 06:33:08.852730', '1', '云南-昆明五华区翠湖南路67号-翠湖公园-1', 2, '[{\"changed\": {\"fields\": [\"city\", \"view_desc\"]}}]', 12, 1),
(23, '2020-02-14 06:35:53.600479', '3', '春江花月酒店', 1, '[{\"added\": {}}]', 10, 1),
(24, '2020-02-14 06:36:33.944321', '4', '半舍湖畔客栈', 1, '[{\"added\": {}}]', 10, 1),
(25, '2020-02-14 06:38:08.337501', '5', '莲花宾馆', 1, '[{\"added\": {}}]', 10, 1),
(26, '2020-02-14 06:42:16.547452', '6', '恬舍客栈', 1, '[{\"added\": {}}]', 10, 1),
(27, '2020-02-14 06:43:12.815987', '7', '华地王朝大酒店', 1, '[{\"added\": {}}]', 10, 1);

-- --------------------------------------------------------

--
-- 表的结构 `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'tour', 'article'),
(8, 'tour', 'comment'),
(9, 'tour', 'extuser'),
(10, 'tour', 'hotel'),
(13, 'tour', 'order'),
(11, 'tour', 'score'),
(12, 'tour', 'view');

-- --------------------------------------------------------

--
-- 表的结构 `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2020-02-11 12:55:42.854927'),
(2, 'auth', '0001_initial', '2020-02-11 12:55:44.555330'),
(3, 'admin', '0001_initial', '2020-02-11 12:55:46.006132'),
(4, 'admin', '0002_logentry_remove_auto_add', '2020-02-11 12:55:46.068532'),
(5, 'contenttypes', '0002_remove_content_type_name', '2020-02-11 12:55:46.411733'),
(6, 'auth', '0002_alter_permission_name_max_length', '2020-02-11 12:55:46.552133'),
(7, 'auth', '0003_alter_user_email_max_length', '2020-02-11 12:55:48.065336'),
(8, 'auth', '0004_alter_user_username_opts', '2020-02-11 12:55:48.096536'),
(9, 'auth', '0005_alter_user_last_login_null', '2020-02-11 12:55:48.283736'),
(10, 'auth', '0006_require_contenttypes_0002', '2020-02-11 12:55:48.299336'),
(11, 'auth', '0007_alter_validators_add_error_messages', '2020-02-11 12:55:48.314936'),
(12, 'auth', '0008_alter_user_username_max_length', '2020-02-11 12:55:48.502137'),
(13, 'sessions', '0001_initial', '2020-02-11 12:55:48.704937'),
(14, 'tour', '0001_initial', '2020-02-11 12:55:52.058943'),
(15, 'tour', '0002_view_img', '2020-02-11 13:05:30.806020'),
(16, 'tour', '0003_extuser_phone', '2020-02-14 06:46:13.590321'),
(17, 'tour', '0004_order', '2020-02-14 12:11:00.167019');

-- --------------------------------------------------------

--
-- 表的结构 `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('knxp1heo6k4vqoq1lxjjhzcu7tid2q4t', 'NzcxZTQ0M2NmMjdlYWM1ZDI2MTRkOGJkNzlhNzZhMzg3ZTQyNTU5Mjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyOWU5ZTJkZjY5MTQ4MGQ3NmM0MGFiMjczN2UzNGVkYTM5ZTUxMDViIn0=', '2020-02-28 07:00:02.204877'),
('xffnzdb66z7orbyjru14tbculqc7l2qz', 'YWY2ODc4NjMyNWFkZjEwNThjMzY1NTUzYzU4ZTdmN2E2NmZkNzMzNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3NWM3N2I0ZDQ0YzQ4MDc1ZjNmZjkwNWNmY2NkMTM0N2YyZjE3YzAyIn0=', '2020-02-25 12:57:40.547555');

-- --------------------------------------------------------

--
-- 表的结构 `tour_article`
--

CREATE TABLE `tour_article` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `time` datetime NOT NULL,
  `author_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tour_article`
--

INSERT INTO `tour_article` (`id`, `title`, `content`, `time`, `author_id`) VALUES
(1, '滇池旅游攻略', '彩云之南，云南昆明，四季如春，不仅仅在气候上吸引着越来越多的游客，更凭着它秀丽的风景，风格多样的食物吸引着越来越多的背包客前来昆明旅游，无论你是跟团行还是自由行，小编都希望以下的攻略对各位读者有那么一点点的帮助，现在就让我们一起去昆明旅游吧\r\n在昆明的交通，如果你是自由行的话，可以选择公交，地铁，出租车到自己想要的景点，小编个人觉得在昆明坐公交是比较方便的，公交直达昆明的大大小小的景点\r\n景点一，石林，石林是形成于2.7亿年前的经典喀斯特地貌，世界的古迹之一，里面都是导游介绍每一个景点，每一块石头的传说给大家，门票大约175元，因为是在郊区，需要打车，或者巴士,火车两小时的车程前往,最好早一点去,这样晚上就可以回来了,在里面还有民族习俗可以参加。\r\n滇池喂海鸥可以说是来昆明的动力之一了（海鸥只有冬天才来哈）滇池也是昆明的标志景点之一。光看图片就好美，成群的海鸥在水面上展翅飞翔，闭上眼睛感受海鸥飞过的阵阵气息，令人陶醉。来昆明不来滇池，算是白来了。\r\n\r\n', '2020-02-14 12:29:08.911524', 2);

-- --------------------------------------------------------

--
-- 表的结构 `tour_comment`
--

CREATE TABLE `tour_comment` (
  `id` int(11) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `comment_date` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `view_id` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `tour_extuser`
--

CREATE TABLE `tour_extuser` (
  `number` int(11) NOT NULL,
  `age` int(11) DEFAULT NULL,
  `sex` varchar(2) DEFAULT NULL,
  `address` varchar(30) DEFAULT NULL,
  `autograph` varchar(50) DEFAULT NULL,
  `greet` varchar(50) DEFAULT NULL,
  `labels` varchar(50) DEFAULT NULL,
  `register_date` date NOT NULL,
  `user_id` int(11) NOT NULL,
  `phone` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tour_extuser`
--

INSERT INTO `tour_extuser` (`number`, `age`, `sex`, `address`, `autograph`, `greet`, `labels`, `register_date`, `user_id`, `phone`) VALUES
(1054200, 24, '男', '昆明市官渡区', NULL, '你好', NULL, '2020-02-14', 1, '13588887777'),
(4365299, NULL, NULL, NULL, NULL, NULL, NULL, '2020-03-09', 3, NULL),
(7404831, 23, '男', '昆明市官渡区364', NULL, NULL, NULL, '2020-02-14', 2, '13514817716');

-- --------------------------------------------------------

--
-- 表的结构 `tour_hotel`
--

CREATE TABLE `tour_hotel` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `pic` varchar(100) NOT NULL,
  `intro` longtext NOT NULL,
  `price` double NOT NULL,
  `tel` varchar(20) NOT NULL,
  `address` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tour_hotel`
--

INSERT INTO `tour_hotel` (`id`, `title`, `pic`, `intro`, `price`, `tel`, `address`) VALUES
(1, '昆明泉世纪大酒店', 'static/upload/1-120326132T5-51.jpg', '昆明泉世纪大酒店 - 云南省昆明市官渡区春城路286', 40, '(0871)64870766', '云南省昆明市官渡区春城路286'),
(2, '润恒大酒店(人民西路店)', 'static/upload/vol20.jpg', '云南省昆明市西山区人民西路42', 166, '(0871)63301066', '云南省昆明市西山区人民西路42'),
(3, '春江花月酒店', 'static/upload/3.png', '春江花月酒店坐落于闻名遐迩的滇池畔，漫步于滇池大坝，舟泛鸥嬉，湖光山色，不胜惬意，云南民族村，海埂公园，西山龙门，大观楼，海埂会堂，滇池国际会展中心等地周围有公交车场、银行、便利店等生活配套设施完善，位置优越、交通便利。 \r\n  它是一所由昆明春江花月酒店管理有限公司精心打造的一家高端精品酒店，各类客房别致、高雅、舒适、独特。', 188, '(0871)64870766', '滇池畔'),
(4, '半舍湖畔客栈', 'static/upload/1.png', '昆明滇池度假区半舍湖畔客栈是昆明一家热门的酒店之一，从酒店到长水国际机场较近，到昆明火车站方便，交通方面均很便捷。包括滇池和云南民族村都在酒店周边，对于入住旅客想在该地区畅游会很方便，服务到位，价格实惠。', 288, '(0871)63301066', '云南省昆明市西山区人民西路42'),
(5, '莲花宾馆', 'static/upload/4.png', '莲花宾馆是一家集住宿、餐饮、娱乐、购物为一体的宾馆，始终致力于为宾客打造温馨舒适、绿色健康的驻足之所，曾获评中国绿色饭店委员会的“四叶级绿色饭店”荣誉。它位于人文气息浓厚的学府路，地理位置得天独厚，周边众多高校林立，附近莲花池公园风景秀丽宜人，距市中心仅5分钟的车程，交通便利。', 168, '(0871)64870743', '云南省昆明市官渡区春城路286'),
(6, '恬舍客栈', 'static/upload/1_Jl8ExQx.png', '旅客若想住在昆明的滇池风景区，那么昆明恬舍客栈将会是一个便捷的选择，交通都很便捷。附近有很多景点，包括云南民族村和滇池', 188, '(0871)64870766', '滇池度假区'),
(7, '华地王朝大酒店', 'static/upload/2.png', '华地王朝大酒店是云南华川集团有限公司旗下的“华地王朝”，位于昆明市高新技术产业开发区内，众多知名企业簇拥，是商务客人入住的优选。酒店设施、配套服务一应俱全，是集住宿、餐饮、娱乐和旅游商务服务为一体的综合性精品商务酒店周边交通便利设施完善。', 399, '(0871)63301066', '云南省昆明市高新技术产业开发区');

-- --------------------------------------------------------

--
-- 表的结构 `tour_order`
--

CREATE TABLE `tour_order` (
  `id` int(11) NOT NULL,
  `num` int(11) NOT NULL,
  `price` double NOT NULL,
  `date` varchar(20) NOT NULL,
  `time` datetime NOT NULL,
  `hotel_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tour_order`
--

INSERT INTO `tour_order` (`id`, `num`, `price`, `date`, `time`, `hotel_id`, `user_id`) VALUES
(1, 2, 376, '2020-01-02', '2020-02-14 12:13:20.222836', 3, 2),
(2, 1, 40, '2020-01-02', '2020-03-09 12:00:23.233960', 1, 3);

-- --------------------------------------------------------

--
-- 表的结构 `tour_score`
--

CREATE TABLE `tour_score` (
  `id` int(11) NOT NULL,
  `rate` int(11) NOT NULL,
  `comment_date` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `view_id` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `tour_view`
--

CREATE TABLE `tour_view` (
  `id` varchar(50) NOT NULL,
  `price` double NOT NULL,
  `province` varchar(20) NOT NULL,
  `city` varchar(20) NOT NULL,
  `view_name` varchar(25) NOT NULL,
  `view_desc` longtext NOT NULL,
  `view_rate` varchar(5) NOT NULL,
  `advise_time` varchar(20) NOT NULL,
  `img` varchar(100)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `tour_view`
--

INSERT INTO `tour_view` (`id`, `price`, `province`, `city`, `view_name`, `view_desc`, `view_rate`, `advise_time`, `img`) VALUES
('1', 30, '云南', '昆明五华区翠湖南路67号', '翠湖公园', '昆明翠湖公园位于昆明市区的北部螺峰山下，云南大学正门对面，是市区最漂亮的公园之一。虽然面积不大，但很有特色。这里最初曾是滇池中的一个湖湾，后来因水位下降而成为一汪清湖。自明朝起历任云南行政官员都曾在这里修亭建楼。由于垂柳和碧水构成其主要特色的缘故，本世纪初正式定名为翠湖。公园里的红嘴鸥很有名，在入冬时节都会飞到昆明来过冬，周末的时候有许多人都会聚在公园，老人和孩子们一起说说笑笑，传递着喜悦，值得游玩。\r\n  这是我们旅游的第一站，翠湖是这个美丽城市的中心花园，周围有许多的景点，像云南大学，陆军讲武堂等等，这就像一个中继站，你可以从任何地方返回来。', '2', '2', 'static/upload/4.jpg'),
('2', 23, '云南', '昆明西山区大观路284号大观公园', '大观楼', '大观楼最著名的应该是180字的长对联，它是中国第一长对联，世界第一长对联。首先上联为：\r\n   五百里滇池，奔来眼底，披襟岸帻，喜茫茫空阔无边。看东骧神骏，西翥灵仪，北走蜿蜒，南翔缟素。高人韵士，何妨选胜登临。趁蟹屿螺洲，梳理就风鬟雾鬓；更苹天苇地，点缀些翠羽丹霞，莫辜负四围香稻，万顷晴沙，九夏芙蓉，三春杨柳。\r\n  讲述是滇池的大小，以及整个景色的地理位置和沿岸景色的壮丽，绘出了一幅滇池以及周边景色的美丽风景画。整个上联写得气势恢宏，给人透露出一种霸气的感觉。\r\n  而相对的下联则是：数千年往事，注到心头，把酒凌虚，叹滚滚英雄谁在。想汉习楼船，唐标铁柱，宋挥玉斧，元跨革囊。伟烈丰功，费尽移山心力。尽珠帘画栋，卷不及暮雨朝云；便断碣残碑，都付与苍烟落照。只赢得几杵疏钟，半江渔火，两行秋雁，一枕清霜。\r\n  下联则是述出了云南的历史，感叹云南历史的风云变幻，发人深省，给人绘出一幅耐人寻味的历史画面。现在大观楼因长联而出名与黄鹤楼，岳阳楼，滕王阁齐名为我国的四大名楼之一。\r\n  当然，这里现在也成为老人孩子们平时休息放松的地方，在这你可以听到昆明独特的花灯，嬉戏声，欢笑声。同样里面也有许多的游乐设施，给孩子年轻人带来许多乐趣。', '2', '2', 'static/upload/3.jpg'),
('3', 25, '云南', '昆明西山区滇池路1318号', '海埂公园', '海埂公园是横海的脊，它是一个楔形的堤坝，也被称为海埂大坝，它从东向西横穿滇池，整个大坝长约5公里，宽60到300米。海埂大坝把滇池300多平方公里分成两部分，大坝南侧为滇池，北侧为草海，大坝东面是国家体育冬季训练基地，西面是海埂公园。\r\n  每天都有许多市民来进行体育锻炼，每到冬天，人们就来这里可以喂到红嘴鸥，海鸥在海面翱翔，与蓝蓝的海形成了一道风景画。\r\n  海埂公园同样也提供租车的服务，可以租到自行车或者慢跑，不仅可以欣赏风景，同样也可以进行有氧的建身活动，让心情和身体整个都放轻松，同样在这里眺望西山就像一位睡美人一样，趟在滇池上。', '4', '2', 'static/upload/3_iSF3Fbc.jpg'),
('4', 41, '云南', '昆明区东北郊7公里处的鸣凤山麓', '金殿', '金殿坐东向西，是云南著名的道观。主殿系青铜铸造，熠熠生辉，耀眼夺目，故名之“金殿”，是我国全国重点文物保护单位。金殿风景区建于明朝万历年间，这是明朝时期的一位巡抚模仿当年在湖北武当山太和殿和天柱峰金殿建筑风格带领当地人所建造的一座宫殿，从正门进入，我们要从山脚下沿途往上山走，可以一路感受自然风光，呼吸到最棒的新鲜空气。\r\n  我们会经过一日门，二日门和三日门，继续走的话就会登上天门，看到有历史风光的太和宫大门，穿过棂星门，沿着台阶走，就会看到著名的金殿，金殿的梁、柱、穹顶、波纹屋檐、罗马雕像、桌子、酒瓶、横幅都是用铜做的，所以会在阳光下闪闪发光，所以故名金殿，同样也是中国现存的纯铜的大殿，具有极高的历史价值。\r\n  同样相称的还有它周围的自然风光，这里绿树成荫，阳光穿过树隙，照出的斑斑点点同样也是一道风景画，伴随着鸟鸣声，这就像道教的文化的体现一般。', '4', '2', 'static/upload/3_Lh9rIrh.jpg'),
('5', 50, '云南', '昆明市中心三市街与金碧路汇处', '金马碧鸡坊', '可以看到俩扇坊门高12米，宽18米，雕梁画栋精美绝伦，东坊临金马山而名为金马坊，西坊靠碧鸡山而名为碧鸡坊，是昆明的象征。金马碧鸡坊始建于明朝宣德年间，至今已有近四百年的历史。我们可以看看早期的照片，已经有百年的历史，它是这个城市的古老的传承，载着许多人的记忆，作为昆明的地标，它的设计反映了云南古代人在建筑学，天文学等方面的领域的大成就。\r\n  虽然经过了重建，但它还是一种传承。换个角度作为中心地段，这里邻着南屏街和正义坊，有着繁华的地段，是年轻人小情侣来消遣与消费的地方。每到晚上，灯火通明，给人带来不错的观感。', '4', '1', 'static/upload/1.jpg'),
('6', 20, '云南', '昆明市西郊滇池畔', '西山风景区', '俗话说的好：”不到龙门非好汉“。这句话说的就是爬西山时的俗话。说到西山，这里不得不提一下西山峰峦起伏，古树参天，苍翠挺拔，雄伟壮观；由碧鸡山、华亭山、太华山、太平山、罗汉山、挂榜山等山峰组成，山脉连绵40多公里，最高海拔2500米左右。远眺西山群峰，恰似一位美丽曲腿仰卧在滇池畔，青丝垂海的睡美人，因此西山又称为“睡美人山”。之所以叫睡美人山呢，是因为：\r\n  相传很久以前，在滇池岸边，有一对真挚相爱的青年男女，男捕鱼，女织网，生活的很幸福，小伙子为了表达对姑娘的爱意，乘小舟到海子为她采取海菜花，结果一去不返。一天又一天，姑娘思念着小伙子，悲恸欲绝，昼夜长哭，眼泪流了“五百里”，最后泪尽而逝，身躯化为湖滨山峦，长发则散于草海之内，从此，这山便称为“睡美人山”。\r\n  同样等上龙门看日出，也是一种别致的体验，还有著名的音乐家聂耳先生的墓也在园中，西山还有许多景点，像植物园，华亭寺，太华寺等，当你登上这些寺的时候你才能体会到“一览众山小”感觉。', '4', '3', 'static/upload/2_H1Vb0LA.jpg'),
('7', 30, '云南', '昆明圆通街', '园通寺', '说到园通寺，它是昆明最古老的佛教寺院之一，已有1200多年的建寺历史。同时它也是昆明市内最大的寺院。它位于园通山以南，前面是圆通街，同样它邻近昆明动物园，游玩过后可以去旁边的动物园游玩。园通寺是出了名的一所佛教寺院，同样它也是老昆明的八景之一，它的建筑突出了严谨与对称，后山的风景更是群山环绕，下面就详细的介绍下寺庙：\r\n  园通寺景区不单只有一个寺它还包括了瑶天寺，邹树塘寺，云门寺和上方阉，现存古墓塔近百座，镶嵌石雕多处，唐代青铜佛像、康熙千僧壶、白玉佛像等文物保存完好，白居易等学者在这里留下了270余件文学作品，同样有许多生动形象的石雕动物，像石鼓，龟，鸡等。\r\n  这里不得不说一下云居山是中国著名的佛教圣地，就像一座禅寺，高僧众多，同样具有明显的禅宗风格。', '4', '2', 'static/upload/1_kQgS1m3.jpg'),
('8', 60, '云南', '昆明市西南郊', '云南民族村', '地址：云南民族村位于云南省昆明市西南郊的滇池之畔\r\n\r\n俗话说得好：“五十六个民族，五十六朵花，五十六个兄弟姐妹是一家”，云南则有彝族、白族、傣族、苗族、景颇族、佤族、哈尼族、纳西族、傈僳族、独龙族等26个少数民族，这些名族的特点特色你都可以在云南民族村里看到，它是云南少数民族传统以及文化的缩影，就像一个展览馆，你可以在着看到26个民族的传统文化以及习俗习惯。\r\n  刚进入大门是一个宽阔的广场，草坪上则是一对白象雕塑，像极了迎接贵客的到来，同样进到里面傣族是第一个村落，你可以看见特有的竹楼。而其他民族的村落则是用不同的方式分散开来，真正的展示了各少数民族的生活习俗习惯等，云南民族村与滇池湖滨大道相连，使整个民族村连成了一个大团结的景观。', '5', '2', 'static/upload/2_njXhL3y.jpg'),
('9', 40, '云南', '云南省昆明市广福路6393号', '云南省博物馆', '云南省博物馆是一座中国省级综合性博物馆，始建于1951年，经过半个多世纪的积累，它已成为云南省文物收藏最多的博物馆。云南省博物馆收藏了青铜器、古钱币、陶瓷、古书画、碑刻、邮票等工艺品20多万件。代表性的藏品有战国时期的牛虎铜器、西汉时期的四牛明金铜壳储藏、北宋郭熙的《溪山访友图》、大理国时期的金色芦荟观音像和金翅鸟等。\r\n  除了，西山，翠湖，大观楼，对于喜欢历史的游客，云南省博物馆是一个极好的去处，里面的收藏与藏品都非常丰富，它分为一，二，三，收藏品现在主要集中在二，三层。\r\n 当然，展馆最受欢迎以及著名的就是青铜展区了，包含了战国时期，东汉和西汉时期的收藏品，都是一件件极为珍贵的展品，不禁让人想探究它的神秘。这里最著名的收藏品首当其冲是珍宝牛虎铜案，它与甘肃武威出土的铜跑马“马踏飞燕”铜案一样著名，它们被并称为“北有马踏飞燕，南有牛虎铜案”，这俩件文物曾经引起了世界的轰动。', '5', '3', 'static/upload/6.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `tour_article`
--
ALTER TABLE `tour_article`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tour_article_author_id_ad5b0707_fk_auth_user_id` (`author_id`);

--
-- Indexes for table `tour_comment`
--
ALTER TABLE `tour_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tour_comment_user_id_a2210cf3_fk_auth_user_id` (`user_id`),
  ADD KEY `tour_comment_view_id_eac5dfd6_fk_tour_view_id` (`view_id`);

--
-- Indexes for table `tour_extuser`
--
ALTER TABLE `tour_extuser`
  ADD PRIMARY KEY (`number`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `tour_hotel`
--
ALTER TABLE `tour_hotel`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tour_order`
--
ALTER TABLE `tour_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tour_order_hotel_id_1c0afd74_fk_tour_hotel_id` (`hotel_id`),
  ADD KEY `tour_order_user_id_6a18bb79_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `tour_score`
--
ALTER TABLE `tour_score`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tour_score_user_id_9985049e_fk_auth_user_id` (`user_id`),
  ADD KEY `tour_score_view_id_eccd442e_fk_tour_view_id` (`view_id`);

--
-- Indexes for table `tour_view`
--
ALTER TABLE `tour_view`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
--
-- 使用表AUTO_INCREMENT `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- 使用表AUTO_INCREMENT `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- 使用表AUTO_INCREMENT `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- 使用表AUTO_INCREMENT `tour_article`
--
ALTER TABLE `tour_article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `tour_comment`
--
ALTER TABLE `tour_comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `tour_hotel`
--
ALTER TABLE `tour_hotel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- 使用表AUTO_INCREMENT `tour_order`
--
ALTER TABLE `tour_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `tour_score`
--
ALTER TABLE `tour_score`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 限制导出的表
--

--
-- 限制表 `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- 限制表 `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- 限制表 `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- 限制表 `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- 限制表 `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- 限制表 `tour_article`
--
ALTER TABLE `tour_article`
  ADD CONSTRAINT `tour_article_author_id_ad5b0707_fk_auth_user_id` FOREIGN KEY (`author_id`) REFERENCES `auth_user` (`id`);

--
-- 限制表 `tour_comment`
--
ALTER TABLE `tour_comment`
  ADD CONSTRAINT `tour_comment_user_id_a2210cf3_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `tour_comment_view_id_eac5dfd6_fk_tour_view_id` FOREIGN KEY (`view_id`) REFERENCES `tour_view` (`id`);

--
-- 限制表 `tour_extuser`
--
ALTER TABLE `tour_extuser`
  ADD CONSTRAINT `tour_extuser_user_id_9728d73a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- 限制表 `tour_order`
--
ALTER TABLE `tour_order`
  ADD CONSTRAINT `tour_order_hotel_id_1c0afd74_fk_tour_hotel_id` FOREIGN KEY (`hotel_id`) REFERENCES `tour_hotel` (`id`),
  ADD CONSTRAINT `tour_order_user_id_6a18bb79_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- 限制表 `tour_score`
--
ALTER TABLE `tour_score`
  ADD CONSTRAINT `tour_score_user_id_9985049e_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `tour_score_view_id_eccd442e_fk_tour_view_id` FOREIGN KEY (`view_id`) REFERENCES `tour_view` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
