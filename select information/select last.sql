SELECT
	* 
FROM
	包裹 
WHERE
	寄递方式 = '陆运' 
	AND 所属载具编号 = 1721 
	AND 送达时间 < '2023-05-25' 
ORDER BY
	送达时间 DESC 
	LIMIT 1;