SELECT
	所处街道,
	COUNT(*) AS 客户数量 
FROM
	客户 
GROUP BY
	所处街道 
ORDER BY
	客户数量 DESC 
	LIMIT 1;