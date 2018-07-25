drop table member2;
select * from member2;

create table manager (
	managerId varchar2(12) primary key,
	managerPasswd varchar2(12) not null
);
insert into manager values ('master','1234');

create sequence book_seq 
start with 1 
increment by 1 
nocycle nocache;
	
create table book (
	book_id number(10) primary key, 
	book_kind varchar2(3) not null, 
	book_title varchar2(100) not null, 
	book_price number(10) not null, 
	book_count number(5) not null, 
	author varchar2(20), 
	publishing_com varchar2(30), 
	publishing_date varchar2(15), 
	book_image varchar2(16) default 'nothing.jpg', 
	book_content varchar2(2000), 
	discount_rate number(3), 
	reg_date date
);

alter table book modify book_content varchar2(2000);

select * from book;

create table bank (
	account varchar2(30) primary key, 
	bank varchar2(16) not null, 
	name varchar2(12) not null
);

insert into bank values('111-1111-1111','신한','길동'); 
insert into bank values('222-2222-2222','국민','하재'); 
insert into bank values('333-3333-3333','농협','석태'); 

drop sequence cart_seq;
create sequence cart_seq;
truncate table cart;

create table cart (
	cart_id number(10) primary key, 
	buyer varchar2(12) not null, 
	book_id number(10) not null, 
	book_title varchar2(100), 
	buy_price number(10) not null, 
	buy_count number(5) not null, 
	book_image varchar2(16) default 'nothing.jpg'
);


select * from cart;
select * from cart where buyer='hong';

--drop table buy;
create table buy (
	buy_id number primary key , 
	buyer varchar2(12) not null, 
	book_id number(10) not null, 
	book_title varchar2(100), 
	buy_price number(10) not null,
	buy_count number(5) not null,
	book_image varchar2(16) default 'nothing.jpg', 
	buy_date date, 
	account varchar2(50), 
	deliveryName varchar2(12), 
	deliveryTel varchar2(20), 
	deliveryAddress varchar2(80), 
	sanction varchar2(12) default '준비중' 
);
select * from buy;
--member2 테이블 생성
drop table member2;

--회원테이블member2로 수정
create table member2(
	id varchar2(12) primary key,
	password varchar2(12) not null,
	name varchar2(20) not null,
	birth date,
	zipno varchar2(7),
	address1 varchar2(80),
	address2 varchar2(50),
	tel1 varchar2(3),
    tel2 varchar2(4),
    tel3 varchar2(4),
	email varchar2(20),
	regdate date default sysdate,
	use_flag char(1) default 0
);

select * from member2;

select managerPasswd from manager where managerId='master';
select * from book;

select count(*) from book where book_kind='100';
select * from book order by reg_date desc;

--서적상품 삭제 history sequence
create sequence book_his_seq 
increment by 1 
start with 1
nocycle;

--서적상품 history 테이블
create table book_history (
    seq  number(10) primary key,
	book_id number(10) not null, 
	book_kind varchar2(3) not null, 
	book_title varchar2(100) not null, 
	book_price number(10) not null, 
	author varchar2(20), 
	publishing_com varchar2(30), 
	publishing_date varchar2(15), 
	book_content varchar2(2000), 
	del_date date default sysdate
);

alter table book_history modify book_content varchar2(2000);

--서적상품 삭제 trigger
create or replace trigger book_trg_d 
after delete on book
for each row
begin
  insert into book_history(
       seq,	book_id,book_kind,book_title,book_price,author,
	   publishing_com,publishing_date,book_content,del_date     
       )
       values(
       book_his_seq.nextval,
       :old.book_id,:old.book_kind,:old.book_title,:old.book_price,
       :old.author,:old.publishing_com,:old.publishing_date,
       :old.book_content,sysdate
       );
end;
--트리거 상태 확인
select * from user_triggers where table_name ='BOOK';

select * from book_history;

select *
  from
(select *
  from book
 where book_kind =100
 order by reg_date desc)
  where rownum <=3;
  
  select * from book order by book_id desc;
  alter trigger book_trg_d disable;
  delete book where publishing_date like 'Tue Jan 16 16:0%';
  commit;
  alter trigger book_trg_d enable;
  
  select * from book where  BOOK_TITLE like '%49%';
  update book set book_count=0 where book_title like '%49%';commit;


select * from cart;

select 'private '||decode(data_type,'NUMBER','int','DATE','Date','VARCHAR2','String')||' '||lower(column_name)||';' 
  from cols 
 where table_name ='BUY'; 

select * from cols where table_name='BUY';