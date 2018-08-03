<%@page import="model.Buy"%>
<%@page import="dao.BuyDao"%>
<%@page import="model.Cart"%>
<%@page import="java.util.List"%>
<%@page import="dao.CartDao"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="loginCheck.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
    String account = request.getParameter("account");
    String receiverName = request.getParameter("name");
    String receiverTel = request.getParameter("tel1")
    		           +"-"+request.getParameter("tel2")
    		           +"-"+request.getParameter("tel3");
    String receiverAddress = request.getParameter("zipno")
    		               +"-"+request.getParameter("address1")
                           +"-"+request.getParameter("address2");
    
    if(account.length()==0||receiverName.length()==0||
    		 receiverTel.length()==0||receiverAddress.length()==0) 
   {	
    	out.print("<script>");
        out.print("alert('값이 비어있습니다.');");
        out.print("hsitory.back();");
    	out.print("<script>");
    }
    
    String buyer = (String)session.getAttribute("id");
    
    System.out.println("account="+account);
    System.out.println("receiverName="+receiverName);
    System.out.println("receiverTel="+receiverTel);
    System.out.println("receiverAddress="+receiverAddress);
    System.out.println("buyer="+buyer);
 
    CartDao cDao = CartDao.getInstance();
    List<Cart> list = cDao.getCartList(buyer);
   
    BuyDao bDao = BuyDao.getInstance();
    Buy  buy = new Buy();
    
    
    buy.setBuyer(buyer);
    buy.setAccount(account);
    buy.setDeliveryname(receiverName);
    buy.setDeliverytel(receiverTel);
    buy.setDeliveryaddress(receiverAddress);
    
    int result = 0;
    //구매처리 db작업
    result = bDao.insertBuy(list,buy);
    
    if(result>0){
    	out.print("<script>");
    	out.print("alert('구매처리 완료!');");
    	out.print("location.href='buyList.jsp';");
    	out.print("</script>");
    }else{
    	out.print("<script>");
    	out.print("alert('구매처리 중 오류 발생 콘솔메세지를 확인하세요');");
    	out.print("history.back();");
    	out.print("</script>");
    } 
    
%>
