<%@page import="model.PagingBean"%>
<%@page import="util.Paging"%>
<%@page import="dao.BuyDao"%><%@page import="model.Buy"%><%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="loginCheck.jsp" %>
<%
     String path = getServletContext().getContextPath();
	 String buyer = (String)session.getAttribute("id");
	/* 페이징 설정*/
	int pageSize= 10;
	int BLOCKSIZE=10;//한 블럭당 출력되는 페이지 수
	String pageNum = request.getParameter("pageNum");
	
	 ArrayList<Buy> list = null;
	 BuyDao dao = BuyDao.getInstance();
	 int buyCount = dao.getBuyListCount(buyer);//구매 목록 건수 구하기
	 System.out.println("count="+buyCount);

	 Paging pg = new Paging();
	    PagingBean pb = pg.getPaging(pageNum, pageSize, BLOCKSIZE, buyCount);
	 //list = dao.getBuyList(buyer);//구매 목록 리스트 구하기
	 list = dao.getBuyList(buyer,pb.getStartRow(),pb.getEndRow());//
	 System.out.println("pageCount="+pb.getPageCount());
	 int total=0;
	 for(int i=0;i<list.size();i++)
		 total+=(list.get(i).getBuy_price()==0?1:list.get(i).getBuy_price())
		            *(list.get(i).getBuy_count()==0?1:list.get(i).getBuy_count());
	 	 
	
	 request.setAttribute("path", path);
	 request.setAttribute("buyer",buyer);
	 request.setAttribute("buyList",list);
	 request.setAttribute("buyCount",buyCount);
	 request.setAttribute("total",total);
	 
	 request.setAttribute("pageCount", pb.getPageCount());
	 request.setAttribute("startPage",pb.getStartPage());
	 request.setAttribute("BLOCKSIZE",BLOCKSIZE);
	 request.setAttribute("endPage",pb.getEndPage());
	 
	 System.out.println("startPage="+pb.getStartPage());
	 System.out.println("endPage="+pb.getEndPage());
	 System.out.println("BLOCKSIZE="+BLOCKSIZE);
	 
	 
	 
%>
<html><head><title></title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
<table border="1" width="650" cellspacing="3" cellpadding="3" align="center">
  <caption><h3>구매 목록</h3></caption>
  <tr>
  	<th><b>번호</b></th><th><b>도서명</b></th><th><b>판매가격</b></th>
  	<th><b>수량</b></th><th><b>금액</b></th><th><b>상품상태</b></th>
  </tr>
  <c:if test="${empty buyList}">
  		<tr><td><b>구매목록이 없습니다.</b></td></tr>
  </c:if>
  <c:if test="${!empty buyList}">
  <c:forEach var="buy" items="${buyList}" varStatus="no">
    <tr>
     <td align="center" width="50"><b>${no.count}</b></td>
     <td width="300">
     <img src="${path}/imageFile/${buy.book_image}" border="0" 
                              width="30" height="50" align="middle">
       ${buy.book_title}                              
      </td>
      <td align="center" width="100">
      <fmt:formatNumber  value="${buy.buy_price}" pattern="###,##0" />
      </td>
      <td align="center" width="50">
      <fmt:formatNumber  value="${buy.buy_count}" pattern="###,##0"/>
      </td>
      <td align="center" width="150s">
      <fmt:formatNumber  value="${buy.buy_count * buy.buy_price}" 
                                    pattern="###,##0"/>
     </td>
     <td>
     	<select name="status" <c:if test="${buy.sanction!='배송완료'}">disabled</c:if>>
           <option value="준비중"<c:if test="${buy.sanction=='준비중'}">selected</c:if>>준비중</option>
     	   <option value="배송중"<c:if test="${buy.sanction=='배송중'}">selected</c:if>>배송중</option>
     	   <option value="배송완료"<c:if test="${buy.sanction=='배송완료'}">selected</c:if>>배송완료</option>
     	   <option value="구매확정"<c:if test="${buy.sanction=='구매확정'}">selected</c:if>>구매확정</option>
     	   <option value="반품"<c:if test="${buy.sanction=='반품'}">selected</c:if>>반품</option>
		</select><br>
		<c:if test="${buy.sanction=='배송완료'}">
		<input type="button" value="구매확정" 
		  onclick="location.href='buyStatusPro.jsp?buy_id=${buy.buy_id}&sanctions=구매확정'">
		<input type="button" value="반품" 
		onclick="location.href='buyStatusPro.jsp?buy_id=${buy.buy_id}&sanctions=반품'">
		</c:if>
     </td>
    </tr>
  </c:forEach>
    <tr>
      <td colspan="6" align="right"><b>총 금액:
        <fmt:formatNumber  value="${total}" type="currency" currencySymbol=" ￦"/>
      </b>
      </td>
    </tr>
    <tr>
    <td colspan="6" align="center">
  
  <c:if test="${startPage>BLOCKSIZE}">
  <a href="buyList.jsp?pageNum=${startPage-BLOCKSIZE}">[이전]</a>
  </c:if>
  
  <c:if test="${endPage>pageCount}">
  	<c:forEach var="i" begin="${startPage}" end="${pageCount}">
  	<a href="buyList.jsp?pageNum=${i}">${i}</a>
  	</c:forEach>
  	</c:if>
  	
  	<c:if test="${endPage<pageCount}">
	  <c:forEach var="i" begin="${startPage}" end="${endPage}">
	  		<a href="buyList.jsp?pageNum=${i}">${i}</a>
	  </c:forEach>
	  <a href="buyList.jsp?pageNum=${startPage+BLOCKSIZE}">[다음]</a>
  </c:if>
  </b></font>
</td>
	</tr>	 
  </c:if>
</table>
<br>
<center>
	<input type="button" value="메인으로" 
	                 onclick="location.href='shopMain.jsp'">
</center>
</body>
</html>




