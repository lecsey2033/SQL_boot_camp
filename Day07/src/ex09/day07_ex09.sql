WITH tmp AS (SELECT p.address,
                    ROUND(MAX(age::numeric)-(MIN(age::numeric) / MAX(age::numeric)), 2) AS formula,
                    ROUND(AVG(age::numeric), 2) AS average
             FROM person p
             GROUP BY p.address)
SELECT address,
       formula,
       average,
       formula > average AS comparison
FROM tmp
ORDER BY address;




