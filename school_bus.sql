-- -------------------------------------------------------------
-- TablePlus 2.10(268)
--
-- https://tableplus.com/
--
-- Database: school_bus
-- Generation Time: 2020-11-15 14:02:03.6150
-- -------------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


DROP TABLE IF EXISTS `sb_bus`;
CREATE TABLE `sb_bus` (
  `uuid` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键编号',
  `limit_number` varchar(10) NOT NULL DEFAULT '' COMMENT '限制人数',
  `driver_name` varchar(50) NOT NULL DEFAULT '' COMMENT '司机姓名',
  `drive_phone` varchar(50) NOT NULL DEFAULT '' COMMENT '司机电话',
  `seats_number` varchar(50) NOT NULL DEFAULT '' COMMENT '座位排列：json文件',
  `begin_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='班车表';

DROP TABLE IF EXISTS `sb_count`;
CREATE TABLE `sb_count` (
  `uuid` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键编号',
  `bus_id` int(11) NOT NULL COMMENT '班车id',
  `begin_time` varchar(50) NOT NULL DEFAULT '' COMMENT '开始时间',
  `end_time` varchar(50) NOT NULL DEFAULT '' COMMENT '结束时间',
  `bus_status` varchar(50) NOT NULL DEFAULT '' COMMENT '0：沙河；1：清水河；2：沙河到清水河；3：清水河到沙河',
  `price` double NOT NULL COMMENT '价格',
  `selected_seats` varchar(50) NOT NULL DEFAULT '' COMMENT '已选座位',
  `seat_status` varchar(50) NOT NULL DEFAULT '' COMMENT '0:未满；1:已满',
  `begin_date` varchar(100) CHARACTER SET utf8mb4 NOT NULL COMMENT 'mm-dd格式',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB AUTO_INCREMENT=1327842608319434753 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='场次表';

DROP TABLE IF EXISTS `sb_order`;
CREATE TABLE `sb_order` (
  `uuid` bigint(20) NOT NULL COMMENT '主键编号',
  `count_id` bigint(20) NOT NULL COMMENT '场次id',
  `bus_status` varchar(50) NOT NULL DEFAULT '' COMMENT '0:沙河->清水河；1:清水河->沙河',
  `seats_ids` varchar(50) NOT NULL DEFAULT '' COMMENT '已售座位编号',
  `count_price` double NOT NULL COMMENT '场次预售价格',
  `order_price` double NOT NULL COMMENT '订单总金额',
  `order_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `user_id` int(11) NOT NULL COMMENT '下单人id',
  `order_status` varchar(50) NOT NULL DEFAULT '' COMMENT '0-待支付,1-已支付,2-已关闭',
  `evaluate_status` varchar(50) NOT NULL DEFAULT '' COMMENT '0:未评价；1:已评价',
  `comment` varchar(255) NOT NULL DEFAULT '' COMMENT '评论',
  `order_user` varchar(100) CHARACTER SET utf8mb4 NOT NULL COMMENT '下单人',
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='订单表';

DROP TABLE IF EXISTS `sb_user`;
CREATE TABLE `sb_user` (
  `uuid` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '主键编号',
  `user_name` varchar(50) NOT NULL DEFAULT '' COMMENT '用户账号',
  `user_pwd` varchar(50) NOT NULL DEFAULT '' COMMENT '用户密码',
  `nick_name` varchar(50) NOT NULL DEFAULT '' COMMENT '用户昵称',
  `user_sex` int(11) DEFAULT NULL COMMENT '用户性别 0-男，1-女',
  `email` varchar(50) NOT NULL DEFAULT '' COMMENT '用户邮箱',
  `user_phone` varchar(50) NOT NULL DEFAULT '' COMMENT '用户手机号',
  `begin_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `money` double NOT NULL COMMENT '用户余额',
  `pay_password` varchar(100) CHARACTER SET utf8mb4 NOT NULL COMMENT '支付密码',
  PRIMARY KEY (`uuid`),
  UNIQUE KEY `user_name` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=1323530467558817795 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户表';

INSERT INTO `sb_bus` (`uuid`, `limit_number`, `driver_name`, `drive_phone`, `seats_number`, `begin_time`, `update_time`) VALUES ('1', '20', '买', '135', '/file/seat.json', '2020-10-09 07:26:23', '2020-10-09 07:26:23'),
('2', '20', '赵', '135', '/file/seat.json', '2020-10-09 07:26:23', '2020-10-09 07:26:23'),
('3', '20', '李', '135', '/file/seat.json', '2020-10-09 07:26:23', '2020-10-09 07:26:23'),
('4', '20', '王', '135', '/file/seat.json', '2020-10-09 07:26:23', '2020-10-09 07:26:23'),
('5', '20', '牛', '135', '/file/seat.json', '2020-10-09 07:26:23', '2020-10-09 07:26:23'),
('6', '20', '马', '135', '/file/seat.json', '2020-10-09 07:26:23', '2020-10-09 07:26:23'),
('7', '20', '狗', '135', '/file/seat.json', '2020-10-09 07:26:23', '2020-10-09 07:26:23'),
('8', '20', '王', '135', '/file/seat.json', '2020-10-09 07:26:23', '2020-10-09 07:26:23');

INSERT INTO `sb_count` (`uuid`, `bus_id`, `begin_time`, `end_time`, `bus_status`, `price`, `selected_seats`, `seat_status`, `begin_date`) VALUES ('1', '1', '08:00', '09:00', '1', '4', '', '0', '2020-03-09'),
('2', '2', '08:30', '09:30', '1', '4', '', '0', '2020-03-16'),
('3', '3', '09:00', '10:00', '1', '4', '', '0', '2020-03-09'),
('4', '4', '09:30', '10:30', '1', '4', '', '0', '2020-03-09'),
('5', '1', '09:30', '10:30', '0', '4', '', '0', '2020-03-09'),
('6', '2', '10:00', '11:00', '0', '4', '', '0', '2020-03-09'),
('7', '5', '08:00', '09:00', '0', '4', '', '0', '2020-03-09'),
('8', '6', '09:30', '10:30', '0', '4', '', '0', '2020-03-09'),
('9', '3', '14:00', '15:00', '0', '4', '', '0', '2020-03-09'),
('10', '4', '15:30', '16:30', '0', '4', '', '0', '2020-03-09'),
('11', '7', '17:00', '18:00', '0', '4', '', '0', '2020-03-09'),
('12', '5', '14:00', '15:00', '1', '4', '', '0', '2020-03-09'),
('13', '6', '15:30', '16:30', '1', '4', '', '0', '2020-03-09'),
('14', '8', '17:00', '18:00', '1', '4', '', '0', '2020-03-09'),
('15', '7', '20:00', '21:00', '1', '4', '', '0', '2020-03-09'),
('16', '8', '20:00', '21:00', '0', '4', '', '0', '2020-03-09'),
('17', '8', '24:00', '24:30', '0', '4', '', '0', '2020-03-09'),
('86', '1', '08:00', '09:00', '1', '4', '', '0', '2020-03-20'),
('87', '2', '08:30', '09:30', '1', '4', '', '0', '2020-03-20'),
('88', '3', '09:00', '10:00', '1', '4', '', '0', '2020-03-20'),
('89', '4', '09:30', '10:30', '1', '4', '', '0', '2020-03-20'),
('90', '1', '09:30', '10:30', '0', '4', '', '0', '2020-03-20'),
('91', '2', '10:00', '11:00', '0', '4', '', '0', '2020-03-20'),
('92', '5', '08:00', '09:00', '0', '4', '', '0', '2020-03-20'),
('93', '6', '09:30', '10:30', '0', '4', '', '0', '2020-03-20'),
('94', '3', '14:00', '15:00', '0', '4', '', '0', '2020-03-20'),
('95', '4', '15:30', '16:30', '0', '4', '', '0', '2020-03-20'),
('96', '7', '17:00', '18:00', '0', '4', '', '0', '2020-03-20'),
('97', '5', '14:00', '15:00', '1', '4', '', '0', '2020-03-20'),
('98', '6', '15:30', '16:30', '1', '4', '', '0', '2020-03-20'),
('99', '8', '17:00', '18:00', '1', '4', '', '0', '2020-03-20'),
('100', '7', '20:00', '21:00', '1', '4', '', '0', '2020-03-20'),
('101', '8', '20:00', '21:00', '1', '4', '', '0', '2020-11-14'),
('102', '8', '24:00', '24:30', '0', '4', '', '0', '2020-11-14'),
('1327842601310752768', '1', '08:00', '09:00', '1', '4', '', '0', '2020-11-15'),
('1327842601897955328', '2', '08:30', '09:30', '1', '4', '', '0', '2020-11-15'),
('1327842602317385728', '3', '09:00', '10:00', '1', '4', '', '0', '2020-11-15'),
('1327842602732621824', '4', '09:30', '10:30', '1', '4', '', '0', '2020-11-15'),
('1327842603147857920', '1', '09:30', '10:30', '0', '4', '', '0', '2020-11-15'),
('1327842603579871232', '2', '10:00', '11:00', '0', '4', '', '0', '2020-11-15'),
('1327842604003495936', '5', '08:00', '09:00', '0', '4', '', '0', '2020-11-15'),
('1327842604431314944', '6', '09:30', '10:30', '0', '4', '', '0', '2020-11-15'),
('1327842604859133952', '3', '14:00', '15:00', '2', '4', '4', '0', '2020-11-15'),
('1327842605282758656', '4', '15:30', '16:30', '0', '4', '', '0', '2020-11-15'),
('1327842605697994752', '7', '17:00', '18:00', '0', '4', '', '0', '2020-11-15'),
('1327842606125813760', '5', '14:00', '15:00', '3', '4', '', '0', '2020-11-15'),
('1327842606541049856', '6', '15:30', '16:30', '1', '4', '', '0', '2020-11-15'),
('1327842606956285952', '8', '17:00', '18:00', '1', '4', '', '0', '2020-11-15'),
('1327842607371522048', '7', '20:00', '21:00', '1', '4', '', '0', '2020-11-15'),
('1327842607895810048', '8', '20:00', '21:00', '0', '4', '', '0', '2020-11-15'),
('1327842608319434752', '8', '24:00', '24:30', '0', '4', '', '0', '2020-11-15');

INSERT INTO `sb_order` (`uuid`, `count_id`, `bus_status`, `seats_ids`, `count_price`, `order_price`, `order_time`, `user_id`, `order_status`, `evaluate_status`, `comment`, `order_user`) VALUES ('1234556', '88', '0', '2', '4', '4', '2020-11-08 08:58:18', '4', '1', '0', '', '4'),
('1325445718558773248', '102', '0', '3,4', '4', '8', '2020-11-08 09:31:02', '4', '0', '0', '', 'feng'),
('1325446551618850816', '102', '0', '3,4', '4', '8', '2020-11-08 09:34:42', '4', '0', '0', '', 'feng'),
('1325446938035884032', '102', '0', '3,4', '4', '8', '2020-11-08 09:35:52', '4', '0', '0', '', 'feng'),
('1325447295688380416', '102', '0', '3,4', '4', '8', '2020-11-08 09:37:17', '4', '0', '0', '', 'feng'),
('1326438038548647936', '102', '0', '3,4', '4', '8', '2020-11-14 06:46:35', '4', '1', '0', '', 'feng'),
('1326438486361903104', '102', '0', '3,4', '4', '8', '2020-11-14 06:46:35', '4', '1', '0', '', 'feng'),
('1326439581461123072', '102', '0', '3,4', '4', '8', '2020-11-14 06:46:35', '4', '1', '0', '', 'feng'),
('1326440653512642560', '102', '0', '3,4', '4', '8', '2020-11-14 06:46:35', '4', '1', '0', '', 'feng'),
('1326466495575887872', '102', '0', '3,4', '4', '8', '2020-11-14 06:46:35', '4', '1', '0', '', 'feng'),
('1326481700552839168', '102', '0', '3,4', '4', '8', '2020-11-14 06:46:35', '4', '1', '0', '', 'feng'),
('1326486204736212992', '102', '0', '3,4', '4', '8', '2020-11-14 06:46:35', '4', '1', '0', '', 'feng'),
('1326487198576545792', '102', '0', '3,4', '4', '8', '2020-11-14 06:46:35', '4', '1', '0', '', 'feng'),
('1326488152164143104', '102', '0', '3,4', '4', '8', '2020-11-14 06:46:35', '4', '1', '0', '', 'feng'),
('1326489349822484480', '102', '0', '3,4', '4', '8', '2020-11-14 06:46:35', '4', '1', '0', '', 'feng'),
('1326489889813958656', '102', '0', '3,4', '4', '8', '2020-11-14 06:46:35', '4', '1', '0', '', 'feng'),
('1326491014336221184', '102', '0', '3,4', '4', '8', '2020-11-14 06:46:35', '4', '1', '0', '', 'feng'),
('1326491694543278080', '102', '0', '3,4', '4', '8', '2020-11-14 06:46:35', '4', '1', '0', '', 'feng'),
('1326491762545528832', '102', '0', '3,4', '4', '8', '2020-11-14 06:46:35', '4', '1', '0', '', 'feng'),
('1326495444200722432', '102', '0', '3,4', '4', '8', '2020-11-14 06:46:35', '4', '1', '0', '', 'feng'),
('1326495924465307648', '102', '0', '3,4', '4', '8', '2020-11-14 06:46:35', '4', '1', '0', '', 'feng'),
('1326497352281886720', '102', '0', '3,4', '4', '8', '2020-11-14 06:46:35', '4', '1', '0', '', 'feng'),
('1326498359145533440', '102', '0', '3,4', '4', '8', '2020-11-14 06:46:35', '4', '1', '0', '', 'feng'),
('1327576965762387968', '101', '0', '1', '4', '4', '2020-11-14 06:39:49', '4', '0', '0', '', '4'),
('1327578299358121984', '101', '0', '3', '4', '4', '2020-11-14 06:45:14', '4', '1', '0', '', '4'),
('1327854098615242752', '1327842604859133952', '0', '4', '4', '4', '2020-11-15 01:01:12', '4', '1', '0', '', '4');

INSERT INTO `sb_user` (`uuid`, `user_name`, `user_pwd`, `nick_name`, `user_sex`, `email`, `user_phone`, `begin_time`, `update_time`, `money`, `pay_password`) VALUES ('2', 'admin', '0192023a7bbd73250516f069df18b500', '隔壁泰山', '0', 'admin@qq.com', '13888888888', '2020-02-25 20:35:51', '2020-02-25 20:35:51', '0', ''),
('3', 'jiangzh', '5e2de6bd1c9b50f6e27d4e55da43b917', '阿里郎', '0', 'jiangzh@qq.com', '13866666666', '2020-02-25 20:35:51', '2020-02-25 20:35:51', '0', ''),
('4', 'mai', '202cb962ac59075b964b07152d234b70', '你是风儿，他是草', '0', '1595947@qq.com', '18438747362', '2020-02-26 16:10:39', '2020-11-15 01:01:11', '199888', '123456'),
('18', 'feng', '202cb962ac59075b964b07152d234b70', '买', '1', '123@qq.com', '123', '2020-02-28 19:58:45', '2020-03-15 16:00:52', '2', '123456'),
('1323530467558817794', 'laxiba3', '202cb962ac59075b964b07152d234b70', '', NULL, 'mai@qq.com', '1000', '2020-11-03 07:40:28', '2020-11-03 02:40:29', '0', '123456');




/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;