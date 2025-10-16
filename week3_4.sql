--  Dropping a view syntax: 
Drop view viewname; 
  --Source Table   
 --Insert the below table       
--ROLLNO NAME MARKS 
--501 jyothi 90 
--502 sai 95 
--504 yamuna 70 
--505 padma 60 
--503 ravi 80
--Creating View 
  create view myview as select rollno,name from st1; 
   view created 
--Display Views and Tables in your login 
select * from tab;
--Inserting  a row in view 
 insert into myview values(506,'prathisha'); 
 1 row(s) inserted 
--Display view 
select * from myview;
--Displaying Table 
select * from st1; 
--  Deleting a row in a view 
delete from myview where rollno=506; 
1 row(s) deleted 
--Display view 
select * from myview;
--Displaying Table 
select * from st1; 
--Change the Structure of the View  
create or replace view myview as select * from st1; 
view created. 
--Creating View when base table doesn’t exist 
  create or replace force view abc as select * from dummy_table;  
  --Creating Read only view 
  create view myview1 as select * from st1 with read only; 
  view created 
  --Inserting Data in Read only view 
  insert into myview1 values(503,'prathisha',80); 
 update myview1 set name='suma'  where rollno=505;
-- Displaying view 
select * from myview1; 
--Creating View with check option 
create view myview2 as select * from st1 where marks<101 with check  option; 
view created. 
--Inserting a row into view 
insert into myview2 values(504,'siri',101); 
--Dropping view 
Drop View myview1; 
View dropped
