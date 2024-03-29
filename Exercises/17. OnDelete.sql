create database on_delete;

use on_delete;

create table department
(dept_name varchar(20), 
building varchar(15),
budget numeric(12,2) check (budget > 0),
primary key (dept_name)
);
     
create table instructor
(ID varchar(5), 
name varchar(20) not null, 
dept_name varchar(20) default 'Comp. Sci.', 
salary numeric(8,2) check (salary > 29000),
primary key (ID)
);    
     
insert into department values ('Biology', 'Watson', '90000');
insert into department values ('Comp. Sci.', 'Taylor', '100000');
insert into department values ('Elec. Eng.', 'Taylor', '85000');
insert into department values ('Finance', 'Painter', '120000');
insert into department values ('History', 'Painter', '50000');
insert into department values ('Music', 'Packard', '80000');
insert into department values ('Physics', 'Watson', '70000');

insert into instructor values ('10101', 'Srinivasan', 'Comp. Sci.', '65000');
insert into instructor values ('12121', 'Wu', 'Finance', '90000');
insert into instructor values ('15151', 'Mozart', 'Music', '40000');
insert into instructor values ('22222', 'Einstein', 'Physics', '95000');
insert into instructor values ('32343', 'El Said', 'History', '60000');
insert into instructor values ('33456', 'Gold', 'Physics', '87000');
insert into instructor values ('45565', 'Katz', 'Comp. Sci.', '75000');
insert into instructor values ('58583', 'Califieri', 'History', '62000');
insert into instructor values ('76543', 'Singh', 'Finance', '80000');
insert into instructor values ('76766', 'Crick', 'Biology', '72000');
insert into instructor values ('83821', 'Brandt', 'Comp. Sci.', '92000');
insert into instructor values ('98345', 'Kim', 'Elec. Eng.', '80000');

alter table instructor add constraint my_fk
foreign key (dept_name) references department (dept_name)
on delete restrict;

delete from department where dept_name='Biology';

alter table instructor drop constraint my_fk;

alter table instructor add constraint my_fk
foreign key (dept_name) references department (dept_name)
on delete set null;

delete from department where dept_name='Biology';

drop database;
-- restore the database

alter table instructor add constraint my_fk
foreign key (dept_name) references department (dept_name)
on delete set default;

delete from department where dept_name='Biology';

drop database
-- restore the database

alter table instructor add constraint my_fk
foreign key (dept_name) references department (dept_name)
on delete cascade;

delete from department where dept_name='Biology';

drop database
-- restore the database

alter table instructor add constraint my_fk
foreign key (dept_name) references department (dept_name)
on delete cascade
on update cascade;

update department set dept_name='Bio' where dept_name='Biology';


