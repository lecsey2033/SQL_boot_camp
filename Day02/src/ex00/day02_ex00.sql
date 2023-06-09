SELECT DISTINCT name, rating
FROM pizzeria p
    LEFT JOIN person_visits pv ON p.id=pv.pizzeria_id 
WHERE pv.pizzeria_id is NULL;
       