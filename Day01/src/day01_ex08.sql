select order_date,
       concat(person.name, ' (age:', person.age, ')') as person_information
from (person_order as po(primary_key, id) natural join person)
order by order_date, person_information;