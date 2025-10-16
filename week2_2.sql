-- Find the average salary of company 
Select AVG(amount) from company; 
-- Find the Sum of salaries of company 
Select SUM(amount) from company; 
-- Find the Maximum amount of company 
Select Max(amount) from company; 
-- Find the Minimum amount of company 
Select Min(amount) from company;
-- Find the number of rows in a company 
Select Count(*) from company;
-- Find the sum of amount of each company. 
select companyn,sum(amount) from company group by companyn;
-- Find the minimum amount of each company. 
select companyn,min(amount) from company group by companyn; 
-- Find the maximum amount of each company. 
select companyn,max(amount) from company group by companyn; 
-- Find the count of all the rows grouped by each company name. 
select companyn,count(*) from company group by companyn; 
-- Find the count of all the rows grouped by each company name & having count greater than 1. 
select companyn,count(*) from company group by companyn having count(*)>1; 
-- Find the sum of amount of each company and having sum of amount greater than 10000. 
select companyn,sum(amount) from company group by companyn having sum(amount)>10000; 
