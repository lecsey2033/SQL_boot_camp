select p.name as person_name,
       m.pizza_name as pizza_name,
       pi.name as pizzeria_name
from person as p
    join person_order as po on p.id = po.person_id
    join menu as m on po.menu_id = m.id 
    join pizzeria as pi on m.pizzeria_id = pi.id
order by 1, 2, 3;
       