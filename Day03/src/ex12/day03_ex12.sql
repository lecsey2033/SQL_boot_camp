INSERT INTO person_order
SELECT GENERATE_SERIES((SELECT MAX(id) FROM person_order) + 1,
                        (SELECT MAX(id) FROM person_order) + (SELECT COUNT(*) FROM person)),
       GENERATE_SERIES((SELECT MIN(id) FROM person), (SELECT COUNT(*) FROM person)),
       (SELECT m.id FROM menu m WHERE m.pizza_name = 'greek pizza'),
       timestamp '2022-02-25';
       
--INSERT INTO menu VALUES ((SELECT MAX(id) FROM menu) + 1, 2, 'greek pizza', 800);
--DELETE FROM menu WHERE id = (SELECT MAX(id) FROM menu);
   
--DELETE FROM person_order WHERE id > (SELECT MAX(id) FROM person_order) - (SELECT COUNT(*) FROM person);
   