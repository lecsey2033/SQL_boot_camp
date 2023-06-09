--Session #1
SET SESSION CHARACTERISTICS AS TRANSACTION ISOLATION LEVEL REPEATABLE READ;

--Session #2
SET SESSION CHARACTERISTICS AS TRANSACTION ISOLATION LEVEL REPEATABLE READ;

--Session #1
BEGIN;
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

--Session #2
BEGIN;
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

--Session #1
UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut';

--Session #2
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';

--Session #1 (В сессии #2 вызывается ERROR)
COMMIT;

--Session #2 (Происходит откат RALLBACK)
COMMIT;

--Session #1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

--Session #2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

--Результатом вызова последних двух запросов будет рейтинг = 4