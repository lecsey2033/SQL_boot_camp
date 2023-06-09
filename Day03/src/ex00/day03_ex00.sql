SELECT m.pizza_name,
       m.price, 
       p.name AS pizzeria_name,
       pv.visit_date
FROM person_visits pv 
    JOIN pizzeria p ON pv.pizzeria_id = p.id 
    JOIN menu m ON pv.pizzeria_id = m.pizzeria_id 
WHERE (m.price BETWEEN 800 AND 1000) AND pv.person_id = 3 
ORDER BY 1, 2, 3;