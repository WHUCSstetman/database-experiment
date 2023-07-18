SELECT
	C.姓名 AS 客户,
	SUM( Z.总金额 ) AS 总支付金额 
FROM
	客户 C
	JOIN 客户2 C2 ON C.客户编号 = C2.客户编号
	JOIN 包裹 P ON C2.快递单号 = P.快递单号
	JOIN 支付金额 Z ON P.快递单号 = Z.快递单号 
WHERE
	P.发货时间 >= DATE_SUB( NOW(), INTERVAL 1 YEAR ) -- 过去一年内的发货时间
GROUP BY
	C.姓名 
ORDER BY
	总支付金额 DESC 
	LIMIT 1;