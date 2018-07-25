create table board(
num number primary key, --key
writer varchar2(30) not null, --작성자
subject varchar2(100) not null, --제목
content varchar2(1000) not null, --본문
email varchar2(50) not null, --이메일
readcount number default 0,--읽은 횟수
passwd varchar2(30) not null, -- 패스워드
ref number not null, --답별글 끼리 그룹
re_step number not null,--ref내의 순서
re_level number not null,-- 들여쓰기 
ip varchar2(30) not null, --작성자 ip
reg_date date not null --작성일
);

select * from board;

select 'private '||decode(data_type,'VARCHAR2','String','NUMBER','int','DATE','Date',data_type)
       ||' '||lower(column_name)
  from cols 
 where table_name='BOARD'
  order by column_id;
   
 --현재까지의 글 번호 조회 결과 없으면 null값 리턴 
 select max(num) from board;
  
 --입력
insert into board
(num,writer,subject,content,email,passwd,reg_date,ref,re_step,re_level,ip) 
values(?,?,?,?,?,?,sysdate,?,?,?,?);

truncate table board;

select * from board where num >=1000;

-- 시작,끝 
select num, writer, ref,re_step,re_level
 from
(select rownum rn, a.* 
  from
(select * from board order by ref desc, re_step asc) a)
where rn between 1 and 10;
;

update board set readcount=readcount+1 where num=1000;

select passwd from board where num=101;


drop table favorHate;
create table favorHate(
num number(5) not null,
ip varchar2(30),
id varchar2(30),
favor number(1),
hate  number(1)
);

insert into favorHate(num,ip,id,favor,hate) values(1003,'127.0.0.1','',1,0);
insert into favorHate(num,ip,id,favor,hate) values(1003,'127.0.0.2','',1,0);
insert into favorHate(num,ip,id,favor,hate) values(1003,'127.0.0.3','',0,1);
insert into favorHate(num,ip,id,favor,hate) values(1003,'127.0.0.4','',1,0);

select * from favorHate;

select num,sum(favor),sum(hate) from favorHate group by num;

select * from board where num = 1003;
update board set email ='vctor@naver.com' where num=1003;