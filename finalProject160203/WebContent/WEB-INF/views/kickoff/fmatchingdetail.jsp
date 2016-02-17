<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>
<link href="CSS/BBStable.css" rel="stylesheet" >


<form name="frmForm" id="_frmForm" method="post" action="bbsupdate.do">
<table class="list_table" style="width:50%;">
<%-- <input type="hidden" name="seq" value="${bbs.bbs_no}"/> --%>

<colgroup>
<col style="width:200px;" />
<col style="width:auto;" />
</colgroup>

<tbody>	

<tr class="id">
	<th>클럽장</th>
	<td style="text-align: left">${fmd.team_managerid}</td>
</tr>

<tr>
	<th>클럽명</th><td style="text-align: left">${fmd.team_name}</td>
</tr>

<tr>
	<th>경기일자</th><td style="text-align: left">${fmd.game_date}</td>
</tr>

<tr>
	<th>경기장</th><td style="text-align: left">${fmd.ground}</td>
</tr>

<tr>
	<th>대전료</th><td style="text-align: left">
	<fmt:formatNumber value="${fmd.pay}" pattern="#,###.##' 원'"/></td>
</tr>

<tr>
	<th>대전현황</th>
		<c:if test="${fmd.game_state == 0}">
			<td style="text-align: center;" bgcolor="orange">대기중</td> 
		</c:if>
			
		<c:if test="${fmd.game_state == 1}">
			<td style="text-align: center" bgcolor="green">경기중</td> 
		</c:if>
		
		<c:if test="${fmd.game_state == 2}">
			<td style="text-align: center" bgcolor="lightgray">경기완료</td> 
		</c:if>
</tr>



<%-- 
<tr>
	<td colspan="2" style="height:50px; text-align:center;">
		<span><a href="#none" id="_btnUpdate" title="글수정하기"><img src="image/bupdate.png" alt="수정하기" /></a>
		</span>
	</td>
</tr>
--%>
		
</tbody>		
</table>

<%-- 답글달기 --%>
<%-- 
<c:if test="${login.id ne bbs.id}">

<form action="bbsreply.do" method="post">
<input type="hidden" name="seq"   value="${bbs.seq}" />
<input type="submit"  value="답글달기" />
</form>

</c:if>
--%>
</form>

<%-- <c:if test="${login.user_email ne bbs.user_email}"> --%>
<!-- <form action="bbsreply.do" method="post"> -->
<%-- <input type="hidden" name="bbs_no"   value="${bbs.bbs_no}" /> --%>
<!-- <input type="submit"  value="답글달기" /> -->
<!-- </form> -->
<%-- </c:if> --%>

<%-- <c:if test="${login.user_email eq bbs.user_email}"> --%>
<!-- <form action="bbsupdate.do" method="post"> -->
<%-- <input type="hidden" name="bbs_no"   value="${bbs.bbs_no}" /> --%>
<!-- <input type="submit"  value="수정하기" /> -->
<!-- </form> -->
<%-- </c:if> --%>

<%-- <c:if test="${login.user_email eq bbs.user_email}"> --%>
<!-- <form action="bbsdel.do" method="post"> -->
<%-- <input type="hidden" name="bbs_no"   value="${bbs.bbs_no}" /> --%>
<!-- <input type="submit"  value="삭제하기" /> -->
<!-- </form> -->
<%-- </c:if> --%>

<script type="text/javascript">
$("#_btnUpdate").click(function() {	
	alert('글수정하기');	
	submitContents($("#_frmForm"));
//	$("#_frmForm").attr({ "target":"_self", "action":"bbswriteAf.do" }).submit();
});


</script>