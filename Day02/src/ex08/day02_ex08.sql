WITH men AS (SELECT p.id, p.name
             FROM person p
             WHERE p.gender = 'male' AND p.address IN ('Moscow', 'Samara')),
     men_order AS (SELECT po.menu_id,
                          men.name
                   FROM person_order po
                       LEFT JOIN men
                       ON po.person_id = men.id
                   WHERE men.name IS NOT NULL),
     pizza_id AS (SELECT m.id
               FROM menu m
               WHERE m.pizza_name = 'pepperoni pizza' OR m.pizza_name = 'mushroom pizza')
SELECT DISTINCT name 
FROM men_order
    LEFT JOIN pizza_id ON men_order.menu_id = pizza_id.id
ORDER BY 1 DESC; 
       

       