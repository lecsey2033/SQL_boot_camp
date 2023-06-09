INSERT INTO person_visits
VALUES ((SELECT MAX(id) FROM person_visits) + 1,
        (SELECT p.id FROM person p WHERE p.name = 'Dmitriy'),
        (SELECT pi2.id
         FROM (SELECT *
               FROM pizzeria pi) pi2
                  JOIN (SELECT * FROM menu m WHERE m.price < 800) m2
                        ON pi2.id = m2.pizzeria_id
         EXCEPT
        (SELECT pi.id
         FROM pizzeria pi
         JOIN mv_dmitriy_visits_and_eats mdvae ON pi.name = mdvae.name)
         ORDER BY 1
         LIMIT 1),
        TIMESTAMP '2022-01-08');

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;




