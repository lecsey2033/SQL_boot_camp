CREATE VIEW v_symmetric_union AS 
      WITH R AS (SELECT *
                 FROM person_visits pv
                 WHERE pv.visit_date = '2022-01-02'),
           S AS (SELECT *
                 FROM person_visits pv
                 WHERE pv.visit_date = '2022-01-06'),
 left_except AS (SELECT R.person_id
                 FROM R 
                 EXCEPT 
                 SELECT S.person_id 
                 FROM S),
right_except AS (SELECT S.person_id
                 FROM S 
                 EXCEPT 
                 SELECT R.person_id 
                 FROM R)
SELECT * 
FROM left_except
UNION 
SELECT * 
FROM right_except
ORDER BY person_id;



