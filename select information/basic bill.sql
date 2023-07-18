SELECT
	c.客户编号,
	c.姓名 AS 客户姓名,
	CONCAT( c.所处城市, ', ', c.所处街道 ) AS 地址,
	SUM( pm.总金额 ) AS 应付金额 
FROM
	客户 c
	JOIN 客户2 c2 ON c.客户编号 = c2.客户编号
	JOIN 包裹 p ON c2.快递单号 = p.快递单号
	JOIN 支付金额 pm ON p.快递单号 = pm.快递单号 
WHERE
	YEAR ( p.发货时间 ) = YEAR ( CURDATE() - INTERVAL 1 MONTH ) 
	AND MONTH ( p.发货时间 ) = MONTH ( CURDATE() - INTERVAL 1 MONTH ) 
GROUP BY
	c.客户编号,
	c.姓名,
	地址