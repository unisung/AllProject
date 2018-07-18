<%@page import="java.io.InputStream"%>
<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="javax.sql.DataSource"%><%@page import="javax.naming.Context"%><%@page import="javax.naming.InitialContext"%>
<%@page import="java.sql.Connection"%><%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Connection conn;
	BufferedOutputStream bos = null;
	InputStream  in=null;
	String id = request.getParameter("id");
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
		conn = ds.getConnection();
		String sql = "select photo from imgTest where id=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,id);
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()){
			//DB로 부터 읽은 바이너리 파일
			Blob blob = rs.getBlob(1);
			//jsp의 out객체와 pageContext의 out객체의 충돌방지
			out.clear();
			out=pageContext.pushBody();
			
			bos = new BufferedOutputStream(response.getOutputStream());
			//입력스트림으로 읽고
			in = blob.getBinaryStream();
			int length=(int)blob.length();
			byte[] buffer = new byte[length];
			
			//출력스트림으로 출력
			while((length=in.read(buffer))!=-1){
				bos.write(buffer);
			}
		}
		bos.close();
		in.close();
		pstmt.close();
		conn.close();
	}catch(Exception e){
		out.print(e.getMessage());
	}


%>

</body>
</html>