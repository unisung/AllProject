<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>지역변수와 전역변수</title>
</head>
<body>
  <h3>지역변수와 전역변수</h3>
  <hr>
  <script type="text/javascript">
    var x=10;//전역변수 x선언
    /* function 함수명(){} */
    function f(){
    	var x=1;//함수내에서 선언된 지역변수 x
    	
    	document.write("지역변수 x="+x);
    	document.write("<br>");
    	document.write("전역변수 x="+this.x);//전역변수 호출:this.전역변수명;
    }
    //함수 호출 함수명();
    f();
  </script>
  
</body>
</html>