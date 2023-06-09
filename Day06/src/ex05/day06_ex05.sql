COMMENT ON TABLE person_discounts IS 'Personal discount for a person in each pizzeria';
COMMENT ON COLUMN person_discounts.id IS 'Discount id';
COMMENT ON COLUMN person_discounts.person_id IS 'Id of the person who received the discount';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'Id of the pizzeria providing the discount';
COMMENT ON COLUMN person_discounts.discount IS 'Discount amount';