<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="network4.*"
    import="java.io.File"
    import="java.util.ArrayList"
    import="java.util.List"
    import="java.awt.image.BufferedImage"
    errorPage="error.jsp"
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-type" content="text/html;charset=utf8">
  <title>图片</title>
  <link rel="stylesheet" type="text/css" href="css/page2.css" >
  <link rel="stylesheet" type="text/css" href="css/bootstrap.css" >
 <style>
body {
	margin: 0;
	padding: 0;	
	background-image: url(images/page2-1.jpg); 
	background-repeat: no-repeat;
    background-size: 1366px 677px; 	
 }
select{
	width:200px;
	height:44px;
	float:left;
	font-family:"微软雅黑";
	outline:none;
	color: #000000;
}
option:hover{
	background:gray;
	color:#fff;
}
button {
	width:120px;
	height: 44px;
	border:1px solid orange;
	background-color: orange;
    position:relative;
    box-align: center;
    float:left;
}

</style>
 </head>
<%!
String fname;
File fName;
String hashCode;//暂时变量
String sourceHashCode;//原图片的FingerPoint
public static final int SAMEVALUE =1; 
List urlList;//pictures
List hashCodes;//save all FingerPrint
List similarResultList;//存储相似图片的路径
String pic_url;
%>

<body class="page2">	 		
 <%

	
	
	
	 String imgPath;
	 imgPath=new File(application.getRealPath(request.getRequestURI())).getParent();
	 imgPath=imgPath+"/images";
	 out.println(imgPath);
	 List list = new ArrayList();
	 File file = new File(imgPath);
	 String[] fileNames = file.list();
	 for(String name:fileNames){
	 out.println(name);
	 }
	 
	 
	 
%> 	

</body>
</html>