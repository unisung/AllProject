create or replace procedure plus(
num1 in number, 
num2 in number,
num3 out number
)
as
begin
 num3 := num1+num2;
end;
