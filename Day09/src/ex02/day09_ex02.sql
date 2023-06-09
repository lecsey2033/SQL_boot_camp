CREATE OR REPLACE FUNCTION fnc_trg_person_delete_audit()
  RETURNS trigger AS
$$
BEGIN
  INSERT INTO person_audit SELECT CURRENT_TIMESTAMP AT TIME ZONE 'Europe/Moscow', 'D', OLD.*;
RETURN NULL;
END;
$$
LANGUAGE 'plpgsql';

CREATE TRIGGER trg_person_delete_audit  
  AFTER DELETE 
  ON person
  FOR EACH ROW
  EXECUTE FUNCTION fnc_trg_person_delete_audit();
  
DELETE FROM person WHERE id = 10;
 
  




