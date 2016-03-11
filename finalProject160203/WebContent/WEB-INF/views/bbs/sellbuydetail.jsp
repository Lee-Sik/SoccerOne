<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<fmt:requestEncoding value="utf-8"/>
<link href="CSS/bbstable.css" rel="stylesheet" >
<head>

<script type="text/javascript">
	//SNS 등 sharer 처리
function fnShareFb(sMsg,sUrl) {
		
	var sMsg = document.getElementById('title').value;	
	var sUrl = document.getElementById('url').value;
    var href = "http://www.facebook.com/sharer.php?u=" + sUrl + "&t=" + encodeURIComponent(sMsg);
    var a = window.open(href, 'facebook', 'width=400, height=350');
    if ( a ) {
    a.focus();
    }
}
function fnShareTw(sUrl){
    var sUrl = document.getElementById('url').value;
	var sTxt = document.getElementById('content').value;
 
    var href = "http://twitter.com?status="+encodeURIComponent(sTxt)+" "+encodeURIComponent(sUrl);
    var a = window.open(href, 'twitter', 'width=400, height=350');
    if ( a ) {
    a.focus();
    }
}

</script>
</head>
<form name="frmForm" id="_frmForm" method="post" action="sellbuyupdate.do">
<table class="list_table" style="width:85%;">

<colgroup>
<col style="width:100px;" />
<col style="width:auto;" />
</colgroup>

<tbody>	
<tr>
	<td style="text-align: left;">분 류</td>
	<td style="text-align: left; font-weight: bold;">${sellbuy.topic}</td>
</tr>

<tr>
	<td style="text-align: left;">작성일</td>
	<td style="text-align: left;">${sellbuy.wdate}</td>
</tr>

<tr>
	<td style="text-align: left;">제 목</td>
	<td style="text-align: left;">${sellbuy.title}</td>
</tr>

<tr>
	<td style="text-align: left;">작성자</td>
	<td style="text-align: left;">
	<img src="./image/${sellbuy.user_profile}" style="width: 80px;">
	<b>${sellbuy.user_email}</b></td>
</tr>
<tr>
	<th colspan="2">내용</th>
</tr>
<tr>
	<td colspan="2" style="text-align: left;">
	<div style="text-align: right;">조회수 ${sellbuy.readcount}&nbsp;&nbsp;추천수 ${sellbuy.good}&nbsp;</div><br><br>
	${sellbuy.content}
	<br><br><br><br>	
	<div align="center">

		<c:if test="${flike.user_email == null}">
			<a href="sellbuylike.do?sellbuy_no=${sellbuy.sellbuy_no}&user_email=${login.user_email}"><img src="./image/like_btnd.gif"></a><br>
		</c:if>
		<c:if test="${flike.user_email != null}">
			<a href="sellbuylikedel.do?sellbuy_no=${sellbuy.sellbuy_no}&user_email=${login.user_email}"><img src="./image/like_btn.gif"></a><br>
		</c:if>
	 
	  	<input type = "hidden" id = "title" value ='${sellbuy.title}'>
    	<input type = "hidden" id = "content" value ='${sellbuy.content}'>
    	<input type = "hidden" id = "url" value ='http://211.238.142.129:8090/finalProject160203/sellbuydetail.do?sellbuy_no=${sellbuy.sellbuy_no}'>
		
	 <a href="#"><img onClick="fnShareFb();" src="./image/facebook_top.gif" width="16" height="16" alt="페이스북" border="0"></a>
     <a href="#"><img onclick="fnShareTw();" src="./image/twitter_top.gif" width="16" height="16" alt="트위터" border="0"></a>
     	
	</div>
	
	</td>
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
</form>


<c:if test="${login.user_email eq sellbuy.user_email}">
<form action="sellbuyupdate.do" method="post">
<input type="hidden" name="sellbuy_no"   value="${sellbuy.sellbuy_no}" />
<input type="submit"  value="수정하기" />
</form>
</c:if>

<c:if test="${login.user_email eq sellbuy.user_email}">
<form action="sellbuydel.do" method="post">
<input type="hidden" name="sellbuy_no" value="${sellbuy.sellbuy_no}" />
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
<form action="sellbuycommentAf.do">
<input type="hidden" name="parent_sellbuy_no" value="${sellbuy.sellbuy_no}"/>
<input type="hidden" name="user_email" value="${login.user_email}"/>

<br>
<table class="list_table" style="width:85%;">
<col width="8%"/>
<col width="auto"/>
<col width="10%"/>

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
			<td>
			<img src="./image/${comlist.user_profile}" style="width: 80px;"><br>
			${comlist.user_email}</td>
			<td style="text-align: left;">${comlist.content}</td>
			<td style="text-align: right;">
			${comlist.wdate}<br>
			<c:if test="${comlist.user_email == login.user_email}">
			<a href="#" 
		 	onclick="javascript:window.open('./sellbuycommentupdate.do?comment_no=${comlist.comment_no}','','location=0,status=0,scrollbars=1,width=750,height=300');">
			<img src="./image/comment_edit.gif"/></a>&nbsp;
			<a href="sellbuycommentdel.do?comment_no=${comlist.comment_no}&sellbuy_no=${sellbuy.sellbuy_no}&mode=detail"><img src="./image/comment_del.gif"/></a>
			</c:if>
			</td>
			</tr>
		</c:forEach>
	</c:if>		
</table>
<table class="list_table" style="width:85%;">

<tr>
	<td style="text-align: left;"><textarea rows="5" cols="80" name="content"></textarea></td>
	<td><input type="submit" value="댓글달기"></td>
</tr>
</table>
</form>

<br>
<a href="http://sports.news.naver.com/videoCenter/index.nhn?uCategory=wfootball&category=champs&id=178017">
<img src="./image/bbs_video3.png"/></a>
<br>


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
		 onclick="javascript:window.open('./commentlist.do?sellbuy_no=${sellbuy.sellbuy_no}','','location=0,status=0,scrollbars=1,width=750,height=300');">[${sellbuy.commentcount}]</a>
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

<div id="buttons_wrap">
	<span class="button blue">
	<button type="button" id="_btnAdd">글쓰기</button></span>
</div>


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
<br><br>

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



