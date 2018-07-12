select * from emp order by eno;
select * from member;

select password from member where id='hong3';


drop table books;
create table books(
code    varchar2(5) primary key,
name    varchar2(100),
writer  varchar2(30),
price   number(7),
page    number(5)
);


drop sequence book_seq;

create sequence book_seq 
increment by 1
start with 10000
;

insert into books values(book_seq.nextval,'로미오와 줄리엣','세익스피어',250000,700);
insert into books values(book_seq.nextval,'리어왕','세익스피어',280000,900);
insert into books values(book_seq.nextval,'역사의 역사','유시민',14000,700);
insert into books values(book_seq.nextval,'뇌과학자가 이야기하는 현명하게 사는 비법','정재승',250000,700);
insert into books values(book_seq.nextval,'우리는 울고 싶을 때 울 수 있는 사람이어야 한다','백세희 ',250000,700);

insert into books values(book_seq.nextval,'고구려를 구할 영웅이 나타난다! ','설민석',10000,300);
insert into books values(book_seq.nextval,'드라마〈김비서가 왜 그럴까〉 연애세포를 깨운 화제의 책','하태완',12000,300);
insert into books values(book_seq.nextval,'곰돌이 푸가 느긋한 미소를 지으며 건네는 위로의 말들','곰돌이푸 ',10000,300);
insert into books values(book_seq.nextval,'손석희 추천, 현직 판사가 말하는 한국의 불편한 진실','문유석',13000,300);
insert into books values(book_seq.nextval,'말과 글의 따뜻함과 차가움에 대하여, 하찮아 보이는 것들의 소중함에','이기주',10000,300);


insert into books values(book_seq.nextval,'고양이 눈으로 바라본 인간의 미래, 베르나르 베르베르 신작!','베르나르 베르베르',13000,300);
insert into books values(book_seq.nextval,'어른이 처음인 이들을 위한 단단한 위로들','김수현',12000,300);
insert into books values(book_seq.nextval,'고양이 눈으로 바라본 인간의 미래, 베르나르 베르베르 신작!','곰돌이푸 ',10000,300);
insert into books values(book_seq.nextval,'신토익 반영, 핵심 단어와 필수 표현으로 시험 완벽 대비','david cho',13000,300);
insert into books values(book_seq.nextval,'소란스럽지 않은 진심으로 전하는 행복의 메시지','전승환',13000,300);

insert into books values(book_seq.nextval,'나는 어디를 향해 이렇게 열심히 달리고 있는 걸까','하완 ',15000,300);
insert into books values(book_seq.nextval,'오르는 집은 지금도 숨어 있다! 고수익 부동산을 찾는 열쇠','이상우',16000,300);
insert into books values(book_seq.nextval,'국대급 심쿵 로맨스! 전국은 김비서 열풍!','정경윤',12000,300);
insert into books values(book_seq.nextval,'한국사의 흐름을 한눈에 살펴본다!','최태성',13000,300);
insert into books values(book_seq.nextval,'우리가 살고 싶은 도시를 말하다','유현준',15000,300);

insert into books values(book_seq.nextval,'역사 속 라이벌 편! 설쌤과 황 대감, 화해 대작전','설민석',10000,300);
insert into books values(book_seq.nextval,'많이 바뀐 것 같지만 바뀌지 않은 세상, 한국에서 ''여자''로 살아간다는 것','조남주',16000,300);
insert into books values(book_seq.nextval,'더 많이, 더 빨리, 더 똑똑하게 부를 만드는 새로운 부의 법칙','정경윤',12000,300);
insert into books values(book_seq.nextval,'히가시노 게이고, 기적과 감동을 추리하다!','히가시노',13000,300);
insert into books values(book_seq.nextval,'단독에디션] 사람이 지닌 고유한 향기는 사람의 말에서 뿜어져 나온다.','이기주',15000,300);

commit


select * from books;

select * from books where writer like '%세익스피어%';
select * from books where writer like '%세익스피어%';




