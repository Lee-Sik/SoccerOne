<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<h3>부모글</h3>

<table class="list_table" style="width:85%;">
<colgroup>
	<col style="width:200px;" />
	<col style="width:auto;" />
</colgroup>
	<tr>
		<th>번호</th>
		<td style="text-align: left">${bbs.seq}</td>
	</tr>
	
	<tr>
		<th>작성자</th>
		<td style="text-align: left">${bbs.id}</td>
	</tr>
	<tr>
		<th>제목</th>
		<td style="text-align: left">${bbs.title}</td>
	</tr>
	<tr>
		<th>조회수</th>
		<td style="text-align: left">${bbs.readcount}</td>
	</tr>
	 
	<tr>
		<th>기타</th>
		<td style="text-align: left">[${bbs.ref}]-[${bbs.step}]-[${bbs.depth}]</td>
	</tr>
	
	<tr>
		<th>작성일</th>
		<td style="text-align: left">${bbs.wdate}</td>
	</tr>
	
	<tr>
		<th>내용</th>
		<td style="text-align: left"><textarea rows="20" cols="60"
		 name="content" >${bbs.content}</textarea></td>
	</tr>

</table>


<h3>답글달기</h3>

<form action="bbsreplyAf.do" method="post">
<input type="hidden" name="seq" value="${bbs.seq}" />
<table class="list_table" style="width:85%;">
<colgroup>
	<col style="width:200px;" />
	<col style="width:auto;" />
</colgroup>

<tr class="id">
	<th>아이디</th>
		<td style="text-align: left"><input type="text" name="id" value="${login.id}"
		size="20" readonly="readonly" /></td>
	</tr>
	<tr>
		<th>제목</th>
		<td style="text-align: left"><input type="text" name="title" size="50" /></td>
	</tr>
	<tr>
		<th>내용</th>
		<td style="text-align: left"><textarea rows="20" cols="60" name="content" ></textarea></td>
	</tr>
		<tr>
		<td colspan="2"><input type="submit"  value="답글달기" /></td>
	</tr>

</table>
</form>

<a href='bbslist.do'>글목록</a><br/>






