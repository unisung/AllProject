select * from member order by id;

--권한:관리자,일반
create table privilege(
id varchar2(20) primary key,
grade varchar2(10) not null
);

select * from privilege;

insert into privilege values('admin','admin');

delete from privilege where id='zz';

--권한 입력 트리거
create or replace trigger trg_inst
after insert on MEMBER
for each row
begin
  insert into privilege(id,grade) values(:new.id, 'guest');
end; 

select * from user_triggers
where trigger_name='TRG_INST';

