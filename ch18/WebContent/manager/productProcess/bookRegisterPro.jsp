<%@page import="java.util.Date"%>
<%@page import="dao.BookDao"%>
<%@page import="model.Book"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	 request.setCharacterEncoding("utf-8");
     
%>
<%
	String realFolder ="";
	String filename="";
	MultipartRequest imageUp = null;
	String saveFolder = "/imageFile";
	String encType="utf-8";
	int maxSize = 5*1024*1024;
	ServletContext context = getServletContext();
	realFolder = context.getRealPath(saveFolder);
	
	imageUp = new MultipartRequest(
			request,
			realFolder,
			maxSize,
			encType,
			new DefaultFileRenamePolicy()
			);
	/* 다중 파일 업로드 처리 */
	Enumeration files = imageUp.getFileNames();
	while(files.hasMoreElements()){
			String name = (String)files.nextElement();
			filename = imageUp.getFilesystemName(name);
	}
%>

<%	
	 Book book = new Book();
	String book_kind = imageUp.getParameter("book_kind");
	String book_title = imageUp.getParameter("book_title");
	String book_price = imageUp.getParameter("book_price");
	String book_count = imageUp.getParameter("book_count");
	String author = imageUp.getParameter("author");
	String publishing_com = imageUp.getParameter("publishing_com");
	String book_content = imageUp.getParameter("book_content");
	String discount_rate = imageUp.getParameter("discount_rate");
	String publishing_date = imageUp.getParameter("publishing_date");
	
	book.setBook_kind(book_kind);
	book.setBook_title(book_title);
	book.setBook_price(Integer.parseInt(book_price));
	book.setBook_count(Integer.parseInt(book_count));
	book.setAuthor(author);
	book.setPublishing_com(publishing_com);
	book.setPublishing_date(publishing_date);
	book.setBook_image(filename);
	book.setBook_content(book_content);
	book.setDiscount_rate(Integer.parseInt(discount_rate)); 
	
	/* java.sql.Date()생성자의 매개변수로 java.util.Date().getTime()를 넘김 */
	book.setReg_date(new java.sql.Date(new Date().getTime()));
	
	BookDao bookProcess = BookDao.getInstance();
	int result = bookProcess.insertBook(book);
   
	if(result>0){
		response.sendRedirect("bookList.jsp?book_kind="+book.getBook_kind());
	}else{
		out.print("<script>");
		out.print("alert('데이터 입력중 에러 발생. 메시지를 확인하세요');");
		out.print("location.href='bookRegisterForm.jsp';");
	}
%>