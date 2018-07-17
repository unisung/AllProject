create or replace function emp_ename(
e_eno in emp.eno%type
)
return varchar2
is
v_ename varchar2(20):='';
begin
	select ename
	  into v_ename
	  from emp 
	 where eno =e_eno;
  return v_ename;
  exception
  when no_data_found or too_many_rows then
  return v_ename;
end; 

select * 
  from user_objects 
 where object_name='EMP_ENAME';
 
 
create or replace function emp_info(
e_eno in emp.eno%type
)
return varchar2
is
v_info varchar2(500):='';
begin
	select '이름:'||ename||',업무:'||job||',매니저:'||manager||',입사일자'
	             ||hiredate||',부서번호:'||dno
	  into v_info
	  from emp 
	 where eno =e_eno;
  return v_info;
  exception
  when no_data_found or too_many_rows then
  return v_info;
end; 

select * from user_objects where object_name='EMP_INFO';