<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	// scriptlet 이란 영역
	String title = "jsp";
%>
<html>
<body>
	<h2><%=title%></h2>
	// expression tag
	<hr />
	// horizon 수평선
	<%
		if (Math.random() > 0.5) {
	%>
	좋다.
	<%
		} else {
	%>
	싫다.
	<%
		}
	%>

</body>
</html>