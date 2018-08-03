<%@page import="java.util.List"%><%@page import="dao.*"%><%@page import="model.*"%><%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="loginCheck.jsp" %>
<%
    //어플리케이션 경로 
	String path = getServletContext().getContextPath();
    String book_kind = request.getParameter("book_kind");
    String buyer = (String)session.getAttribute("id");
    ArrayList<Cart> cartList = null;
    ArrayList<Bank> accountList = null;
    Member member = null;
    
    out.print("book_kind="+book_kind);
    
    //로그인한 id로 Cart정보 조회
    CartDao  dao = CartDao.getInstance();
    cartList = (ArrayList)dao.getCartList(buyer);
    out.print("cartSize="+cartList.size()+"<br>");
    int total =0;//총 금액
    
    for(int i=0;i<cartList.size();i++){
    	System.out.println(cartList.get(i).getBook_id()+":"
                   +cartList.get(i).getBook_title()+":"
    			    +cartList.get(i).getCart_id());
    	int buy_count = cartList.get(i).getBuy_count();
    	int buy_price = cartList.get(i).getBuy_price();
    	total+=buy_count*buy_price;
    }
    
    /* 로그인한 id의 회원정보 조회 */
    MemberDao  mDao = MemberDao.getInstance();
    member = mDao.selectMember(buyer);
    
    System.out.println(member.getId()+":"+member.getName()+":"+member.getAddress1());
    
    /* 결제 계좌 정보  */
    BuyDao bDao = BuyDao.getInstance();
    accountList = bDao.getAccount();
    
    for(Bank a:accountList){
    	System.out.println(a.getAccount()+":"+a.getBank()+":"+a.getName());
    } 
    
    /* 수신처 정보  */
    ReceiverDao rDao = ReceiverDao.getInstance();
    //수신자 1개 정보
    Receiver receiver = rDao.getReceiverInfo(buyer, 1);
    // 추가된 수신지 정보 리스트
    List<Receiver> receiverList = rDao.getReceiverList(buyer);
    
    for(Receiver r:receiverList){
    	out.print(r.getName()+":"+r.getTel1()+":"+r.getTel2()+":"+r.getTel3());
    }
    
    request.setAttribute("receiverList", receiverList);
    request.setAttribute("receiver",receiver);
    request.setAttribute("cartList", cartList);
    request.setAttribute("member",member);
    request.setAttribute("accountList",accountList);
    request.setAttribute("path", path);
    request.setAttribute("total", total); 
    request.setAttribute("book_kind", book_kind); 
%>
<html><head>
<title>장바구니 상품 구매 처리</title>
<script>
function chk(obj){
  var  	buyer= obj.id.value;
	alert("buyer="+buyer);
	obj.action="../member/recAddressInput.jsp";
	obj.submit();
}  
</script>
<script>
function change(sel){
	/* select의 선택된 index번호 = selectedIndex */
	var index = sel.selectedIndex;
	//선택된 인덱스의 값 options[sel.selectedIndex].value;
	var val = sel.options[index].value;
	alert(val);
	//메세지 객체 생성
	var msg = new String(val);
	//"."을 구분자로 자르기 => address[0],[1],[2],...배열로 저장
	var address = msg.split('.');
	//console출력 =console.log(값);
	for(var i=0;i<address.length;i++)
		console.log(address[i]);
		
    //현재 페이지의 DOM객체에 직접 접근 getElementById(아이디명);
	document.getElementById("name").value=address[1];
	document.getElementById("tel1").value=address[2];
	document.getElementById("tel2").value=address[3];
	document.getElementById("tel3").value=address[4];
	document.getElementById("zipno").value=address[5];
	document.getElementById("address1").value=address[6];
	document.getElementById("address2").value=address[7];
}
</script>
</head>
<body>
<div align="center"><b>구매 목록</b></div>
<c:if test="${empty cartList}">
<b>장바구니 목록이 존재하지 않습니다.</b>
</c:if>
<c:if test="${not empty cartList}">
<form action="updateCart.jsp" name="inform" method="post">
<table border="1" width=750 align="center">
<tr>
<th><b>번호</b></th><th><b>도서명</b></th><th><b>판매가격</b></th>
<th><b>수량</b></th><th><b>금액</b></th>
</tr>
<c:forEach var="cart" items="${cartList}" varStatus="no">
<tr>
<td align="center" width="50">${no.count}</td>
<td width="300">
<a href="${path}/shop/bookContent.jsp?book_id=${cart.book_id}&book_kind=${book_kind}">
<img src="${path}/imageFile/${cart.book_image}" 
               border="0" width="30" height="50" align="middle">
	${cart.book_title}
</a>
</td>
<td align="center" width="100">
	<fmt:formatNumber value="${cart.buy_price}" type="currency" currencySymbol="￦"/>
</td>
<td align="center">
<fmt:formatNumber value="${cart.buy_count}" pattern="###,##0" />
</td>
<td align="center">
<fmt:formatNumber value="${cart.buy_price * cart.buy_count}" 
                    type="currency" currencySymbol="￦" />
</td>
</tr>
</c:forEach><!-- 장바구니 리스트 반복 끝. -->
<tr><!-- 총계 -->
<td colspan="5" align="right">
<b>총 구매금액:
<fmt:formatNumber value="${total}" type="currency" currencySymbol="￦" />
</b>
</td>
</tr><!-- 총계 끝. -->
</table>
</form><!-- 장바구니 데이타 끝.  -->
<br><br>
<form action="buyPro.jsp" name="buyInput" method="post">
<table width="600" border="1" cellspacing="0" cellpadding="3" align="center">
<tr>
<td colspan=2 align="center"><font size="+1"><b>주문자 정보</b></font>
</tr>
<tr align="center" ><td width="100"><b>성명</b></td>
                    <td width="400"><b>${member.name}</b></td>
</tr>
<tr align="center" >
<td><b>전화번호</b></td>
<td>${member.tel1}-${member.tel2}-${member.tel3}</td>
</tr>
<tr>
<td align="center"><b>주소</b></td>
<td align="left">${member.address1}<br>${member.address2}</td>
</tr><!-- 주문자 정보 끝. -->
<tr>
<td>결제 계좌</td>
<td>
<select name="account">
<c:forEach var="account" items="${accountList}">
 <option value="${account.account}-${account.bank}-${account.name}">
                   ${account.account}-${account.bank}-${account.name}</option>
</c:forEach>
</select>
</td>
</tr>
<!-- 배송지 정보 추가 -->
<form name="recInfo" id="recInfo">
<input type="hidden" name="id" value=${receiver.id}>
<tr>
<td colspan=2 align="center"><font size="+1">
   <b>배송지 정보</b>  배송지:
   <select name="recAddr"  onchange="change(this)">
   <c:forEach var="list" items="${receiverList}" varStatus ="no" >
     <option value="${list.seq}.${list.name}.${list.tel1}.${list.tel2}.${list.tel3}.${list.zipno}.${list.address1}.${list.address2}">${no.count} - ${list.nickname}-${list.name}</option>
   </c:forEach>
   </select>
  <input type="button" value="배송지 추가" onclick="return chk(this.form)"></font>
</tr>
<tr align="center" ><td width="100"><b>수신자</b></td>
                    <td width="400"><b>
                     <input type="text" name="name" id="name" value=${receiver.name}></b></td>
</tr>
<tr align="center" >
<td><b>전화번호</b></td>
<td><input type="text" name="tel1" id="tel1" value=${receiver.tel1}  maxlength="3" size="3">
    -<input type="text" name="tel2" id="tel2" value=${receiver.tel2} maxlength="4" size="4">
    -<input type="text" name="tel3" id="tel3" value=${receiver.tel3} maxlength="4" size="4"></td>
</tr>
<tr>
<td align="center"><b>주소</b></td>
<td><input type="text" name="zipno" id="zipno" size="7" value="${receiver.zipno}">
    <input type="button" value="우편번호" onclick="execDaumPostcode()">
<input type="text" name="address1" id="address1" value="${receiver.address1}" 
                   size="60" maxlength="60">
<br><input type="text" name="address2" id="address2" value="${receiver.address2}" size="60"></td>
</tr><!-- 주문자 정보 끝. -->
</form>
<tr>
<td colspan="2" align="center">
<input type="submit" value="확인">
<input type="reset" value="다시작성">
<input type="button" value="취소" 
      onclick="location.href='shopMain.jsp'">
</td>
</tr>
</table>
</form>
</c:if>
</body>
</html>
<!-- 우편번호 조회 스크립트 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipno').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('address1').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('address2').focus();
            }
        }).open();
    }
</script>