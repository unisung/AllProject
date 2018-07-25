<%@ page  contentType="text/html; charset=UTF-8" %>
<html><head>
<title>회원 탈퇴 폼</title>
<script>
	function chk(){
		var pass = document.getElementById('password').value;
		if(pass.length==0){
			alert("패스워드를 입력하세요");
			document.getElementById('password').focus();
			return false;
		}
		return true;
	}

</script>
</head>
<body>
   <form action="memberDeleteProc.jsp" method="post"  onsubmit="return chk()">
   <table>
   	<caption><h3>회원탈퇴</h3></caption>
   	<tr><th>회원아이디</th>
   	       <td><input type="text" name="id" value=${id} readonly="readonly"></td>
   	</tr>
   	<tr><th>패스워드</th><td><input type="password" name="password" id="password"></tr>
   	<tr><td colspan="2"><input type="submit" value="확인">
   	                                <input type="reset" value="지우기"></td>
   	 </tr>
   </table>
   </form>
</body>
</html>