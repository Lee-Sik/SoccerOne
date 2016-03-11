<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<fmt:requestEncoding value="utf-8"/>
<link href="CSS/bbstable.css" rel="stylesheet" >
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

</table>

</form>
</body>


<script type="text/javascript">
$("#_editBtn").click(function() {
  	$("#_updateAf").submit();
   		alert("수정 완료!"); 		
  		opener.parent.location.reload();
 		setTimeout("window.close()",3000)
});
</script>

