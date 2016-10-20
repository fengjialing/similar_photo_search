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
	input[type='submit']{
	width:120px;
	height: 44px;
	border:1px solid orange;
	background-color: orange;
    position:relative;
    box-align: center;
    
	}
	.main{
	width:400px;
    height: 300px;
    position:relative;
    margin:180px auto;
    }
	h2{
	text-align:center;
	}
	.file{
	height:44px;
	width:200px;
	float:left;
	}
</style>
</head>
<body>
	<div class="main">
	<h2 style="text-align:center;margin:10px auto">请选择上传图片</h2>
	<form action="doUpload.jsp" method="post" enctype="multipart/form-data">
		<input type="file" name="fname" class="file" id="fileField" size="28" onchange="document.getElementById('textfield').value=this.value" />
		<input type="submit" value="提交">
	</form>
	</div>
</body>
</html>
