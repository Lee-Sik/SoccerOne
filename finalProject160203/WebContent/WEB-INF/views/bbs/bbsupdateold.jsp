<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>
<link href="CSS/BBStable.css" rel="stylesheet" >

<form name="frmForm" id="_frmForm" method="post" action="bbsupdateAf.do">
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
	<th>제목</th><td style="text-align: left"><input type="text" name="title" size="60" value='${bbs.title}'/></td>
</tr>

<tr>
	<th>내용</th>
	<td style="text-align: left"><textarea rows="10" cols="50" name='content' id="_content">${bbs.content}</textarea></td>
</tr>

<tr>
	<td colspan="2" style="height:50px; text-align:center;">
		<input type="hidden" name="bbs_no" value="${bbs.bbs_no}" />
		<span><a href="#none" id="_btnupdate" title="수정하기">수정하기</a>
		</span>
	</td>
</tr>
</tbody>
</table>
</form>


<script type="text/javascript">
$("#_btnupdate").click(function() {	
	alert('수정하기');	
	$("#_frmForm").attr({ "target":"_self", "action":"bbsupdateAf.do" }).submit();  // http://www.w3schools.com/jsref/prop_form_target.asp
});
</script>

