select
	(select name
	 from person
	 where person.id = po.person_id) as name
from person_order as po
where (menu_id = 13 or menu_id = 14 or menu_id = 18) 
	and order_date = '2022-01-07';
