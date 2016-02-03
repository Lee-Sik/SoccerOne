<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
<meta charset='utf-8'>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="CSS/main.css" rel="stylesheet" type="text/css" >
<link href="CSS/base.css" rel="stylesheet">
<link href="CSS/styles.css" rel="stylesheet">
<link href="CSS/BBStable.css" rel="stylesheet" >

<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
<script src="CSS/script.js"></script>
<title>Insert title here</title>
</head>
<body>
<div id="header"><tiles:insertAttribute name="header"/></div>
<div id="menu"><tiles:insertAttribute name="menu"/></div>
<div id="first"><tiles:insertAttribute name="first"/></div>
<div id="footer"><tiles:insertAttribute name="footer"/></div>
</body>
</html>