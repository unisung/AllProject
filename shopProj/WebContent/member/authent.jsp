<%@page import="org.apache.commons.mail.SimpleEmail"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
    String sEmail = request.getParameter("email");

	String msg="";
    for(int i=0;i<16;i++)
	   msg += (char)((Math.random()*26)+97);
  	
    String sendMsg = "다음 메세지를 인증 창에 입력하세요: "+msg;
    
    out.print(msg+"<br>");
    out.print("email:"+sEmail+"<br>");
    out.print("<script>");
    out.print("function chk(){"); 
    out.print("var sp=document.getElementById('sp');");
    out.print("var text='전송완료';");
    out.print("alert(sp);");
    out.print("alert(text);");
    out.print("sp.innerHTML=text;");
     out.print("}"); 
    out.print("</script>");
    
	  /*  int num = 97;
	   char c=' ';
	   for(int i=0;i<num+25;i++){
	   	 c = (char)(num+i);   	 
         out.print(c+"<br>");
	   }    */
	   
	//email 주소를 입력받아서 메일 전송하기
	 if(sEmail!=null && !"".equals(sEmail)){
		request.setCharacterEncoding("utf-8");
		
		//이메일 설정
		final String HOST_NAME="smtp.naver.com";
		final int PORT_NUMBER=465;
		final String CONTENT_TYPE="text/plain;charset=utf-8";
		
		//이메일 발송 처리
		SimpleEmail email = new SimpleEmail();
		email.setCharset("utf-8");
		email.setHostName(HOST_NAME);
		email.setSmtpPort(PORT_NUMBER);
		email.setSSL(true);
		email.setTLS(true);
		//메일 이증 처리
		email.setAuthentication("아이디", "비번");
		
		//메일 내용 저장
		email.setSubject("인증메일");
		email.setContent(sendMsg,CONTENT_TYPE);
		
		//수신자 
		email.addTo(sEmail);
		email.setFrom("vctor@naver.com", "관리자");
		
		//발송 처리
		email.send();
		
	}
%>
<form onsubmit="chk()">
  <fieldset>
  <legend>email</legend>
  <p>
  <input type="text" name="email">
  </p>
  <p>
  <input type="submit" value="전송"><span id="sp"></span>
  </p>
  </fieldset>
</form>
<fieldset>
<legend>인증 메세지</legend>
<p>
<input type="text" name="msg" id="msg">
</p>
<p>
<input type="button" onclick="cfm()" value="확인">
</p>
</fieldset>
</body>
</html>
<script>
function cfm(){
 var msg = document.getElementById("msg").value;
 if(msg=='<%=msg%>'){
	 alert('인증되었습니다.');
	 location.href='joinProc1.jsp';
 }else{
	 msg="";
	 alert('인증 실패:값을 확인하세요');
 }
}
</script>