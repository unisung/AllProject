<%@page import="org.apache.commons.mail.SimpleEmail"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
    
   //Form으로 부터 내용 받기
	String emailId = request.getParameter("emailId");
    String receiver =request.getParameter("writer");
    String subject = request.getParameter("subject");
    String content = request.getParameter("content");
    String pageNum = request.getParameter("pageNum");
   
    //이메일 설정
    final String HOST_NAME="smtp.naver.com";
    final int PORT_NUMBER=465;
    final String CONTENT_TYPE="text/plain;charset=utf-8";
    
    //이메일 발송 처리
    SimpleEmail email = new SimpleEmail();
    email.setCharset("utf-8");//문자셋 설정
    email.setHostName(HOST_NAME);//SMTP 서버 설정
    email.setSmtpPort(PORT_NUMBER);//포트번호 설정
    email.setSSL(true);//보안설정
    email.setTLS(true);//보안설정
    //보내는 사람의 이메일 id와 비번을 저장 
    email.setAuthentication("vctor", "비번");//메일인증 
    
    //메일 내용 저장
    email.setSubject(subject);//이메일 제목 저장
    email.setContent(content,CONTENT_TYPE);//이메일 본문 저장
    
    
    //수신자/발신자 저장
    email.addTo(emailId,receiver);//수신자 이메일 주소
    email.setFrom("vctor@naver.com","홍길동");//발신자 이멜 주소
    //메일 발송
    email.send();//메일 발송
   
    out.print("<script>");
    out.print("alert('이메일 발송이 완료되었습니다.');");
    out.print("location.href='list.jsp?pageNum="+pageNum+"';");
    out.print("</script>"); 
%>
<%--  emailId:<%=emailId %><br>
 수신자:<%=receiver %><br>
 제목:<%=subject %><br>
 내용:<%=content %><br>
 페이지:<%=pageNum %><br> --%>
 

</body>
</html>