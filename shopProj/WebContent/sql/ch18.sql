-- sys 유저 접속
-- C:\Users\Administrator>sqlplus sys as sysdba
-- 사용자 계정 생성
--SQL> create user shop identified by shop;
--User created.
-- 사용자 권한부여
--SQL> grant create session to shop;
--Grant succeeded.
--SQL> grant dba to shop;
--Grant succeeded.
--SQL> conn shop/shop@xe
--Connected.
--SQL> conn sys as sysdba;
--Enter password:
--Connected.
-- 사용자 패스워드 변경 
--SQL> alter user shop identified by shop account unlock;
--User altered.
--SQL> conn shop/shop@xe;
--Connected.

-- 관리자 테이블
create table manager (
	managerId varchar2(12) primary key,
	managerPasswd varchar2(12) not null
);
-- 관리자 id/패스워드 입력
insert into manager values ('master','1234');

select managerpasswd from manager where managerid='master';

--book 등록용 시퀀스 생성
create sequence book_seq 
start with 1 
increment by 1 
nocycle nocache;

--book상품 마스타 테이블	
create table book (
	book_id number(10) primary key,    --도서 번호
	book_kind varchar2(3) not null,    --도서 분류
	book_title varchar2(100) not null, -- 도서명
	book_price number(10) not null,    -- 가격
	book_count number(5) not null,     -- 재고수량
	author varchar2(20),               -- 저자
	publishing_com varchar2(30),       -- 출판사
	publishing_date varchar2(15),      -- 출판일
	book_image varchar2(16) default 'nothing.jpg', -- 표지 
	book_content varchar2(2000),       -- 내용 요약
	discount_rate number(3),           -- 할인율
	reg_date date                      -- 등록일
);

alter table book modify book_content varchar2(2000);

select * from book;

--결제 계좌 테이블
create table bank (
	account varchar2(30) primary key, 
	bank varchar2(16) not null, 
	name varchar2(12) not null
);

insert into bank values('111-1111-1111','신한','길동'); 
insert into bank values('222-2222-2222','국민','하재'); 
insert into bank values('333-3333-3333','농협','석태'); 

--drop sequence cart_seq;
-- 장바구니 테이블입력용 시쿼스 생성
create sequence cart_seq;

--truncate table cart;

create table cart (
	cart_id number(10) primary key, -- 장바구니 id
	buyer varchar2(12) not null,    -- 구매자명
	book_id number(10) not null,    -- 도서id
	book_title varchar2(100),       -- 도서명
	buy_price number(10) not null,  -- 가격
	buy_count number(5) not null,   -- 수량
	book_image varchar2(16) default 'nothing.jpg' -- 표지
);


select * from cart;
select * from cart where buyer='hong';

--drop table buy;
-- 구매 테이블 생성
create table buy (
	buy_id number primary key ,     -- 구매 순번
	buyer varchar2(12) not null,    -- 구매자 명
	book_id number(10) not null,    -- 도서id
	book_title varchar2(100),       -- 도서명
	buy_price number(10) not null,  -- 가격
	buy_count number(5) not null,   -- 수량 
	book_image varchar2(16) default 'nothing.jpg', -- 표지 
	buy_date date,                  -- 구매일자
	account varchar2(50),           -- 결재계좌 
	deliveryName varchar2(12),      -- 수신자 
	deliveryTel varchar2(20),       -- 수신전화번호 
	deliveryAddress varchar2(80),   -- 수신주소
	sanction varchar2(12) default '준비중'  -- 배송상태 결제-준비중-배송중-배송완료
);
select * from buy;
--member 테이블 생성
drop table member;

--회원테이블member 생성
create table member(
	id varchar2(12) primary key, -- 회원 id
	password varchar2(12) not null, -- 비번
	name varchar2(20) not null,  -- 회원명
	birth date,  -- 생일
	zipno varchar2(7), -- 우편번호
	address1 varchar2(150), -- 주소1
	address2 varchar2(150), -- 주소2 
	tel1 varchar2(3),  -- 전화번호1
    tel2 varchar2(4),  -- 전화번호2
    tel3 varchar2(4),  -- 전화번호3
	email varchar2(20),-- email
	regdate date default sysdate, --가입일자
	use_flag char(1) default 0 -- 회원상태(가입,탈퇴)
);


select * from member;

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
    seq  number(10) primary key, -- 순번
	book_id number(10) not null, -- 도서id
	book_kind varchar2(3) not null,  -- 분류
	book_title varchar2(100) not null, -- 제목
	book_price number(10) not null,  -- 가격
	author varchar2(20),  -- 저장
	publishing_com varchar2(30), -- 출판사 
	publishing_date varchar2(15), -- 출판일
	book_content varchar2(2000),  -- 내용요약
	del_date date default sysdate -- 삭제일시
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

select 'private '||decode(data_type,'NUMBER','int','DATE','Date','VARCHAR2','String','CHAR','char',data_type)||' '||lower(column_name)||',' 
  from cols 
 where table_name ='BOOK'
 order by column_id;

select * from cols where table_name='BUY';


--- union all 집합 A U B U C U D
select 'insert into member(' from dual
  union all

select lower(column_name)||',' 
  from cols
 where table_name = 'MEMBER'
 
 union all
 
select ') values (' from dual

union all

select lower(column_name)||',' 
  from cols
 where table_name = 'MEMBER'
 
 union all
 
 select ')' from dual;


 select password from member where id='king';
 
 select *
  from 
 (select * 
  from book 
 where book_kind='100' 
 order by reg_date desc )
 where rownum<=2;
 
 -- book 
 select 'insert into book (' from dual
  union all

select lower(column_name)||',' 
  from cols
 where table_name = 'BOOK'
 
 union all
 
select ') values (' from dual

union all

select lower(column_name)||',' 
  from cols
 where table_name = 'BOOK'
 
 union all
 
 select ')' from dual;
 
 --update
 select 'update '||lower(table_name)||' set ' 
   from cols 
  where table_name='BOOK' 
    and rownum=1
  union all
 select lower(column_name)||'='||'?,'  
   from cols 
  where table_name='BOOK'
 union all
 select 'where book_id=?' 
   from dual; 
  
  
 select * from book where book_id=149;
 
 select * from BOOK_HISTORY;
 
 select * from
 (select * from book where book_kind='100' order by reg_date desc)
 where rownum<=5;
 
 
 --분류별 조회
 select * from
 (select rownum rn, book.* from book where book_kind='300' order by reg_date desc)
 where rn between 11 and 20;
 
 -- all조회
 select * from
 (select rownum rn, book.* from book order by reg_date desc)
 where rn between 11 and 20;
 
 
 select * from
 (select rownum rn, book.* from book where book_kind like '%' order by reg_date desc)
 where rn between 11 and 20;
 
 select * from
 (select rownum rn, a.* from
 (select * from book where book_kind like '100' order by reg_date desc) a)
 where rn between 11 and 20;
 
 
 
 select * from (select rownum rn, a.* from (select * from book order by book_id) a ) where rn between 11 and 20 ;
 
 --도서 분야(카테고리)테이블
 create table category(
 catNo varchar2(3) primary key,
 catName varchar(20) not null
 );
 --시퀀스 삭제 drop sequence 시퀀스 명;
drop sequence cat_seq;
-- 시퀀스 생성 create sequence 시쿼스명 start with 시작번호 increment by 증가분;
create sequence cat_seq start with 100 increment by 100;
-- 테이블 내 데이타 자르기 
truncate table category;
-- 시퀀스를 이용한 값 입력
insert into category(catNo, catName) values(cat_seq.nextval,'문학');
insert into category(catNo, catName) values(cat_seq.nextval,'외국어');
insert into category(catNo, catName) values(cat_seq.nextval,'컴퓨터');

select * from category;

--- union all 집합 A U B U C U D
select '1' from dual
union all
select '1' from dual
union all
select '3' from dual;

select 'insert into cart(' from dual
union all
select lower(column_name)||',' 
  from cols
 where table_name = 'CART'
union all
select ') values(?,?,?,?,?,?,?)' from dual;
 

select * from cart;
select * from book where book_id =0;

select * from user_objects where object_type='SEQUENCE';
 
select cart_seq.nextval from dual;


--카트 저장시 상품수량 재고에서 빼기 트리거
-- 트리거 insert update시에 작동하는 트리거:insert or update(or delete)  
-- after: 테이블에 입력후 작동
-- 테이블 타겟: on 테이블명 (on cart)
-- 한건 입력시마다 처리: for each row(옵션)
create or replace trigger cart_trg_iu
after insert or update on cart
for each row
begin
   update book 
      set book_count = book_count - (nvl(:new.buy_count,0)-nvl(:old.buy_count,0)) --:new.buy_count는 cart의 칼럼값 
    where book_id=:new.book_id;--:new.book_id는 cart의 칼럼값
end;

-- 트리거 활성화 여부 확인
select TRIGGER_NAME, STATUS from user_triggers where trigger_name like 'CART_TRG%';
-- 트리거 정상 상태 확인
select OBJECT_NAME, STATUS from user_objects where object_type='TRIGGER';


select * from cart;
select * from book where book_id=40;

select * from cart where buyer='hong';


--cart 삭제 트리거
create or replace trigger cart_trg_d
after delete on cart
for each row
begin
   update book 
      set book_count = book_count + nvl(:old.buy_count,0) --:old.buy_count는 cart의 칼럼값 
    where book_id=:old.book_id;--:old.book_id는 cart의 칼럼값
end;

-- 트리거 활성화 여부 확인
select TRIGGER_NAME, STATUS from user_triggers where trigger_name like 'CART_TRG%';
-- 트리거 정상 상태 확인
select OBJECT_NAME, STATUS from user_objects where object_type='TRIGGER';


select * from cart where buyer='hong';

alter trigger cart_trg_d disable;
alter trigger cart_trg_d enable;

select book_id from cart;
select book_id,book_count from book where book_id in (select book_id from cart);
select book_id,book_count from book where book_id in (6,2);


select * from cart, book where cart.book_id(+)=book.book_id and book.book_id is not null;
