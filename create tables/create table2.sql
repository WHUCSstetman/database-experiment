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