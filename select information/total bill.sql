SELECT
	c.客户编号,
	c.姓名 AS 客户姓名,
	p.快递单号,
	p.寄递方式,
	p.发货时间,
	p.寄件地址,
	p.送达时间,
	p.收件地址,
	pm.快递费,
	pm.包装费,
	pm.总金额 
FROM
	客户 c
	INNER JOIN 客户2 c2 ON c.客户编号 = c2.客户编号
	INNER JOIN 包裹 p ON c2.快递单号 = p.快递单号
	INNER JOIN 支付金额 pm ON p.快递单号 = pm.快递单号 
WHERE
	YEAR ( p.发货时间 ) = YEAR ( CURDATE() - INTERVAL 1 MONTH ) 
	AND MONTH ( p.发货时间 ) = MONTH ( CURDATE() - INTERVAL 1 MONTH )