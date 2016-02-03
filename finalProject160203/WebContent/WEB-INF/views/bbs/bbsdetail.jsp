<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>



<form name="frmForm" id="_frmForm" method="post" action="bbsupdate.do">
<table class="list_table" style="width:85%;">
<input type="hidden" name="seq" value="${bbs.bbs_no}"/>

<colgroup>
<col style="width:200px;" />
<col style="width:auto;" />
</colgroup>

<tbody>	

<tr class="id">
	<th>아이디</th>
	<td style="text-align: left">${bbs.user_email}</td>
</tr>

<tr>
	<th>제 목</th><td style="text-align: left">${bbs.title}</td>
</tr>

<tr>
	<th>작성일</th><td style="text-align: left">${bbs.wdate}</td>
</tr>

<tr>
	<th>조회수</th><td style="text-align: left">${bbs.readcount}</td>
</tr>

<tr>
	<th>내 용</th>
	<td style="text-align: left"><textarea rows="10" cols="50" 
	name='content' id="_content">${bbs.content}</textarea></td>
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

<c:if test="${login.user_email eq bbs.user_email}">
<form action="bbsupdate.do" method="post">
<input type="hidden" name="bbs_no"   value="${bbs.bbs_no}" />
<input type="submit"  value="수정하기" />
</form>
</c:if>

<c:if test="${login.user_email eq bbs.user_email}">
<form action="bbsdel.do" method="post">
<input type="hidden" name="bbs_no"   value="${bbs.bbs_no}" />
<input type="submit"  value="삭제하기" />
</form>
</c:if>

<script type="text/javascript">
$("#_btnUpdate").click(function() {	
	alert('글수정하기');	
	submitContents($("#_frmForm"));
//	$("#_frmForm").attr({ "target":"_self", "action":"bbswriteAf.do" }).submit();
});


</script>