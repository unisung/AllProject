<%@page import="model.PagingBean"%>
<%@page import="util.Paging"%>
<%@page import="dao.BuyDao"%>
<%@page import="model.Buy"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="loginCheck.jsp" %>
<%
	//웹 어플리케이션 경로
    String path = getServletContext().getContextPath();
    //구매자id를 session에서 얻어오기
    String buyer = (String)session.getAttribute("id");
    //페이징 설정
    int pageSize =10;//한 페이지당 출력되는 리스트 수
    int BLOCKSIZE=10;//한블럭당 출력되는 페이지 수
    String pageNum = request.getParameter("pageNum");
    if(pageNum==null||"".equals(pageNum)) pageNum="1";
    
    ArrayList<Buy> list=null;
    BuyDao dao = BuyDao.getInstance();
    //해당 id(buyer)에 해당하는 구매리스트 건수 얻어오기
    int buyCount = dao.getBuyListCount(buyer);//구매 건수 db 
    
    //페이징 객체 구하기
    Paging pg = new Paging();
    PagingBean pb = pg.getPaging(pageNum, pageSize, BLOCKSIZE, buyCount);
    //페이징 처리한 객체의 시작번호,끝번호를 이용하여 해당페이지에 보여줄 리스트 출력
    list = dao.getBuyList(buyer, pb.getStartRow(), pb.getEndRow());//구매 리스트 db
    
    System.out.println("list="+list);
    
    //총금액
    int total=0;
    for(int i=0;i<list.size();i++)
    	total+= (list.get(i).getBuy_price()==0?1:list.get(i).getBuy_price())
    	       *(list.get(i).getBuy_count()==0?1:list.get(i).getBuy_count());
    
    //request에 속성으로 객체 저장하기
    request.setAttribute("path", path);  //web경로
    request.setAttribute("buyer", buyer);//구매자id
    request.setAttribute("buyList", list);//구매 리스트
    request.setAttribute("buyCount",buyCount);//구매 건수
    request.setAttribute("total", total);//총금액
    
    //페이징 객체 저장
    request.setAttribute("pageCount", pb.getPageCount());//전체 페이지 건수
    request.setAttribute("startPage", pb.getStartPage());//시작 페이지 번호
    request.setAttribute("BLOCKSIZE", BLOCKSIZE);//블럭 사이즈
    request.setAttribute("endPage",pb.getEndPage());//종료 페이지 번호
    
    System.out.println("startPage="+pb.getStartPage());
    System.out.println("endPage="+pb.getEndPage());
    System.out.println("BLOCKSIZE="+BLOCKSIZE);
%>
<html>
<head>
<title>구매 리스트 </title>
</head>
<body>
<table border="1" width="650" cellspacing="3" cellpadding="3" align="center">
<caption><h3>구매 목록</h3></caption>
<thead>
<tr>
<th><b>번호</b></th><th><b>도서명</b></th><th><b>판매가격</b></th>
<th><b>수량</b></th><th><b>금액</b></th><th><b>상품상태</b></th>
</tr>
</thead>
<tbody>
<c:if test="${empty buyList}">
	<tr><td colspan=6><b>구매 목록이 없습니다.</b></td></tr>
</c:if>
<c:if test="${!empty buyList}">
<c:forEach var="buy" items="${buyList}" varStatus="no">
<tr>
  <td align="center" width="50"><b>${no.count}</b></td>
  <td width="300">
    <img src="${path}/imageFile/${buy.book_image}" 
                    border=0 width="30" height="50" align="middle">
    <a href="${path}/shop/bookContent.jsp?book_id=${buy.book_id}">${buy.book_title}</a>
  </td>
  <td align="center" width="100">
  <fmt:formatNumber  value="${buy.buy_price}" type="currency" currencySymbol="￦" />  
  </td>
  <td align="center" width="50">
  <fmt:formatNumber  value="${buy.buy_count}" pattern="###,##0"/>
  </td>
  <td>
  <fmt:formatNumber value="${buy.buy_count*buy.buy_price}" 
                          type="currency" currencySymbol="￦"/>
  </td>
  <td>
  <c:if test="${buy.sanction=='배송완료'}">
  <select name="status" <c:if test="${buy.sanction!='배송완료'}">disabled</c:if>>
  <option value="배송완료" <c:if test="${buy.sanction=='배송완료'}">selected disabled</c:if>>배송완료</option>
  <option value="구매확정" <c:if test="${buy.sanction=='구매확정'}">selected</c:if>>구매확정</option>
  <option value="반품" <c:if test="${buy.sanction=='반품'}">selected</c:if>>반품</option>
  </select>
  </c:if>
  <c:if test="${buy.sanction!='배송완료'}">
  <select name="status" <c:if test="${buy.sanction!='배송완료'}">disabled</c:if>>
  <option value="준비중" <c:if test="${buy.sanction=='준비중'}">selected</c:if>>준비중</option>
  <option value="배송중" <c:if test="${buy.sanction=='배송중'}">selected</c:if>>배송중</option>
  <option value="배송완료" <c:if test="${buy.sanction=='배송완료'}">selected</c:if>>배송완료</option>
  <option value="구매확정" <c:if test="${buy.sanction=='구매확정'}">selected</c:if>>구매확정</option>
  <option value="반품" <c:if test="${buy.sanction=='반품'}">selected</c:if>>반품</option>
  </select>
  </c:if>
  
  
  <br><!-- 구매확정/반품 처리  -->
  <c:if test="${buy.sanction=='배송완료'}">
  <input type="button" value="구매/반품 확정" 
        onclick="location.href='buyStatusPro.jsp'?buy_id=${buy.buy_id}&sanction=구매확정'">
   <input type="button" value="반품"
        onclick="location.href='buyStatusPro.jsp'?buy_id=${buy.buy_id}&sanction=반품'">
  </c:if>      
   </td>
</tr>
</c:forEach><!-- 반복문 끝. -->
<tr>
 <td colspan=6 align="right"><b>총 금액:
 <fmt:formatNumber  value="${total}" type="currency" currencySymbol="￦"/>
 </b>
</tr>
<tr>
<td colspan=6 align="center">
<!-- [이전] 표시 처리 -->
<c:if test="${startPage>BLOCKSIZE}">
	<a href="buyList.jsp?pageNum=${startPage-BLOCKSIZE}">[이전]</a>
</c:if>
<!-- 블럭내 페이지 출력 끝 페이지가 전체 페이지 건수 보다 많을 경우 끝페이지를 pageCount와 동기화 -->
<c:if test="${endPage >= pageCount}">
<c:forEach var="i" begin="${startPage}" end="${pageCount}"><!-- 각 페이지 출력  -->
<a href="buyList.jsp?pageNum=${i}">${i}</a>
</c:forEach>
</c:if>
<!-- 블럭내 끝 페이지가 전체 페이지 수보다 작으면 endPage를 끝 페이지로 사용 -->
<c:if test="${endPage < pageCount}">
<c:forEach var="i" begin="${atartPage}" end="${endPage}">
  <a href="buyList.jsp?pageNum=${i}">${i}</a><!-- 각 페이지 출력 -->
  </c:forEach>
  <a href="buyList.jsp?pageNum=${startPage+BLOCKSIZE}">[다음]</a>
</c:if>
</td>
</tr>
</c:if>
</table>
<br>
<center>
<input type="button" value="메인으로" onclick="location.href='shopMain.jsp'">
</center>
</body>
</html>