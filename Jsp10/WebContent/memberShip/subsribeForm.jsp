<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입화면</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('address1').value = fullRoadAddr;
                document.getElementById('address2').value = data.jibunAddress;

                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();
    }
</script>
<script>
//전역변수 선언
var isId=false;
function selEvent(){
	/* select list의 이벤트 값 구하기 
	   onchange이벤트 - 상태가 바뀐 후의 값 select value값
	 */
	var domain = document.getElementById("emailDomain").value;//select의 값
	document.getElementById("emailID").value=domain;//input 태그에 저장
	if(domain=='')
		document.getElementById('emailID').focus();
}
function open_chk(){
	var id=document.getElementById('id').value;
	if(id.length==0){
		alert("id를 입력하세요");
		document.getElementById('id').focus();
		return;
	}
	isId=true;//id체크 확인
	window.open("idCheck.jsp?id="+id,"","width=450 height=300");
}
function chk(){
	 var pwd = document.getElementById('password');
	var pwd2 = document.getElementById('password2');
	if(!pwd.value){
		alert("패스워드를 입력하세요");
		pwd.focus();
		return false;}
	if(!pwd2.value){
		alert("패스워드확인을 입력하세요");
		pwd2.focus();
		return false;}
	if(pwd.value!=pwd2.value){
		alert("입력한 패스워드값이 서로 다릅니다.");
		pwd.value="";
		pwd2.value="";
		pwd.focus();
		return false;} 
	 if(!isId){
		alert("Id체크를 해주세요");
		return false;
		} 
	return true;
}
</script>
</head>
<body>
<div id="wrap">
 <div id="header">
 
 </div>
 <div id="content">
  <div>
   <form action="subscribePro.jsp" name="frm"  method="post">
     <table border=1 bgcolor="yellow">
       <tr>
          <th>*ID</th>
          <td><input type="text" name="id" id="id">
              <input type="button" name="isId" id="idId" value="IDcheck" 
                   onclick="open_chk()">
          </td>
       </tr>
       <tr>
          <th>*Password</th>
          <td><input type="password" name="password" id="password"></td>
       </tr>
       <tr>
          <th>Password확인</th>
          <td><input type="password" name="password2" id="password2"></td>
       </tr>
       <tr>
        <th>*이름</th>
        <td><input type="text" name="name" id="name" ></td>
       </tr>
       <tr>
        <th>생일</th>
        <td><input type="date" name="birth" id="birth"></td>
       </tr>
       <tr>
       <th>*우편번호</th>
       <td><input type="text" name="zipcode" id="zipcode" maxlength="7" size="7" >
       <input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
       </td>
       </tr>
       <tr><th>*주소1</th>
       <td><input type="text" name="address1" id="address1" maxlength="100" size="100" ></td>
       </tr>
       <tr><th>*주소2</th>
       <td><input type="text" name="address2" id="address2" maxlength="100" size="100" ></td>
       </tr>
       <tr>
       <th>전화번호</th>
       <td>
          <select name="tel1" id="tel1">
            <option value="010">010</option>
            <option value="011">011</option>
            <option value="016">016</option>
            <option value="017">017</option>
            <option value="02">02</option>
            <option value="031">031</option>
            <option value="032">032</option>
           </select> 
           -
           <input type="text" name="tel2" id="tel2" size="4" maxlength="4">
           -
           <input type="text" name="tel3" id="tel3" size="4" maxlength="4">
       </td>
       </tr>
       <tr>
        <th>*email</th>
        <td>
         <input type="text" name="emailId" id="emailId" >@
         <input type="text" name="emailID" id="emailID" >
         <select name="emailDomain" id="emailDomain" onchange="selEvent()">
         <option value="naver.com">naver.com</option>
         <option value="daum.net">daum.net</option>
         <option value="gmail.com">gmail.com</option>
         <option value="nate.com">nate.com</option>
         </select>
        </td>
       </tr>
       <tr>
       <td colspan=2 align="center">
       <input type="submit" value="확인">
       <input type="reset" value="다시작성">
       </td>
       </tr>
     </table>
   </form>
  </div>
 </div><!-- content끝. -->
 <div id="footer">
  <span>2018. choongang. </span>
 </div>
</div>
</body>
</html>