<%@ page contentType="text/html; charset=UTF-8" %>
<html><head>
<script type="text/javascript">
	function chk(){
		var  route = document.getElementById('startMenu').value;
		if(route=="Admin"){
			location.href="indexManager.jsp";
		}else if(route=="Member"){
			location.href="indexShopMain.jsp";
		}
	}
</script>
<title>Insert title here</title></head>
<body>
         <select id="startMenu">
           <option value="NotSelected">선택</option>
           <option value="Admin">Admin</option>
           <option value="Member">Member</option>
         </select>
         <input type="button" value="작업 선택" onclick="chk()">
</body>
</html>