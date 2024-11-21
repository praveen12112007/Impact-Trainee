create table employee(
    emplyoyee_id int primary key auto_increment,
    name varchar(100),
    depart varchar(50),
    salary decimal(10,2)

);
insert into employee(name,depart,salary)values('praveen','java',30000),
('selva','sales',10000);
select * from employee;


delimiter //
create procedure basic_trns()
begin
  declare exit handler for sqlexception
    rollback;
  start transaction;
  
  update employee set salary=salary*10 where depart='sales';
  insert into audit_log(action,description) values('update','updated salaries of sales dept');
  commit;
end//
call basic_trns();
drop basic_trns();