<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- PersonalInfo pinfo = new PersonalInfo(); -->
  <jsp:useBean class="ch01.PersonalInfo" id="pinfo" 
                          scope="session"></jsp:useBean>
  이름:<jsp:getProperty property="name" name="pinfo"/><br>
  성별:<jsp:getProperty property="gender" name="pinfo"/><br>
  나이:<jsp:getProperty property="age" name="pinfo"/>
  
</body>
</html>