<%@page import="dao.BookDao"%>
<%@page import="model.Book"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!-- 메니저 로그인 여부 확인 -->
<%@ include file="../managerSessionChk.jsp" %>
<%
       request.setCharacterEncoding("utf-8");
       String saveFolder = "/imageFile";
       String filename="";//이미파일 명 변수 선언
       //컨텍스 정보객체 생성
       ServletContext context = getServletContext();
       //이미지 저장 폴더 지정
       String realFolder = context.getRealPath(saveFolder);
       int maxSize = 5*1024*1024;//파일 사이즈를 5MB로 설정
       String encType = "utf-8";//문자셋 설정
       
       MultipartRequest multi = new MultipartRequest(
    		   request,//리퀘스트 객체
    		   realFolder,//저장 경로
    		   maxSize,//파일 최대 사이즈
    		   encType,//문자셋
    		   new DefaultFileRenamePolicy()//중복이름 처리 방법지정
    		   );
       //전송한 파일 정보 출력
       Enumeration files = multi.getFileNames();
       //파일정보가 있다면
       while(files.hasMoreElements()){
    	       //input 태그의 속성이 file인 태그 name의 속성값:파라미터 명
    	      String name = (String)files.nextElement();
              //서버에 저장된 파일 이름
    	      filename = multi.getFilesystemName(name);
       }
       Book book = new Book();
     
       int book_id = Integer.parseInt(multi.getParameter("book_id"));
       String orgBook_kind = multi.getParameter("org_book_kind");
       String book_kind = multi.getParameter("book_kind");
       String book_title = multi.getParameter("book_title");
       String book_price =multi.getParameter("book_price");
       String book_count = multi.getParameter("book_count");
       String author = multi.getParameter("author");
       String publishing_com = multi.getParameter("publishing_com");
       String publishing_date = multi.getParameter("publishing_date");
       String book_content = multi.getParameter("book_content");
       String discount_rate = multi.getParameter("discount_rate");
       
       book.setBook_id(book_id);
       book.setBook_kind(book_kind);
       book.setBook_title(book_title);
       book.setBook_price(Integer.parseInt(book_price));
       book.setBook_count(Integer.parseInt(book_count));
       book.setAuthor(author);
       book.setPublishing_com(publishing_com);
       book.setPublishing_date(publishing_date);
       book.setBook_image(filename);//선택한 파일 이미지 세팅
       book.setBook_content(book_content);
       book.setDiscount_rate(Integer.parseInt(discount_rate));
       /* 등록 일자(수정일자) */
       book.setReg_date(new java.sql.Date(new java.util.Date().getTime()));
       
       //update처리process
       BookDao dao = BookDao.getInstance();
       int result = dao.updateBookInfo(book, book_id);
       if(result>0){
    	   				response.sendRedirect("bookList.jsp?book_kind="+orgBook_kind);
       }else{
    	   out.print("<script>");
		   out.print("alert('상품 정보 수정 중 에러발생, 콘솔 메세지를 확인하세요');");
		   out.print("location.href='bookUpdateForm.jsp';");
		   out.print("</script>");
       }
%>



