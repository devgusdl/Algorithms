SELECT case when f<1 then '0'
            when f>=1 then f*10000
            else NULL end PRICE_GROUP,
            COUNT(*) PRODUCTS
FROM
(
SELECT FLOOR(PRICE/10000) f
FROM PRODUCT
) a
GROUP BY 1
ORDER BY 1 asc