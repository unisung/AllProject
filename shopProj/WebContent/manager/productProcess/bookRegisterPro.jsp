<%@page import="dao.BookDao"%>
<%@page import="model.Book"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!-- 문자셋 설정 -->
<%  request.setCharacterEncoding("utf-8"); %>
<%
	String realFolder="";//이미지 저장 폴더
	String filename="";//파일명
	MultipartRequest imageUp=null;
	String saveFolder="/imageFile";//이미지 저장 폴더
	final String encType="utf-8";
	final int maxSize = 5*1024*1024;//5*1024byte*1024:5MB-한번에 전송되는 최대사이즈
	ServletContext context = getServletContext();
	realFolder = context.getRealPath(saveFolder);//절대경로
	
	//이미지 저장 객체 생성
	imageUp = new MultipartRequest(
				 request,//request
				 realFolder,//저장위치
				 maxSize,//전송최대 사이즈
				 encType,//문자셋
				 new DefaultFileRenamePolicy()//이미 있는 파일 명 처리 
			);
	
   /* 다중 파일 업로드 처리  */
   //여러개의 파일인 경우
   Enumeration files = imageUp.getFileNames();
   while(files.hasMoreElements()){
	     String name = (String)files.nextElement();
	     filename = imageUp.getFilesystemName(name);
	     String orginalName= imageUp.getOriginalFileName(name);
	     out.print(name+"<br>");
	     out.print(filename+"<br>");
	     out.print(orginalName+"<br><br>");
   }
%><%
   /* Book book = new Book(); */
   String book_kind = imageUp.getParameter("book_kind");
   String book_title = imageUp.getParameter("book_title");
   String book_price = imageUp.getParameter("book_price");
   String book_count = imageUp.getParameter("book_count");
   String author = imageUp.getParameter("author");
   String publishing_com = imageUp.getParameter("publishing_com");
   String book_content = imageUp.getParameter("book_content");
   String discount_rate = imageUp.getParameter("discount_rate");
   String publishing_date = imageUp.getParameter("publishing_date");
   
   //등록일자 생성 처리
    java.sql.Date reg_date = new java.sql.Date(new java.util.Date().getTime());
   
 %>
 <jsp:useBean id="book" class="model.Book">
 <jsp:setProperty name="book" property="book_kind" value="<%=book_kind%>"/>
 <jsp:setProperty name="book" property="book_title" value="<%=book_title%>"/>
 <jsp:setProperty name="book" property="book_price" 
                                        value="<%=Integer.parseInt(book_price)%>"/>
 <jsp:setProperty name="book" property="book_count" 
                                        value="<%=Integer.parseInt(book_count)%>"/>
 <jsp:setProperty name="book" property="author" value="<%=author%>"/>
 <jsp:setProperty name="book" property="publishing_com" value="<%=publishing_com%>"/>
 <jsp:setProperty name="book" property="book_image" value="<%=filename%>"/>
 <jsp:setProperty name="book" property="book_content" value="<%=book_content%>"/>
 <jsp:setProperty name="book" property="discount_rate" 
                                        value="<%=Integer.parseInt(discount_rate)%>"/>
<jsp:setProperty name="book" property="publishing_date" value="<%=publishing_date%>"/> 
<jsp:setProperty name="book" property="reg_date" value="<%=reg_date%>"/>
 </jsp:useBean>
 <%
  
    BookDao dao = BookDao.getInstance();
    int result = dao.insertBook(book);
    
    if(result>0){
    	response.sendRedirect("bookList.jsp?book_kind="+book.getBook_kind());
    }else{
    	out.print("<script>");
    	out.print("alert('데이타 입력 중 에러발생. 메세지를 확인하세요.');");
    	out.print("location.href='bookRegisterForm.jsp';");
    	out.print("<script>");
    }
    /* out.print(book.getBook_kind()+"<br>");
    out.print(book.getBook_title()+"<br>");
    out.print(book.getPublishing_date()+"<br>");
    out.print(book.getReg_date()+"<br>");
   */ 
   /* out.print(book_kind+"<br>");
   out.print(book_title+"<br>");
   out.print(book_price+"<br>");
   out.print(book_count+"<br>");
   out.print(author+"<br>");
   out.print(publishing_com+"<br>");
   out.print(book_content+"<br>");
   out.print(discount_rate+"<br>");
   out.print(publishing_date+"<br>"); */
   
 
   



%>



