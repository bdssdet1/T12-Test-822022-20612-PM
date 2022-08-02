/* <sc-table> DemoUser T12</sc-table> */
CREATE TABLE DemoUsers, NO FALLBACK, NO BEFORE JOURNAL, NO AFTER JOURNAL, CHECKSUM = DEFAULT, DEFAULT MERGEBLOCKRATIO
(
   ID       INTEGER GENERATED BY DEFAULT AS IDENTITY (START WITH 1 INCREMENT BY 1 MAXVALUE 9999),
   Name     VARCHAR(255) NOT NULL,
   Birthday DATE NOT NULL,
	CityCode INTEGER NOT NULL,
	Email    VARCHAR(255) NOT NULL
)
UNIQUE PRIMARY INDEX(ID);

/* <sc-insert> </sc-insert> */
INSERT INTO DemoUsers(Name, Birthday, CityCode, Email) VALUES('Emma Ezquivel', '2021-11-11', 123, 'emma@mobilize.se');
/* <sc-insert> </sc-insert> */
INSERT INTO DemoUsers(Name, Birthday, CityCode, Email) VALUES('Daniel Duran', '2021-10-11', 456, 'daniel@mobilize.se');
/* <sc-insert> </sc-insert> */
INSERT INTO DemoUsers(Name, Birthday, CityCode, Email) VALUES('Jennifer Jones', '2021-09-10', 789, 'jennifer@mobilize.se');
/* <sc-insert> </sc-insert> */
INSERT INTO DemoUsers(Name, Birthday, CityCode, Email) VALUES('Joseph Jar', '2021-08-09', 741, 'joseph@mobilize.se');

/* <sc-view> DemoUserView </sc-view> */
REPLACE VIEW View_DemoUsers
   (Name, CityCode, Email) AS
   SELECT Name, CityCode, Email
   FROM DemoUsers;

/* <sc-procedure> InsertDemoUsers </sc-procedure> */
REPLACE PROCEDURE InsertDemoUsers ( 
   IN in_Name VARCHAR(255), 
   IN in_Birthday DATE, 
   IN in_CityCode INTEGER, 
   IN in_Email VARCHAR(255)
) 
BEGIN 
   INSERT INTO DemoUsers (Name, Birthday, CityCode, Email)
   VALUES (:in_Name, :in_Birthday, :in_CityCode, :in_Email); 
END;

/* <sc-call> </sc-call> */
CALL InsertDemoUsers ('TestTable', '2020-12-12', 420, 'testTable@email.com');

/* <sc-procedure> UpdateDemoUsers </sc-procedure> */
REPLACE PROCEDURE UpdateDemoUsers ( 
   IN in_id INTEGER, 
   IN in_Name VARCHAR(255), 
   IN in_Birthday DATE, 
   IN in_CityCode INTEGER, 
   IN in_Email VARCHAR(255)
) 
BEGIN 
   UPDATE DemoUsers 
   SET Name = in_Name, Birthday= in_Birthday, CityCode = in_CityCode,Email = in_Email
   WHERE ID = in_id; 
END;

/* <sc-call> </sc-call> */
CALL UpdateDemoUsers (1, 'TestUpdate', '2020-12-12', 840, 'testInsert@email.com');