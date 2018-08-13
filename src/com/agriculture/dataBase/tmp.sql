/*生产区块[ID, 区块名]*/
DROP TABLE IF EXISTS t_area_block;
CREATE TABLE t_area_block (
  `ID`            INT AUTO_INCREMENT PRIMARY KEY NOT NULL COMMENT 'ID',
  `areaBlock`     VARCHAR(10)                    NOT NULL UNIQUE COMMENT '生产区块',
  `remark`        VARCHAR(200)                   COMMENT '备注',
  `longitude`     DOUBLE                         NOT NULL COMMENT '经度',
  `latitude`      DOUBLE                         NOT NULL COMMENT '纬度'
)DEFAULT charset = "utf8" ENGINE = InnoDB COMMENT='生产区块';



/*生产区块与生产任务的联系*/
DROP TABLE IF EXISTS t_produce_task_area_block;
CREATE TABLE t_produce_task_area_block (
  `produceTaskID`       VARCHAR(15)     NOT NULL COMMENT '生产批次号',
  `areaBlockID`         INT             NOT NULL COMMENT '生产区ID'
) DEFAULT charset = "utf8" ENGINE = InnoDB COMMENT='生产区块与生产任务的联系';