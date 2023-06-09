select name from pizzeria
where name not in (select name from pizzeria
                   join person_visits 
                   on pizzeria.id = person_visits.pizzeria_id);
                   
select name from pizzeria
where not exists (select pizzeria_id from person_visits
                  where pizzeria.id = person_visits.pizzeria_id);