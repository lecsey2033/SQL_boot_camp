CREATE FUNCTION fnc_fibonacci(pstop INTEGER DEFAULT 10)
RETURNS TABLE (fibo_numbers INTEGER) AS
$$
WITH RECURSIVE fibonacci(prev_n, n) AS
 (SELECT 0, 1
  UNION ALL
  SELECT n, prev_n + n
   FROM fibonacci
  WHERE n < pstop)
SELECT prev_n 
    FROM fibonacci
$$
LANGUAGE SQL;

select * from fnc_fibonacci(100);
select * from fnc_fibonacci();





