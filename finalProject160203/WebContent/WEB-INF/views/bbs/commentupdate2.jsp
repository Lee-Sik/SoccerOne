<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<fmt:requestEncoding value="utf-8"/>
<link href="CSS/BBStable.css" rel="stylesheet" >
<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>

<style type="text/css">
body, table{
    font-size: 12px;
    font-family: Montserrat, sans-serif;
}
</style>

</head>

<body>
<form name="update" id="_updateAf" method="post" action="commentupdateAf.do">

<table class="list_table" style="width:85%;">
<colgroup>
<col width="10%"/>
<col width="auto"/>
<col width="20%"/>
</colgroup>
<tr>
	<th colspan="3">댓글 수정</th>
</tr>

<tr>
	<td><input type="hidden" name="comment_no" value="${com.comment_no}">${com.user_email}</td>
	<td style="text-align: left; "><textarea name="content" cols="50" rows="3">${com.content}</textarea></td>
	<td><button type="button" id="_editBtn" onclick="javascript:goOpener();">수정하기</button></td>
</tr>

<!-- <tr> -->
<!-- 	<td> 작성자 </td> -->
<!-- 	<td colspan="2"> 댓글 </td>	 -->
<!-- </tr> -->
	
<%-- 	<c:if test="${empty comlist}"> --%>
<!-- 		<tr> -->
<!-- 		<td colspan="3">작성된 댓글이 없습니다.</td> -->
<!-- 		</tr> -->
<%-- 	</c:if> --%>
	
<%-- 	<c:if test="${not empty comlist}"> --%>
<%-- 		<c:forEach items="${comlist}" var="comlist"> --%>
<!-- 			<tr> -->
<%-- 			<td>${comlist.user_email}</td> --%>
<%-- 			<td style="text-align: left;">${comlist.content}</td> --%>
<!-- 			<td style="text-align: right;"> -->
<%-- 			${comlist.wdate}<br> --%>
<%-- 			<a href="commentedit.do?comment_no=${comlist.comment_no}"><img src="./image/comment_edit.gif"/></a>&nbsp; --%>
<%-- 			<a href="commentdel.do?comment_no=${comlist.comment_no}&bbs_no=${bbs_no}&mode=popuplist"><img src="./image/comment_del.gif"  --%>
<!-- 			onclick="del()"/></a> -->
<!-- 			</td> -->
<!-- 			</tr> -->
<%-- 		</c:forEach> --%>
<%-- 	</c:if>		 --%>
</table>
<!-- <table class="list_table" style="width:85%;"> -->

<!-- <tr> -->
<!-- 	<td style="text-align: left;"><textarea rows="5" cols="80" name="content"></textarea></td> -->
<!-- 	<td><input type="submit" value="댓글달기"></td> -->
<!-- </tr> -->
<!-- </table> -->
</form>
</body>
<script type="text/javascript">
function goOpener(){
	alert("수정 완료!");
	
	opener.name = "gogo";
	document.update.target = gogo;
	document.update.action="commentupdateAf.do";
	document.update.submit();
	
	self.close();
	
}
</script>


<!-- <script type="text/javascript"> -->
<!-- $("#_editBtn").click(function() { -->
<!--   	$("#_updateAf").submit(); -->
<!--    		alert("수정 완료!"); 		 -->
<!--   		opener.parent.location.reload(); -->
<!--  		setTimeout("window.close()",3000) -->
<!-- }); -->
<!-- </script> -->

