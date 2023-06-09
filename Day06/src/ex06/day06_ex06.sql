CREATE SEQUENCE seq_person_discounts START 1;
SELECT SETVAL('seq_person_discounts', (SELECT MAX(pd.id) FROM person_discounts pd));

ALTER TABLE person_discounts
ALTER COLUMN id SET DEFAULT NEXTVAL('seq_person_discounts');
    
INSERT INTO person_discounts (person_id, pizzeria_id)
VALUES (1, 2);