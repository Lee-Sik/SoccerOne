<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" type="text/css" href="./CSS/main.css">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="header"><tiles:insertAttribute name="header"/></div>
<div id="menu"><tiles:insertAttribute name="menu"/></div>
<div id="first"><tiles:insertAttribute name="first"/></div>
<div id="footer"><tiles:insertAttribute name="footer"/></div>
</body>
</html>