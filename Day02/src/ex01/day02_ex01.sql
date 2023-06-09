SELECT pv.missing_date
FROM (SELECT DISTINCT visit_date AS missing_date
        FROM person_visits) AS pv 
   LEFT JOIN (SELECT DISTINCT pv2.visit_date
              FROM person_visits pv2
              WHERE pv2.person_id <= 2) AS pv3 ON pv.missing_date = pv3.visit_date
WHERE pv3.visit_date IS NULL
ORDER BY pv.missing_date;

       