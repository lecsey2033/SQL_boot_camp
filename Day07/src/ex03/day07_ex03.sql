WITH amount_visit AS (SELECT p.name,
                             count(p.id) AS count
                      FROM person_visits pv 
                         JOIN pizzeria p ON pv.pizzeria_id = p.id
                      GROUP BY p.name),
     amount_order AS (SELECT p.name,
                             count(p.id) AS count
                      FROM person_order po
                         JOIN menu m ON po.menu_id = m.id
                         JOIN pizzeria p ON m.pizzeria_id = p.id
                      GROUP BY p.name) 
SELECT un.name,
       sum(un.count) AS total_count
FROM (SELECT * FROM amount_visit
      UNION ALL
      SELECT * FROM amount_order) AS un
GROUP BY un.name
ORDER BY total_count DESC, un.name;





