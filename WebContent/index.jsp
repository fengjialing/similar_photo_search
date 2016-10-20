<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	body {
	margin: 0;
	padding: 0;	
	background-image: url(images/3-2.jpg); 
	background-repeat: no-repeat;
    background-size: 1377px 677px;   
 	} 
	#word {
	width: 350px;
    height: 30px;
    position:relative;
    margin:10px auto;
    text-align: center;
	vertical-align: middle;
	
 	}
	#word a{
    text-decoration:none;
    color: black;
    font-family: "微软雅黑";
    font-size: 1.5em;	
    font-weight:bold;
	}
	#word a:hover{
	color:gray;
	}
</style>
<script>
 function Function5()
{
	window.location.href="picture.jsp";
}

function Function6()
{
	window.location.href="UploadExample.jsp";
}

</script>   
</head>
<body>
	<h1 style="text-align:center;margin-top:50px;">欢迎来到图片搜索中心</h1>
	<div id="word">
	  <a href="#a" onclick="Function5()">搜索图片&nbsp;&nbsp;&nbsp;&nbsp;</a>
	  <a href="#b" onclick="Function6()">上传图片</a>
	</div>

</body>
</html>