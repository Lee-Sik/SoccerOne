<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8'>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="CSS/main.css" rel="stylesheet" type="text/css" >
<link href="CSS/styles.css" rel="stylesheet">
<link rel="shortcut icon" href="./image/bbs_europe.jpg" />

<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
<script src="CSS/script.js"></script>
<title>사커원</title>

</head>
<body>

<div id="top">
<div id="header"><tiles:insertAttribute name="header"/></div>
<div id="menu"><tiles:insertAttribute name="menu"/></div>
	<div>
		<div id="main">
		<c:if test="${not empty title}">
		<div class="main_title"><br>
		<img width="80%;" src="./image/maintitle/title_${title}.png"/></div></c:if>
		
			<tiles:insertAttribute name="main"/>
		</div>
		<div id="right">
			<div id="content"><tiles:insertAttribute name="content"/></div>
			<div id="advertise"><tiles:insertAttribute name="advertise"/></div>
		</div>
	</div>
</div>

<div id="footer"><tiles:insertAttribute name="footer"/></div>

    
</body>
</html>
