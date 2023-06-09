INSERT INTO menu 
VALUES ((SELECT MAX(id) FROM menu) + 1,
        (SELECT p.id FROM pizzeria p WHERE p.name = 'Dominos'), 
        'sicilian pizza', 
        900);
    
--DELETE FROM menu WHERE id = (SELECT MAX(id) FROM menu);