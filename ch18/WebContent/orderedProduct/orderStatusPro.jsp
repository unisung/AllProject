<%@page import="dao.BuyDao"%>
<%@ page contentType="text/html; charset=UTF-8"%>s
<%
		request.setCharacterEncoding("utf-8");	
		BuyDao dao = BuyDao.getInstance();
		int result = 0;
		String buy_id = request.getParameter("buy_id");
		String status = request.getParameter("sanctions");
		result = dao.updateOrderStatus(Integer.parseInt(buy_id),status);
		if(result>0){
			out.print("<script>");
			out.print("alert('상태가 수정되었습니다.');");
			out.print("location.href='orderedList.jsp'");
			out.print("</script>");
		}else{
			out.print("<script>");
			out.print("alert('상태 수정 실패');");
			out.print("history.back();");
			out.print("</script>");
		}
%>