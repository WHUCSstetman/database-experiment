SELECT DISTINCT
	C.姓名 AS 客户,
	P.收件人,
	C.手机号 
FROM
	包裹 P
	JOIN 客户2 C2 ON P.快递单号 = C2.快递单号
	JOIN 客户 C ON C2.客户编号 = C.客户编号
WHERE
	P.寄递方式 = '陆运' 
	AND P.所属载具编号 = 1721 
	AND ( P.发货时间 <= '2023-05-25' ) 
	AND ( P.承诺日期 >= '2023-05-25' ) 
	AND ( P.送达时间 >= '2023-05-25' OR P.送达时间 IS NULL );