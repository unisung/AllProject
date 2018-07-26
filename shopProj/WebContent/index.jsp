<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
 function chk(){
	 var route = document.getElementById("startMenu").value;
	 if(route=="Adimin"){
		location.href="indexManager.jsp"; 
	 }else if(route=="Member"){
		location.href="indexShopMain.jsp";
	 }
 }

</script>
</head>
<body>
  <select id="startMenu">
    <option value="NoSelected">선택</option>
    <option value="Adimin">Admin</option>
    <option value="Member">Member</option>
  </select>
  <input type="button" value="선택" onclick="chk()">
</body>
</html>