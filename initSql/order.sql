----产品基础信息表
CREATE TABLE `t_product` (
  `p_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '逻辑ID',
  `p_name` varchar(128) NOT NULL COMMENT '产品名称',
  `p_type` varchar(20) NOT NULL COMMENT '产品分类',
  `p_url` varchar(128) NOT NULL COMMENT '产品URL',
  `p_price` double(8) NOT NULL COMMENT '产品单价',
  `p_producer_id` int(10) NULL COMMENT '生产商',
  `p_company` varchar(8) NOT NULL COMMENT '产品单位',
  `last_update_by` int(11) NOT NULL COMMENT '最后修改者',
  `last_update_date` date NOT NULL  COMMENT '最后修改时间',
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


----进货商基础信息表
CREATE TABLE `t_producer` (
  `pro_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '逻辑ID',
  `pro_name` varchar(64) NOT NULL COMMENT '姓名',
  `pro_add` varchar(128) NOT NULL COMMENT '地址',
  `pro_url` varchar(128) NOT NULL COMMENT 'URL',
  `pro_tel` varchar(64) NULL COMMENT '电话号码',
  `pro_mobile` varchar(64) NULL COMMENT '手机号码',
  `pro_zipcode` varchar(8) NOT NULL COMMENT '邮编',
  `pro_qq` varchar(16) NULL COMMENT 'qq',
  `pro_mail` varchar(24) NULL COMMENT '邮编',
  `pro_des` varchar(128) NULL COMMENT '备注',
  `last_update_by` int(11) NOT NULL COMMENT '最后修改者',
  `last_update_date` date NOT NULL  COMMENT '最后修改时间',
  PRIMARY KEY (`per_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


----进货基础信息表 
CREATE TABLE `t_stock` (
  `st_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '逻辑ID',
  `st_create_time` varchar(64) NOT NULL COMMENT '姓名',
  `st_status` int(8) NOT NULL COMMENT '状态1 新建 2有效 3无效',
  `st_total` double(12) NULL COMMENT '总金额',
  `last_update_by` int(11) NOT NULL COMMENT '最后修改者',
  `last_update_date` date NOT NULL  COMMENT '最后修改时间',
  PRIMARY KEY (`st_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

---进货详细信息
CREATE TABLE `t_st_producer` (
  `stp_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '逻辑ID',
  `p_name` varchar(128) NOT NULL COMMENT '产品名称',
  `p_type` varchar(20) NOT NULL COMMENT '产品分类',
  `p_url` varchar(128) NOT NULL COMMENT '产品URL',
  `p_price` double(8) NOT NULL COMMENT '产品单价',
  `p_producer_id` int(10) NULL COMMENT '生产商',
  `p_company` varchar(8) NOT NULL COMMENT '产品单位',
  `last_update_by` int(11) NOT NULL COMMENT '最后修改者',
  `last_update_date` date NOT NULL  COMMENT '最后修改时间',
  PRIMARY KEY (`stp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
