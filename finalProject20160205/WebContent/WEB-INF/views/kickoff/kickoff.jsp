<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>
<link href="CSS/KICKOFF.css" rel="stylesheet" >

<body>

<table class="list_table" style="width:85%;">
<colgroup>
<col style="width:40px;" />
<col style="width:50px;" />
<col style="width:30px;" />
<col style="width:100px;" />
<col style="width:100px;" />
<col style="width:80px;" />
<col style="width:30px;" />
</colgroup>
<tr>
	<td colspan="7" style="text-align: center; font-weight: bold">최근 공식경기 등록 현황</td>
</tr>

<tr>
		<th>지역구</th> <th>팀명</th> <th>경기요약</th>  <th>경기날짜</th>  <th>운동장</th> <th>대관료</th>  <th>대전현황</th> 
</tr>
<c:forEach items="${publicgamelist}" var="fglist" varStatus="vs">
	<tr>
		<td>${fglist.game_location}</td>
		<td>${fglist.team_name}</td>
		<td>${fglist.game_content}</td> 
		<td>${fglist.game_date}</td> 
		<td>${fglist.ground}</td> 
		<td>${fglist.pay}</td> 
		<c:if test="${fglist.game_state == 0}">
				<td bgcolor="orange">부킹중
			</td> 
			</c:if>
			
			<c:if test="${fglist.game_state == 1}">
				<td bgcolor="lightgray">부킹완료
			</td> 
			</c:if>
	</tr>
</c:forEach>
</table>


<br><br><br><br>


<table class="list_table" style="width:85%;">
<colgroup>
<col style="width:40px;" />
<col style="width:50px;" />
<col style="width:100px;" />
<col style="width:100px;" />
<col style="width:80px;" />
<col style="width:50px;" />
</colgroup>
<tr>
	<td colspan="6" style="text-align: center; font-weight: bold">최근 친선경기 등록 현황</td>
</tr>
<tr>
		<th>지역구</th> <th>팀명</th> <th>요약</th>  <th>경기날짜</th>  <th>운동장</th> <th>대관료</th> 
</tr>
<c:forEach items="${freegamelist}" var="fglist" varStatus="vs">
	<tr>
		<td>${fglist.game_location}</td> 
		<td>${fglist.team_name}</td>
		<td>${fglist.game_content}</td> 
		<td>${fglist.game_date}</td> 
		<td>${fglist.ground}</td> 
		<td>${fglist.pay}</td> 
	</tr>
</c:forEach>
</table>
</body>