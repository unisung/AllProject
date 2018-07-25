<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>파일 업로드 </title>
</head>
<body>
<form action="fileUpPro.jsp" name="fileForm" 
         method="post"  enctype="multipart/form-data">
 <fieldset>
 <legend>파일전송</legend>
 <p>
 <label>작성자</label>
 <input type="text" name="writer">
 </p>
 <p>
 <label>제목</label>
 <input type="text" name="title">
 </p>
<p>
<label>파일명</label>
<input type="file" name="uploadFile">
</p>
<p>
<input type="submit" value="전송">
</p>
</fieldset>
</form>
</body>
</html>