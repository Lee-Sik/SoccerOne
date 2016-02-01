<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<html>
<body>
	<%
		int n = 3;
//		int n = 5;		//	n이라는 변수가 있기 때문에 duplicate (중복)
//		String request;		// why duplicate ??
		request.toString();		// request ?? 이란 객체가 선언도 안했는데 있고.
			// 요청 : 사용자쪽에서 전달되는 정보들을 접근 할때 사용
		response.toString();		// response ?? 란 객체가 선언도 안했는데 있다.
			// 응답 : 사용자쪽으로 전달해야 되는 정보들을 접근할때 사용
		String addr = request.getRemoteAddr();			// 요청지의 ip를 얻어낸다.
	%>
	addr ?  <%=addr %>  <hr/>
	<%
		//response.sendError(500);
	%>
</body>
</html>








