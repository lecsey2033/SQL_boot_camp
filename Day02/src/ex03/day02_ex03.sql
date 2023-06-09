WITH dates AS (SELECT day::date AS missing_date
                FROM generate_series(timestamp '2022-01-01', '2022-01-10', '1 day') AS DAY),
    visits AS (SELECT pv.visit_date
                    FROM person_visits pv
                    WHERE pv.person_id < 3)
SELECT dates.missing_date
FROM dates
    LEFT JOIN visits ON dates.missing_date = visits.visit_date
WHERE visit_date IS NULL 
ORDER BY 1;
       