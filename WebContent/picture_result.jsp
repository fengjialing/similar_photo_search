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
 <body>
<%!
String fname;
File fName;
String hashCode;//暂时变量
String sourceHashCode;//原图片的FingerPoint
public static final int SAMEVALUE =1; 
List urlList;//pictures
List hashCodes;//save all FingerPrint
List similarResultList;//存储相似图片的路径
List similarResultList_last=new ArrayList();//存储相似图片的路径的相对路径
List urlList_last;
String pic_url;
%>
<%
fname=request.getParameter("fname");
fName=new File(fname);
if(fName.exists()){
	sourceHashCode=phash.produceFingerPrint(fname);
	//替代urlList=phash.collectionImgUrl();
	 String imgPath=new File(application.getRealPath(request.getRequestURI())).getParent();
	 imgPath=imgPath.substring(0, imgPath.lastIndexOf("\\"));
	 String imgPath_image=imgPath+"/image";
	 urlList = new ArrayList();
	 urlList_last = new ArrayList();
	 File file = new File(imgPath_image);
	 if(file.isDirectory()){
	 	String[] fileNames = file.list();
	 	for(String name:fileNames){
	 		urlList.add(imgPath_image.concat("/")+name);
	 		urlList_last.add("image/"+name);
	 	}
	 }
	//
	hashCodes=new ArrayList();
	similarResultList = new ArrayList();
    //similarResultList_last = new ArrayList();
	for (Object url : urlList) {
		hashCode =phash.produceFingerPrint(url.toString());
		hashCodes.add(hashCode);
	}
	for (int i = 0; i < hashCodes.size(); i++)
	{
		int difference = phash.hammingDistance(sourceHashCode, hashCodes.get(i).toString());
		if(difference <= SAMEVALUE){
			similarResultList.add(urlList.get(i).toString());	
			similarResultList_last.add(urlList_last.get(i));
		}
	}
}	
session.setAttribute("list",similarResultList);
%>
	 		
  	<div class="container">
    			<%
     			if(similarResultList_last.isEmpty())
    	 		throw new NullPointerException();
    			out.println("<h2 style='text-align:center'>搜索结果如下</h2>");
    			out.println("<p style='text-align:center'>搜索物品：丝巾</p>");
    			out.println("<p style='text-align:center'>搜索类型：以图找图</p>");
    			%>
    		<div style="width:350px;height:100px;margin:0 auto;">
    			<form name="colorSearch" action="more_search.jsp">
  					<select name="color" style="float:left;">
  						<option value="1">红色</option>
  						<option value="2">绿色</option>
  						<option value="3">蓝色</option>
  						<option value="6">紫色</option>
  						<option value="7">黄色</option>
  					</select>
  						<button type="submit" >高级搜索</buttton>
				</form>
			</div>
			<div id="result_img">
    			<%
    			for (Object url_last:similarResultList_last) {		
					out.println("<img src='"+url_last+"'></img>");
				}
    			similarResultList_last.clear();
    			%>
  			</div>
	</div>	

</body>
</body>
</html>