WITH pizzeria_names AS (SELECT m.id AS id, 
                                 m.pizza_name AS pizza_name,
                                 p.name AS pizzeria_name
                          FROM menu m
                                 LEFT JOIN pizzeria p 
                                 ON m.pizzeria_id = p.id)
SELECT pn.pizza_name,
       pn.pizzeria_name
FROM person_order po 
    JOIN pizzeria_names pn ON po.menu_id = pn.id
WHERE po.person_id = 1 OR po.person_id = 4
ORDER BY 1, 2;
       

       