<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>썸네일 이미지 폼</title>
</head>
<body>
 <h3>썸네일 이미지 </h3>
 <form name="frm" action="thumbnailPro.jsp" 
     method="post" encType="multipart/form-data">
  <p>
  <label>
  이미지 파일
  </label>
  <input type="file" name="fileName">
  </p>
  <p>
  <input type="submit" value="전송">
  </p>
 </form>
</body>
</html>