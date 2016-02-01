<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	// qz.jsp?year=????&gender=??	

	String str = request.getParameter("year");	
	int a = 2015-Integer.parseInt(str);
	int v =    Integer.parseInt(request.getParameter("year"));
	int age = 2015-v;
	
	String r = request.getParameter("gender");
%>
<html>
<body>
	당신은 <%=age  %>세이고 , 
	<%if( r.equals("f") ) {%>
		여성
	<%}else { %>
		남성
	<%} %>
	
	입니다.
</body>
</html>