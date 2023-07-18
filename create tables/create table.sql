CREATE TABLE `hw1`.`包裹`  (
  `快递单号` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '20位长字符',
  `物品信息` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `价值` int NULL DEFAULT NULL COMMENT '单位￥',
  `类型` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `重量` int NULL DEFAULT NULL COMMENT '单位kg',
  `时效性` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `寄递方式` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `发货时间` date NULL DEFAULT NULL,
  `送达时间` date NULL DEFAULT NULL,
  `承诺日期` date NULL DEFAULT NULL,
  `寄件地址` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `收件地址` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `寄件人` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `收件人` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `是否国际快递` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `是否危险品` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `是否签收` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `所属载具编号` int NULL DEFAULT NULL,
  PRIMARY KEY (`快递单号`) USING BTREE,
  INDEX `快递单号`(`快递单号` ASC) USING BTREE,
  INDEX `发货时间`(`发货时间` ASC) USING BTREE,
  INDEX `所属载具编号`(`所属载具编号` ASC) USING BTREE,
  INDEX `发货时间_2`(`发货时间` ASC, `送达时间` ASC) USING BTREE,
  INDEX `寄件地址`(`寄件地址` ASC, `收件地址` ASC) USING BTREE,
  INDEX `快递单号_2`(`快递单号` ASC, `发货时间` ASC, `送达时间` ASC, `寄件地址` ASC, `收件地址` ASC) USING BTREE,
  CONSTRAINT `包裹_chk_1` CHECK (`是否危险品` in (_utf8mb4'是',_utf8mb4'否')),
  CONSTRAINT `包裹_chk_2` CHECK (`是否国际快递` in (_utf8mb4'是',_utf8mb4'否')),
  CONSTRAINT `包裹_chk_3` CHECK (`寄递方式` in (_utf8mb4'陆运',_utf8mb4'空运'))
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

CREATE TABLE `hw1`.`客户`  (
  `客户编号` int(10) UNSIGNED ZEROFILL NOT NULL,
  `姓名` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `手机号` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `所处街道` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `所处城市` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`客户编号`) USING BTREE,
  INDEX `客户编号`(`客户编号` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

CREATE TABLE `hw1`.`客户2`  (
  `快递单号` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `客户编号` int(10) UNSIGNED ZEROFILL NULL DEFAULT NULL,
  INDEX `快递单号`(`快递单号` ASC) USING BTREE,
  INDEX `客户编号`(`客户编号` ASC) USING BTREE,
  CONSTRAINT `客户2_ibfk_1` FOREIGN KEY (`快递单号`) REFERENCES `hw1`.`包裹` (`快递单号`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `客户2_ibfk_2` FOREIGN KEY (`客户编号`) REFERENCES `hw1`.`客户` (`客户编号`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

CREATE TABLE `hw1`.`位置细目`  (
  `快递单号` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `首日日期` date NULL DEFAULT NULL,
  `首日日期位置` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `第二天` date NULL DEFAULT NULL,
  `第二天位置` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `第三天` date NULL DEFAULT NULL,
  `第三天位置` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `第四天` date NULL DEFAULT NULL,
  `第四天位置` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `最后日期` date NULL DEFAULT NULL,
  `最后日期位置` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`快递单号`) USING BTREE,
  INDEX `日期`(`首日日期` ASC, `首日日期位置` ASC) USING BTREE,
  INDEX `首日日期`(`首日日期` ASC, `最后日期` ASC) USING BTREE,
  INDEX `首日日期位置`(`首日日期位置` ASC, `最后日期位置` ASC) USING BTREE,
  CONSTRAINT `位置细目_ibfk_1` FOREIGN KEY (`快递单号`) REFERENCES `hw1`.`包裹` (`快递单号`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;


CREATE TABLE `hw1`.`支付金额`  (
  `快递单号` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `支付日期` date NULL DEFAULT NULL,
  `快递费` int NULL DEFAULT NULL,
  `包装费` int NULL DEFAULT NULL,
  `总金额` int NULL DEFAULT NULL,
  PRIMARY KEY (`快递单号`) USING BTREE,
  INDEX `支付日期`(`支付日期` ASC) USING BTREE,
  CONSTRAINT `支付金额_ibfk_1` FOREIGN KEY (`快递单号`) REFERENCES `hw1`.`包裹` (`快递单号`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `支付金额_ibfk_3` FOREIGN KEY (`支付日期`) REFERENCES `hw1`.`包裹` (`发货时间`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `支付金额_chk_1` CHECK ((`快递费` + `包装费`) = `总金额`)
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;