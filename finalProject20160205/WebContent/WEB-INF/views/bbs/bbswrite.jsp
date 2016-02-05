<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<link href="CSS/BBStable.css" rel="stylesheet" >

<br><br><br><br><br>
<form name="frmForm" id="_frmForm" method="post" action="bbswriteAf.do">
<table class="list_table" style="width:85%;">

<colgroup>
	<col style="width:200px;" />
	<col style="width:auto;" />
</colgroup>

<tbody>	

<tr>
	<th>말머리</th>
	<td style="text-align: left">
		<select id="topic" name="topic">
			<option value="" selected="selected">선택</option>
			<option value="korea">국내축구</option>
			<option value="europe">해외축구</option>
			<option value="sellbuy">중고장터</option>			
		</select>
	</td>
</tr>

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
	<td style="text-align: left"><input type="text" name="imageurl" size="60"/></td>
</tr>

<tr>
	<td colspan="2" style="height:50px; text-align:center;">
		<span><a href="#none" id="_btnLogin" title="글쓰기"><img src="image/bwrite.png" alt="로그인" /></a>
		</span>
	</td>
</tr>

</tbody>
</table>
</form>

<script type="text/javascript">
$("#_btnLogin").click(function() {	
	alert('글쓰기');	
	$("#_frmForm").attr({ "target":"_self", "action":"bbswriteAf.do" }).submit();
});
</script>