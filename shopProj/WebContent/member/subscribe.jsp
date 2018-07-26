<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
<script>
function open_chk(){
	var id = document.getElementById("id");
	if(id.value.length==0){
		alert('id를 입력하세요');
		id.focus();
		return;
	}
	window.open("idCheck.jsp?id="+id.value,"idcheck","width=450, heigth=100, resize=yes");
}
function open_emailChk(){
	var emailId= document.getElementById("emailId").value;
	var emailDomain = document.getElementById("emailD").value;
	var emailAddress = emailId+"@"+emailDomain;
	
	if(emailId.length==0 || emailDomain.length==0){
		alert('email을 확인하세요');
		document.getElementById("emailId").focus();
		return;
	}
	window.open("emailCheck.jsp?email="+emailAddress,"emailCheck","height=100,width=450,resize=yes");
}

function sel(){
	var emailDomain = document.getElementById("emailDomain").value;
	var emailD = document.getElementById("emailD");
	   emailD.value = emailDomain;
	if(emailDomain=="")
		document.getElementById("emailD").focus();
}

function chk(){
	var pass1 = document.getElementById("password");
	var pass2 = document.getElementById("password2");
	if(pass1.value!=pass2.value){
		alert('패스워드값과 확인값이 서로 다릅니다.');
		pass1.value="";
		pass2.value="";
		pass1.focus();
		return false;
	}
	return true;
}
</script>
</head>
<body>
<form name="frm" method="post" action="subscribeProc.jsp" onsubmit="return chk()">
<table border=1 bgcolor="yellow">
<tr><td>*ID:</td>
<td><input type="text" name="id" id="id" autofocus>
    <input type="button" name="isId" id="isId" value="IDcheck" onclick="open_chk()">
</td>
</tr>
<tr><td>*PASSWORD</td>
<td><input type="password" name="password" id="password" required></td>
</tr>
<tr><td>PASSWORD확인</td>
<td><input type="password" name="password2" id="password2" required></td>
</tr>
<tr>
<td>*이름:</td>
<td><input type="text" name="name" id="name" required></td>
</tr>
<tr>
<td>생일</td>
<td><input type="date" name="birth" id="birth">
</td>
</tr>
<tr>
<td>*우편번호</td>
<td><input type="text" name="zipno" id="zipno" maxlength="7" size="7" required>
    <input type="button" onclick="execDaumPostcode()" value="우편번호 찾기"><br>
</td>
</tr>
<tr><td>*주소1</td>
<td><input type="text" name="address1" id="address1" maxlength="80" size="80" required></td>
</tr>
<tr><td>*주소2</td>
<td><input type="text" name="address2" id="address2" maxlength="80" size="80" required></td>
</tr>
<tr>
<td>tel</td><td>
<select name="tel1" id="tel1">
 <option value="010">010</option>
 <option value="011">011</option>
 <option value="016">016</option>
 <option value="02">02</option>
 <option value="031">031</option>
 <option value="032">032</option>
</select>-
<input type="text" name="tel2" id="tel2" size="4" maxlength="4">-
<input type="text" name="tel3" id="tel3" size="4" maxlength="4">
</td>
</tr>
<tr>
<td>*email</td>
<td><input type="text" name="emailId" id="emailId" required>@
    <input type="text" name="emailD" id="emailD" required>
    <select name="emailDomain" id="emailDomain" onchange="sel()">
	    <option value="naver.com">naver.com</option>
	    <option value="daum.net">daum.net</option>
	    <option value="google.com">gooogle.com</option>
	    <option value="nate.com">nate.com</option>
	    <option value="">직접입력</option>
    </select>
<input type="button" name="isEmail" id="isEmail" value="EmailCheck" 
    onclick="open_emailChk()"></td>
</tr>
<tr>
<td colspan=2 align="center">
<input type="submit" value="확인">
<input type="reset" value="다시작성">
</td>
</tr>
</table>
</form>
</body>
</html>