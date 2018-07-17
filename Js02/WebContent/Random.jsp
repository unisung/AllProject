<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
  function randomInt(){
	  return Math.floor(Math.random()*9)+1;
  }
</script>
</head>
<body>
<h3>Math를 활용한 구구단 연습</h3>
<hr>
<script>
   var ques = randomInt() + "*"+randomInt();
   //
   var user = prompt(ques+"값은 얼마입니까?",0);//prompt로 받은 값은 문자열
   if(user==null){
	   document.write("구구단을 종료합니다.");
   }else{
	   var ans = eval(ques);//"10*2"=> 10*2,문자열값을 수식으로 변경 eval()
	   if(ans==user)
		   document.write("정답!");
	   else
		   document.write("아니오!");
	   docment.write(ques+"="+"<strong>"+ans+"</strong>입니다.<br>");
   }
</script>

</body>
</html>