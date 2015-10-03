CREATE TABLE country (
  id   NUMBER NOT NULL ENABLE,
  country      VARCHAR(50) NOT NULL,
  last_update  TIMESTAMP   NOT NULL,
  CONSTRAINT COUNTRY_PK PRIMARY KEY  (id)
);

create sequence country_seq;


CREATE TABLE ADDRESS 
   (	
   ID NUMBER NOT NULL, 
	STREET VARCHAR2(50 BYTE) NOT NULL, 
	ZIP_CODE VARCHAR2(10 BYTE) NOT NULL, 
	COUNTRY_FK NUMBER NOT NULL, 
	CONSTRAINT ADDRESS_PK PRIMARY KEY (ID)
	CONSTRAINT ADDRESS_FK1 FOREIGN KEY (COUNTRY_FK)
	REFERENCES COUNTRY (ID) 
 );




create table owner(
id  Number not null,
first_name varchar(20),
last_name varchar(20),
constraint owner_pk primary key(id)
);

create table owner_address_pivot(
owner_fk number not null,
address_fk number not null,
CONSTRAINT OWNER_ADDRESS_PIVOT_PK PRIMARY KEY (OWNER_FK, ADDRESS_FK),
 CONSTRAINT OWNER_ADDRESS_PIVOT_FK1 FOREIGN KEY (OWNER_FK)
	  REFERENCES OWNER (ID),
 CONSTRAINT OWNER_ADDRESS_PIVOT_FK2 FOREIGN KEY (ADDRESS_FK)
	  REFERENCES ADDRESS (ID)
);


CREATE  TABLE users (
  username VARCHAR(45) NOT NULL ,
  password VARCHAR(45) NOT NULL ,
  enabled Number(1,0) default 1,
  PRIMARY KEY (username));
  
  CREATE TABLE user_roles (
  user_role_id Number(11) NOT NULL, 
  username VARCHAR(45) NOT NULL,
  role VARCHAR(45) NOT NULL,
  PRIMARY KEY (user_role_id),
  CONSTRAINT fk_username FOREIGN KEY (username) REFERENCES users (username));
  
   create sequence user_roles_seq;
   
   CREATE OR REPLACE TRIGGER dept_bir 
BEFORE INSERT ON departments 
FOR EACH ROW

BEGIN
  SELECT dept_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
   
   

CREATE TABLE persistent_logins (
    username VARCHAR(64) NOT NULL,
    series VARCHAR(64) NOT NULL,
    token VARCHAR(64) NOT NULL,
    last_used TIMESTAMP NOT NULL,
    PRIMARY KEY (series)
);


create table authorities (
    username varchar(50) not null,
    authority varchar(50) not null,
    constraint fk_username2 foreign key (username) references users (username),
    constraint authorities_idx_1 unique  (username, authority)
) ;
insert into  authorities (username,authority) values ('benpoon','admin');


  CREATE OR REPLACE FORCE VIEW "OWNER_ADDRESS_VIEW" ("OWNER_ID", "First Name", "Last Name", "Address ID","Street","zipcode","country") AS
  select oa.owner_fk,o.first_name,o.last_name,oa.address_fk,a.street,a.zip_code,c.country from
  owner_address oa,owner o, address a where oa.owner_fk=owner_id and oa.address_fk=a.address_id and a.country_fk=c.country_id;
  
CREATE OR REPLACE FORCE VIEW "OWNER_ADDRESS_VIEW" ("OWNER_ID", "First Name", "Last Name", "Address ID","Street","zipcode","country") AS
  select oa.owner_fk,o.first_name,o.last_name,oa.address_fk,a.street,a.zip_code,c.country from
  owner_address oa,owner o, address a, country c where oa.owner_fk=owner_id and oa.address_fk=a.address_id and a.country_fk=c.country_id;
  
  
  
  
  
  
  
  
  
  
  
  
  FANTASY FOOTBALL
  
  create or replace function parse_homeaway (pValue varchar2)
   return varchar2
is
   v_pos3 number;
   v_pos4 number;
   team_name varchar(30);
begin

   /* Return 2nd occurrence of ' ' */
   v_pos3 := INSTR (pValue, '@', 1, 1);
   

   team_name:=SUBSTR (pValue, v_pos3, v_pos3);

   if team_name='@' then
   team_name:= 'away';
   else
    team_name:= 'home';
  end if;
   return team_name;
   
end parse_homeaway;
  
  

CREATE OR REPLACE VIEW HOME_STATS_ALL_YEARS_VIEW_2 AS 
select home.player as player, home.avgpts as home_avg, AWAY.AVGPTS as AWAY_AVG from HOME_STATS_ALL_YEARS_VIEW  HOME 
LEFT OUTER JOIN  HOME_STATS_ALL_YEARS_VIEW  AWAY on home.player=away.player where HOME.home_away='home'and  AWAY.home_away='away'; 


CREATE OR REPLACE VIEW HOME_STATS_ALL_YEARS_VIEW_2 AS 
select home.player as player, home.avgpts as home_avg, AWAY.AVGPTS as AWAY_AVG ,(select count(*) from PLAYERS_STATS_PER_GAME where player=home.player and home_away='home') as home_games, (select count(*) from PLAYERS_STATS_PER_GAME where player=home.player and home_away='away') as away_games from HOME_STATS_ALL_YEARS_VIEW  HOME 
LEFT OUTER JOIN  HOME_STATS_ALL_YEARS_VIEW  AWAY on home.player=away.player where HOME.home_away='home'and  AWAY.home_away='away'; 

create or replace view players_stats_per_game as
 SELECT FOS.WEEK AS WEEK, FOS.YEAR AS YEAR, FOS.PLAYER AS PLAYER, FOS.TEAM AS TEAM, PARSE_HOMEAWAY(FS.OPPONENT) AS HOME_AWAY, FOS.DK_FPTS AS FPOINTS  FROM 
 FOOTBALL_OFF_STATS FOS  LEFT OUTER JOIN FOOTBALL_SCHEDULE FS ON TRIM(FOS.TEAM)=TRIM(FS.TEAM) AND TRIM(FOS.week)=TRIM(fs.week) and TRIM(fos.year)=TRIM(fs.year);


 SELECT  PLAYER, TEAM,home_away, AVG(FPOINTS)AS AVGPTS FROM (
 SELECT FOS.WEEK AS WEEK, FOS.YEAR AS YEAR, FOS.PLAYER AS PLAYER, FOS.TEAM AS TEAM, PARSE_HOMEAWAY(FS.OPPONENT) AS HOME_AWAY, FOS.DK_FPTS AS FPOINTS  FROM 
 FOOTBALL_OFF_STATS FOS  LEFT OUTER JOIN FOOTBALL_SCHEDULE FS ON TRIM(FOS.TEAM)=TRIM(FS.TEAM) AND TRIM(FOS.week)=TRIM(fs.week) and TRIM(fos.year)=TRIM(fs.year)) GROUP BY 
 PLAYER, TEAM,home_away order by player;




 select 
 SELECT FOS.WEEK AS WEEK, FOS.YEAR AS YEAR, FOS.PLAYER AS PLAYER, FOS.TEAM AS TEAM, PARSE_HOMEAWAY(FS.OPPONENT) AS HOME_AWAY, FOS.DK_FPTS AS FPOINTS  FROM 
 FOOTBALL_OFF_STATS FOS  LEFT OUTER JOIN FOOTBALL_SCHEDULE FS ON TRIM(FOS.TEAM)=TRIM(FS.TEAM) AND TRIM(FOS.week)=TRIM(fs.week) and TRIM(fos.year)=TRIM(fs.year);
 





select * from home_stats_all_years_view;

SELECT COUNT(PLAYER) FROM(
 SELECT FOS.WEEK AS WEEK, FOS.YEAR AS YEAR, FOS.PLAYER AS PLAYER, FOS.TEAM AS TEAM, PARSE_HOMEAWAY(FS.OPPONENT) AS HOME_AWAY, FOS.DK_FPTS AS FPOINTS  FROM 
 FOOTBALL_OFF_STATS FOS  LEFT OUTER JOIN FOOTBALL_SCHEDULE FS ON TRIM(FOS.TEAM)=TRIM(FS.TEAM) AND TRIM(FOS.week)=TRIM(fs.week) and TRIM(fos.year)=TRIM(fs.year));



 CREATE OR REPLACE VIEW HOME_STATS_ALL_YEARS_VIEW AS 
 SELECT  PLAYER, TEAM, HOME_AWAY, AVG(FPOINTS)AS AVGPTS, count(*) as GAME_COUNT FROM (
 SELECT FOS.WEEK AS WEEK, FOS.YEAR AS YEAR, FOS.PLAYER AS PLAYER, FOS.TEAM AS TEAM, PARSE_HOMEAWAY(FS.OPPONENT) AS HOME_AWAY, FOS.DK_FPTS AS FPOINTS  FROM 
 FOOTBALL_OFF_STATS FOS  LEFT OUTER JOIN FOOTBALL_SCHEDULE FS ON TRIM(FOS.TEAM)=TRIM(FS.TEAM) AND TRIM(FOS.week)=TRIM(fs.week) and TRIM(fos.year)=TRIM(fs.year)) GROUP BY 
 PLAYER, TEAM, HOME_AWAY order by player;  


 CREATE OR REPLACE VIEW HOME_STATS_BY_YEAR_VIEW AS 
 SELECT YEAR, PLAYER, TEAm, AVG(FPOINTS)AS AVGPTS, count(*) as count FROM (
 SELECT FOS.WEEK AS WEEK, FOS.YEAR AS YEAR, FOS.PLAYER AS PLAYER, FOS.TEAM AS TEAM, PARSE_HOMEAWAY(FS.OPPONENT) AS HOME_AWAY, FOS.DK_FPTS AS FPOINTS  FROM 
 FOOTBALL_OFF_STATS FOS  LEFT OUTER JOIN FOOTBALL_SCHEDULE FS ON TRIM(FOS.TEAM)=TRIM(FS.TEAM) AND TRIM(FOS.week)=TRIM(fs.week) and TRIM(fos.year)=TRIM(fs.year)) GROUP BY 
 YEAR,PLAYER, TEAM order by player;  
 
  CREATE OR REPLACE VIEW HOME_STATS_VIEW_3 AS 
 
 SELECT PLAYER, YEAR, HOME_AWAY, AVG(FPOINTS)AS AVGPTS FROM (
 SELECT FOS.WEEK AS WEEK, FOS.YEAR AS YEAR, FOS.POSITION AS POSITION, FOS.TEAM AS TEAM, PARSE_HOMEAWAY(FS.OPPONENT) AS HOME_AWAY, FOS.DK_FPTS AS FPOINTS  FROM 
 FOOTBALL_OFF_STATS FOS  LEFT OUTER JOIN FOOTBALL_SCHEDULE FS ON TRIM(FOS.TEAM)=TRIM(FS.TEAM) AND TRIM(FOS.week)=TRIM(fs.week) and TRIM(fos.year)=TRIM(fs.year)) GROUP BY 
 PLAYER,YEAR,HOME_AWAY; ORDER BY POSITION;  


  CREATE OR REPLACE VIEW HOME_STATS_VIEW_POSITION AS 
 SELECT POSITION, YEAR, HOME_AWAY, AVG(FPOINTS)AS AVGPTS, count(*)as count FROM (
 SELECT FOS.WEEK AS WEEK, FOS.YEAR AS YEAR, FOS.POSITION AS POSITION, FOS.TEAM AS TEAM, PARSE_HOMEAWAY(FS.OPPONENT) AS HOME_AWAY, FOS.DK_FPTS AS FPOINTS  FROM 
 FOOTBALL_OFF_STATS FOS  LEFT OUTER JOIN FOOTBALL_SCHEDULE FS ON TRIM(FOS.TEAM)=TRIM(FS.TEAM) AND TRIM(FOS.week)=TRIM(fs.week) and TRIM(fos.year)=TRIM(fs.year)) GROUP BY 
 POSITION,YEAR,HOME_AWAY ORDER BY POSITION; 

SELECT * FROM HOME_STATS_VIEW_2;


create or replace function parse_homeaway (pValue varchar2)
   return varchar2
is
   v_pos3 number;
   v_pos4 number;
   team_name varchar(30);
begin

   /* Return 2nd occurrence of ' ' */
   v_pos3 := INSTR (pValue, '@', 1, 1);
   

   team_name:=SUBSTR (pValue, v_pos3, v_pos3);

   if team_name='@' then
   team_name:= 'away';
   else
  team_name:= 'home';
  end if;
   return team_name;
   
end parse_homeaway;

 CREATE OR REPLACE VIEW HOME_STATS_ALL_YEARS_VIEW AS 
 SELECT  PLAYER, TEAM, HOME_AWAY, AVG(FPOINTS)AS AVGPTS, count(*) as count FROM (
 SELECT FOS.WEEK AS WEEK, FOS.YEAR AS YEAR, FOS.PLAYER AS PLAYER, FOS.TEAM AS TEAM, PARSE_HOMEAWAY(FS.OPPONENT) AS HOME_AWAY, FOS.DK_FPTS AS FPOINTS  FROM 
 FOOTBALL_OFF_STATS FOS  LEFT OUTER JOIN FOOTBALL_SCHEDULE FS ON TRIM(FOS.TEAM)=TRIM(FS.TEAM) AND TRIM(FOS.week)=TRIM(fs.week) and TRIM(fos.year)=TRIM(fs.year)) GROUP BY 
 PLAYER, TEAM, HOME_AWAY order by player;  


 CREATE OR REPLACE VIEW HOME_STATS_BY_YEAR_VIEW AS 
 SELECT YEAR, PLAYER, TEAM, HOME_AWAY, AVG(FPOINTS)AS AVGPTS, count(*) as count FROM (
 SELECT FOS.WEEK AS WEEK, FOS.YEAR AS YEAR, FOS.PLAYER AS PLAYER, FOS.TEAM AS TEAM, PARSE_HOMEAWAY(FS.OPPONENT) AS HOME_AWAY, FOS.DK_FPTS AS FPOINTS  FROM 
 FOOTBALL_OFF_STATS FOS  LEFT OUTER JOIN FOOTBALL_SCHEDULE FS ON TRIM(FOS.TEAM)=TRIM(FS.TEAM) AND TRIM(FOS.week)=TRIM(fs.week) and TRIM(fos.year)=TRIM(fs.year)) GROUP BY 
 YEAR,PLAYER, TEAM, HOME_AWAY order by player;  
 
  CREATE OR REPLACE VIEW HOME_STATS_VIEW_3 AS 
 
 SELECT POSITION, YEAR, HOME_AWAY, AVG(FPOINTS)AS AVGPTS FROM (
 SELECT FOS.WEEK AS WEEK, FOS.YEAR AS YEAR, FOS.POSITION AS POSITION, FOS.TEAM AS TEAM, PARSE_HOMEAWAY(FS.OPPONENT) AS HOME_AWAY, FOS.DK_FPTS AS FPOINTS  FROM 
 FOOTBALL_OFF_STATS FOS  LEFT OUTER JOIN FOOTBALL_SCHEDULE FS ON TRIM(FOS.TEAM)=TRIM(FS.TEAM) AND TRIM(FOS.week)=TRIM(fs.week) and TRIM(fos.year)=TRIM(fs.year)) GROUP BY 
 POSITION,YEAR,HOME_AWAY ORDER BY POSITION;  


  CREATE OR REPLACE VIEW HOME_STATS_VIEW_3 AS 
 SELECT POSITION, YEAR, HOME_AWAY, AVG(FPOINTS)AS AVGPTS, count(*)as count FROM (
 SELECT FOS.WEEK AS WEEK, FOS.YEAR AS YEAR, FOS.POSITION AS POSITION, FOS.TEAM AS TEAM, PARSE_HOMEAWAY(FS.OPPONENT) AS HOME_AWAY, FOS.DK_FPTS AS FPOINTS  FROM 
 FOOTBALL_OFF_STATS FOS  LEFT OUTER JOIN FOOTBALL_SCHEDULE FS ON TRIM(FOS.TEAM)=TRIM(FS.TEAM) AND TRIM(FOS.week)=TRIM(fs.week) and TRIM(fos.year)=TRIM(fs.year)) GROUP BY 
 POSITION,YEAR,HOME_AWAY ORDER BY POSITION; 

 CREATE OR REPLACE VIEW HOME_STATS_VIEW_2 AS 
 
 SELECT YEAR, PLAYER, TEAM, HOME_AWAY, AVG(FPOINTS)AS AVGPTS FROM (
 SELECT FOS.WEEK AS WEEK, FOS.YEAR AS YEAR, FOS.PLAYER AS PLAYER, FOS.TEAM AS TEAM, PARSE_HOMEAWAY(FS.OPPONENT) AS HOME_AWAY, FOS.DK_FPTS AS FPOINTS  FROM 
 FOOTBALL_OFF_STATS FOS  LEFT OUTER JOIN FOOTBALL_SCHEDULE FS ON TRIM(FOS.TEAM)=TRIM(FS.TEAM) AND TRIM(FOS.week)=TRIM(fs.week) and TRIM(fos.year)=TRIM(fs.year)) GROUP BY 
 YEAR,PLAYER, TEAM, HOME_AWAY ;  

 CREATE OR REPLACE VIEW HOME_STATS_VIEW AS 
 SELECT FOS.WEEK, FOS.YEAR, FOS.PLAYER, FOS.TEAM, FS.OPPONENT FROM 
 FOOTBALL_OFF_STATS FOS  LEFT OUTER JOIN FOOTBALL_SCHEDULE FS ON TRIM(FOS.TEAM)=TRIM(FS.TEAM) AND TRIM(FOS.week)=TRIM(fs.week) and TRIM(fos.year)=TRIM(fs.year);  
