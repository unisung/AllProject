<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
 /* 매개변수 두개를 받아서 결과를 리턴하는 함수 */
 function adder(a,b){
	 var sum;
	 sum=a+b;
	 return sum;
 }
</script>
</head>
<body>
     <h3>함수 adder()</h3>
     <hr>
     <script type="text/javascript">
      var n= adder(24567, 98774);//함수 호출
      document.write("24567 + 98774의 결과는 "+n+"<br>");     
     </script>
</body>
</html>