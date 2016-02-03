<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<link href="CSS/COMUNITYtable.css" rel="stylesheet" >

<body>
<table class="list_table_5">
<colgroup>
<col style="width:30px;" />
<col style="width:200px;" />
<col style="width:50px;" />
<col style="width:150px;" />
</colgroup>

<tr>
	<td colspan="4" style="text-align: center; font-weight: bold">최근 국내축구 게시글</td>
</tr>

<tr>
		<th>번호</th> <th>제목</th> <th>작성자</th>  <th>작성일</th>
</tr>

<c:if test="${not empty bbslist}">

	<c:forEach items="${bbslist}" var="bbslist" varStatus="vs">
		<tr>		
			<c:if test="${bbslist.topic == 'korea'}">
				<td>${vs.count}</td> 
				<td><a href='bbsdetail.do?bbs_no=${bbslist.bbs_no}'>${bbslist.title}</a></td>
				<td>${bbslist.user_email}</td> 
				<td>${bbslist.wdate}</td> 
			</c:if>
		</tr>
	</c:forEach>

</c:if>

</table>

<br><br><br><br>

<table class="list_table_5">
<colgroup>
<col style="width:30px;" />
<col style="width:200px;" />
<col style="width:50px;" />
<col style="width:150px;" />
</colgroup>
<tr>
	<td colspan="4" style="text-align: center; font-weight: bold">최근 해외축구 게시글</td>
</tr>

<tr>
		<th>번호</th> <th>제목</th> <th>작성자</th>  <th>작성일</th>
</tr>

<c:if test="${not empty bbslist}">

	<c:forEach items="${bbslist}" var="bbslist" varStatus="vs">
		<tr>		
			<c:if test="${bbslist.topic == 'europe'}">
				<td>${vs.count}</td> 
				<td><a href='bbsdetail.do?bbs_no=${bbslist.bbs_no}'>${bbslist.title}</a></td>
				<td>${bbslist.user_email}</td> 
				<td>${bbslist.wdate}</td> 
			</c:if>
		</tr>
	</c:forEach>

</c:if>

</table>


<br><br><br><br>



<!-- <table> -->
<!-- <tr> -->
<!-- 	<td colspan="6" style="text-align: center; font-weight: bold">최근 친선경기 등록 현황</td> -->
<!-- </tr> -->
<!-- <tr> -->
<!-- 		<th>게임번호</th> <th>팀명</th> <th>요약</th>  <th>경기날짜</th>  <th>운동장</th> <th>대관료</th>  -->
<!-- </tr> -->
<%-- <c:forEach items="${freegamelist}" var="fglist" varStatus="vs"> --%>
<!-- 	<tr> -->
<%-- 		<td>${vs.count}</td>  --%>
<%-- 		<td>${fglist.team_name}</td> --%>
<%-- 		<td>${fglist.game_content}</td>  --%>
<%-- 		<td>${fglist.game_date}</td>  --%>
<%-- 		<td>${fglist.ground}</td>  --%>
<%-- 		<td>${fglist.pay}</td>  --%>
<!-- 	</tr> -->
<%-- </c:forEach> --%>
<!-- </table> -->
</body>