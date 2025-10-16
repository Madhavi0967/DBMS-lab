--Find the names of sailors who have reserved boat no 103. 
select s.sname from sailors s  
where s.sid IN( select r.sid from reserves r 
  where r.bid=103); 
--Find the names of sailors who have not reserved boat no 103. 
select s.sname from sailors s  
where s.sid NOT IN( select r.sid from reserves r 
where r.bid=103); 
--Find the sailor id with the highest rating 
select s.sid from sailors s where s.rating>=all(select s1.rating from sailors s1); 
--Find the sailor id whose rating is better than some sailor called andy 
select s.sid from sailors s 
where s.rating>ANY(select s1.rating from sailors s1 where s1.sname='Andy');
-- Find the names of sailors who have reserved boat no 103 
 select s.sname from sailors s where EXISTS(select * from reserves r where s.sid=r.sid and   
r.bid=103); 
 Find the names of sailors who have not reserved boat no 103 
 select s.sname from sailors s where NOT EXISTS(select * from reserves r where s.sid=r.sid  
 and r.bid=103); 
