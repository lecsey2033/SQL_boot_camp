WITH women AS (SELECT p.id, p.name
             FROM person p
             WHERE p.gender = 'female'),
     women_order AS (SELECT w.name,
                            po.*,
                            m.pizza_name
                     FROM person_order po
                         JOIN women w ON po.person_id = w.id
                         JOIN menu m ON po.menu_id = m.id)
SELECT DISTINCT wo.name
FROM women_order wo
WHERE wo.pizza_name = 'cheese pizza' 
    AND EXISTS (SELECT wo2.name
                FROM women_order wo2
                WHERE wo2.pizza_name = 'pepperoni pizza');


       

       