<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>
<link rel="stylesheet" type="text/css" href="./CSS/main.css">
<html>
<body>
<!-- #004 view -->
<div id="header"><tiles:insertAttribute name="header"/></div>
<div id="menu"><tiles:insertAttribute name="menu"/></div>
<div id="main"><tiles:insertAttribute name="main"/></div>
<div id="content"><tiles:insertAttribute name="content"/></div>
<div id="advertise"><tiles:insertAttribute name="advertise"/></div>
<div id="footer"><tiles:insertAttribute name="footer"/></div>

    
</body>
</html>
