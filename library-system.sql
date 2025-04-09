/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 80036
Source Host           : localhost:3306
Source Database       : library-system

Target Server Type    : MYSQL
Target Server Version : 80036
File Encoding         : 65001

Date: 2024-11-20 13:49:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for activity
-- ----------------------------
DROP TABLE IF EXISTS `activity`;
CREATE TABLE `activity` (
  `id` int NOT NULL AUTO_INCREMENT,
  `activity_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `activity_date` date NOT NULL,
  `activity_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `activity_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of activity
-- ----------------------------
INSERT INTO `activity` VALUES ('1', '活动1', '2024-11-02', '广州城建职业学院图书馆', 0xE58F91E5B883E6B4BBE58AA8);
INSERT INTO `activity` VALUES ('2', '颁奖典礼', '2024-11-08', '广州城建职业学院图书馆', 0xEFBC9BEFBC9B);
INSERT INTO `activity` VALUES ('3', '读书会', '2024-11-30', '广州城建职业学院图书馆', 0x6A6E626A6E);
INSERT INTO `activity` VALUES ('4', '图书交换', '2024-11-22', '广州城建职业学院图书馆', 0xE7BB84E7BB87E4B9A6E7B18DE4BAA4E68DA2E6B4BBE58AA8EFBC8CE8AEA9E8AFBBE88085E5B8A6E887AAE5B7B1E8AFBBE5AE8CE79A84E4B9A6E7B18DE4B88EE4BB96E4BABAE4BAA4E68DA2EFBC8CE5A29EE58AA0E99885E8AFBBE79A84E5A49AE6A0B7E680A7E38082);
INSERT INTO `activity` VALUES ('5', '考试', '2024-11-05', '信工财经楼', 0xE69C9FE69CABE88083E8AF95);
INSERT INTO `activity` VALUES ('6', '图书分享会', '2024-11-09', '广州城建职业学院图书馆', 0xE8BF9BE8A18CE59BBEE4B9A6E58886E4BAAB);
INSERT INTO `activity` VALUES ('7', '图书分享会', '2024-11-16', '广州城建图书馆', 0xE8BF9BE8A18CE59BBEE4B9A6E58886E4BAAB);
INSERT INTO `activity` VALUES ('42', '颁奖典礼', '2024-11-22', '信工财经楼', 0x313131);
INSERT INTO `activity` VALUES ('43', '读书会', '2024-11-22', '广州城建职业学院图书馆', 0x313131);

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `admin_id` int NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(20) DEFAULT NULL,
  `admin_pwd` varchar(20) DEFAULT NULL,
  `admin_email` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', '123456', '1111111@qq.com');
INSERT INTO `admin` VALUES ('2', 'admin2', '123456', '2222222@qq.com');

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `book_id` int NOT NULL AUTO_INCREMENT,
  `book_name` varchar(20) NOT NULL,
  `book_author` varchar(20) DEFAULT NULL,
  `book_publish` varchar(20) DEFAULT NULL,
  `book_category` int DEFAULT NULL,
  `book_price` double DEFAULT NULL,
  `book_introduction` varchar(100) DEFAULT NULL,
  `book_static` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`book_id`),
  KEY `book_category` (`book_category`) USING BTREE,
  CONSTRAINT `book_ibfk_1` FOREIGN KEY (`book_category`) REFERENCES `book_category` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=263 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES ('1', '巨人的陨落', '肯.福莱特', '江苏凤凰文艺出版社', '1', '129', '在第一次世界大战中发生的故事', '0');
INSERT INTO `book` VALUES ('2', '三体', '刘慈欣', '南京大学出版社', '1', '68', '科幻小说', '1');
INSERT INTO `book` VALUES ('3', '百年孤独', '加西亚·马尔克斯', '人民文学出版社', '3', '69', '魔幻现实主义的经典之作，描述布恩迪亚家族的兴衰', '1');
INSERT INTO `book` VALUES ('4', '追风筝的人', '卡勒德·胡赛尼', '作家出版社', '1', '89', '阿富汗背景的友情、背叛和救赎的故事', null);
INSERT INTO `book` VALUES ('5', '活着', '余华', '作家出版社', '1', '59', '描述一个普通农民在中国现代历史中的苦难经历', '1');
INSERT INTO `book` VALUES ('6', '平凡的世界', '路遥', '陕西人民出版社', '1', '75', '讲述了陕北乡村一代人追求梦想与奋斗的故事', '1');
INSERT INTO `book` VALUES ('7', '1984', '乔治·奥威尔', '人民文学出版社', '2', '55', '描述极权主义社会的反乌托邦小说', '1');
INSERT INTO `book` VALUES ('8', '三体', '刘慈欣', '重庆出版社', '2', '120', '讲述人类与外星文明的碰撞和宇宙的命运', null);
INSERT INTO `book` VALUES ('9', '围城', '钱钟书', '人民文学出版社', '3', '60', '通过对婚姻与人生的幽默描写，呈现社会的荒诞', '1');
INSERT INTO `book` VALUES ('10', '嫌疑人X的献身', '东野圭吾', '南海出版公司', '1', '82', '推理小说，讲述一场深刻的智力博弈', '1');
INSERT INTO `book` VALUES ('11', '阿Q正传', '鲁迅', '人民文学出版社', '1', '38', '通过阿Q这一角色揭示中国社会的种种弊病', '0');
INSERT INTO `book` VALUES ('12', '小王子', '安东尼·德·圣-埃克苏佩里', '译林出版社', '3', '45', '通过小王子的故事探讨爱、责任和生命的意义', null);
INSERT INTO `book` VALUES ('13', '战争与和平', '列夫·托尔斯泰', '人民文学出版社', '2', '168', '描述俄法战争时期贵族阶层的生活和命运', '0');
INSERT INTO `book` VALUES ('14', '刀锋', '毛姆', '上海译文出版社', '3', '88', '通过主人公的经历探讨人生的意义与追求', null);
INSERT INTO `book` VALUES ('15', '简爱', '夏洛蒂·勃朗特', '译林出版社', '3', '65', '描述一个孤儿女孩如何通过奋斗与爱情找到自己的归宿', '0');
INSERT INTO `book` VALUES ('16', '呼啸山庄', '艾米莉·勃朗特', '人民文学出版社', '3', '78', '讲述了复仇与爱情交织的悲剧故事', '0');
INSERT INTO `book` VALUES ('17', '白夜行', '东野圭吾', '南海出版公司', '1', '98', '两位主人公命运交织，暗黑心理学的经典之作', null);
INSERT INTO `book` VALUES ('18', '窗边的小豆豆', '黑柳律子', '中国少年儿童出版社', '3', '38', '一位特殊孩子的成长故事，充满温暖与希望', null);
INSERT INTO `book` VALUES ('19', '了不起的盖茨比', 'F. Scott Fitzgerald', '译林出版社', '1', '68', '描写了20世纪初美国社会的奢华与腐化', null);
INSERT INTO `book` VALUES ('20', '人类简史', '尤瓦尔·赫拉利', '中信出版集团', '2', '125', '通过历史的视角探讨人类的起源、进化和未来', '1');
INSERT INTO `book` VALUES ('21', '刀锋', '毛姆', '上海译文出版社', '1', '78', '描写一个男人与生活、爱情和哲学的关系', '1');
INSERT INTO `book` VALUES ('22', '苏菲的世界', '乔斯坦·贾德', '上海三联书店', '2', '55', '哲学入门，带领读者走进西方哲学的世界', '1');
INSERT INTO `book` VALUES ('23', '天龙八部', '金庸', '香港三联书店', '1', '120', '金庸经典武侠小说，讲述江湖恩怨与英雄传奇', '1');
INSERT INTO `book` VALUES ('24', '鹿鼎记', '金庸', '中华书局', '3', '99', '描述了清朝初期一位多面英雄的传奇故事', null);
INSERT INTO `book` VALUES ('25', '红楼梦', '曹雪芹', '人民文学出版社', '1', '139', '中国古代文学经典，描写贵族家庭的兴衰', '1');
INSERT INTO `book` VALUES ('26', '聊斋志异', '蒲松龄', '中华书局', '1', '98', '通过鬼怪故事揭示人性与社会的多面性', '1');
INSERT INTO `book` VALUES ('27', '金瓶梅', '兰陵笑笑生', '人民文学出版社', '3', '88', '描写明代社会风貌及人性复杂的古典小说', '1');
INSERT INTO `book` VALUES ('28', '围城', '钱钟书', '人民文学出版社', '1', '65', '通过婚姻、职场等展示人性的荒诞', '1');
INSERT INTO `book` VALUES ('29', '活着', '余华', '作家出版社', '2', '62', '一位普通农民的生命与苦难的故事', '1');
INSERT INTO `book` VALUES ('30', '时间的秩序', '卡洛·罗韦利', '中信出版集团', '3', '115', '对物理学与哲学对时间本质的探讨', '1');
INSERT INTO `book` VALUES ('31', '白夜行', '东野圭吾', '南海出版公司', '2', '98', '一场关于爱情与犯罪的深刻故事', '1');
INSERT INTO `book` VALUES ('32', '盗墓笔记', '南派三叔', '湖南文艺出版社', '1', '78', '讲述了盗墓探险的故事，融入了许多悬疑元素', null);
INSERT INTO `book` VALUES ('33', '解忧杂货店', '东野圭吾', '南海出版公司', '3', '85', '通过一家神奇杂货店，展现了人性与温暖', '11');
INSERT INTO `book` VALUES ('34', '当呼吸化为空气', '保罗·卡拉尼', '中信出版集团', '2', '92', '癌症患者的自述，关于生命、死亡与人生的反思', '1');
INSERT INTO `book` VALUES ('35', '父与子', '埃里希·凯斯特纳', '译林出版社', '3', '45', '通过父子关系展现家庭的温馨与教育的重要性', '1');
INSERT INTO `book` VALUES ('36', '小王子', '安托万·德·圣-埃克苏佩里', '译林出版社', '1', '68', '关于爱、责任与友情的寓言故事', null);
INSERT INTO `book` VALUES ('37', '二十年后', '亚历山大·仲马', '人民文学出版社', '2', '72', '描写了三个英雄在法国大革命后的故事', '1');
INSERT INTO `book` VALUES ('38', '美丽新世界', '阿道司·赫胥黎', '上海译文出版社', '3', '90', '一个关于未来社会极权主义的反乌托邦小说', '0');
INSERT INTO `book` VALUES ('39', '穆斯林的葬礼', '霍达·巴拉卡特', '花城出版社', '1', '85', '描述了一个穆斯林家庭的生活与文化', '0');
INSERT INTO `book` VALUES ('40', '西游记', '吴承恩', '人民文学出版社', '3', '59', '经典的中国古代神话故事，讲述唐僧师徒四人西天取经的故事', '0');
INSERT INTO `book` VALUES ('41', '大卫·科波菲尔', '查尔斯·狄更斯', '人民文学出版社', '2', '135', '通过主人公大卫的成长故事，揭示了19世纪英国社会的各种矛盾', '0');
INSERT INTO `book` VALUES ('42', '悲惨世界', '维克多·雨果', '译林出版社', '2', '138', '讲述了法国大革命时期的社会变革与个人奋斗', null);
INSERT INTO `book` VALUES ('43', '简爱', '夏洛蒂·勃朗特', '人民文学出版社', '3', '78', '通过主人公简爱的成长与爱情经历，探索自我实现', '1');
INSERT INTO `book` VALUES ('44', '呼啸山庄', '艾米莉·勃朗特', '人民文学出版社', '1', '99', '一场悲剧爱情的故事，探索复仇与心灵的复杂性', '1');
INSERT INTO `book` VALUES ('45', '水浒传', '施耐庵', '人民文学出版社', '3', '88', '一部描写梁山好汉与民间疾苦的古代小说', '1');
INSERT INTO `book` VALUES ('46', '红楼梦', '曹雪芹', '人民文学出版社', '2', '128', '描写了贾宝玉和林黛玉的爱情悲剧', '1');
INSERT INTO `book` VALUES ('47', '大红灯笼高高挂', '苏童', '作家出版社', '2', '75', '讲述了中国传统家庭中的女性命运', '1');
INSERT INTO `book` VALUES ('48', '一九八四', '乔治·奥威尔', '人民文学出版社', '3', '65', '反乌托邦的经典之作，讲述了极权主义社会的监控与压迫', null);
INSERT INTO `book` VALUES ('49', '一生', '罗永浩', '中信出版集团', '2', '88', '罗永浩的自述，讲述了他从年轻到年老的创业与生活', '11');
INSERT INTO `book` VALUES ('50', '动物庄园', '乔治·奥威尔', '译林出版社', '3', '55', '通过动物们的反抗故事，讽刺极权主义和社会制度', '1');
INSERT INTO `book` VALUES ('51', '肖申克的救赎', '斯蒂芬·金', '南海出版公司', '1', '69', '一位冤枉入狱的男人，在监狱中寻找自由的故事', '1');
INSERT INTO `book` VALUES ('52', '三国演义', '罗贯中', '人民文学出版社', '2', '118', '描写了三国时期英雄人物的传奇故事', '1');
INSERT INTO `book` VALUES ('53', '水浒传', '施耐庵', '人民文学出版社', '3', '98', '通过一百单八将的故事展现中国的民间英雄与社会矛盾', '1');
INSERT INTO `book` VALUES ('54', '达·芬奇密码', '丹·布朗', '译林出版社', '2', '95', '结合宗教与历史的谜题，探索真相与神秘', '0');
INSERT INTO `book` VALUES ('55', '月亮与六便士', '毛姆', '上海译文出版社', '1', '78', '一个追求艺术与自由的男人的故事', '0');
INSERT INTO `book` VALUES ('56', '雨季不再来', '周国平', '中信出版集团', '3', '62', '讲述了一个青春成长的故事，涉及爱情与离别', '0');
INSERT INTO `book` VALUES ('57', '追忆似水年华', '马塞尔·普鲁斯特', '人民文学出版社', '1', '145', '通过对时间与记忆的深入探讨，表达对生活的回忆', '0');
INSERT INTO `book` VALUES ('58', '基督山伯爵', '大仲马', '人民文学出版社', '3', '120', '描述复仇与宽恕的经典故事', null);
INSERT INTO `book` VALUES ('59', '活着', '余华', '作家出版社', '2', '58', '讲述一个普通农民的生活故事，探索人类生死的哲学', '1');
INSERT INTO `book` VALUES ('60', '没有什么能阻挡你前进的脚步', '乔治·费尔南德斯', '中信出版集团', '3', '77', '通过真实故事展示了如何在困境中坚持梦想', '11');
INSERT INTO `book` VALUES ('61', '一生的旅程', '高尔基', '人民文学出版社', '1', '85', '讲述一个普通人在俄罗斯革命时期的成长与奋斗', null);
INSERT INTO `book` VALUES ('62', '傲慢与偏见', '简·奥斯汀', '译林出版社', '2', '89', '描写了18世纪英格兰社会中爱情与家庭的故事', '1');
INSERT INTO `book` VALUES ('63', '剑桥简明世界史', '朱利安·巴吉尼', '人民文学出版社', '3', '95', '讲述从古代到现代的世界历史，涵盖各大文明的兴衰', '1');
INSERT INTO `book` VALUES ('64', '看不见的城市', '伊塔洛·卡尔维诺', '人民文学出版社', '1', '88', '通过虚构的城市，表达了对于人类经验的深刻反思', '1');
INSERT INTO `book` VALUES ('65', '无声告白', '伍绮诗', '南海出版公司', '2', '78', '讲述了一个家庭的秘密与无法言说的心声', '1');
INSERT INTO `book` VALUES ('66', '我是猫', '夏目漱石', '人民文学出版社', '3', '72', '通过一只猫的视角，描写了日本社会的百态', '1');
INSERT INTO `book` VALUES ('67', '时间简史', '斯蒂芬·霍金', '中信出版集团', '1', '110', '探讨宇宙的起源、黑洞、时间旅行等科学理论', '1');
INSERT INTO `book` VALUES ('68', '1984', '乔治·奥威尔', '译林出版社', '2', '82', '揭示极权主义社会中的监控、自由与压迫', null);
INSERT INTO `book` VALUES ('69', '与神对话', '尼尔·唐纳德·沃尔什', '中信出版集团', '3', '85', '通过与神的对话，探索人类生命的意义', '1');
INSERT INTO `book` VALUES ('70', '雾都孤儿', '查尔斯·狄更斯', '译林出版社', '1', '68', '讲述了一个孤儿的成长与社会的冷酷', '1');
INSERT INTO `book` VALUES ('71', '骆驼祥子', '老舍', '人民文学出版社', '1', '78', '讲述了北京人力车夫祥子在社会压迫下的悲剧命运', '1');
INSERT INTO `book` VALUES ('72', '追风筝的人', '卡勒德·胡赛尼', '作家出版社', '2', '98', '讲述阿富汗背景下的友情与救赎', '1');
INSERT INTO `book` VALUES ('73', '动物庄园', '乔治·奥威尔', '人民文学出版社', '1', '48', '通过动物反抗讲述政治权力与社会不公', null);
INSERT INTO `book` VALUES ('74', '天龙八部', '金庸', '香港三联书店', '3', '115', '金庸经典武侠小说，讲述江湖恩怨与英雄传奇', '0');
INSERT INTO `book` VALUES ('75', '福尔摩斯探案全集', '阿瑟·柯南·道尔', '人民文学出版社', '2', '178', '柯南·道尔的经典侦探小说，福尔摩斯与华生的冒险故事', '0');
INSERT INTO `book` VALUES ('76', '太阳照常升起', '欧内斯特·海明威', '译林出版社', '3', '88', '海明威经典作品，展示迷失一代人的生活与哲学', '0');
INSERT INTO `book` VALUES ('77', '时间简史', '斯蒂芬·霍金', '中信出版集团', '2', '145', '关于宇宙的起源、黑洞与时间的思考', '00');
INSERT INTO `book` VALUES ('78', '阿甘正传', '温斯顿·格鲁姆', '译林出版社', '1', '120', '讲述一个智力低下的男子通过简单的努力创造了传奇人生', '0');
INSERT INTO `book` VALUES ('79', '肖申克的救赎', '斯蒂芬·金', '南海出版公司', '3', '85', '讲述监狱中主人公如何寻求自由与希望', '0');
INSERT INTO `book` VALUES ('80', '漫长的告别', '雷蒙德·钱德勒', '译林出版社', '2', '105', '侦探小说，讲述一位私人侦探的冒险与抉择', '0');
INSERT INTO `book` VALUES ('81', '飘', '玛格丽特·米切尔', '人民文学出版社', '1', '145', '通过斯嘉丽·奥哈拉讲述美国南方的爱情与战争', null);
INSERT INTO `book` VALUES ('82', '瓦尔登湖', '亨利·大卫·梭罗', '人民文学出版社', '3', '98', '梭罗的经典之作，描述他在湖边独自生活的经历与思考', '1');
INSERT INTO `book` VALUES ('83', '白雪公主与猎人', '丽莎·马尔金', '译林出版社', '2', '82', '讲述经典童话“白雪公主”的另一种故事', '1');
INSERT INTO `book` VALUES ('84', '乔布斯传', '沃尔特·艾萨克森', '中信出版集团', '1', '168', '苹果公司创始人乔布斯的传记，讲述他的传奇人生与商业哲学', '1');
INSERT INTO `book` VALUES ('85', '银河帝国', '艾萨克·阿西莫夫', '人民文学出版社', '3', '98', '科幻巨作，讲述银河帝国的兴衰与人类命运', '1');
INSERT INTO `book` VALUES ('86', '大亨小传', 'F. Scott Fitzgerald', '译林出版社', '1', '125', '一位财富至上的美国商人和他错失的爱情', '1');
INSERT INTO `book` VALUES ('87', '月亮和六便士', '毛姆', '上海译文出版社', '3', '78', '通过主人公的故事讲述追求艺术与自由的代价', '1');
INSERT INTO `book` VALUES ('88', '追忆似水年华', '马塞尔·普鲁斯特', '人民文学出版社', '2', '155', '通过对时间与记忆的深入探讨，表达对生活的回忆', '1');
INSERT INTO `book` VALUES ('89', '活着', '余华', '作家出版社', '1', '62', '一位普通农民的生命与苦难的故事', '1');
INSERT INTO `book` VALUES ('90', '平凡的世界', '路遥', '陕西人民出版社', '3', '118', '描述陕北乡村一代人追求梦想与奋斗的故事', '1');
INSERT INTO `book` VALUES ('91', '红楼梦', '曹雪芹', '人民文学出版社', '2', '130', '描述了贾宝玉和林黛玉的爱情悲剧', '11');
INSERT INTO `book` VALUES ('92', '文化苦旅', '余秋雨', '作家出版社', '1', '89', '余秋雨以游历的方式探讨中国的文化与历史', '1');
INSERT INTO `book` VALUES ('93', '大卫·科波菲尔', '查尔斯·狄更斯', '人民文学出版社', '3', '105', '通过主人公大卫的成长故事，揭示了19世纪英国社会的各种矛盾', '1');
INSERT INTO `book` VALUES ('94', '无人生还', '阿加莎·克里斯蒂', '译林出版社', '2', '88', '侦探小说，讲述一群人在孤岛上的死亡之谜', null);
INSERT INTO `book` VALUES ('95', '傲慢与偏见', '简·奥斯汀', '译林出版社', '3', '98', '描述18世纪英格兰社会中爱情与家庭的故事', '00');
INSERT INTO `book` VALUES ('96', '雪国', '川端康成', '译林出版社', '2', '72', '讲述一位男子与一位雪国女子的爱情悲剧', '0');
INSERT INTO `book` VALUES ('97', '窄门', '安德烈·纪德', '人民文学出版社', '3', '88', '一部探讨理性与感情冲突的文学作品', '0');
INSERT INTO `book` VALUES ('98', '复活', '列夫·托尔斯泰', '人民文学出版社', '1', '112', '托尔斯泰的经典作品，描述了一个人内心的道德和精神的重生', '0');
INSERT INTO `book` VALUES ('99', '西方哲学史', '罗素', '中信出版集团', '2', '135', '系统介绍西方哲学的主要思想流派与哲学家', '0');
INSERT INTO `book` VALUES ('100', '我的前半生', '亦舒', '作家出版社', '1', '69', '讲述一个女人的婚姻与自我发现的故事', '0');
INSERT INTO `book` VALUES ('101', '时间的秩序', '卡洛·罗韦利', '中信出版集团', '2', '150', '物理学家卡洛·罗韦利通过深入浅出的方式讲解了时间的本质', '1');
INSERT INTO `book` VALUES ('102', '三体', '刘慈欣', '重庆出版社', '3', '120', '中国科幻文学的代表作，讲述了外星文明与人类的首次接触', '1');
INSERT INTO `book` VALUES ('103', '机器学习实战', '彼得·哈林顿', '人民邮电出版社', '2', '135', '介绍机器学习算法与实践的实用指南', '1');
INSERT INTO `book` VALUES ('104', 'Python核心编程', 'Wesley J. Chun', '电子工业出版社', '1', '200', 'Python语言的深度学习与应用', null);
INSERT INTO `book` VALUES ('105', '数据结构与算法分析', 'Mark Allen Weiss', '人民邮电出版社', '1', '220', '本书讲解了数据结构和算法的基本知识及应用', '11');
INSERT INTO `book` VALUES ('106', '算法图解', 'Aditya Bhargava', '机械工业出版社', '2', '95', '通过图示的方式让读者易懂地学习算法', '1');
INSERT INTO `book` VALUES ('107', '深度学习', 'Ian Goodfellow', '机械工业出版社', '3', '180', '介绍深度学习的基础与前沿技术', '1');
INSERT INTO `book` VALUES ('108', '人工智能：一种现代的方法', 'Stuart Russell', '机械工业出版社', '1', '300', '该书详细阐述了人工智能的核心概念与技术', '1');
INSERT INTO `book` VALUES ('109', '计算机程序的构造和解释', 'Harold Abelson', '电子工业出版社', '2', '250', '书籍介绍了计算机科学的基本理论与实践', '1');
INSERT INTO `book` VALUES ('110', '数学之美', '吴军', '人民邮电出版社', '3', '98', '书籍阐述了数学在现代计算机科学中的应用', null);
INSERT INTO `book` VALUES ('111', '大数据时代', '维克托·迈尔·舍恩伯格', '中信出版集团', '2', '128', '讲述了大数据如何改变我们的世界', '11');
INSERT INTO `book` VALUES ('112', '从0到1', '彼得·蒂尔', '中信出版集团', '1', '142', '探讨了创新与创业的哲学和实践', '1');
INSERT INTO `book` VALUES ('113', '黑客与画家', '保罗·格雷厄姆', '人民邮电出版社', '2', '115', '从黑客文化的视角，讲述科技创新的方式与理念', '1');
INSERT INTO `book` VALUES ('114', '创新者的窘境', '克莱顿·克里斯滕森', '中信出版集团', '1', '175', '分析了为什么大公司会失败以及如何避免失败', '1');
INSERT INTO `book` VALUES ('115', '精益创业', '埃里克·里斯', '中信出版集团', '2', '98', '本书介绍了创业过程中如何利用数据驱动的决策', '1');
INSERT INTO `book` VALUES ('116', '商道', '李光斗', '中信出版集团', '1', '135', '讲述商道思维与创新战略', '1');
INSERT INTO `book` VALUES ('117', '硅谷钢铁侠', '阿什利·万斯', '中信出版集团', '2', '200', '讲述了埃隆·马斯克的创业经历与创新精神', '1');
INSERT INTO `book` VALUES ('118', '微信营销', '王佳敏', '电子工业出版社', '1', '90', '详细介绍微信平台的营销技巧和策略', '0');
INSERT INTO `book` VALUES ('119', '原子习惯', '詹姆斯·克利尔', '中信出版集团', '3', '105', '本书讲解了如何通过小习惯改变生活与工作', '0');
INSERT INTO `book` VALUES ('120', '人类简史', '尤瓦尔·赫拉利', '中信出版集团', '1', '210', '从人类的起源到未来发展，深入探讨了人类历史的演变', '0');
INSERT INTO `book` VALUES ('121', '活下去的理由', '马特·海格', '译林出版社', '2', '135', '描述了作者如何走出心理困境，面对生命中的挑战', '1');
INSERT INTO `book` VALUES ('122', '我们仨', '杨绛', '人民文学出版社', '3', '92', '讲述了杨绛和丈夫钱钟书以及女儿的家庭故事', '1');
INSERT INTO `book` VALUES ('123', '人性的弱点', '戴尔·卡耐基', '中信出版集团', '1', '125', '通过案例剖析人性中的弱点，并提供改进的方法', '1');
INSERT INTO `book` VALUES ('124', '窗边的小豆豆', '黑柳律子', '人民文学出版社', '2', '85', '以小豆豆的成长故事为核心，描写了教育和人生的哲理', '1');
INSERT INTO `book` VALUES ('125', '笑傲江湖', '金庸', '香港三联书店', '3', '115', '金庸的经典武侠小说，讲述江湖的风波与侠义情怀', '1');
INSERT INTO `book` VALUES ('126', '我与地坛', '史铁生', '作家出版社', '1', '88', '通过地坛的讲述，展现作者对生命的反思与思考', '1');
INSERT INTO `book` VALUES ('127', '追寻失落的时光', '马塞尔·普鲁斯特', '人民文学出版社', '3', '130', '书中通过时光的流逝与记忆的回忆，表达了时间与人生的主题', '0');
INSERT INTO `book` VALUES ('128', '岛上书店', '加布瑞埃拉·泽文', '作家出版社', '2', '120', '讲述了一家书店如何改变了一个小镇的命运', '0');
INSERT INTO `book` VALUES ('129', '纳尼亚传奇', 'C.S.路易斯', '人民文学出版社', '1', '260', '经典的奇幻小说系列，讲述了四个孩子进入奇幻世界的冒险', '1');
INSERT INTO `book` VALUES ('130', '莫失莫忘', '八月长安', '作家出版社', '3', '92', '讲述青春和爱情的故事，透过情感的转折与成长的痛楚', '1');
INSERT INTO `book` VALUES ('131', '哈利·波特与魔法石', 'J.K.罗琳', '人民文学出版社', '2', '210', '哈利波特系列的第一部，讲述了哈利进入魔法学校的冒险', '1');
INSERT INTO `book` VALUES ('132', '大英博物馆的历史', 'Diane Lees', '中信出版集团', '1', '350', '详细描述了大英博物馆的历史、藏品及其文化背景', '1');
INSERT INTO `book` VALUES ('133', '历史深处的忧虑', '余华', '作家出版社', '2', '145', '余华的长篇小说，探讨了历史与社会的深层次问题', '0');
INSERT INTO `book` VALUES ('134', '死囚的冥想', '唐纳德·霍金', '作家出版社', '1', '120', '通过对囚犯的冥想，探讨社会、犯罪和心理的关系', null);
INSERT INTO `book` VALUES ('135', '曼联十年', '威尔·雷德', '人民体育出版社', '2', '188', '讲述了曼联足球俱乐部在十年的辉煌与挑战', '1');
INSERT INTO `book` VALUES ('136', '中国大历史', '黄仁宇', '人民出版社', '3', '285', '深刻解读中国五千年历史与文化的演变', '1');
INSERT INTO `book` VALUES ('137', '未来简史', '尤瓦尔·赫拉利', '中信出版集团', '1', '250', '通过对未来的预测，探讨人工智能、生物技术对人类社会的影响', '11');
INSERT INTO `book` VALUES ('138', '霍乱时期的爱情', '加西亚·马尔克斯', '人民文学出版社', '2', '148', '讲述一个跨越半个世纪的爱情故事', '1');
INSERT INTO `book` VALUES ('139', '红与黑', '斯汤达尔', '人民文学出版社', '3', '188', '小说通过主人公的奋斗历程，展示了19世纪法国社会的阶级斗争', '1');
INSERT INTO `book` VALUES ('140', '贫穷的本质', '阿比吉特·V·班纳吉', '中信出版集团', '1', '158', '通过调查贫困人群的生活方式，探讨了贫穷的根源与解决办法', '1');
INSERT INTO `book` VALUES ('141', '时间旅行者的妻子', '奥黛丽·尼芬格', '人民文学出版社', '2', '225', '讲述一对恋人因时间旅行的特殊命运而经历的爱情故事', '1');
INSERT INTO `book` VALUES ('142', '傲慢与偏见', '简·奥斯汀', '译林出版社', '3', '118', '这部经典小说探讨了人类情感与社会结构的多重矛盾', '1');
INSERT INTO `book` VALUES ('143', '红楼梦', '曹雪芹', '人民文学出版社', '1', '210', '讲述了贾宝玉与林黛玉的复杂关系及家族的兴衰', '1');
INSERT INTO `book` VALUES ('144', '天使与魔鬼', '丹·布朗', '人民文学出版社', '2', '150', '讲述一位哈佛大学教授解开关于宗教与科学的谜团', '1');
INSERT INTO `book` VALUES ('145', '火星救援', '安迪·威尔', '译林出版社', '3', '225', '描述一名宇航员在火星上孤立无援的生存故事', '1');
INSERT INTO `book` VALUES ('146', '福尔摩斯探案全集', '亚瑟·柯南·道尔', '人民文学出版社', '1', '500', '集结了福尔摩斯系列的所有经典探案故事', '1');
INSERT INTO `book` VALUES ('147', '神雕侠侣', '金庸', '香港三联书店', '2', '280', '金庸的经典武侠小说，讲述了杨过与小龙女的爱情故事', '11');
INSERT INTO `book` VALUES ('148', '嫌疑人X的献身', '东野圭吾', '译林出版社', '1', '135', '推理小说，讲述了数学家与罪犯之间的故事', null);
INSERT INTO `book` VALUES ('149', '从零到一', '彼得·蒂尔', '中信出版集团', '3', '120', '分享彼得·蒂尔对创新与商业的独特见解', '1');
INSERT INTO `book` VALUES ('150', '设计中的设计', '原研哉', '生活·读书·新知三联书店', '2', '180', '讲解设计理念和设计思维的经典之作', null);
INSERT INTO `book` VALUES ('151', '白鹿原', '陈忠实', '人民文学出版社', '3', '180', '通过白鹿村的历史，反映了陕北农村的变迁和人物的命运', null);
INSERT INTO `book` VALUES ('152', '复活', '列夫·托尔斯泰', '人民文学出版社', '1', '200', '托尔斯泰的经典作品，讲述了主人公如何通过自我反思获得复活', '0');
INSERT INTO `book` VALUES ('153', '解忧杂货店', '东野圭吾', '南海出版公司', '2', '138', '通过一家杂货店帮助人们解决烦恼的温情故事', '0');
INSERT INTO `book` VALUES ('154', '素食者', '韩江', '作家出版社', '1', '160', '讲述了女性在社会与家庭压力中的心理挣扎和个人解放', '0');
INSERT INTO `book` VALUES ('155', '何以秦汉', '于丹', '文化艺术出版社', '3', '130', '探讨了中国古代历史与文化的精髓，尤其是秦汉时期的智慧与哲学', null);
INSERT INTO `book` VALUES ('156', '山海经', '佚名', '中华书局', '2', '280', '中国古代经典文献之一，包含了丰富的神话故事、地理知识与文化传说', '1');
INSERT INTO `book` VALUES ('157', '人间清醒', '刘擎', '北京联合出版公司', '1', '155', '一本反思人性、人生与社会的哲学著作，讲述人类如何追求清醒的心态', '1');
INSERT INTO `book` VALUES ('158', '敦煌', '安丽', '人民文学出版社', '3', '175', '讲述了敦煌的历史、文化以及敦煌遗址的考古故事', '1');
INSERT INTO `book` VALUES ('159', '倾城之恋', '张爱玲', '人民文学出版社', '2', '120', '张爱玲的经典作品，描述了上海的恋爱故事与战争中的人性', '1');
INSERT INTO `book` VALUES ('160', '活着', '余华', '作家出版社', '3', '95', '余华的小说，通过普通人的命运，揭示了生命的意义与苦难', '1');
INSERT INTO `book` VALUES ('161', '大江大海1949', '龙应台', '台港出版社', '1', '210', '回顾1949年中国历史变迁中的痛苦与选择', '1');
INSERT INTO `book` VALUES ('162', '了不起的盖茨比', 'F.斯科特·菲茨杰拉德', '译林出版社', '2', '180', '美国现代经典小说，讲述了追逐梦想与爱情的故事', null);
INSERT INTO `book` VALUES ('163', '追风筝的人', '卡勒德·胡赛尼', '南海出版公司', '1', '190', '讲述了阿富汗的历史背景下，一段关于亲情与背叛的动人故事', '0');
INSERT INTO `book` VALUES ('164', '百年孤独', '加布里埃尔·加西亚·马尔克斯', '人民文学出版社', '3', '250', '魔幻现实主义的经典作品，讲述布恩迪亚家族的传奇历史', '0');
INSERT INTO `book` VALUES ('165', '窗外', '卡洛·罗韦利', '作家出版社', '2', '95', '通过对窗外自然的观察，深刻探讨了物理世界的奥秘', '1');
INSERT INTO `book` VALUES ('166', '平凡的世界', '路遥', '人民文学出版社', '1', '210', '通过讲述一名农村青年的成长，展现了中国社会的变迁与人性的坚韧', null);
INSERT INTO `book` VALUES ('167', '星空', '张嘉佳', '作家出版社', '3', '145', '本书讲述了关于人生、爱情与人际关系的深刻思考', '1');
INSERT INTO `book` VALUES ('168', '西藏生死书', '索甲仁波切', '生活·读书·新知三联书店', '1', '220', '一本关于西藏生死学的书籍，深入探讨生死与灵魂的哲学', '1');
INSERT INTO `book` VALUES ('169', '三国演义', '罗贯中', '人民出版社', '2', '330', '中国古典名著之一，讲述三国时期的英雄与智谋', '0');
INSERT INTO `book` VALUES ('170', '西游记', '吴承恩', '人民出版社', '1', '500', '中国古典名著，讲述了唐僧师徒四人的取经历程', null);
INSERT INTO `book` VALUES ('171', '水浒传', '施耐庵', '人民出版社', '3', '280', '讲述了一百零八个英雄好汉的传奇故事', '1');
INSERT INTO `book` VALUES ('172', '红楼梦', '曹雪芹', '人民文学出版社', '2', '350', '中国古代文学的巅峰之作，讲述了贾宝玉与林黛玉的爱情故事', null);
INSERT INTO `book` VALUES ('173', '金瓶梅', '兰陵笑笑生', '人民文学出版社', '1', '250', '明代古典小说，揭示了封建社会家庭生活的荒诞与腐化', '11');
INSERT INTO `book` VALUES ('174', '唐顿庄园', 'Julian Fellowes', '人民文学出版社', '2', '195', '讲述了上世纪初英国贵族家庭的历史与纷争', '1');
INSERT INTO `book` VALUES ('175', '秘密', '朗达·拜恩', '北京联合出版公司', '3', '115', '一本关于吸引力法则和自我实现的哲学书籍', null);
INSERT INTO `book` VALUES ('176', '谋杀启事', 'Agatha Christie', '上海译文出版社', '1', '160', '阿加莎·克里斯蒂的经典侦探小说，揭秘了一宗谋杀案', null);
INSERT INTO `book` VALUES ('177', '火星救援', '安迪·威尔', '译林出版社', '2', '250', '讲述了宇航员在火星上的求生故事，探索了人类极限生存的可能性', '0');
INSERT INTO `book` VALUES ('178', '天使与魔鬼', '丹·布朗', '人民文学出版社', '1', '210', '著名的宗教与科学对立的故事，讲述了哈佛教授的惊险探险', null);
INSERT INTO `book` VALUES ('179', '骆驼祥子', '老舍', '人民文学出版社', '3', '120', '讲述了北平一名车夫祥子追求幸福与独立的悲剧', '0');
INSERT INTO `book` VALUES ('180', '白夜行', '东野圭吾', '人民文学出版社', '2', '180', '悬疑小说，讲述了两个人如何在黑暗中寻找光明', '0');
INSERT INTO `book` VALUES ('181', '活下去的理由', '马特·海格', '译林出版社', '1', '135', '通过作者自己的故事，探讨了如何走出抑郁症的阴霾', '1');
INSERT INTO `book` VALUES ('182', '邪不压正', '王朔', '作家出版社', '3', '150', '通过现代社会的寓言，揭示人性中的黑暗与善良', '11');
INSERT INTO `book` VALUES ('183', '岛上书店', '加布瑞埃拉·泽文', '作家出版社', '2', '130', '讲述了书店与小镇之间的温馨关系与对人心的影响', null);
INSERT INTO `book` VALUES ('184', '长恨歌', '白居易', '人民文学出版社', '1', '100', '白居易的经典诗歌，讲述唐代杨贵妃与唐明皇的悲情故事', '11');
INSERT INTO `book` VALUES ('185', '无声告白', '莉莎·珠诺', '作家出版社', '2', '175', '讲述了一个家庭的秘密与生活的冲突', '1');
INSERT INTO `book` VALUES ('186', '天鹅绒的双手', '伊莎贝尔·阿连德', '译林出版社', '3', '145', '一段关于家庭与爱情的故事，带有浓郁的拉美风情', '1');
INSERT INTO `book` VALUES ('187', '追忆似水年华', '马塞尔·普鲁斯特', '人民文学出版社', '1', '350', '通过回忆的叙述，讲述了主人公的成长与人际关系', '1');
INSERT INTO `book` VALUES ('188', '嫌疑人X的献身', '东野圭吾', '译林出版社', '2', '160', '一部引人入胜的推理小说，讲述了一个牺牲与智慧的故事', null);
INSERT INTO `book` VALUES ('189', '十年一品温如言', '林笛儿', '作家出版社', '3', '115', '一本浪漫小说，讲述了一段长久等待的爱情', null);
INSERT INTO `book` VALUES ('190', '百年孤独', '加西亚·马尔克斯', '人民文学出版社', '1', '250', '通过布恩迪亚家族的故事，讲述了拉丁美洲的历史与文化', '00');
INSERT INTO `book` VALUES ('191', '活着', '余华', '作家出版社', '2', '150', '讲述了一个普通人家庭的苦难与坚韧，揭示了生命的意义', '0');
INSERT INTO `book` VALUES ('192', '天堂的钥匙', '布莱恩·韦斯', '作家出版社', '1', '210', '本书探讨了前世回溯与转世的哲学和心理学', '1');
INSERT INTO `book` VALUES ('193', '平凡的世界', '路遥', '人民文学出版社', '3', '240', '通过讲述一个农村青年的成长，展现了社会与个体的斗争', '1');
INSERT INTO `book` VALUES ('194', '拆掉思维里的墙', '邓健', '中信出版社', '2', '130', '通过心理学的视角，帮助人们拆除思维中的壁垒，提升认知', '1');
INSERT INTO `book` VALUES ('195', '百年孤独', '加西亚·马尔克斯', '人民文学出版社', '1', '250', '讲述了布恩迪亚家族七代人的传奇历史，充满魔幻与现实交织的魅力', '1');
INSERT INTO `book` VALUES ('196', '月亮与六便士', '威廉·萨默塞特·毛姆', '译林出版社', '3', '210', '小说讲述了一个艺术家为追求内心的艺术理想而摒弃一切的故事', '1');
INSERT INTO `book` VALUES ('197', '人性的弱点', '戴尔·卡耐基', '华夏出版社', '1', '160', '本书探讨了人类行为中的弱点以及如何克服这些弱点，实现个人成功', null);
INSERT INTO `book` VALUES ('198', '钢铁是怎样炼成的', '尼古拉·奥斯特洛夫斯基', '人民文学出版社', '2', '185', '通过主人公保尔·柯察金的奋斗历程，讲述了苏联革命时期的英雄气概', '1');
INSERT INTO `book` VALUES ('199', '洛丽塔', '弗拉基米尔·纳博科夫', '人民文学出版社', '3', '200', '一部充满争议的小说，讲述了人类欲望的复杂性与道德的挑战', '1');
INSERT INTO `book` VALUES ('200', '乌合之众', '古斯塔夫·勒庞', '商务印书馆', '1', '190', '本书深入探讨了群体心理学与大众行为，分析了群众心态对社会的影响', '1');
INSERT INTO `book` VALUES ('201', '达芬奇密码', '丹·布朗', '上海译文出版社', '2', '220', '讲述了哈佛符号学教授罗伯特·兰登解开隐藏在艺术作品中的谜题', null);
INSERT INTO `book` VALUES ('202', '解忧杂货店', '东野圭吾', '南海出版公司', '3', '130', '通过杂货店帮助人们解决生活中的难题，揭示人性中的温情与坚韧', '11');
INSERT INTO `book` VALUES ('203', '活下去的理由', '马特·海格', '译林出版社', '1', '140', '通过作者自己与抑郁症的斗争，探讨了生命的意义与自我救赎', '1');
INSERT INTO `book` VALUES ('204', '傲慢与偏见', '简·奥斯汀', '人民文学出版社', '2', '210', '讲述了伊丽莎白与达西之间的爱情故事，揭示了社会阶层与性格对婚姻的影响', '1');
INSERT INTO `book` VALUES ('205', '杀死一只知更鸟', '哈珀·李', '人民文学出版社', '3', '190', '一本揭示种族不平等与道德勇气的经典之作', null);
INSERT INTO `book` VALUES ('206', '百年孤独', '加西亚·马尔克斯', '译林出版社', '1', '250', '通过布恩迪亚家族的故事，揭示拉美历史的变迁与个人命运', '0');
INSERT INTO `book` VALUES ('207', '我不喜欢这世界，我只喜欢你', '蔡康永', '百花文艺出版社', '2', '135', '这是一段充满哲理与温情的爱情故事，探索人与人之间的关系', null);
INSERT INTO `book` VALUES ('208', '傲慢与偏见', '简·奥斯汀', '人民文学出版社', '3', '200', '探讨了婚姻、财富与社会阶级的影响，体现了爱情中的偏见与自负', '0');
INSERT INTO `book` VALUES ('209', '解忧杂货店', '东野圭吾', '南海出版公司', '1', '145', '这是一家可以解决人们烦恼的杂货店，每个人都能在这里找到答案', '1');
INSERT INTO `book` VALUES ('210', '追风筝的人', '卡勒德·胡赛尼', '南海出版公司', '2', '190', '一部关于亲情、友情与救赎的感人小说，背景设置在战乱的阿富汗', '1');
INSERT INTO `book` VALUES ('211', '时间简史', '斯蒂芬·霍金', '译林出版社', '1', '200', '本书深入浅出地讲解了宇宙的起源、黑洞、时间的流逝等科学概念', '11');
INSERT INTO `book` VALUES ('212', '岛上书店', '加布瑞埃拉·泽文', '作家出版社', '3', '135', '讲述了书店与小镇之间的温馨故事，探讨了生活中的情感与关系', '1');
INSERT INTO `book` VALUES ('213', '十年一品温如言', '林笛儿', '作家出版社', '1', '120', '一本关于爱情与等待的小说，讲述了一个温柔的情感故事', '1');
INSERT INTO `book` VALUES ('214', '火星救援', '安迪·威尔', '译林出版社', '2', '250', '讲述了宇航员马克·沃特尼在火星上生存的故事，探索了极限生存的可能性', '1');
INSERT INTO `book` VALUES ('215', '杀死一只知更鸟', '哈珀·李', '人民文学出版社', '1', '190', '本书揭示了美国南方种族主义的严酷现实，展示了正义与人性的力量', null);
INSERT INTO `book` VALUES ('216', '平凡的世界', '路遥', '人民文学出版社', '3', '210', '通过主人公的奋斗，展现了当时中国社会的变迁与底层人民的苦难', '1');
INSERT INTO `book` VALUES ('217', '情书', '泉谷麻里', '现代出版社', '2', '135', '一封迟到的情书，讲述了一段跨越时间的爱情故事', null);
INSERT INTO `book` VALUES ('218', '明朝那些事儿', '当年明月', '中国友谊出版公司', '3', '220', '通过讲述明朝历史的故事，提供了一种有趣且通俗的历史视角', null);
INSERT INTO `book` VALUES ('219', '简爱', '夏洛蒂·勃朗特', '人民文学出版社', '1', '210', '通过简·爱与罗切斯特先生的爱情故事，探讨了自尊与平等的主题', null);
INSERT INTO `book` VALUES ('220', '大江大海1949', '龙应台', '台港出版社', '2', '250', '通过个人的历史回顾，讲述了1949年中国的历史和社会变迁', null);
INSERT INTO `book` VALUES ('221', '围城', '钱钟书', '人民文学出版社', '3', '180', '讲述了年轻知识分子方鸿渐的成长历程，具有深刻的社会和人性讽刺', null);
INSERT INTO `book` VALUES ('222', '许三多', '韩寒', '作家出版社', '1', '210', '一部结合幽默与深刻的现代小说，讲述了都市中的青年困境', null);
INSERT INTO `book` VALUES ('223', '流浪地球', '刘慈欣', '人民文学出版社', '2', '230', '一部关于地球末日时的科幻小说，探索人类如何面对全球危机', null);
INSERT INTO `book` VALUES ('224', '活下去的理由', '马特·海格', '译林出版社', '3', '150', '一本关于如何战胜抑郁症和重建生活的心灵鸡汤', null);
INSERT INTO `book` VALUES ('225', '月亮与六便士', '威廉·萨默塞特·毛姆', '译林出版社', '1', '200', '通过讲述一位艺术家追寻自己理想的故事，探讨了自我与现实的冲突', null);
INSERT INTO `book` VALUES ('226', '时间简史', '斯蒂芬·霍金', '译林出版社', '2', '240', '用通俗易懂的语言探讨宇宙的起源、黑洞以及时间的概念', null);
INSERT INTO `book` VALUES ('227', '解忧杂货店', '东野圭吾', '南海出版公司', '3', '160', '一间神奇的杂货店，每个来信的人都能得到它的帮助，最终找到属于自己的答案', null);
INSERT INTO `book` VALUES ('228', '倾城之恋', '张爱玲', '人民文学出版社', '1', '175', '讲述了一个充满爱情与婚姻困境的动人故事', null);
INSERT INTO `book` VALUES ('229', '沉默的大多数', '王小波', '作家出版社', '2', '150', '王小波的随笔集，关注社会、政治和人性的思考', null);
INSERT INTO `book` VALUES ('230', '平凡的世界', '路遥', '人民文学出版社', '3', '220', '讲述了一个从农村走出的青年如何在社会变迁中成长', null);
INSERT INTO `book` VALUES ('231', '追风筝的人', '卡勒德·胡赛尼', '南海出版公司', '1', '240', '一段跨越多年、跨越国界的友情和爱情故事，背景设在阿富汗', null);
INSERT INTO `book` VALUES ('232', '无声告白', '伍绮诗', '现代出版社', '2', '180', '讲述了一个家族的秘密以及父母与孩子之间复杂的情感纠葛', null);
INSERT INTO `book` VALUES ('233', '偷影子的人', '马克·李维', '作家出版社', '3', '160', '一部关于生命、梦想与人际关系的现代小说', null);
INSERT INTO `book` VALUES ('234', '简爱', '夏洛蒂·勃朗特', '人民文学出版社', '1', '200', '一部探索女性独立与爱情的经典作品，讲述了简爱与罗切斯特之间的爱情', null);
INSERT INTO `book` VALUES ('235', '杀死一只知更鸟', '哈珀·李', '人民文学出版社', '2', '190', '本书通过讲述一个小女孩的成长故事，探讨了美国南方的种族主义问题', null);
INSERT INTO `book` VALUES ('236', '半生缘', '张爱玲', '人民文学出版社', '3', '170', '一部关于人性与爱情的小说，讲述了两个女人与男人之间复杂的情感纠葛', null);
INSERT INTO `book` VALUES ('237', '百年孤独', '加西亚·马尔克斯', '人民文学出版社', '1', '250', '一部充满魔幻现实主义色彩的小说，讲述了布恩迪亚家族的七代人', null);
INSERT INTO `book` VALUES ('238', '悲惨世界', '维克多·雨果', '人民文学出版社', '2', '300', '通过一系列复杂的人物，描述了法国社会的不平等和人性的善恶', null);
INSERT INTO `book` VALUES ('239', '国富论', '亚当·斯密', '商务印书馆', '3', '220', '一部关于经济学的经典之作，分析了市场经济和劳动分工的基础', null);
INSERT INTO `book` VALUES ('240', '红与黑', '司汤达', '人民文学出版社', '1', '280', '讲述了一个年轻人在18世纪法国的野心与奋斗，反映了阶级、爱情与政治的主题', null);
INSERT INTO `book` VALUES ('241', '复活', '列夫·托尔斯泰', '人民文学出版社', '2', '260', '一部讲述俄罗斯贵族青年忏悔与道德重生的小说', null);
INSERT INTO `book` VALUES ('242', '狼图腾', '姜戎', '人民文学出版社', '3', '230', '讲述了蒙古草原与狼群的故事，反映了人与自然的关系', null);
INSERT INTO `book` VALUES ('243', '挪威的森林', '村上春树', '上海译文出版社', '1', '210', '一部关于青春、爱情、成长的小说，深刻探讨了人性的孤独与矛盾', null);
INSERT INTO `book` VALUES ('244', '恶意', '东野圭吾', '南海出版公司', '2', '190', '东野圭吾的犯罪推理小说，讲述了两人之间因善与恶引发的纠葛', null);
INSERT INTO `book` VALUES ('245', '奇点临近', '雷·库兹韦尔', '中信出版社', '3', '220', '一本关于科技发展与未来的畅想，探讨了人工智能与人类命运的关系', null);
INSERT INTO `book` VALUES ('246', '百年孤独', '加西亚·马尔克斯', '人民文学出版社', '1', '250', '一部以拉美历史为背景的魔幻现实主义小说，讲述了一个家族七代的故事', null);
INSERT INTO `book` VALUES ('247', '自控力', '凯利·麦格尼戈尔', '中信出版社', '2', '180', '一本帮助人们增强自控力的心理学著作', null);
INSERT INTO `book` VALUES ('248', '风起', '古龙', '现代出版社', '3', '200', '一部古龙的经典小说，讲述了一个侠客与爱情的故事', null);
INSERT INTO `book` VALUES ('249', '银河帝国三部曲', '艾萨克·阿西莫夫', '人民文学出版社', '1', '300', '以未来银河帝国为背景，探讨了文明、历史与科技之间的关系', null);
INSERT INTO `book` VALUES ('250', '达芬奇密码', '丹·布朗', '上海译文出版社', '2', '210', '通过对历史和宗教符号的破解，揭示了一个隐秘的世界', null);
INSERT INTO `book` VALUES ('251', '解忧杂货店', '东野圭吾', '南海出版公司', '3', '160', '一部温暖人心的小说，讲述了一个奇特的杂货店如何改变了人们的命运', null);
INSERT INTO `book` VALUES ('252', '三体', '刘慈欣', '人民文学出版社', '1', '230', '一部探讨人类与外星文明的科幻小说，揭示了宇宙的浩瀚与未知', null);
INSERT INTO `book` VALUES ('253', '爱情故事', '埃里奇·西格尔', '作家出版社', '2', '150', '讲述了一段悲壮的爱情故事，至今感动无数人', null);
INSERT INTO `book` VALUES ('254', '天使与魔鬼', '丹·布朗', '上海译文出版社', '3', '220', '一部充满悬疑与智慧的小说，探讨了宗教与科学之间的冲突', null);
INSERT INTO `book` VALUES ('255', '时间的皱折', '玛德琳·兰格尔', '人民文学出版社', '1', '210', '讲述了几个孩子穿越时空的冒险，探索了宇宙的秘密', null);
INSERT INTO `book` VALUES ('256', '东周列国志', '冯梦龙', '中华书局', '2', '240', '通过历史的角度，描写了中国春秋战国时期的列国争霸', null);
INSERT INTO `book` VALUES ('257', '追忆似水年华', '马塞尔·普鲁斯特', '人民文学出版社', '3', '270', '一部关于记忆与时间的哲学小说，深入探索了人类心灵的深处', null);
INSERT INTO `book` VALUES ('258', '岛屿', '阿尔贝·加缪', '作家出版社', '1', '200', '讲述了哲学家阿尔贝·加缪对生命与死亡的思考', null);
INSERT INTO `book` VALUES ('259', '平凡的世界', '路遥', '人民文学出版社', '2', '220', '描述了普通人在大时代背景下的奋斗与坚持', null);
INSERT INTO `book` VALUES ('260', '尤利西斯', '詹姆斯·乔伊斯', '人民文学出版社', '3', '250', '一部关于时间、记忆与语言的现代主义文学经典', null);
INSERT INTO `book` VALUES ('261', '11', '11', '11', '1', '11', '11', null);
INSERT INTO `book` VALUES ('262', '1', '1', '1', '1', '1', '1', null);

-- ----------------------------
-- Table structure for book_category
-- ----------------------------
DROP TABLE IF EXISTS `book_category`;
CREATE TABLE `book_category` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of book_category
-- ----------------------------
INSERT INTO `book_category` VALUES ('1', '小说');
INSERT INTO `book_category` VALUES ('2', '历史');
INSERT INTO `book_category` VALUES ('3', '计算机');
INSERT INTO `book_category` VALUES ('4', '哲学');
INSERT INTO `book_category` VALUES ('5', '社会科学');
INSERT INTO `book_category` VALUES ('6', '政治法律');
INSERT INTO `book_category` VALUES ('7', '军事科学');
INSERT INTO `book_category` VALUES ('8', '中国文学');
INSERT INTO `book_category` VALUES ('9', '外国文学');
INSERT INTO `book_category` VALUES ('10', '外国传记');
INSERT INTO `book_category` VALUES ('11', '英语');
INSERT INTO `book_category` VALUES ('12', '俄国小说');
INSERT INTO `book_category` VALUES ('13', '心理学');
INSERT INTO `book_category` VALUES ('14', '言情小说');
INSERT INTO `book_category` VALUES ('15', '武侠小说');
INSERT INTO `book_category` VALUES ('16', '环境科学');
INSERT INTO `book_category` VALUES ('17', '纪实文学');
INSERT INTO `book_category` VALUES ('18', '爽文');
INSERT INTO `book_category` VALUES ('19', '类别');
INSERT INTO `book_category` VALUES ('20', '恐怖');
INSERT INTO `book_category` VALUES ('21', '你好');
INSERT INTO `book_category` VALUES ('22', '惊悚');
INSERT INTO `book_category` VALUES ('23', '零零');
INSERT INTO `book_category` VALUES ('24', '剧情');
INSERT INTO `book_category` VALUES ('25', '校园');
INSERT INTO `book_category` VALUES ('79', '散文');
INSERT INTO `book_category` VALUES ('80', '散文');
INSERT INTO `book_category` VALUES ('81', '11');

-- ----------------------------
-- Table structure for borrowingbooks
-- ----------------------------
DROP TABLE IF EXISTS `borrowingbooks`;
CREATE TABLE `borrowingbooks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `book_id` int DEFAULT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `book_id` (`book_id`) USING BTREE,
  CONSTRAINT `borrowingbooks_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`),
  CONSTRAINT `borrowingbooks_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of borrowingbooks
-- ----------------------------
INSERT INTO `borrowingbooks` VALUES ('79', '28', '7', '2024-11-14');
INSERT INTO `borrowingbooks` VALUES ('80', '28', '112', '2024-11-14');
INSERT INTO `borrowingbooks` VALUES ('81', '28', '40', '2024-11-14');
INSERT INTO `borrowingbooks` VALUES ('82', '28', '25', '2024-11-14');
INSERT INTO `borrowingbooks` VALUES ('83', '28', '98', '2024-11-14');
INSERT INTO `borrowingbooks` VALUES ('84', '28', '8', '2024-11-14');
INSERT INTO `borrowingbooks` VALUES ('85', '28', '179', '2024-11-14');
INSERT INTO `borrowingbooks` VALUES ('86', '28', '47', '2024-11-14');
INSERT INTO `borrowingbooks` VALUES ('87', '28', '74', '2024-11-14');
INSERT INTO `borrowingbooks` VALUES ('89', '1', '144', '2024-11-14');
INSERT INTO `borrowingbooks` VALUES ('90', '1', '192', '2024-11-14');
INSERT INTO `borrowingbooks` VALUES ('91', '1', '55', '2024-11-14');
INSERT INTO `borrowingbooks` VALUES ('92', '1', '196', '2024-11-14');
INSERT INTO `borrowingbooks` VALUES ('93', '1', '86', '2024-11-14');
INSERT INTO `borrowingbooks` VALUES ('94', '1', '41', '2024-11-14');
INSERT INTO `borrowingbooks` VALUES ('95', '1', '106', '2024-11-14');
INSERT INTO `borrowingbooks` VALUES ('97', '27', '17', '2024-11-14');
INSERT INTO `borrowingbooks` VALUES ('98', '27', '151', '2024-11-14');
INSERT INTO `borrowingbooks` VALUES ('99', '27', '232', '2024-11-14');
INSERT INTO `borrowingbooks` VALUES ('100', '27', '113', '2024-11-14');
INSERT INTO `borrowingbooks` VALUES ('101', '27', '139', '2024-11-14');
INSERT INTO `borrowingbooks` VALUES ('102', '27', '137', '2024-11-14');
INSERT INTO `borrowingbooks` VALUES ('103', '27', '136', '2024-11-14');
INSERT INTO `borrowingbooks` VALUES ('104', '27', '229', '2024-11-14');
INSERT INTO `borrowingbooks` VALUES ('105', '27', '68', '2024-11-14');
INSERT INTO `borrowingbooks` VALUES ('106', '27', '161', '2024-11-14');
INSERT INTO `borrowingbooks` VALUES ('107', '27', '220', '2024-11-14');
INSERT INTO `borrowingbooks` VALUES ('108', '27', '252', '2024-11-14');
INSERT INTO `borrowingbooks` VALUES ('109', '27', '149', '2024-11-15');
INSERT INTO `borrowingbooks` VALUES ('110', '27', '26', '2024-11-15');
INSERT INTO `borrowingbooks` VALUES ('111', '27', '119', '2024-11-15');
INSERT INTO `borrowingbooks` VALUES ('113', '27', '233', '2024-11-15');
INSERT INTO `borrowingbooks` VALUES ('114', '1', '170', '2024-11-19');

-- ----------------------------
-- Table structure for feedback
-- ----------------------------
DROP TABLE IF EXISTS `feedback`;
CREATE TABLE `feedback` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `createdAt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of feedback
-- ----------------------------
INSERT INTO `feedback` VALUES ('1', '1111', '222@qq.com', 0x32323232333233, '2024-11-04 01:49:24');
INSERT INTO `feedback` VALUES ('2', '常规', '222@qq.com', 0xE69C89E5BE85E68F90E9AB98, '2024-11-05 06:19:08');
INSERT INTO `feedback` VALUES ('3', 'wl', '862198394@qq.com', 0xE5868DE68EA5E5868DE58E89, '2024-11-11 07:08:56');
INSERT INTO `feedback` VALUES ('4', 'ooo', '111@qq.com', 0xE68A93E9A9AC, '2024-11-11 07:09:26');
INSERT INTO `feedback` VALUES ('5', '111', '13421865766@163.com', 0x313131, '2024-11-19 08:15:47');
INSERT INTO `feedback` VALUES ('6', 'wl', '222@qq.com', 0xE58AA0E6B2B9, '2024-11-20 05:30:56');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(20) DEFAULT NULL,
  `user_pwd` varchar(20) DEFAULT NULL,
  `user_email` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'user11', '123456', '501455447@qq.com');
INSERT INTO `user` VALUES ('2', '111', '123456', '13421865766@163.com');
INSERT INTO `user` VALUES ('3', 'lxy', '123456', '222@qq.com');
INSERT INTO `user` VALUES ('4', 'wl', '123456', 'admin@qq.com');
INSERT INTO `user` VALUES ('27', 'user2', '123456', '222@qq.com');
INSERT INTO `user` VALUES ('28', 'wl', '1234566', '862198394@qq.com');
INSERT INTO `user` VALUES ('33', '111', '123456', '222@qq.com');
