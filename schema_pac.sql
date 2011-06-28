CREATE OR REPLACE PACKAGE actions AS --spec
  /**
  * Funkcia overi daneho pouzivatela.
  * @param i_user
  * @param i_password
  * @return Priznak, ci sa podarilo pouzivatela autentifikovat
  *   {*} TRUE Pouzivatela sa podarilo autentifikovat
  *   {*} FALSE Pouzivatela sa nepodarilo autentifikovat
  */
  FUNCTION authenticate_user(i_user IN users.username%TYPE, i_password IN users.PASSWORD%TYPE) RETURN boolean;
  
  /**
  * Procedura vypise prehlad profilu uzivatela 
  */
  PROCEDURE view_profile_user(i_username IN users.username%TYPE);
END actions;
/

CREATE OR REPLACE PACKAGE BODY actions AS --body
  FUNCTION authenticate_user(i_user IN users.username%TYPE, i_password IN users.PASSWORD%TYPE) RETURN boolean IS
  BEGIN
    IF i_user = i_password THEN
      RETURN TRUE;
    ELSE
      RETURN FALSE;
    END IF;
  END authenticate_user;
  
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
  END view_profile_user;
END actions;
/