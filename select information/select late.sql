SELECT
	* 
FROM
	包裹 
WHERE
	送达时间 > 承诺日期 
	OR 送达时间 IS NULL;