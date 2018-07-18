<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
function idChk(){
	var id = document.frm.id.value;
	if(id==""){
		alert('아이디를 입력하세요');
		document.frm.id.focus();
		return false;
	}
	window.open('confirmId.jsp?id='+id,"id중복 체크","width=300 heigth=300");
}

</script>
<title>회원가입</title>
</head>
<body>
    <h2>회원가입</h2>
     <form name="frm" action="agree.jsp" method="post" onsubmit="return chk()">
        <fieldset>
        <legend>필수입력사항</legend>
         <p>
          <label>아이디</label>
          <input type="text" name="id" maxlength="20" required>
          <input type="button" value="중복체크" onclick="idChk()">
         </p>
         <p>
          <label>패스워드</label>
          <input type="password" name="password" maxlength="20">
         </p>
         <p>
          <label>패스워드 확인</label>
          <input type="password" name="password2" maxlength="20">
         </p>
         <p>
          <label>이름</label>
          <input type="text" name="name" maxlength="30" required>
         </p>
        </fieldset>
        <p>
         <input type="submit" value="회원가입">
         <input type="reset" value="취소">
        </p>
     </form>
</body>
</html>