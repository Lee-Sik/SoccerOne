<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	// 웹망에서 사용하는 규약상 (http) 클라이언트측에서 서버측으로 값들을 전달할수 있는데
	// 형태는 [ 해당페이지명?이름=값&이름=값&이름=값&이름=값 ] 이렇고
	// 이런 값들을 웹기술(jsp,php,asp)마다 확보하는게 가능하다

	// jsp 에서는 이 값들을 확보할때 request 객체를 통해서 얻어낸다.
	// 메서드명은  String getParameter(String name)   이다.  (데이터확보는 String으로!)

	// 예를 들어서, 현재 페이지가 ex02.jsp?grade=silver   혹은  ..   ?grade=gold   이런식으로 왔다면
	String v = request.getParameter("grade");
	// 추가로 ex02.jsp?grade=silver&rank=5    이렇게 더 추가되서 날라온다고 가정하고
	String r = request.getParameter("rank");
%>
<html>
<body>
	당신이 grade 이란 이름으로 물려서 보낸 값은
	<%=v%>	!!
	<hr />
	당신이 rank 란 이름으로 물려서 보낸 값은
	<%=r%>	!!
	<hr />
	rank 에 물려서 넘어온 값이 5 이하일때는 "승급 가능" 라는 응답메세지를 더 보내게 if 처리해라
	<hr />
	<%
		// 파라미터 확보는 String 형태로 발생하기 때문에 , 수치타입으로 변환처리 해야된다.
		// String → int :  Integer.parseInt
		int ir = Integer.parseInt(r);
		if (ir <= 5) {	%>
	<b>승급가능</b>
	<%
		}
	%>


</body>
</html>






