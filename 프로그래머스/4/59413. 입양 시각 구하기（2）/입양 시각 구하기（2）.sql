with recursive time as (
    select 0 as hour
    union all
    select hour+1 from time where hour<23)

SELECT r.hour as HOUR,COUNT(ANIMAL_ID)as COUNT
FROM ANIMAL_OUTS as o right join time as r
on HOUR(o.DATETIME) = r.hour
GROUP BY 1
ORDER BY 1