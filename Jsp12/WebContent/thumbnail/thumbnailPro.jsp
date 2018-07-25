<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.io.File"%>
<%@page import="java.awt.Graphics2D"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="javax.media.jai.JAI"%>
<%@page import="javax.media.jai.RenderedOp"%>
<%@page import="java.awt.image.renderable.ParameterBlock"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%
   String imagePath = getServletContext().getRealPath("/fileSave");
   int size = 2*1024*1024;//2MB
   String filename="";
   try{
	   
	   MultipartRequest multi 
	        = new MultipartRequest(
	        		request,
	        		imagePath,
	        		size,
	        		"utf-8",
	        		new DefaultFileRenamePolicy()
	        		);
	   Enumeration files = multi.getFileNames();
	   String file = (String)files.nextElement();
	   filename = multi.getFilesystemName(file);//upload된 파일명
	   //이미지 변환
	   //이미지는 ParameterBlock을 통해서만 담을 수 있음.
	   ParameterBlock pb = new ParameterBlock();
	   //서버에 저장된 원본파일의 경로로 파라미터 블럭에 추가
	   //가져온 파일명을 받아서 이미지패스에 지정한 폴더 속에 파일을 만듦
	   System.out.println("패스:"+imagePath+"/"+filename);
	   pb.add(imagePath+"/"+filename);
	   //jai 파라미터 블럭 로드하여 RenderedOp에 추가
	   RenderedOp rOp = JAI.create("fileload",pb);
	   //불러온 이미지를 BufferedImage객체에 담기
	   BufferedImage bi = rOp.getAsBufferedImage();
	   //객체를 Buffered이미지에담기
	   //thumb 버퍼생성, 버퍼사이즈 100*100 설정
	   BufferedImage thumb =
	       new BufferedImage(100,100,BufferedImage.TYPE_INT_RGB);
	   //2d그래픽 그리기(사이즈 100*100)
	   Graphics2D g = thumb.createGraphics();
	   g.drawImage(bi, 0, 0, 100, 100,null);
	  //출력할 위치, 파일명 설정, 섬네일 저장. 확장자 .jpg 
	   File file1 = new File(imagePath+"/th_"+filename);
	  System.out.println("file1="+file1.getName());
	  ///버퍼에서 이미지 불러와서 출력
	   ImageIO.write(thumb,"jpg",file1);
   }catch(Exception e){
	   e.printStackTrace();
   }
%>
</head>
<body>
<h2>썸네일 처리</h2>
-원본 이미지-<br>
<img src="../fileSave/<%=filename%>"><p>
-썸네일 이미지-<br>
<img src="../fileSave/th_<%=filename%>"><p>
</body>
</html>