WITH A AS (SELECT
user_id
FROM USER_INFO
WHERE YEAR(joined) = "2021")

, B AS (SELECT
YEAR(sales_date) AS YEAR, MONTH(sales_date) AS MONTH, online_sale_id, user_id, product_id, sales_amount, sales_date
FROM ONLINE_SALE
WHERE user_id IN (SELECT * FROM A))

, C AS (SELECT
YEAR, MONTH, count(DISTINCT(user_id)) AS PURCHASED_USERS, ROUND(count(DISTINCT(user_id)) / (SELECT COUNT(user_id) FROM A), 1) AS PURCHASED_RATIO
FROM B
GROUP BY YEAR, MONTH
ORDER BY YEAR ASC, MONTH ASC
)

SELECT * FROM C