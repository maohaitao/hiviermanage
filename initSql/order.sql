----��Ʒ������Ϣ��
CREATE TABLE `t_product` (
  `p_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '�߼�ID',
  `p_name` varchar(128) NOT NULL COMMENT '��Ʒ����',
  `p_type` varchar(20) NOT NULL COMMENT '��Ʒ����',
  `p_url` varchar(128) NOT NULL COMMENT '��ƷURL',
  `p_price` double(8) NOT NULL COMMENT '��Ʒ����',
  `p_producer_id` int(10) NULL COMMENT '������',
  `p_company` varchar(8) NOT NULL COMMENT '��Ʒ��λ',
  `last_update_by` int(11) NOT NULL COMMENT '����޸���',
  `last_update_date` date NOT NULL  COMMENT '����޸�ʱ��',
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


----�����̻�����Ϣ��
CREATE TABLE `t_producer` (
  `pro_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '�߼�ID',
  `pro_name` varchar(64) NOT NULL COMMENT '����',
  `pro_add` varchar(128) NOT NULL COMMENT '��ַ',
  `pro_url` varchar(128) NOT NULL COMMENT 'URL',
  `pro_tel` varchar(64) NULL COMMENT '�绰����',
  `pro_mobile` varchar(64) NULL COMMENT '�ֻ�����',
  `pro_zipcode` varchar(8) NOT NULL COMMENT '�ʱ�',
  `pro_qq` varchar(16) NULL COMMENT 'qq',
  `pro_mail` varchar(24) NULL COMMENT '�ʱ�',
  `pro_des` varchar(128) NULL COMMENT '��ע',
  `last_update_by` int(11) NOT NULL COMMENT '����޸���',
  `last_update_date` date NOT NULL  COMMENT '����޸�ʱ��',
  PRIMARY KEY (`per_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


----����������Ϣ�� 
CREATE TABLE `t_stock` (
  `st_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '�߼�ID',
  `st_create_time` varchar(64) NOT NULL COMMENT '����',
  `st_status` int(8) NOT NULL COMMENT '״̬1 �½� 2��Ч 3��Ч',
  `st_total` double(12) NULL COMMENT '�ܽ��',
  `last_update_by` int(11) NOT NULL COMMENT '����޸���',
  `last_update_date` date NOT NULL  COMMENT '����޸�ʱ��',
  PRIMARY KEY (`st_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

---������ϸ��Ϣ
CREATE TABLE `t_st_producer` (
  `stp_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '�߼�ID',
  `p_name` varchar(128) NOT NULL COMMENT '��Ʒ����',
  `p_type` varchar(20) NOT NULL COMMENT '��Ʒ����',
  `p_url` varchar(128) NOT NULL COMMENT '��ƷURL',
  `p_price` double(8) NOT NULL COMMENT '��Ʒ����',
  `p_producer_id` int(10) NULL COMMENT '������',
  `p_company` varchar(8) NOT NULL COMMENT '��Ʒ��λ',
  `last_update_by` int(11) NOT NULL COMMENT '����޸���',
  `last_update_date` date NOT NULL  COMMENT '����޸�ʱ��',
  PRIMARY KEY (`stp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
