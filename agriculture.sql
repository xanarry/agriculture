DROP DATABASE IF EXISTS db_agricultrue;
CREATE DATABASE IF NOT EXISTS db_agricultrue
  charset = "utf8";
USE db_agricultrue;

/* 操作员没有任何类型, 系统管理员也只有一个, 系统操作员则分为{合作社", "种植大户", "公司"} */
DROP TABLE IF EXISTS t_user;
CREATE TABLE t_user (
  `ID`             VARCHAR(20) PRIMARY KEY, /*身份证号码, 唯一标示用户*/
  `name`           VARCHAR(10)  NOT NULL, /*姓名*/
  `loginName`      VARCHAR(20)  NOT NULL UNIQUE, /*登录名*/
  `email`          VARCHAR(254), /**/
  `phone`          VARCHAR(25), /**/
  `leaderID`       VARCHAR(20), /*直属领导ID*/
  `leaderName`     VARCHAR(10), /*领导名字*/
  `role`           ENUM ("系统管理员", "系统操作员", "操作员")   DEFAULT "操作员", /*用户角色*/
  `type`           ENUM ("合作社", "种植大户", "公司", "其他") DEFAULT "种植大户", /*用户类型*/
  `password`       VARCHAR(160) NOT NULL, /*用户密码,保存密码的sha1值*/
  `createTime`     BIGINT       NOT NULL, /*管理员账号创建时间*/
  `lastLoginTime`  BIGINT       NOT NULL, /*管理员最后登录时间*/
  `lastUpdateTime` BIGINT       NOT NULL, /*管理员密码最后修改时间*/
  `failureCount`   INT                              DEFAULT 0, /*失败次数*/
  `loginCount`     INT /*登录次数*/
)
  DEFAULT charset = "utf8"
  ENGINE = InnoDB;


/**
3.1标准库管理{农药,肥料,种子,兽药,饲料,饲料添加剂}
    3.1.1农药[编号,生产企业,类型,农药等级,适用行业,名称,条形码,单位,剂型,规格,推荐稀释倍数,推荐亩用量,农药登记证号,停药期（天）,针对病害,备注]
        3.1.1.1适用行业[农作物种植业,林业,畜牧业,渔业,农林牧渔服务业]
        3.1.1.2农药等级[高毒,中毒,低毒,微毒,限用]
    3.1.2肥料[编号,生产企业,类型,适用行业,名称,条形码,单位,成分及含量,规格,推荐稀释倍数,推荐亩用量,肥料登记证号,针对病害,备注]
    3.1.2种子[编号,生产企业,类型,适用行业,名称,条形码,单位,型号,规格,针对病害,备注]
    3.1.3兽药[编号,生产企业,类型,适用行业,名称,条形码,单位,型号,规格,兽药批准文号,针对病害,备注]
    3.1.4饲料[编号,生产企业,类型,适用行业,名称,条形码,单位,型号,规格,饲料登记证号,针对病害,备注]
    3.1.5饲料添加剂[编号,生产企业,类型,适用行业,名称,条形码,单位,型号,规格,针对病害,备注]
3.2采购管理[投入品名称,采购订单编号,采购数量,责任人,采购日期,供应商,生产厂家,生产日期,生产批号,有效期,附件,备注]
3.3投入品使用记录[批次号,产品名称,生产区,投入品名称,名称拼音简码,投入品编号,投入品类型表单名称,开始日期,结束日期]
3.4投入品库存[企业名称,投入品编号,投入品类型,投入品名称,单位,型号,规格,数量]
3.5购买人管理[姓名, 地址,联系电话]
*/










/*投入品管理===================================================*/


/*采购管理[投入品名称,采购订单编号,采购数量,责任人,采购日期,供应商,生产厂家,生产日期,生产批号,有效期,附件,备注]*/
DROP TABLE IF EXISTS t_purchase_record;
CREATE TABLE t_purchase_record (
  `ID`            INT PRIMARY KEY      AUTO_INCREMENT,
  `orderNO`       VARCHAR(20) NOT NULL, /*采购订单编号*/
  `materialNO`    VARCHAR(20) NOT NULL, /*投入品编号*/
  `materialName`  VARCHAR(20) NOT NULL, /*投入品名称*/
  `provider`      VARCHAR(30), /*供应商*/
  `producer`      varchar(30), /*生产厂家*/
  `purchaseCount` DOUBLE      NOT NULL, /*采购数量*/
  `unit`          VARCHAR(10), /*单位*/
  `purchaseDate`  date, /*采购日期*/
  `produceDate`   date, /*生产日期*/
  `produceNO`     VARCHAR(20), /*生产批号*/
  `validDate`     date, /*有效期*/
  `validDateUnit` ENUM ("年", "月", "日") DEFAULT "月", /*有效期单位*/
  `operator`      varchar(10), /*责任人*/
  `remark`        VARCHAR(100) /*备注*/
)
  DEFAULT charset = "utf8"
  ENGINE = InnoDB;


/*投入品使用记录[批次号,产品名称,生产区,投入品名称,投入品编号,投入品类型, 表单名称, 数量, 单位, 开始日期,结束日期]*/
DROP TABLE IF EXISTS t_material_use_record;
CREATE TABLE t_material_use_record (
  `ID`              INT PRIMARY KEY AUTO_INCREMENT,
  `produceTaskID`   VARCHAR(15) NOT NULL, /*生产任务批次号: 2018060841766, 年月日+64位微秒时间戳后5位*/
  `materialNO`      VARCHAR(20) NOT NULL, /*投入品编号*/
  `materialName`    VARCHAR(20) NOT NULL, /*投入品名称*/
  `product`         varchar(10), /*农产品名称*/
  `area`            VARCHAR(20), /*生产区*/
  `materialType`    VARCHAR(30), /*投入品类型*/
  `produceTaskItem` varchar(30), /*使用在生产任务的什么项目*/
  `useAmount`       DOUBLE, /*使用量*/
  `unit`            VARCHAR(10), /*使用量单位*/
  `userDate`        BIGINT, /*使用日期*/
  `remark`          VARCHAR(100) /*备注*/
)
  DEFAULT charset = "utf8"
  ENGINE = InnoDB;


/*投入品库存[企业名称,投入品编号,投入品类型,投入品名称,单位,型号,规格,数量]*/
DROP TABLE IF EXISTS t_material_remain;
CREATE TABLE t_material_remain (
  `materialNO`    VARCHAR(20) primary key NOT NULL, /*投入品编号*/
  `materialName`  VARCHAR(20)             NOT NULL, /*投入品名称*/
  `materialType`  VARCHAR(30), /*投入品类型*/
  `amount`        DOUBLE DEFAULT 0, /*数量*/
  `specification` VARCHAR(20), /*规格*/
  `unit`          VARCHAR(10), /*单位*/
  `model`         VARCHAR(20)/*型号*/
)
  DEFAULT charset = "utf8"
  ENGINE = InnoDB;

/*农药[编号,生产企业,类型,农药等级,适用行业,名称,条形码,单位,剂型,规格,推荐稀释倍数,推荐亩用量,农药登记证号,停药期（天）,针对病害,备注]*/
DROP TABLE IF EXISTS t_pesticide;
CREATE TABLE t_pesticide (
  `ID`              INT PRIMARY KEY AUTO_INCREMENT,
  `NO`              VARCHAR(20) NOT NULL UNIQUE, /*编号*/
  `name`            VARCHAR(20) NOT NULL, /*名称*/
  `producer`        VARCHAR(30), /*生产企业*/
  `specification`   VARCHAR(20), /*规格*/
  `unit`            VARCHAR(10), /*单位*/
  `model`           VARCHAR(20), /*型号*/
  `suitFor`         ENUM ("农作物种植业", "林业", "畜牧业", "渔业", "农林牧渔服务业"), /*适用行业*/
  `toxicityLevel`   ENUM ("高毒", "中毒", "低毒", "微毒", "限用"), /*农药等级*/
  `aimTo`           VARCHAR(30), /*针对病害*/
  `recommendDilute` TINYINT, /*推荐稀释倍数*/
  `preparation`     VARCHAR(20), /*剂型*/
  `recommendUseAmount` VARCHAR(20), /*亩用量*/
  `licenseNO`      VARCHAR(20), /*农药登记证号*/
  `stopdays`        MEDIUMINT, /*停药期*/
  `remark`          VARCHAR(100) /*备注*/
)
  DEFAULT charset = "utf8"
  ENGINE = InnoDB;


/*肥料[编号,生产企业,类型,适用行业,条形码,单位,成分及含量,规格,推荐稀释倍数,推荐亩用量,肥料登记证号,备注]*/
DROP TABLE IF EXISTS t_fertilizer;
CREATE TABLE t_fertilizer (
  `ID`                 INT PRIMARY KEY AUTO_INCREMENT,
  `NO`                 VARCHAR(20) NOT NULL UNIQUE, /*编号*/
  `name`               VARCHAR(20) NOT NULL, /*名称*/
  `producer`           VARCHAR(30), /*生产企业*/
  `specification`      VARCHAR(20), /*规格*/
  `unit`               VARCHAR(10), /*单位*/
  `model`              VARCHAR(20), /*型号*/
  `suitFor`            ENUM ("农作物种植业", "林业", "畜牧业", "渔业", "农林牧渔服务业"), /*适用行业*/
  `recommendDilute`    TINYINT, /*推荐稀释倍数*/
  `recommendUseAmount` VARCHAR(20), /*推荐亩用量*/
  `licenseNO`         VARCHAR(20), /*肥料登记证号*/
  `remark`             VARCHAR(200) /*备注*/
)
  DEFAULT charset = "utf8"
  ENGINE = InnoDB;

/*种子[编号,生产企业,类型,适用行业,名称,条形码,单位,型号,规格,备注]*/
DROP TABLE IF EXISTS t_seed;
CREATE TABLE t_seed (
  `ID`            INT PRIMARY KEY AUTO_INCREMENT,
  `NO`            VARCHAR(20) NOT NULL UNIQUE, /*编号*/
  `name`          VARCHAR(20) not null, /*名称*/
  `producer`      VARCHAR(30), /*生产企业*/
  `specification` VARCHAR(20), /*规格*/
  `unit`          VARCHAR(10), /*单位*/
  `model`         VARCHAR(20), /*型号*/
  `suitFor`       ENUM ("农作物种植业", "林业", "畜牧业", "渔业", "农林牧渔服务业"), /*适用行业*/
  `remark`        VARCHAR(200) /*备注*/
)
  DEFAULT charset = "utf8"
  ENGINE = InnoDB;


/*兽药[编号,生产企业,类型,适用行业,名称,条形码,单位,型号,规格,兽药批准文号,针对病害,备注]*/
DROP TABLE IF EXISTS t_veterinary_drug;
CREATE TABLE t_veterinary_drug (
  `ID`            INT PRIMARY KEY AUTO_INCREMENT,
  `NO`            VARCHAR(20) NOT NULL UNIQUE, /*编号*/
  `name`          VARCHAR(20) NOT NULL, /*名称*/
  `producer`      VARCHAR(30), /*生产企业*/
  `specification` VARCHAR(20), /*规格*/
  `unit`          VARCHAR(10), /*单位*/
  `model`         VARCHAR(20), /*型号*/
  `suitFor`       ENUM ("农作物种植业", "林业", "畜牧业", "渔业", "农林牧渔服务业"), /*适用行业*/
  `licenseNO`     VARCHAR(20), /*批准文号*/
  `aimTo`         VARCHAR(50), /*针对病害*/
  `remark`        VARCHAR(200) /*备注*/
)
  DEFAULT charset = "utf8"
  ENGINE = InnoDB;

/*饲料[编号,生产企业,类型,适用行业,名称,条形码,单位,型号,规格,兽药批准文号,备注]*/
DROP TABLE IF EXISTS t_forage;
CREATE TABLE t_forage (
  `ID`            INT PRIMARY KEY AUTO_INCREMENT,
  `NO`            VARCHAR(20) NOT NULL UNIQUE, /*编号*/
  `name`          VARCHAR(20) NOT NULL, /*名称*/
  `producer`      VARCHAR(30), /*生产企业*/
  `specification` VARCHAR(20), /*规格*/
  `unit`          VARCHAR(10), /*单位*/
  `model`         VARCHAR(20), /*型号*/
  `suitFor`       ENUM ("农作物种植业", "林业", "畜牧业", "渔业", "农林牧渔服务业"), /*适用行业*/
  `licenseNO`    VARCHAR(20), /*批准文号*/
  `remark`        VARCHAR(200) /*备注*/
)
  DEFAULT charset = "utf8"
  ENGINE = InnoDB;




















/*
生产任务[批次号,生产区(只有一个),生产区块(有一个或多个),产品名称,新建质询,回答质询,关闭质询,企业组,录入人,状态,创建时间]
  1产品批次信息[产品名称,产品类别,生产区,生产区块名称,产品介绍]
​  2土地翻耕[翻耕时间,翻耕方式,责任人]
​  3播种信息[品种,种子来源,证明文件,购买单据,产品证明书,采购人,种子处理,亩用种量,播种方式,播种时间,播种密度,农事操作人员,定植时间,定植信息]
​  4整枝记录[日期,整枝方式,负责人]
​  5疏果记录[日期,作物名称,疏果方式,负责人]
​  6授粉记录[日期,授粉方式,负责人]
​  7施肥信息[施肥日期,肥料名称(引用肥料的信息),施肥时期,施肥方式,使用量(千克/亩),负责人]
​  8病虫害防治[病虫害名称,危害程度,防治目的,防治方法,使用物质(引用农药的信息),浓度,负责人]
​  9杂草管理[日期,杂草名称,除草方式,负责人]
​  10灌溉信息[日期,作物名称,灌溉方式,其他方式,用水来源,负责人]
​  11采摘信息[日期,采摘方式,采摘数量,单位,负责人]
​  12产品包装[产品名称,包装批号,包装日期,负责人,包装材料,包装数量,包装规格]
​  13产品检测信息[日期,检测依据/项目,检测结果]
​  14检验报告[样品编号,产(样)品名称,受(送)检单位,检验类别,检验依据,检验结论]
​  15销售流向信息[产品名称,销售日期,销往单位,数量,单位,其他单位,产品包装,运输方式,负责人]
*/

/*生产任务/产品批次信息[批次号,生产区,产品名称,新建质询,回答质询,关闭质询,企业组,录入人,状态,创建时间]*/
DROP TABLE IF EXISTS t_produce_task;
CREATE TABLE t_produce_task (
  `ID`            VARCHAR(15) PRIMARY KEY, /*任务ID, 即批次号: 2018060841766, 年月日+64位微秒时间戳后5位*/
  `productName`   VARCHAR(10)       NOT NULL, /*产品名*/
  `productType`   ENUM ("水果", "蔬菜") NOT NULL, /*产品类型*/
  `productDetail` TEXT, /*产品介绍*/
  `area`          VARCHAR(30)       NOT NULL, /*生产区*/
  `state`         ENUM ("待审核", "新建", "进行中", "完成", "作废"), /*状态*/
  `operator`      VARCHAR(10), /*录入人*/
  `createTime`    BIGINT /*创建时间*/
)
  DEFAULT charset = "utf8"
  ENGINE = InnoDB;


/*生产区块[ID, 区块名]*/
DROP TABLE IF EXISTS t_produce_area_block;
CREATE TABLE t_produce_area_block (
  `ID`            INT AUTO_INCREMENT PRIMARY KEY NOT NULL, /*ID*/
  `produceTaskID` VARCHAR(15)                    NOT NULL, /*生产批次号*/
  `areaBlock`     VARCHAR(10)                    NOT NULL UNIQUE /*生产区块*/
)
  DEFAULT charset = "utf8"
  ENGINE = InnoDB;

/*土地翻耕[翻耕时间,翻耕方式,责任人]*/
DROP TABLE IF EXISTS t_plough;
CREATE TABLE t_plough (
  `ID`            INT AUTO_INCREMENT PRIMARY KEY NOT NULL, /*耕地ID*/
  `produceTaskID` VARCHAR(15)                    NOT NULL, /*生产批次号*/
  `method`        VARCHAR(10)                    NOT NULL, /*耕种方式*/
  `operator`      VARCHAR(10)                    NOT NULL, /*操作人*/
  `operateTime`   BIGINT                         NOT NULL /*耕地时间*/
)
  DEFAULT charset = "utf8"
  ENGINE = InnoDB;

​/*播种信息[品种,种子来源,证明文件,购买单据,产品证明书,采购人,种子处理,亩用种量,播种方式,播种时间,播种密度,农事操作人员,定植时间,定植信息]*/
​ DROP TABLE IF EXISTS t_sow;
CREATE TABLE t_sow (
  `ID`               INT AUTO_INCREMENT PRIMARY KEY NOT NULL, /*ID*/
  `produceTaskID`    VARCHAR(15)                    NOT NULL, /*生产批次号*/
  `seed`             VARCHAR(10)                    NOT NULL, /*种子品种*/
  `source`           VARCHAR(20)                    NOT NULL, /*种子来源*/
  `handle`           VARCHAR(20), /*种子处理*/
  `amountPerMu`      DOUBLE, /*亩用量*/
  `sowingDensity`    DOUBLE, /*播种密度/亩*/
  `sowingMethod`     VARCHAR(20), /*播种方式*/
  `sowingDate`       BIGINT                         NOT NULL, /*播种时间*/
  `colonizationTime` BIGINT, /*定植时间*/
  `colonizationInfo` VARCHAR(20), /*定植信息*/
  `operator`         VARCHAR(10) /*采购人*/
)
  DEFAULT charset = "utf8"
  ENGINE = InnoDB;

/*整枝记录[日期,整枝方式,负责人]*/
​ DROP TABLE IF EXISTS t_pruning;
CREATE TABLE t_pruning (
  `ID`            INT AUTO_INCREMENT PRIMARY KEY NOT NULL, /*耕地ID*/
  `produceTaskID` VARCHAR(15)                    NOT NULL, /*生产批次号*/
  `method`        VARCHAR(10)                    NOT NULL, /*整枝方式*/
  `operator`      VARCHAR(10)                    NOT NULL, /*操作人*/
  `operateTime`   BIGINT                         NOT NULL /*耕地时间*/
)
  DEFAULT charset = "utf8"
  ENGINE = InnoDB;

/*疏果记录[日期,作物名称,疏果方式,负责人]*/
​ DROP TABLE IF EXISTS t_shuguo_record;
CREATE TABLE t_shuguo_record (
  `ID`            INT AUTO_INCREMENT PRIMARY KEY NOT NULL, /*耕地ID*/
  `produceTaskID` VARCHAR(15)                    NOT NULL, /*生产批次号*/
  `cropName`      VARCHAR(10)                    NOT NULL, /*作物名称*/
  `method`        VARCHAR(10)                    NOT NULL, /*蔬果方式*/
  `operator`      VARCHAR(10)                    NOT NULL, /*操作人*/
  `operateTime`   BIGINT                         NOT NULL /*耕地时间*/
)
  DEFAULT charset = "utf8"
  ENGINE = InnoDB;

/*授粉记录[日期,授粉方式,负责人]*/
​ DROP TABLE IF EXISTS t_pollination;
CREATE TABLE t_pollination (
  `ID`            INT AUTO_INCREMENT PRIMARY KEY NOT NULL, /*耕地ID*/
  `produceTaskID` VARCHAR(15)                    NOT NULL, /*生产批次号*/
  `method`        VARCHAR(10)                    NOT NULL, /*授粉方式*/
  `operator`      VARCHAR(10)                    NOT NULL, /*操作人*/
  `operateTime`   BIGINT                         NOT NULL /*耕地时间*/
)
  DEFAULT charset = "utf8"
  ENGINE = InnoDB;

/*施肥信息[施肥日期,肥料名称(引用肥料的信息),施肥时期,施肥方式,使用量(千克/亩),负责人]*/
​ DROP TABLE IF EXISTS t_fertilization;
CREATE TABLE t_fertilization (
  `ID`             INT AUTO_INCREMENT PRIMARY KEY NOT NULL, /*耕地ID*/
  `produceTaskID`  VARCHAR(15)                    NOT NULL, /*生产批次号*/
  `fertilizerID`   INT                            NOT NULL, /*肥料ID*/
  `fertilizerName` VARCHAR(10)                    NOT NULL, /*肥料名称*/
  `method`         VARCHAR(10)                    NOT NULL, /*施肥方式*/
  `useAmount`      DOUBLE, /*使用量(千克/亩)*/
  `operator`       VARCHAR(10)                    NOT NULL, /*负责人*/
  `operateTime`    BIGINT                         NOT NULL /*时间*/
)
  DEFAULT charset = "utf8"
  ENGINE = InnoDB;

/*病虫害防治[病虫害名称,危害程度,防治目的,防治方法,使用物质(引用农药的信息),浓度,负责人]*/
​ DROP TABLE IF EXISTS t_anti_disease_pest;
CREATE TABLE t_anti_disease_pest (
  `ID`            INT                                  AUTO_INCREMENT PRIMARY KEY NOT NULL, /*耕地ID*/
  `produceTaskID` VARCHAR(15)                                                     NOT NULL, /*生产批次号*/
  `dpName`        VARCHAR(10), /*病虫害名称*/
  `harmLevel`     ENUM ("可忽略", "轻度危害", "中度危害", "严重危害") DEFAULT "可忽略", /*危害程度*/
  `method`        VARCHAR(10)                                                     NOT NULL, /*防治方法*/
  `aimTo`         VARCHAR(10)                                                     NOT NULL, /*防治目的*/
  `pesticideID`   INT                                                             NOT NULL, /*使用农药ID*/
  `pesticideName` VARCHAR(20), /*使用农药名称*/
  `operator`      VARCHAR(10)                                                     NOT NULL, /*操作人*/
  `operateTime`   BIGINT                                                          NOT NULL /*时间*/
)
  DEFAULT charset = "utf8"
  ENGINE = InnoDB;

/*杂草管理[日期,杂草名称,除草方式,负责人]*/
​ DROP TABLE IF EXISTS t_weed;
CREATE TABLE t_weed (
  `ID`            INT AUTO_INCREMENT PRIMARY KEY NOT NULL, /*耕地ID*/
  `produceTaskID` VARCHAR(15)                    NOT NULL, /*生产批次号*/
  `weedName`      VARCHAR(10), /*杂草名*/
  `method`        VARCHAR(10)                    NOT NULL, /*授粉方式*/
  `operator`      VARCHAR(10)                    NOT NULL, /*操作人*/
  `operateTime`   BIGINT                         NOT NULL /*时间*/
)
  DEFAULT charset = "utf8"
  ENGINE = InnoDB;

/*灌溉信息[日期,作物名称,灌溉方式,其他方式,用水来源,负责人]*/
​ DROP TABLE IF EXISTS t_irrigation;
CREATE TABLE t_irrigation (
  `ID`            INT AUTO_INCREMENT PRIMARY KEY NOT NULL, /*耕地ID*/
  `produceTaskID` VARCHAR(15)                    NOT NULL, /*生产批次号*/
  `method`        VARCHAR(10)                    NOT NULL, /*灌溉方式*/
  `otherWay`      VARCHAR(20), /*其他方式*/
  `waterSource`   VARCHAR(20), /*用水来源*/
  `operator`      VARCHAR(10)                    NOT NULL, /*操作人*/
  `operateTime`   BIGINT                         NOT NULL /*时间*/
)
  DEFAULT charset = "utf8"
  ENGINE = InnoDB;


/*采摘信息[日期,采摘方式,采摘数量,单位,负责人]*/
​ DROP TABLE IF EXISTS t_product_pick;
CREATE TABLE t_product_pick (
  `ID`            INT AUTO_INCREMENT PRIMARY KEY NOT NULL, /*ID*/
  `produceTaskID` VARCHAR(15)                    NOT NULL, /*生产批次号*/
  `method`        VARCHAR(10)                    NOT NULL, /*方式*/
  `operator`      VARCHAR(10)                    NOT NULL, /*负责人*/
  `pickCount`     INT DEFAULT 0, /*采摘数量*/
  `unit`          VARCHAR(10), /*单位*/
  `operateTime`   BIGINT                         NOT NULL /*时间*/
)
  DEFAULT charset = "utf8"
  ENGINE = InnoDB;


/*产品包装[产品名称,包装批号,包装日期,负责人,包装材料,包装数量,包装规格]*/
​ DROP TABLE IF EXISTS t_product_pack;
CREATE TABLE t_product_pack (
  `ID`            INT AUTO_INCREMENT PRIMARY KEY NOT NULL, /*ID*/
  `produceTaskID` VARCHAR(15)                    NOT NULL, /*生产批次号*/
  `productName`   VARCHAR(10), /*产品名称*/
  `packingNO`     VARCHAR(10)                    NOT NULL, /*包装批号*/
  `packingCount`  INT DEFAULT 0, /*包装数量*/
  `material`      VARCHAR(20), /*包装材料*/
  `operator`      VARCHAR(10)                    NOT NULL, /*负责人*/
  `operateTime`   BIGINT                         NOT NULL /*包装日期*/
)
  DEFAULT charset = "utf8"
  ENGINE = InnoDB;

/*产品检测信息[日期,检测依据/项目,检测结果]*/
​ DROP TABLE IF EXISTS t_product_check;
CREATE TABLE t_product_check (
  `ID`            INT AUTO_INCREMENT PRIMARY KEY NOT NULL, /*耕地ID*/
  `produceTaskID` VARCHAR(15)                    NOT NULL, /*生产批次号*/
  `item`          VARCHAR(10), /*检测依据/项目*/
  `result`        VARCHAR(10)                    NOT NULL, /*检测结果*/
  `operator`      VARCHAR(10)                    NOT NULL, /*操作人*/
  `operateTime`   BIGINT                         NOT NULL /*时间*/
)
  DEFAULT charset = "utf8"
  ENGINE = InnoDB;

/*检验报告[样品编号,产(样)品名称,受(送)检单位,检验类别,检验依据,检验结论]*/
​ DROP TABLE IF EXISTS t_check_report;
CREATE TABLE t_check_report (
  `ID`            INT AUTO_INCREMENT PRIMARY KEY NOT NULL, /*ID*/
  `produceTaskID` VARCHAR(15)                    NOT NULL, /*生产批次号*/
  `sampleID`      VARCHAR(15)                    NOT NULL, /*样品编号*/
  `sampleName`    VARCHAR(10), /*产(样)品名称*/
  `institution`   VARCHAR(10)                    NOT NULL, /*受(送)检单位*/
  `checkType`     VARCHAR(10), /*检验类别*/
  `accordingTo`   VARCHAR(20), /*检验依据*/
  `result`        VARCHAR(20), /*检验结论*/
  `operator`      VARCHAR(10)                    NOT NULL, /*操作人*/
  `operateTime`   BIGINT                         NOT NULL /*时间*/
)
  DEFAULT charset = "utf8"
  ENGINE = InnoDB;

/*销售流向信息[产品名称,销售日期,销往单位,数量,单位,其他单位,产品包装,运输方式,负责人]*/
DROP TABLE IF EXISTS t_sell_info;
CREATE TABLE t_sell_info (
  `ID`            INT AUTO_INCREMENT PRIMARY KEY NOT NULL, /*耕地ID*/
  `produceTaskID` VARCHAR(15)                    NOT NULL, /*生产批次号*/
  `productName`   VARCHAR(20)                    NOT NULL, /*产品名称*/
  `sellTo`        VARCHAR(20)                    NOT NULL, /*销往单位*/
  `amount`        DOUBLE, /*数量*/
  `unit`          VARCHAR(10), /*单位*/
  `wrapMethod`    VARCHAR(20), /*包装方式*/
  `conveyMethod`  VARCHAR(20), /*运输方式*/
  `operator`      VARCHAR(10)                    NOT NULL, /*操作人*/
  `sellTime`      BIGINT /*销售日期*/
)
  DEFAULT charset = "utf8"
  ENGINE = InnoDB;


/*=========================================================*/




/*病虫害防治*/
DROP TABLE IF EXISTS t_diseases_and_pests_ctrl;
CREATE TABLE t_diseases_and_pests_ctrl (
  id                INT AUTO_INCREMENT PRIMARY KEY NOT NULL, /*每次预防的ID*/
  name              VARCHAR(20)                    NOT NULL, /*病虫害名称*/
  protectMethod     VARCHAR(10)                    NOT NULL, /*防治方法*/
  harmLevel         VARCHAR(10), /*危害程度*/
  preventionPurpose VARCHAR(20), /*防治目的*/
  pesticideID       VARCHAR(20)                    NOT NULL, /*农药ID*/
  pesticideName     VARCHAR(20)                    NOT NULL, /*农药名称*/
  concentration     VARCHAR(10), /*浓度*/
  dosage            VARCHAR(20), /*使用量*/
  useDate           BIGINT                         NOT NULL, /*使用日期*/
  operator          VARCHAR(10)                    NOT NULL  /*负责人*/
)
  DEFAULT charset = "utf8"
  AUTO_INCREMENT = 1
  ENGINE = InnoDB;


/*肥料使用*/
DROP TABLE IF EXISTS t_fertilization;
CREATE TABLE t_fertilization (
  id                  INT AUTO_INCREMENT PRIMARY KEY NOT NULL, /*施肥ID*/
  fertilizerID        INT                            NOT NULL, /*使用肥料的ID,参考t_fertilizer中的ID*/
  fertilizerName      VARCHAR(20)                    NOT NULL, /*使用肥料名称*/
  fertilizationPeriod VARCHAR(10)                    NOT NULL, /*施肥时期*/
  fertilizationMethod VARCHAR(20), /*施肥方式*/
  useAmount           VARCHAR(20), /*使用量*/
  useDate             BIGINT                         NOT NULL, /*使用日期*/
  operator            VARCHAR(10)  /*负责人*/
)
  DEFAULT charset = "utf8"
  ENGINE = InnoDB;


/*==========================================*/





/*========================================================*/
/*整枝记录, 有数据, 但是不清楚具体信息*/





/*========================================================*/












/*物资管理*/
DROP TABLE IF EXISTS t_goods;
CREATE TABLE t_goods (
  `ID`              INT         AUTO_INCREMENT PRIMARY KEY, /*物资ID*/
  `name`            VARCHAR(20) NOT NULL, /*名称*/
  `NO`              VARCHAR(32) DEFAULT "", /*编号*/
  `model`           VARCHAR(20) DEFAULT "", /*型号*/
  `type`            VARCHAR(10) DEFAULT "", /*物资类型*/
  `producer`        VARCHAR(20), /*生产商*/
  `remain`          DOUBLE, /*余量*/
  `unit`            VARCHAR(10), /*计量单位*/
  `purchaseDate`    BIGINT      NOT NULL, /*采购时间*/
  `priceAllocRate`  DOUBLE      DEFAULT -1.0, /*是否调配, 可调配的话设置价格正值概率*/
  `amountAllocRate` DOUBLE      DEFAULT -1.0 /*是否调配, 可调配的话设置数量正值概率*/
)
  DEFAULT charset = "utf8"
  ENGINE = InnoDB;


/*采购管理*/
DROP TABLE IF EXISTS t_purchase;
CREATE TABLE t_purchase (
  `ID`           INT AUTO_INCREMENT PRIMARY KEY, /*采购ID*/
  `goodsID`      INT         NOT NULL, /*采购物品ID*/
  `goodsName`    VARCHAR(20) NOT NULL, /*采购物品名称*/
  `seller`       VARCHAR(20), /*采购人*/
  `amount`       DOUBLE, /*采购量*/
  `name`         VARCHAR(10), /*单位*/
  `unitPrice`    DOUBLE, /*单价*/
  `totalPrice`   DOUBLE, /*总价*/
  `purchaseDate` BIGINT      NOT NULL, /*采购时间*/
  `operator`     VARCHAR(10) NOT NULL /*采购人*/
)
  DEFAULT charset = "utf8"
  ENGINE = InnoDB;


DROP TABLE IF EXISTS t_unit;
CREATE TABLE t_unit (
  `ID`     INT AUTO_INCREMENT PRIMARY KEY, /*ID*/
  `name`   VARCHAR(10) NOT NULL UNIQUE, /*单位*/
  `atomic` TINYINT
)
  DEFAULT charset = "utf8"
  ENGINE = InnoDB;


DROP TABLE IF EXISTS t_;
CREATE TABLE t_ (

)
  DEFAULT charset = "utf8"
  ENGINE = InnoDB;

DROP TABLE IF EXISTS t_;
CREATE TABLE t_ (

)
  DEFAULT charset = "utf8"
  ENGINE = InnoDB;

DROP TABLE IF EXISTS t_;
CREATE TABLE t_ (

)
  DEFAULT charset = "utf8"
  ENGINE = InnoDB;


/*========================================================*/





INSERT INTO t_unit (name, `atomic`) VALUES ("克", 1);
INSERT INTO t_unit (name, `atomic`) VALUES ("千克", 1);
INSERT INTO t_unit (name, `atomic`) VALUES ("吨", 1);
INSERT INTO t_unit (name, `atomic`) VALUES ("毫米", 1);
INSERT INTO t_unit (name, `atomic`) VALUES ("厘米", 1);
INSERT INTO t_unit (name, `atomic`) VALUES ("分米", 1);
INSERT INTO t_unit (name, `atomic`) VALUES ("米", 1);
INSERT INTO t_unit (name, `atomic`) VALUES ("千米", 1);
INSERT INTO t_unit (name, `atomic`) VALUES ("平方米", 1);
INSERT INTO t_unit (name, `atomic`) VALUES ("立方米", 1);
INSERT INTO t_unit (name, `atomic`) VALUES ("毫升", 1);
INSERT INTO t_unit (name, `atomic`) VALUES ("升", 1);
INSERT INTO t_unit (name, `atomic`) VALUES ("瓶", 1);
INSERT INTO t_unit (name, `atomic`) VALUES ("包", 1);
INSERT INTO t_unit (name, `atomic`) VALUES ("块", 1);
INSERT INTO t_unit (name, `atomic`) VALUES ("袋", 1);
INSERT INTO t_unit (name, `atomic`) VALUES ("盒", 1);
INSERT INTO t_unit (name, `atomic`) VALUES ("桶", 1);
INSERT INTO t_unit (name, `atomic`) VALUES ("箱", 1);
INSERT INTO t_unit (name, `atomic`) VALUES ("盏", 1);
INSERT INTO t_unit (name, `atomic`) VALUES ("把", 1);
INSERT INTO t_unit (name, `atomic`) VALUES ("台", 1);
INSERT INTO t_unit (name, `atomic`) VALUES ("条", 1);
INSERT INTO t_unit (name, `atomic`) VALUES ("本", 1);
INSERT INTO t_unit (name, `atomic`) VALUES ("其他", 1);


type ENUM ("农药", "肥料", "种子", "兽药", "饲料", "饲料添加剂", "其它") NOT NULL, /*类型*/
name ENUM ("克", "千克", "吨", "毫米", "厘米", "分米", "米", "千米", "平方米", "立方米", "毫升", "升", "瓶", "包", "块", "袋", "盒", "桶", "箱", "盏", "把", "台", "条", "本", "其它") NOT NULL, /*单位*/
