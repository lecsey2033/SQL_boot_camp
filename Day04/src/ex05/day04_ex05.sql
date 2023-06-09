CREATE VIEW v_price_with_discount AS
WITH menu_with_discount AS (SELECT m.id,
                                   m.pizza_name,
                                   m.price,
                                   ROUND(m.price * 0.9) AS discount_price
                            FROM menu m)
SELECT p.name,
       d.pizza_name,
       d.price,
       d.discount_price
FROM person_order po
    JOIN person p ON po.person_id = p.id
    JOIN menu_with_discount d ON po.menu_id = d.id
ORDER BY 1, 2;




