drop table member;
select * from member;

create table member(
id varchar2(30) primary key,
password varchar2(30) not null,
name varchar2(50),
birth date,
zipcode varchar2(7),
address1 varchar2(150),
address2 varchar2(150),
tel1 varchar2(3),
tel2 varchar2(4),
tel3 varchar2(4),
email varchar2(100)
);
select * from member;

select 'private '||decode(data_type,'VARCHAR2','String',data_type)||' '||lower(column_name)||',' 
  from cols 
 where table_name='MEMBER' 
 order by column_id;

select count(*) from member where id='hong';

insert into member values(?,?,?,?,?,?,?,?,?,?,?)
id varchar2(30) primary key,
password varchar2(30) not null,
name varchar2(50),
birth date,
zipcode varchar2(7),
address1 varchar2(150),
address2 varchar2(150),
tel1 varchar2(3),
tel2 varchar2(4),
tel3 varchar2(4),
email

select * from member;