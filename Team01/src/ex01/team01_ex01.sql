insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

WITH main AS (SELECT b.user_id, 
                     b.money, 
                     b.currency_id,
                     b.updated AS bal_updated,
                     c.updated AS cur_updated
              FROM balance b 
                  JOIN currency c ON b.currency_id = c.id
),
    date_on_bottom AS (SELECT m.user_id, 
                              m.money,
                              m.currency_id,
                              m.bal_updated,
                              MIN(m.bal_updated - m.cur_updated) AS bottom_diff
                       FROM main m
                       WHERE m.bal_updated >= m.cur_updated
                       GROUP BY 1, 2, 3, 4
),
       date_on_top AS (SELECT m.user_id, 
                              m.money,
                              m.currency_id,
                              m.bal_updated,
                              MIN(m.cur_updated - m.bal_updated) AS top_diff
                       FROM main m
                       WHERE m.cur_updated > m.bal_updated
                       GROUP BY 1, 2, 3, 4
),
 balance_with_diff AS (SELECT b.*, 
                              COALESCE (dob.bottom_diff, dot.top_diff) AS diff
                       FROM balance b 
                           LEFT JOIN date_on_bottom dob ON b.user_id = dob.user_id 
                                                       AND b.money = dob.money
                                                       AND b.currency_id = dob.currency_id
                                                       AND b.updated = dob.bal_updated
                           LEFT JOIN date_on_top dot ON b.user_id = dot.user_id 
                                                    AND b.money = dot.money
                                                    AND b.currency_id = dot.currency_id
                                                    AND b.updated = dot.bal_updated
                       WHERE COALESCE (dob.bottom_diff, dot.top_diff) IS NOT NULL
)
SELECT COALESCE(u.name, 'not defined') AS name,
       COALESCE(u.lastname, 'not defined') AS lastname,
       c.name AS currency_name,
       (bwd.money * c.rate_to_usd) AS currency_in_usd
FROM balance_with_diff bwd 
    LEFT JOIN "user" u ON bwd.user_id = u.id
    LEFT JOIN currency c ON bwd.currency_id = c.id 
                          AND (bwd.diff = bwd.updated - c.updated OR bwd.diff = c.updated - bwd.updated)
WHERE c.name IS NOT NULL 
ORDER BY 1 DESC, 2, 3;


    



