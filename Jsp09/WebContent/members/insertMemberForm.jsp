<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
 function chk(){
	var pass1 = document.frm.password;
	var pass2 = document.frm.password2;
	if(pass1.value==""){
		alert('비밀번호를 입력하세요');
		pass1.focus();
		return false;
	}
	if(pass2.value==""){
		alert('비밀번호 확인을 입력하세요');
		pass2.focus();
		return false;
	}
	if(pass1.value!=pass2.value){
		alert('입력한 값이 서로 다릅니다.');
		pass1.value="";
		pass2.value="";
		pass1.focus();
		return false;
	}
	return true;
 }
 
 function idChk(){
  	 if(!document.frm.id.value){
  		 document.frm.id.focus();
  		 alert('id를 입력하세요');
  		 return;
  	 }
  	 /* 팝업창 띄우는 메소드 window.open(윈도우명, 타이틀, 속성(폭과 높이)) */
  	 window.open("confirmId.jsp?id="+document.frm.id.value,"","width=300 height=300");
	 return true;
 }
</script>
<title>회원 가입 폼</title>
</head>
<body>
     <h2>회원가입</h2>
     <form name="frm" action="insertMemberPro.jsp" method="post" onsubmit="return chk()">
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