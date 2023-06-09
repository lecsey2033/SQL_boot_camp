WITH pair AS (SELECT p1.id AS id1,
                     p2.id AS id2,
                     p1.name AS person_name1,
                     p2.name AS person_name2,
                     p1.address AS common_address
              FROM person p1
                  JOIN person p2 ON p1.address = p2.address)
SELECT person_name1,
       person_name2,
       common_address
FROM pair
WHERE id1 > id2
ORDER BY 1, 2, 3;



       

       