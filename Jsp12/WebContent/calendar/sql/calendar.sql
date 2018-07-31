create table calUser(
id varchar2(50) primary key,
name varchar2(50) not null,
pwd varchar2(50) not null,
address varchar2(100) not null,
tel varchar2(50) not null
);

insert into caluser values('hong','홍길동','1111','서울시','010-111-1234');

create table calendar(
seq number primary key,
id varchar2(50) not null,
title varchar2(200) not null,
content varchar2(4000) not null,
mdate varchar2(12) not null,
regdte date not null
);

create sequence calendar_seq start  with 1 increment by 1;


