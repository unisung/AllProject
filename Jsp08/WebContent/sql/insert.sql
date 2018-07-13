select * from dept;

insert into dept(no,dname,loc) values(40,'기획','수원'); 
insert into dept(no,dname,loc) values(30,'연구','나주');

delete dept where no=40; 
delete dept where no=0; commit


select no from dept where no=50;  -- resultSet결과 null;
select count(*) from dept where no=50; --resultSet결과 0(null이 아님) ;



select * from member;

select * from member order by id;

update member 
   set name="",
       password=pwd1,
       pno=pno,
       address="" 
 where id=id;

 select * from member where id = 'aa';