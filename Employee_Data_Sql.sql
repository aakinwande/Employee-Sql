create database salarydb;
use salarydb;

select * from salaries;

select EmployeeName, JobTitle from salaries;
select count(*) from salaries;

-- Number of Unique job titles
select count(distinct JobTitle) from salaries;

-- Job title and overtime pay for all the employess with overtime pay > 50000
select JobTitle, OvertimePay from salaries where OvertimePay > 50000 ;

-- The average base pay for all employees
select avg(BasePay) as "Average BasePay" from salaries;

-- Top 10 highest paid Employees
select EmployeeName, JobTitle, TotalPay from salaries
order by TotalPay desc
limit 10;

-- The average BasePay, OvertimePay and OtherPay for each Employee
select EmployeeName, (BasePay + OvertimePay + OtherPay)/3 as "Average pay" from salaries;


-- Employees who have the word "Manager" in thier job title
select EmployeeName, JobTitle from salaries where JobTitle like '%MANAGER%';

-- Employees who DONT'T have the word "Manager" in thier job title
select EmployeeName, JobTitle from salaries where JobTitle != 'MANAGER';

-- Employees with a total pay between 50,000 and 75,000
select * from salaries 
where TotalPay between 50000 and 75000;

-- Employees with a base pay < 50,000 or total pay > 100,000
select * from salaries 
where BasePay < 50000 or TotalPay > 100000;

-- Employees with a TotalPay benefit value between 125,000 and 150,000 and a job title containing the word 'Director'
select * from salaries 
where TotalPayBenefits between 125000 and 150000
and JobTitle like '%DIRECTOR%';


-- Employees ordered by thier totalpay benefits in descending order
select EmployeeName, TotalPayBenefits from salaries 
order by TotalPayBenefits desc;


-- All job titles with an average base of at least 100,000 and order them by the average base pay in descending order
select JobTitle, avg(BasePay) as AvgBasePay from salaries
group by JobTitle
having AvgBasePay >= 100000
order by AvgBasePay desc;


-- delete notes and status column from table
alter table salaries
drop column Notes,
drop column Status;
select * from salaries;

	-- Update the base pay of all employees with the job title containing "Manager" by increasing it by 10%
update salaries
set BasePay = BasePay * 1.1
where JobTitle like "%Manager%"
LIMIT 100; 


-- Delete Employees who have no overtime pay
delete from salaries
where OvertimePay = 0
limit 75720;

select count(*) from salaries where OvertimePay = 0;