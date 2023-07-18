SELECT
	c.客户编号,
	c.姓名,
	COUNT(*) AS 寄出包裹数 
FROM
	客户 c
	JOIN 客户2 c2 ON c.客户编号 = c2.客户编号
	JOIN 包裹 b ON c2.快递单号 = b.快递单号 
WHERE
	b.发货时间 >= CURDATE() - INTERVAL 1 YEAR 
GROUP BY
	c.客户编号,
	c.姓名 
ORDER BY
	寄出包裹数 DESC 
	LIMIT 1;