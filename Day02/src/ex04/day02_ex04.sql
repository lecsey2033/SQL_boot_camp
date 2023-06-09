WITH pizza AS (SELECT *
               FROM menu 
               WHERE pizza_name IN ('mushroom pizza', 'pepperoni pizza'))
SELECT pizza.pizza_name, 
       p.name AS pizzeria_name,
       pizza.price
FROM pizza
    JOIN pizzeria p
    ON pizza.pizzeria_id = p.id
ORDER BY 1, 2;
       