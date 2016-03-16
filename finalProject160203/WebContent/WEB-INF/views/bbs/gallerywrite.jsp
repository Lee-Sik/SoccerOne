<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<link href="CSS/bbstable.css" rel="stylesheet" >

<br><br><br><br><br>
<form name="frmForm" id="_frmForm" method="post" enctype="multipart/form-data">
<table class="list_table" style="width:85%;">

<colgroup>
	<col style="width:200px;" />
	<col style="width:auto;" />
</colgroup>

<tbody>	

<tr class="id">
	<th>아이디</th><td style="text-align: left"><input type="text" name="user_email" readonly="readonly" 
	value='${login.user_email}' size="60"/></td>
</tr>

<tr>
	<th>제목</th><td style="text-align: left"><input type="text" name="title" size="60"/></td>
</tr>

<tr>
	<th>내용</th>
	<td style="text-align: left"><textarea rows="10" cols="50" name='content' id="_content"></textarea></td>
</tr>

<tr>
	<th>이미지경로</th>
	<td style="text-align: left">
	<input type="file" name="file" id="file1"></td>
</tr>
</tbody>
</table>
</form>
<br>
	<div id="buttons_wrap">
		<button type="button" id="_btnAdd">저장</button>
	</div>

<script type="text/javascript">
$("#_btnAdd").click(function() {
	if($("#file1").val() == ""){
		alert('파일 넣어주세요');
		return;
	}else{
	alert('글쓰기');	
	$("#_frmForm").attr({ "target":"_self", "action":"gallerywriteAf.do" }).submit();
	}
});
</script>