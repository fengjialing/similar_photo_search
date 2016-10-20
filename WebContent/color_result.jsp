<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="network4.*"
    import="java.io.File"
    import="java.util.ArrayList"
    import="java.util.List"
    import="java.awt.image.BufferedImage"
    
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   <meta http-equiv="Content-type" content="text/html;charset=utf-8">
   <title>丝巾精选</title>
   <link rel="stylesheet" href="css/bootstrap.css" type="text/css"/>
<style>
	body {
	margin: 0;
	padding: 0;	
	background-image: url(images/page2-1.jpg);   
 } 
img{
	width:200px;
	height: 200px;
	position:relative;
}
 select{
	width:170px;
	height:44px;
	float:left;
	font-family:"微软雅黑";
	border: 1px solid #b0a296;	
	outline:none;
	color: #000040;
}	
</style>   
</head>

<%
	int color=Integer.parseInt(request.getParameter("color").toString());
	String Color=null;
	List results=null;
	List results_last=new ArrayList();
	//List all_Pictures=phash.collectionImgUrl();

	 String imgPath=new File(application.getRealPath(request.getRequestURI())).getParent();
	 imgPath=imgPath.substring(0, imgPath.lastIndexOf("\\"));
	 String imgPath_image=imgPath+"/image";
	 List all_Pictures = new ArrayList();
	 File file = new File(imgPath_image);
	 if(file.isDirectory()){
	 	String[] fileNames = file.list();
	 	for(String name:fileNames){
	 		all_Pictures.add(imgPath_image.concat("/")+name);
	 		
	 	}
	 }
	 //
	
	
	switch(color){
		case 1:{results=searchColorImage.Red(all_Pictures);
				Color="red";
				if(!results.isEmpty()){
				for(Object pic:results){
					String pic_string=pic.toString();
					String pic_last=pic_string.substring(pic_string.lastIndexOf("image"));
					results_last.add(pic_last);
					
				}
				}
				break;
				}
		case 3:{results=searchColorImage.Blue(all_Pictures);
				Color="blue";
				if(!results.isEmpty()){
				for(Object pic:results){
					String pic_string=pic.toString();
					String pic_last=pic_string.substring(pic_string.lastIndexOf("image"));
					results_last.add(pic_last);
				}
				}
				break;
				
				}
		case 2:{results=searchColorImage.Green(all_Pictures);
				Color="green";
				if(!results.isEmpty()){
				for(Object pic:results){
					String pic_string=pic.toString();
					String pic_last=pic_string.substring(pic_string.lastIndexOf("image"));
					results_last.add(pic_last);
				}
				}
				break;
				}
		case 7:{results=searchColorImage.Yellow(all_Pictures);
				Color="yellow";
				if(!results.isEmpty()){
				for(Object pic:results){
					String pic_string=pic.toString();
					String pic_last=pic_string.substring(pic_string.lastIndexOf("image"));
					results_last.add(pic_last);
				}
				}
				break;
				}
		case 6:{results=searchColorImage.Purple(all_Pictures);
				Color="purple";
				if(!results.isEmpty()){
				for(Object pic:results){
					String pic_string=pic.toString();
					String pic_last=pic_string.substring(pic_string.lastIndexOf("image"));
					results_last.add(pic_last);
				}
				}
				break;}
		
	}
%>
<body>
	<div class="container">
  		<div id="result_img">
    		<%
    			if(results_last.isEmpty())
   	 			throw new NullPointerException();
    			out.println("<h2 style='text-align:center'>搜索结果如下</h2>");
    			out.println("<p style='text-align:center'>搜索物品：丝巾</p>");
    			out.println("<p style='text-align:center'>搜索类型："+Color+"</p>");
   	 		%>
   	 		
   			<% 	for(Object url:results_last)
   				{
   					String pic_url=url.toString();
   					
   					out.println("<img src='"+pic_url+"'></img>");
   				}
    		%>
   	 		
   			
   			
    		
    		
  		</div>
	</div>
</body>
</html>