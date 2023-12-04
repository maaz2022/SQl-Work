--->DDL (Data definition language)
# CREATE,alter,Rename,drop,truncate
--->DQL (Data query language)
#select
--->DML (Data manupulation language)
#insert, update ,delete

---------------------------------------------

-->for creating DATABASE
CREATE DATABASE db_name;
CREATE DATABASE if not EXISTS db_name;
----------------------------------------------
-->for deleting DATABASE
DROP DATABASE db_name;
DROP DATABASE if EXISTS db_name;
#for use DATABASE
use DATABASE_name;
----------------------------------------------
-->for creating TABLES
CREATE TABLE table_name(
id INT PRIMARY KEY auto_icncrement,
name VARCHAR(50),
age INT NOT NULL
);
-------------------------------------------------
-->for inserting DATA
INSERT into table_name VALUES(id,"");
#for inserting multiple data in one query
INSERT INTO(id,name) VALUES(id,""),(id,"");
insert into result(id,name,subject,marks) values(1,"maaz","english",88),(2,"saim","psychology",98)
,(3,"ali","urdu",56),(4,"komail","maths",67);
-------------------------------------------------
-->for SELECT data to VIEW
SELECT * FROM table_name;
select col_name from table_name;
SELECT distinct col_name from table_name;
select * from table_name where condition;
SELECT * from table_name where col_name between ____ and ______;
limit, in , not in;
SELECT * from table_name order by col_name ASC/DESC;
SELECT max(col_name),min(col_name),avg(col_name),count(col_name),sum(col_name) from table_name; 
select subject,avg(marks) from result group by subject order by avg(marks) desc;
select subject ,count(name) from result group by subject order by subject;
select subject from result group by subject having max(marks)>80;--->having clause
----------------------------------------------------
-->DATABASE constraints
#default,not null, unique,primary key,foriegn key,check
----------------------------------------------------
--> update
update col_name set condition where condition;
set sql_safe_updates = 0; -->safe mode off
----------------------------------------------------
-->delete
delete from col_name where condition
----------------------------------------------------
-->foriegn key
create table dept(
id int primary key,
name varchar(50)
);
create table teacher(
id int primary key,
name varchar(50),
dept_id int,
foreign key(dept_id) references dept(id)
);
-----------------------------------------------------