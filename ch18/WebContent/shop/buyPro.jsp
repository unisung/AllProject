<%@page import="model.Buy"%><%@page import="dao.BuyDao"%>
<%@page import="model.Cart"%><%@page import="java.util.List"%><%@page import="dao.CartDao"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="loginCheck.jsp" %>
<%
		request.setCharacterEncoding("utf-8");
		String account = request.getParameter("account");
		String deliveryname=request.getParameter("deliveryname");
		String deliveryTel =request.getParameter("deliverytel1")+"-"+request.getParameter("deliverytel2")
		                         +"-"+request.getParameter("deliverytel3");
		String deliveryAddress = request.getParameter("zipno")+"-"
				                        +request.getParameter("address1")+"-"
				                        +request.getParameter("address2");
		String buyer = (String)session.getAttribute("id");
		
		CartDao dao = CartDao.getInstance();
		List<Cart> list = dao.getCartList(buyer);
		
		BuyDao bDao = BuyDao.getInstance();
		Buy buy = new Buy();
		
		buy.setBuyer(buyer);//id
		
		buy.setAccount(account);
		buy.setDeliveryname(deliveryname);
		buy.setDeliverytel(deliveryTel);
		buy.setDeliveryaddress(deliveryAddress);
		
		System.out.println("-----------");
		System.out.println("buyer="+buy.getBuyer());
		System.out.println("account="+buy.getAccount());
		System.out.println("deliveryTe="+buy.getDeliverytel());
		System.out.println("deliveryname="+buy.getDeliveryname());
		System.out.println("deliveryAddress="+buy.getDeliveryaddress());
		System.out.println("list="+list.size());
		System.out.println("-----------");
		
		
		int result = 0;
		result = bDao.insertBuy(list,buy);
		
		if(result>0){
			out.print("<script>");
			out.print("alert('구매처리완료!');");
			out.print("location.href='buyList.jsp';");
			out.print("</script>");
		}else{
			out.print("<script>");
			out.print("alert('구매처리 실패');");
			out.print("history.back();");
			out.print("</script>");
		}
%>