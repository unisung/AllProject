<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
    //한번에 전송가능한 파일 사이즈 한계
    int maxSize =5*1024*1024;//5MB;
    //파일저장 폴더 지정
    String fielSave = "/fileSave";//저장폴더
    String realPath = getServletContext().getRealPath(fielSave);//절대경로
    //C:\jspWorkspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\Jsp12\fileSave
    //콘텐츠 문자셋 설정
    String encType="utf-8";
    
    MultipartRequest multi 
          = new MultipartRequest(
    		    request,//form으로 부터 넘어오는 request(Multipartrequest)객체
    		    realPath,//파일저장 실제경로
    		    maxSize,//한번에 전송할 최대 사이즈
    		    encType,//문자셋 설정
    		    new DefaultFileRenamePolicy());//기존 파일이 있으면 새로운 이름으로
    
    String name = "uploadFile";
    String fileName = multi.getFilesystemName(name);//upload된 파일명
    String original = multi.getOriginalFileName(name);//upload되기전 파일명
    //전송된 파일의 타입
    String type=multi.getContentType(name);//문자셋
    File file = multi.getFile(name);//파일객체 얻기 getFile();
    out.print("파라미터 이름:"+name+"<br>");
    out.print("실제파일 이름:"+original+"<br>");
    out.print("저장된 파일 이름:"+fileName+"<br>");
    out.print("파일타입:"+type+"<br>");
    if(file!=null)
    out.print("크기:"+file.length()+"<br>");//파일 사이즈 length()
    String writer=multi.getParameter("writer");//input tag name이 writer
    String title=multi.getParameter("title");//input tag name이 title
    
    out.print("사용자:"+writer+"<br>");
    out.print("제목:"+title+"<br>");
    
%>
</body>
</html>