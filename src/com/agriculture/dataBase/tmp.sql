DROP TABLE IF EXISTS t_product_identity;
CREATE TABLE t_product_identity (
  `produceTaskID`       VARCHAR(15)                    NOT NULL COMMENT '生产批次号',
  `productIdentity`     VARCHAR(10)                    NOT NULL COMMENT '产品唯一识别码',
  PRIMARY KEY (`produceTaskID`, `productIdentity`)
)DEFAULT charset = "utf8" ENGINE = InnoDB COMMENT='产品唯一识别码';