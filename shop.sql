-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 2018-04-13 03:53:32
-- 服务器版本： 10.1.21-MariaDB
-- PHP Version: 5.6.30

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
(10, 'Can add content type', 4, 'add_contenttype'),
(11, 'Can change content type', 4, 'change_contenttype'),
(12, 'Can delete content type', 4, 'delete_contenttype'),
(13, 'Can add session', 5, 'add_session'),
(14, 'Can change session', 5, 'change_session'),
(15, 'Can delete session', 5, 'delete_session'),
(16, 'Can add 用户', 6, 'add_user'),
(17, 'Can change 用户', 6, 'change_user'),
(18, 'Can delete 用户', 6, 'delete_user'),
(19, 'Can add 商品分类', 7, 'add_fenlei'),
(20, 'Can change 商品分类', 7, 'change_fenlei'),
(21, 'Can delete 商品分类', 7, 'delete_fenlei'),
(22, 'Can add 商品目录', 8, 'add_products'),
(23, 'Can change 商品目录', 8, 'change_products'),
(24, 'Can delete 商品目录', 8, 'delete_products'),
(25, 'Can add 订单', 9, 'add_order'),
(26, 'Can change 订单', 9, 'change_order'),
(27, 'Can delete 订单', 9, 'delete_order'),
(28, 'Can add 购物车', 10, 'add_shopcar'),
(29, 'Can change 购物车', 10, 'change_shopcar'),
(30, 'Can delete 购物车', 10, 'delete_shopcar');

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
(1, '2018-04-12 08:58:51', '1', '男士春装', 1, '', 8, 1),
(2, '2018-04-12 08:58:51', '2', '男士春装', 1, '', 8, 1),
(3, '2018-04-12 08:58:59', '3', '男士春装', 1, '', 8, 1),
(4, '2018-04-12 08:59:54', '2', '男士卫衣', 2, 'Changed title, image, price and stock.', 8, 1),
(5, '2018-04-12 09:00:21', '3', '男士新款春装', 2, 'Changed title, desc, image, price and stock.', 8, 1),
(6, '2018-04-12 10:36:55', '1', '男士春装', 2, 'Changed desc.', 8, 1),
(7, '2018-04-12 10:45:36', '1', '男士春装', 2, 'Changed desc.', 8, 1),
(8, '2018-04-12 10:46:07', '1', '男士春装', 2, 'No fields changed.', 8, 1),
(9, '2018-04-12 14:37:43', '4', '辣条', 1, '', 8, 1),
(10, '2018-04-12 14:39:14', '5', '薯片', 1, '', 8, 1),
(11, '2018-04-12 14:43:08', '5', '薯片', 2, 'Changed image.', 8, 1);

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
(4, 'contenttypes', 'contenttype'),
(5, 'sessions', 'session'),
(7, 'shop', 'fenlei'),
(9, 'shop', 'order'),
(8, 'shop', 'products'),
(10, 'shop', 'shopcar'),
(6, 'shop', 'user');

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
(1, 'contenttypes', '0001_initial', '2018-04-12 08:44:02'),
(2, 'admin', '0001_initial', '2018-04-12 08:44:04'),
(3, 'contenttypes', '0002_remove_content_type_name', '2018-04-12 08:44:04'),
(4, 'auth', '0001_initial', '2018-04-12 08:44:06'),
(5, 'auth', '0002_alter_permission_name_max_length', '2018-04-12 08:44:07'),
(6, 'auth', '0003_alter_user_email_max_length', '2018-04-12 08:44:07'),
(7, 'auth', '0004_alter_user_username_opts', '2018-04-12 08:44:07'),
(8, 'auth', '0005_alter_user_last_login_null', '2018-04-12 08:44:07'),
(9, 'auth', '0006_require_contenttypes_0002', '2018-04-12 08:44:07'),
(10, 'sessions', '0001_initial', '2018-04-12 08:44:08');

-- --------------------------------------------------------

--
-- 表的结构 `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `shop_fenlei`
--

CREATE TABLE `shop_fenlei` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `desc` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `shop_fenlei`
--

INSERT INTO `shop_fenlei` (`id`, `title`, `desc`) VALUES
(3, '服装', '各式男女服装、春装、夏装'),
(4, '食品', '各类食品任你选'),
(5, '日用', '各类日用品');

-- --------------------------------------------------------

--
-- 表的结构 `shop_order`
--

CREATE TABLE `shop_order` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product` int(11) NOT NULL,
  `time` datetime NOT NULL,
  `money` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `shop_products`
--

CREATE TABLE `shop_products` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `desc` varchar(2000) NOT NULL,
  `image` varchar(200) DEFAULT NULL,
  `ptype_id` int(11) DEFAULT NULL,
  `price` double NOT NULL,
  `stock` int(11) NOT NULL,
  `time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `shop_products`
--

INSERT INTO `shop_products` (`id`, `title`, `desc`, `image`, `ptype_id`, `price`, `stock`, `time`) VALUES
(1, '男士春装', '商品名称：AK男装 2018春秋新款轻复古尼龙棉装饰绣标后背绣花棒球领短版飞行员夹克1804203 浅米色 L商品编号：21679784993\r\n店铺： AK官方旗舰店\r\n商品毛重：1.0kg\r\n货号：1804203\r\n版型：修身型\r\n厚度：常规\r\n领型：连帽\r\n适用场景：休闲\r\n面料：仿呢料\r\n图案：纯色\r\n基础风格：时尚都市\r\n风格：军旅工装\r\n主要材质：棉\r\n适用季节：秋季\r\n衣长：常规\r\n适用人群：青年\r\n上市时间：2017冬季', 'product/2018/04/5a72aa69N5863d024.jpg', 3, 256, 200, '2018-04-12 08:58:50'),
(2, '男士卫衣', '新款韩版男士春装', 'product/2018/04/5aa130c9N5d95a0c4.jpg', 3, 320, 100, '2018-04-12 08:58:50'),
(3, '男士新款春装', '新款韩版春装', 'product/2018/04/5ab2027bN736dc1e8.jpg', 3, 520, 140, '2018-04-12 08:58:59'),
(4, '辣条', '好吃的辣条啊', 'product/2018/04/59b77b1fNaf553b51.jpg', 4, 15.6, 10, '2018-04-12 14:37:43'),
(5, '薯片', '商品名称：乐事（Lay\'s）\r\n 乐事（Lays） 无限薯片 忠于原味104克/罐   休闲食品小吃零食办公室零食 田园番茄味\r\n商品编号：26459829639\r\n\r\n店铺： 百事食品官方旗舰店商品\r\n毛重：104.00g\r\n包装：独立包装分类：薯片/薯条重量：101g-160g\r\n包装单位：桶装', 'product/2018/04/58660379N1b3bfbc4.jpg', 4, 12, 300, '2018-04-12 14:39:14');

-- --------------------------------------------------------

--
-- 表的结构 `shop_shopcar`
--

CREATE TABLE `shop_shopcar` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product` int(11) NOT NULL,
  `money` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `shop_user`
--

CREATE TABLE `shop_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  `avatar` varchar(200) DEFAULT NULL,
  `balance` double NOT NULL,
  `date_reg` datetime NOT NULL,
  `address` varchar(200) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `idnum` varchar(18) NOT NULL,
  `post` varchar(24) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `shop_user`
--

INSERT INTO `shop_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `avatar`, `balance`, `date_reg`, `address`, `mobile`, `idnum`, `post`, `status`) VALUES
(1, 'pbkdf2_sha256$20000$qh8WGfspAeAB$PssxcDrghVcBtKvbuu0DzkSmiDKAHEkdxq3xjSHAA40=', '2018-04-12 14:31:36', 1, 'admin', '', '', 'admin@qq.com', 1, 1, '2018-04-12 08:44:31', 'avatar/default.png', 0, '2018-04-12 08:44:31', '', '', '', '', 0),
(2, 'pbkdf2_sha256$20000$a1jVwuuaqTWf$THrEbOT9Q303Y2BcovHi3i2Lpme9gLiEjMPjSR3SLpY=', '2018-04-12 13:34:03', 0, 'test', '宝强', '王', '123456@qq.com', 0, 1, '2018-04-12 13:34:03', 'avatar/default.png', 120, '2018-04-12 13:34:03', '北京市朝阳区120号', '13540235241', '', '10020', 0);

-- --------------------------------------------------------

--
-- 表的结构 `shop_user_groups`
--

CREATE TABLE `shop_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 表的结构 `shop_user_user_permissions`
--

CREATE TABLE `shop_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  ADD UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissi_permission_id_23962d04_fk_auth_permission_id` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `content_type_id` (`content_type_id`,`codename`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin__content_type_id_5151027a_fk_django_content_type_id` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_1c5f563_fk_shop_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_3ec8c61c_uniq` (`app_label`,`model`);

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
  ADD KEY `django_session_de54fa62` (`expire_date`);

--
-- Indexes for table `shop_fenlei`
--
ALTER TABLE `shop_fenlei`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_order`
--
ALTER TABLE `shop_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_products`
--
ALTER TABLE `shop_products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_shopcar`
--
ALTER TABLE `shop_shopcar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `shop_user`
--
ALTER TABLE `shop_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `shop_user_groups`
--
ALTER TABLE `shop_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`,`group_id`);

--
-- Indexes for table `shop_user_user_permissions`
--
ALTER TABLE `shop_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`,`permission_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- 使用表AUTO_INCREMENT `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- 使用表AUTO_INCREMENT `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- 使用表AUTO_INCREMENT `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- 使用表AUTO_INCREMENT `shop_fenlei`
--
ALTER TABLE `shop_fenlei`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- 使用表AUTO_INCREMENT `shop_order`
--
ALTER TABLE `shop_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `shop_products`
--
ALTER TABLE `shop_products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- 使用表AUTO_INCREMENT `shop_shopcar`
--
ALTER TABLE `shop_shopcar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `shop_user`
--
ALTER TABLE `shop_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `shop_user_groups`
--
ALTER TABLE `shop_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 使用表AUTO_INCREMENT `shop_user_user_permissions`
--
ALTER TABLE `shop_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- 限制导出的表
--

--
-- 限制表 `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissi_permission_id_23962d04_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_58c48ba9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- 限制表 `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permissi_content_type_id_51277a81_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- 限制表 `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin__content_type_id_5151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_1c5f563_fk_shop_user_id` FOREIGN KEY (`user_id`) REFERENCES `shop_user` (`id`);

--
-- 限制表 `shop_user_groups`
--
ALTER TABLE `shop_user_groups`
  ADD CONSTRAINT `shop_user_groups_user_id_13472df2_fk_shop_user_id` FOREIGN KEY (`user_id`) REFERENCES `shop_user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
