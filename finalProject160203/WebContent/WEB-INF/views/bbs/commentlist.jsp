<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<fmt:requestEncoding value="utf-8"/>
<link href="CSS/bbstable.css" rel="stylesheet" >

<head>
<script type="text/javascript">
function del(){
alert("삭제완료 완료!");
opener.parent.location.reload();
}
</script>

<style type="text/css">
body, table{
    font-size: 12px;
    font-family: "Nanum Gothic", sans-serif;
}

</style>

</head>


<body>
<form action="commentAf.do">

<table class="list_table" style="width:85%;">
<colgroup>
<col width="10%"/>
<col width="auto"/>
<col width="20%"/>
</colgroup>
<tr>
	<th colspan="3">댓글 목록</th>
</tr>
<tr>
	<td> 작성자 </td>
	<td colspan="2"> 댓글 </td>	
</tr>
	
	<c:if test="${empty comlist}">
		<tr>
		<td colspan="3">작성된 댓글이 없습니다.</td>
		</tr>
	</c:if>
	
	<c:if test="${not empty comlist}">
		<c:forEach items="${comlist}" var="comlist">
			<tr>
			<td>${comlist.user_email}</td>
			<td style="text-align: left;">${comlist.content}</td>
			<td style="text-align: right;">
			${comlist.wdate}<br>
			<c:if test="${comlist.user_email == login.user_email}">
			<a href="commentupdate.do?comment_no=${comlist.comment_no}"><img src="./image/comment_edit.gif"/></a>
			&nbsp;
			<a href="commentdel.do?comment_no=${comlist.comment_no}&bbs_no=${bbs_no}&mode=popuplist"><img src="./image/comment_del.gif" 
			onclick="del()"/></a></c:if>
			</td>
			</tr>
		</c:forEach>
	</c:if>		
</table>
</form>
</body>

