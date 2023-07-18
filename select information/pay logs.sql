SELECT
	c.客户编号,
	c.姓名 AS 客户姓名,
	COALESCE ( pm.快递费, 0 ) AS 快递费,
	COALESCE ( pm.包装费, 0 ) AS 包装费,
	COALESCE ( pm.总金额, 0 ) AS 总金额 
FROM
	客户 c
	LEFT JOIN (
	SELECT
		c2.客户编号,
		SUM( pm.快递费 ) AS 快递费,
		SUM( pm.包装费 ) AS 包装费,
		SUM( pm.总金额 ) AS 总金额 
	FROM
		客户2 c2
		INNER JOIN 包裹 p ON c2.快递单号 = p.快递单号
		INNER JOIN 支付金额 pm ON p.快递单号 = pm.快递单号 
	WHERE
		YEAR ( p.发货时间 ) = YEAR ( CURDATE() - INTERVAL 1 MONTH ) 
		AND MONTH ( p.发货时间 ) = MONTH ( CURDATE() - INTERVAL 1 MONTH ) 
	GROUP BY
	c2.客户编号 
	) pm ON c.客户编号 = pm.客户编号