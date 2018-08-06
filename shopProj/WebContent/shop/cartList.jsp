<%@page import="dao.CartDao"%>
<%@page import="model.Cart"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 로그인 여부 확인 파일 인크루드 -->
<%@ include file = "loginCheck.jsp" %>
<%
	//프로젝트 uri경로 
	String path = getServletContext().getContextPath();
    String book_kind = request.getParameter("book_kind");
    String buyer = (String)session.getAttribute("id");
    
    List<Cart> list = null;
    Cart cart =null;
    int count =0;
    int total =0;
    CartDao dao = CartDao.getInstance();
    
    //카트 건수
    count = dao.getListCount(buyer);
    
/*     out.print("카트 내 상품 건수:"+count); */
    
    //카트 상품 리스트
    list = dao.getCartList(buyer);
    
    //총계 구하기
    for(int i=0;i<list.size();i++){
    	total+=list.get(i).getBuy_count()*list.get(i).getBuy_price();
    }
   
    request.setAttribute("count", count);
    request.setAttribute("total", total);
    request.setAttribute("list",  list);
    request.setAttribute("path",  path);
    request.setAttribute("book_kind", book_kind); 
%>
<html><head>
<script>
function chk(obj){//해당 DOM객체(form)가 매개변수로 넘어옴.
	var thisObj = obj.buy_count;//매개변수로 넘어온 DOM객체의 buy_count요소 구하기
	var count = thisObj.value;//buy_count의 값 구하기
	if(count==""){
		alert('수정값은 비어있으면 안됩니다.');
		obj.reset();//매개변수로 넘어온 obj가 form임. reset()메소드로 form을 초기화
		thisObj.focus();//obj의 buy_count에 focus()처리
		return false;//기본 행동 금지처리
	}
	if(isNaN(count)){
		alert('수정값은 숫자여야합니다.~~~');
		/* thisObj.value="";
		thisObj.focus(); */
		obj.reset();
		thisObj.focus();
		return false;
	}
	return true;
}
</script>
<title>상품 카드 리스트</title></head><body>
<h3><b>장바구니</b></h3>
<!-- 장바구니가 비어있을 경우 -->
<c:if test="${empty list}">
<table border=1 width=650 cellpadding=3 cellspacing=3 align=center>
<tr>
<td align="center"><b>장바구니에 담긴 상품이 없습니다.</b>
</td>
</tr>
</table>
<input type="button" value="쇼핑계속" 
             onclick="location.href='list.jsp?book_kind=${book_kind}'">

</c:if> <!--장바구니 비어있을 경우  -->
<!-- 장바구니가 안 비어있을 때 -->
<c:if test="${not empty list}">
<table border=1 width=650 cellspacing=3 cellpadding=3 align=center>
<tr>
<th><b>번호</b></th><th><b>도서명</b></th><th><b>판매가격</b></th>
  <th><b>수량</b></th><th><b>금액</b></th>
</tr>
<c:forEach var="cart" items="${list}" varStatus="n">
<tr>
 <td align="center" width="50"><b>${n.count}</b></td>
 <td width=300>
 <img src="${path}/imageFile/${cart.book_image}" border=0 width=30 height=50 align=middle">
 ${cart.book_title}
</td>
<td align="center" width="100">
<fmt:formatNumber value="${cart.buy_price}" type="currency" currencySymbol="￦" />
</td>
<td width=150 align="center">

<form action="updateCart.jsp" name="inform" method="post" 
                                                 onsubmit="return chk(this)">
 <input type="text" name="buy_count" size="5" value=${cart.buy_count}>
 <input type="hidden" name="cart_id" value="${cart.cart_id}">
 <input type="hidden" name="book_kind" value="${book_kind}">
 <input type="submit" value="수정">
 <input type="button" value="비우기" 
     onclick="location.href='cartDel.jsp?list=${cart.cart_id}&book_kind=${book_kind}'">
</form>
</td>
<td align="center" width="150">
<fmt:formatNumber value="${cart.buy_count*cart.buy_price}" pattern="###,##0"/>
 <%-- /<fmt:formatNumber value="${total}" pattern="###,##0" /> --%>
</td>
</tr>
</c:forEach><!-- 반복문 끝. -->
<tr>
<td colspan=5 align=right>
<b>총금액:<fmt:formatNumber value="${total}" type="currency" currencySymbol="￦"/></b>
</td>
</tr>
<tr>
<td colspan=5 align=center valign=middle>
	<form>
	<input type="button" value="구매하기" onclick="location.href='buyForm.jsp'">
	<input type="button" value="쇼핑계속" 
	                        onclick="location.href='list.jsp?book_kind=${book_kind}'">
	<input type="button" value="장바구니비우기"
	            onclick="location.href='cartDel.jsp?list=all&book_kind=${book_kind}'">                        
	</form>

</td>
</tr>
</table>
</c:if><!-- 카트 상품이 있을 때 -->
</body>
</html>