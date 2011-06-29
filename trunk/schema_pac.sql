CREATE OR REPLACE PACKAGE actions AS
  /**
  * Funkcia overi daneho pouzivatela.
  * @param i_username
  * @param i_password
  * @return Priznak, ci sa podarilo pouzivatela autentifikovat
  *   {*} TRUE Pouzivatela sa podarilo autentifikovat
  *   {*} FALSE Pouzivatela sa nepodarilo autentifikovat
  */
  FUNCTION authenticate_user(i_username IN users.username%TYPE, i_password IN users.PASSWORD%TYPE) RETURN boolean;
  
  /**
  * Procedura vypise prehlad profilu uzivatela
  * @param i_username
  */
  PROCEDURE view_profile_user(i_username IN users.username%TYPE);
  
  /**
  * Procedura vypise prehlad objednavok uzivatela
  * @param i_username
  */
  PROCEDURE view_orders_user(i_username IN users.username%TYPE);
  
  /**
  * Procedura vypise prehlad rezervacii uzivatela
  * @param i_username
  */
  PROCEDURE view_reservations_user(i_username IN users.username%TYPE);
  
  /**
  * Procedura vypise prehlad zliav uzivatela
  * @param i_username
  */
  PROCEDURE view_discounts_user(i_username IN users.username%TYPE);
END actions;
/

CREATE OR REPLACE PACKAGE BODY actions AS
  FUNCTION authenticate_user(i_username IN users.username%TYPE, i_password IN users.PASSWORD%TYPE) RETURN boolean IS
  BEGIN
    IF i_username = i_password THEN
      RETURN TRUE;
    ELSE
      RETURN FALSE;
    END IF;
  END;
  
  PROCEDURE view_profile_user(i_username IN users.username%TYPE) IS
  BEGIN
    FOR i IN (SELECT * FROM view_users WHERE username = i_username) LOOP
      dbms_output.put_line('Username: ' || i.username);
      dbms_output.put_line('Firstname: ' || i.firstname);
      dbms_output.put_line('Lastname: ' || i.lastname);
      dbms_output.put_line('City: ' || i.city);
      dbms_output.put_line('Street address: ' || i.street_address);
      dbms_output.put_line('E-mail: ' || i.email);
      dbms_output.put_line('Telephone: ' || i.telephone);
      dbms_output.put_line('Credit: ' || i.credit);
    END LOOP;
  END;
  
  PROCEDURE view_orders_user(i_username IN users.username%TYPE) IS
  BEGIN
    FOR i IN (SELECT * FROM view_orders WHERE username = i_username) LOOP
      dbms_output.put_line('ID: ' || i.ID);
      dbms_output.put_line('Title: ' || i.title);
      dbms_output.put_line('Year: ' || i.YEAR);
      dbms_output.put_line('3D: ' || i.three_dimensional);
      dbms_output.put_line('Discount: ' || i.discount);
      dbms_output.put_line('Ordered: ' || i.ordered);
    END LOOP;
  END;
  
  PROCEDURE view_reservations_user(i_username IN users.username%TYPE) IS
  BEGIN
    FOR i IN (SELECT * FROM view_reservations WHERE username = i_username) LOOP
      dbms_output.put_line('ID: ' || i.ID);
      dbms_output.put_line('Title: ' || i.title);
      dbms_output.put_line('Year: ' || i.YEAR);
      dbms_output.put_line('3D: ' || i.three_dimensional);
      dbms_output.put_line('Reserved: ' || i.reserved);
      dbms_output.put_line('Valid to: ' || i.valid);
    END LOOP;
  END;
  
  PROCEDURE view_discounts_user(i_username IN users.username%TYPE) IS
  BEGIN
    FOR i IN (SELECT * FROM view_discounts_user WHERE username = i_username) LOOP
      dbms_output.put_line('Name: ' || i.NAME);
      dbms_output.put_line('Value: ' || i.value);
    END LOOP;
  END;
END actions;
/