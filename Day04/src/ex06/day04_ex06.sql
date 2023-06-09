CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS 
WITH visit AS (SELECT pv.pizzeria_id
               FROM person_visits pv
               WHERE pv.person_id IN (SELECT p.id 
                                       FROM person p 
                                       WHERE p.name = 'Dmitriy') 
                     AND pv.visit_date = '2022-01-08'), 
     price_is_good AS (SELECT m.pizzeria_id AS pizzeria_id
                       FROM menu m
                           RIGHT JOIN visit 
                           ON m.pizzeria_id = visit.pizzeria_id
                       WHERE m.price < 800)
SELECT name 
FROM pizzeria p
    RIGHT JOIN price_is_good pig ON p.id = pig.pizzeria_id;




