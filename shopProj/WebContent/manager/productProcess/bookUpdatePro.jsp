<%@page import="dao.BookDao"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../managerSessionChk.jsp" %>
<% 
   //현재페이지로 이동하는 request에 문자셋 설정
   request.setCharacterEncoding("utf-8");
   String saveFoler ="/imageFile";
   String filename="";//이미지 파일명 변수 선언
   //컨텍스트 정보객체 생성
   ServletContext context = getServletContext();
   //이미지 저장 물리지적 절대 경로
   String realFolder = context.getRealPath(saveFoler);
   final int maxSize=5*1024*1024;//파일사이즈 5*1MB
   final String encType="utf-8";//문자셋 설정
   
   MultipartRequest multi = new MultipartRequest(
		               request,
		               realFolder,
		               maxSize,
		               encType,
		               new DefaultFileRenamePolicy()
		   );
  //전송한 파일 정보 출력
  Enumeration files = multi.getFileNames();
  //파일정보가 있으면
  while(files.hasMoreElements()){
	   String name=(String)files.nextElement();
	   //getFileSystemName() - 서버에 올라간 이름
	   filename = multi.getFilesystemName(name);//	   
/* 	   out.print("name="+name+"<br>");
	   out.print("filename="+filename+"<br>"); */
  }
%>
<%
   /* Book book = new Book(); */
   String book_id = multi.getParameter("book_id");
   String book_kind = multi.getParameter("book_kind");
   String book_title = multi.getParameter("book_title");
   String book_price = multi.getParameter("book_price");
   String book_count = multi.getParameter("book_count");
   String author = multi.getParameter("author");
   String publishing_com = multi.getParameter("publishing_com");
   String book_image = multi.getParameter("book_image");
   String book_content = multi.getParameter("book_content");
   String discount_rate = multi.getParameter("discount_rate");
   String publishing_date = multi.getParameter("publishing_date");
   String org_book_kind = multi.getParameter("org_book_kind");
   
/*    System.out.println("book_id="+book_id+"<br>");
   System.out.println("publishing_date="+publishing_date+"<br>"); */
   
   //등록일자 생성 처리
    java.sql.Date reg_date = new java.sql.Date(new java.util.Date().getTime());
 %>
 <jsp:useBean id="book" class="model.Book">
 <jsp:setProperty name="book" property="book_id" value="<%=Integer.parseInt(book_id)%>"/>
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
/*    System.out.println("book_id="+book.getBook_id()+"<br>");
   System.out.println("publishing_date="+book.getPublishing_date()+"<br>"); */

/* update 처리  */
  BookDao dao = BookDao.getInstance();

  int result = dao.updateBookInfo(book, Integer.parseInt(book_id)); 
  if(result>0){
	  out.print("<script>");
	  out.print("alert('"+book_id+"수정 성공!!!');");
	  out.print("location.href='bookList.jsp?book_kind="+org_book_kind+"';");
	  out.print("</script>");
  }else{
	out.print("<script>");
	out.print("alert('상품정보 수정 중 오류발생,콘솔 메세지를 확인하세요');");
	out.print("location.href='bookUpdateForm.jsp';");
	out.print("</script>");  
  }
%>
 
 
 
 
 