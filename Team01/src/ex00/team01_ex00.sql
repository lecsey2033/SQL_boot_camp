WITH last_currency AS (
    SELECT DISTINCT ON (id)
           id,
           name,
           rate_to_usd,
           updated
    FROM currency 
    ORDER BY id, updated DESC  
),
    balance_of_user AS (
    SELECT COALESCE(u.name, 'not defined') AS name,
           COALESCE(u.lastname, 'not defined') AS lastname,
           b.type AS type,
           SUM(b.money) AS volume,
           b.currency_id
    FROM balance b
        LEFT JOIN "user" u  ON b.user_id = u.id 
    GROUP BY name, lastname, type, b.currency_id
)
SELECT bou.name AS name,
       bou.lastname AS lastname,
       bou.type AS type,
       bou.volume AS volume,
       COALESCE(lc.name, 'not defined') AS currency_name,
       COALESCE(lc.rate_to_usd, 1) AS last_rate_to_usd,
       (volume * COALESCE(lc.rate_to_usd, 1)) AS total_volume_in_usd
FROM balance_of_user bou
    LEFT JOIN last_currency lc ON bou.currency_id = lc.id
ORDER BY name DESC, lastname, type;