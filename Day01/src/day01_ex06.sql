select distinct order_date as action_date,
       person.name as person_name
from person_order
    join person_visits on person_order.person_id = person_visits.person_id
    join person on person_order.person_id = person.id
order by action_date asc, person_name desc;

    