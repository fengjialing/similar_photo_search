<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta http-equiv="Content-type" content="text/html;charset=utf-8">
  <title>search according to shape</title>
  <link rel="stylesheet" type="text/css" href="css/page1.css" >
   <script>
 function Function1()
{
	window.location.href="picture.jsp";
}

function Function2()
{
	window.location.href="color.jsp";
}

function Function3()
{
	window.location.href="shape.jsp";
}

function Function4()
{
	window.location.href="conbination.jsp";
}
</script>
<style>
body {
	margin: 0;
	padding: 0;	
	background-image: url(images/page1-1.jpg); 
	background-repeat: no-repeat;
    background-size: 1366px 677px; 	
 }
#main{
	width:523px;
    height: 300px;
    position:relative;
    margin:180px auto;
    
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
	color:white;
}

#search {
	width:580px;
	height:60px;
	margin:30px auto;
	position:relative;
	
}
input[type='file']{
    width: 400px;
    height: 44px;
    border-color: orange;
    box-align: center;
    font-family: "微软雅黑";
    font-size:13px;
    float:left;
}
select{
	width:400px;
	height:44px;
	float:left;
	font-family:"微软雅黑";
	outline:none;
	color: #000000;
}
option{
	
	border-top: none;
	font-size: 15px;
}
option:hover{
	background:gray;
	color:#fff;
}
.conbination select{
	width:200px;
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

<body class="page1">

  <div id="main">
    <div id="word">
	  <a href="#a" onclick="Function1()">图片&nbsp;&nbsp;&nbsp;&nbsp;</a>
	  <a href="#b" onclick="Function2()">颜色&nbsp;&nbsp;&nbsp;&nbsp;</a>
	  <a href="#c" onclick="Function3()" style="color:gray;">形状&nbsp;&nbsp;&nbsp;&nbsp;</a>
	  <a href="#d" onclick="Function4()">组合</a>
    </div>
    <div id="search">
      <form id="form1" name="form1" action="shape_result.jsp">
        <select name="shape" class="select" >
          <option value="round">圆形</option>
          <option value="sanjiaoxing">三角形</option>
          <option value="triangle">方形</option>
        </select>
        <div id="button">
	       <button type="submit" class="submit">搜索</button> 
        </div>
     </form>
   </div>
 </div>

</body>
</html>