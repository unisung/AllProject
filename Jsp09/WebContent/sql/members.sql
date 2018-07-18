select *
  from member;

 create table members(
 id varchar2(20) primary key,
 password varchar2(20) not null,
 name varchar2(30) not null,
 reg_date date not null 
 ); 
 
 select * from members;
 
 