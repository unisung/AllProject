<%@page import="dao.CartDao"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="loginCheck.jsp" %>
<%
  
  String cart_id = request.getParameter("cart_id");
  String book_kind = request.getParameter("book_kind");
  String buy_count = request.getParameter("buy_count");
  //파라미터로 넘어온 값이 비어있을 때.
  if(buy_count==null||"".equals(buy_count)){
	  out.print("<script>");
	  out.print("alert('수정은 값이 있어야합니다.');");
	  out.print("history.back();");
	  out.print("</script>");
  }else{//아닌 경우
 try{
     CartDao dao = CartDao.getInstance();
   /* updateCount()메소드 실행시 cart_trg_iu 트리거가 실행됨 */
 int result /* 숫자가 아닌값이 넘어온 경우 parsetInt()메소드에서 예외발생 */
       = dao.updateCount(Integer.parseInt(cart_id), Integer.parseInt(buy_count)); 
  if(result>0){
	 out.print("<script>");  
	 out.print("alert('카트 수량이 수정되었습니다.');");
	 out.print("location.href='cartList.jsp?book_kind="+book_kind+"';");
	 out.print("</script>");  
  }else{
	 out.print("<script>");
	 out.print("alert('에러발생 콘솔메세지를 확인하세요');");
	 out.print("history.back();");
	 out.print("</script>"); 
  } 
 }catch(Exception e){//숫자로 바꿀때 예외 발생 처리
	  out.print("<script>");
	  out.print("alert('입력값은 숫자여야합니다.');");
	  out.print("history.back();");
	  out.print("</script>");
   } 
 }
%>
