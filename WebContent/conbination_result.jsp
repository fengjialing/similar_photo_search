<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="network4.*"
    import="java.sql.ResultSet"
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/result.css" type="text/css"/>
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
<body>
	<div class="container">
	<%
		String shape=request.getParameter("shape");
		String color=request.getParameter("color");
		Conn conn=new Conn("root","123456","tushuguan");
		ResultSet rs=conn.getRs("select * from tushu where shape='"+shape+"' and color='"+color+"'");
		out.println("<h2 style='text-align:center'>搜索结果如下</h2>");
		out.println("<p style='text-align:center'>搜索物品：丝巾</p>");
		out.println("<p style='text-align:center'>搜索类型："+shape+","+color+"</p>");
		while(rs.next())
		{
		out.println("<img src='"+rs.getString(2)+"'></img>");
        
	    } 
	%>
 	</div>
</body>
</html>