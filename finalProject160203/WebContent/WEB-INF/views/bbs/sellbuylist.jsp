<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<fmt:requestEncoding value="utf-8"/>
<link href="CSS/bbstable.css" rel="stylesheet" >

<div class="box_border" style="margin-top:5px; margin-bottom: 10px;">
<form name="frmForm1" id="_frmFormSearch" method="post" action="">

<table style="margin-left:auto; margin-right:auto; margin-top:3px; margin-bottom:3px; border:0; padding:0;">
<tr>
	<td>Search : </td>
	<td style="padding-left:5px;">
	<select id="_s_category" name="s_category">
		<option value="" selected="selected">선택</option>
		<option value="title">Title</option>
		<option value="contents">Content</option>								
	</select>
</td>
<td style="padding-left:5px;"><input type="text" id="_s_keyword" name="s_keyword" value="${s_keyword}"/></td>
<td style="padding-left:5px;"><span class="button blue"><button type="button" id="_btnSearch"> 검색 </button></span></td>
		</tr>
	</table>
	<input type="hidden" name="pageNumber" id="_pageNumber" value="${(empty pageNumber)?0:pageNumber}"/>						
	<input type="hidden" name="recordCountPerPage" id="_recordCountPerPage" value="${(empty recordCountPerPage)?10:recordCountPerPage}"/>						
	</form>
</div>

<jsp:useBean id="ubbs" class="sist.co.help.BBSHelp"/>
<table class="list_table" style="width:85%;">

<colgroup>
	<col style="width:5%;"/>
	<col style="width:10%;"/>
	<col style="width:auto;"/>
	<col style="width:20%;"/>
	<col style="width:13%;"/>
	<col style="width:7%;"/>
	<col style="width:7%;"/>
</colgroup>

<thead>
	<tr>
		<th>번호</th> <th>분류</th> <th>제목</th> <th>작성자</th>  <th>작성일</th>  <th>조회수</th>  <th>추천수</th> 
	</tr>
</thead>

<c:if test="${empty sellbuylist}">
	<tr>
		<td colspan="7">작성된 글이 없습니다.</td>
	</tr>
</c:if>

<c:forEach items="${sellbuylist}" var="sellbuy" varStatus="vs">
<c:if test="${sellbuy.del == 0}">
	<tr class="_hover_tr">
		<td>${vs.count}</td> 
		<td>${sellbuy.topic}</td>
		<td style="text-align: left"><a href='sellbuydetail.do?sellbuy_no=${sellbuy.sellbuy_no}'>${sellbuy.title}</a>
		 &nbsp;&nbsp;
		 <a href="#" 
		 onclick="javascript:window.open('./sellbuycommentlist.do?sellbuy_no=${sellbuy.sellbuy_no}','','location=0,status=0,scrollbars=1,width=750,height=300');">[${sellbuy.commentcount}]</a>
		</td>
		<td>${sellbuy.user_email}</td>
			<c:set var="rdate" value="${sellbuy.wdate}"/>
			<c:set var="len" value="${fn:length(wdate)}"/>
		<td>${fn:substring(sellbuy.wdate, 0, 10)}</td>  
		<td>${sellbuy.readcount}</td> 
		<td>${sellbuy.good}</td> 
	</tr>
</c:if>
<c:if test="${sellbuy.del == 1}">
	<tr class="_hover_tr">
		<td>${vs.count}</td> 
		<td></td>
		<td style="text-align: left">이 글은 삭제 되었습니다.</td>
		<td>${sellbuy.user_email}</td> 
		<td></td> 
		<td></td> 
		<td></td>
	</tr>
</c:if>	
</c:forEach>
</table> 
<br>

<div id="buttons_wrap">
	<button type="button" id="_btnAdd">글쓰기</button>
</div>
<br>

<div id="paging_wrap">
<jsp:include page="/WEB-INF/views/common/paging.jsp" flush="false">
	<jsp:param value="${pageNumber}" name="pageNumber"/>
	<jsp:param value="${pageCountPerScreen}" name="pageCountPerScreen"/>
	<jsp:param value="${recordCountPerPage}" name="recordCountPerPage"/>
	<jsp:param value="${totalRecordCount}" name="totalRecordCount"/>							
</jsp:include>				
</div>
<form name="frmForm2" id="_frmForm" method="get" action="sellbuywrite.do">
</form>

<br>
<a href="http://sports.news.naver.com/videoCenter/index.nhn?uCategory=wfootball&category=europa&id=181913">
<img src="./image/bbs_video4.png"/></a>
<br>

<script type="text/javascript">
$(document).ready(function() {	// 마우스에 따라서 컬러를 변경
	$("._hover_tr").mouseover(function() {
		$(this).children().css("background-color","#efefef");
	}).mouseout(function() {
		$(this).children().css("background-color","#FFFFFF");
	});				
});

$("#_btnAdd").click(function() {	
// 	alert('글쓰기');	
	$("#_frmForm").attr({ "target":"_self", "action":"sellbuywrite.do" }).submit();
});

$("#_btnSearch").click(function() {
	//alert('search');						
	$("#_frmFormSearch").attr({ "target":"_self", "action":"sellbuylist.do" }).submit();
});

function goPage(pageNumber) {	
	$("#_pageNumber").val(pageNumber) ;
	$("#_frmFormSearch").attr("target","_self").attr("action","sellbuylist.do").submit();
}
</script>







