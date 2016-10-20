<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.List"
    import="java.util.ArrayList"
    import="network4.*"
    errorPage="error.jsp"
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/result.css" >
<link rel="stylesheet" href="css/bootstrap.css" >
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
	int color=Integer.parseInt(request.getParameter("color"));
	List similarResult_List=(List)session.getAttribute("list");
	List results=new ArrayList();
	switch(color){
		case 1:results=searchColorImage.Red(similarResult_List);break;
		case 3:results=searchColorImage.Blue(similarResult_List);break;
		case 2:results=searchColorImage.Green(similarResult_List);break;
		case 7:results=searchColorImage.Yellow(similarResult_List);break;	
		case 6:results=searchColorImage.Purple(similarResult_List);break;
		
	}
%>
<body>
	<div class="container">
	<%
	if(results.isEmpty())
	 throw new NullPointerException();
	 %>
	 <h2 style="text-align:center;">搜索结果如下</h2>
	 <p style="text-align:center;">搜索类型：进一步搜索</p>
	 <%
	for(Object url:results)
	{
		String pic_url=url.toString();
		pic_url=pic_url.substring(pic_url.lastIndexOf("image"));
		out.println("<img src='"+pic_url+"'></img>");
	}
	session.removeAttribute("list");
	%>
	</div>
</body>
</html>