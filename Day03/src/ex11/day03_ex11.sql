UPDATE menu
SET price = price * 0.9
WHERE id = (SELECT menu.id FROM menu WHERE menu.pizza_name = 'greek pizza');

--INSERT INTO menu VALUES ((SELECT MAX(id) FROM menu) + 1, 2, 'greek pizza', 800);
--DELETE FROM menu WHERE id = (SELECT MAX(id) FROM menu);