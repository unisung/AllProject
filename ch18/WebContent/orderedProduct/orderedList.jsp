<%@page import="model.PagingBean"%><%@page import="util.Paging"%>
<%@page import="dao.BuyDao"%><%@page import="model.Buy"%><%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../manager/managerSessionChk.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
		/* 페이징 설정*/
		int pageSize= 10;
		int BLOCKSIZE=10;//한 블럭당 출력되는 페이지 수
       String pageNum = request.getParameter("pageNum");
		
		ArrayList<Buy> list = null;
	   Buy buy = null;
	   BuyDao dao = BuyDao.getInstance();
	   int count = dao.getBuyListCount();
	   
       Paging pg = new Paging();
       PagingBean pb = pg.getPaging(pageNum, pageSize, BLOCKSIZE, count);
	   
	  // list = dao.getBuyList();
	  
	   list = dao.getBuyList(pb.getStartRow(),pb.getEndRow());
	   
	    request.setAttribute("pageCount", pb.getPageCount());
		request.setAttribute("startPage",pb.getStartPage());
		request.setAttribute("BLOCKSIZE",BLOCKSIZE);
		request.setAttribute("endPage",pb.getEndPage());
		request.setAttribute("path", path);
		request.setAttribute("buyCount",count);
		request.setAttribute("list", list);
	   
%>
<html><head>
<link type="text/css" rel="stylesheet" href="${path}/manager/style.css" /> 
<title>Book Shop Mall</title>
</head>
<body>
<h3><b>구매 목록</b></h3>
<a href="${path}/manager/managerMain.jsp"><b>관리자 메인으로</b></a><br>
<table border="1" width="100%" cellspacing="1" cellpadding="1" align="center" class="table">
<caption><b>구매 목록 현황:(${buyCount}) 건</b></caption>
<tr>
	<th><b>순번</b></th><th><b>주문번호</b></th><th><b>주문자</b></th><th><b>도서명</b></th>
	<th><b>주문가격</b></th><th><b>주문수량</b></th><th><b>주문일자</b></th>
	<th><b>결제계좌</b></th><th><b>배송자명</b></th><th><b>연락처</b></th>
	<th><b>배송지주소</b></th><th><b>배송현황</b></th>
</tr>
<c:if test="${empty list}">
	<tr><td colspan="12"></td></tr>
</c:if>
<c:if test="${!empty list}">
<c:forEach var="buy" items="${list}" varStatus="no">
  <c:if test="${no.count%2==0}">
	<tr class="value_c">
  </c:if>
  <c:if test="${no.count%2!=0}">
	<tr class="value_d">
  </c:if>		
	<td><b>${no.count}</b></td>
    <td><b>${buy. buy_id}</b></td>
    <td><b>${buy.buyer}</b></td>
    <td><b>${buy.book_title}</b></td>
    <td align="right"><b>
    <fmt:formatNumber value ="${buy.buy_price}" pattern="###,##0" /></b>
    </td>
    <td align="right"><b>
    <fmt:formatNumber value="${buy.buy_count}" pattern="#,##0"/></b>
    </td>
    <td><b>${buy.buy_date}</b></td>
    <td><b>${buy.account}</b></td>
    <td><b>${buy.deliveryname}</b></td>
    <td><b>${buy.deliverytel}</b></td>
    <td><b>${buy.deliveryaddress}</b></td>
    <td  align="center"><b>
         <form action="orderStatusPro.jsp" method="post">
         <input type="hidden" name="buy_id" value="${buy.buy_id}">
    		<select name="sanctions">
    	<option <c:if test="${buy.sanction=='준비중'}">selected</c:if>>준비중</option>
    	<option <c:if test="${buy.sanction=='배송중'}">selected</c:if>>배송중</option>
    	<option  <c:if test="${buy.sanction=='배송완료'}">selected</c:if>>배송완료</option>
    	<option  <c:if test="${buy.sanction=='반품'}">selected</c:if>>반품</option>
    		</select><br>
    	 <input type="submit" value="수정">	
    	</form>
    </b></td>
</tr>
</c:forEach>
<tr align="center"><td colspan=12>
<font size="4"><b>
  <c:if test="${startPage>BLOCKSIZE}">
  <a href="orderedList.jsp?pageNum=${startPage-BLOCKSIZE}">[이전]</a>
  </c:if>

      <!-- 끝페이지가 조회한 전체 페이지 보다 큰경우 -->
  <c:if test="${endPage>pageCount}">
  <c:forEach var="i" begin="${startPage}" end="${pageCount}">
  		<a href="orderedList.jsp?pageNum=${i}">${i}</a>
  </c:forEach>
  </c:if>
  
    <!-- 끝 페이지가 조회한 전체 페이지 보다 작은 경우 -->
  <c:if test="${endPage<=pageCount}">
  <c:forEach var="i" begin="${startPage}" end="${endPage}">
  		<a href="orderedList.jsp?pageNum=${i}">${i}</a>
  </c:forEach>
  </c:if>
  
  <c:if test="${endPage < pageCount}">
  <a href="orderedList.jsp?pageNum=${startPage+BLOCKSIZE}">[다음]</a>
  </c:if>
  </b></font>
  </td>
</tr>
</c:if>
</table>















</body>
</html>