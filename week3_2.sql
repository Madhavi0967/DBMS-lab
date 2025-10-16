select s.sname from sailors s, reserves r,boats b 
where s.sid=r.sid and b.bid=r.bid and b.bcolor='Red'    
UNION  
select s1.sname from sailors s1,reserves r1,boats b1 
where s1.sid=r1.sid and r1.bid=b1.bid and b1.bcolor='Green'; 
-- Find the names of sailors who have reserved a red or a green boat 
select s.sname from sailors s, reserves r,boats b 
where s.sid=r.sid and b.bid=r.bid and b.bcolor='Red'    
UNION all 
select s1.sname from sailors s1,reserves r1,boats b1 
where s1.sid=r1.sid and r1.bid=b1.bid and b1.bcolor='Green'; 
-- Find the names of sailors who have reserved a red boat but not a green boat 
select s.sname from sailors s, reserves r,boats b 
where s.sid=r.sid and b.bid=r.bid and b.bcolor='Red'    
MINUS 
select s1.sname from sailors s1,reserves r1,boats b1 
where s1.sid=r1.sid and r1.bid=b1.bid and b1.bcolor='Green'; 
