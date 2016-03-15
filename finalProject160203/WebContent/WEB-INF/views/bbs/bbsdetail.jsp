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
function editCom(id){
	
	 event.preventDefault();
	 $('#'+id+"-2").children().hide();
	 
 	$('#'+id).removeAttr('readonly');
 	 origin =$('#'+id).val();
 	// alert(origin);
 	newDiv = document.createElement("input");// 1.노드를 생성한다.
 	 $(newDiv).attr('type', 'button');
 	$(newDiv).attr('value', '수정완료');
 	$(newDiv).attr('onclick', 'editCom2('+id+')');
 	
 	newDiv2 = document.createElement("input");// 1.노드를 생성한다.
	 $(newDiv2).attr('type', 'button');
	$(newDiv2).attr('value', '수정취소');
	$(newDiv2).attr('onclick', 'editCancel('+id+')');
	  
 	$('#'+id+"-2").append(newDiv);
 	$('#'+id+"-2").append(newDiv2);
	

}
function editCancel(id){
	alert('수정취소');
// 	alert(origin);
// 	alert(id);
	$('#'+id).attr('readonly','true');
	//$('#'+id).attr('value',origin);
	$('#'+id).val(origin);
	
	$('#'+id+"-2 input").remove();
	$('#'+id+"-2").children().show();
}

function editCom2(id){
	
	$('#'+id).attr('readonly','true');

	//ajax 처리
	$.ajax({//내 서버에서 필요한 객체를 자바스크립트로 가져오는 ajax
    url: "commentupdateAf.do",
    dataType: 'text',
    data:{'no':id,'contents':$('#'+id).val()},
    jsonpCallback: 'callback',
    type: 'get',
    success: function (data) {
    	if(data== 'true')
    		alert('수정성공');
    }
});
	
	
	
	alert('수정');
	$('#'+id+"-2 input").remove();
	$('#'+id+"-2").children().show();
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
<form name="frmForm" id="_frmForm" method="post" action="bbsupdate.do">
<table class="list_table" style="width:85%;">

<colgroup>
<col style="width:100px;" />
<col style="width:auto;" />
</colgroup>

<tbody>	

<tr>
	<td style="text-align: left;">작성일</td>
	<td style="text-align: left;">${bbs.wdate}</td>
</tr>

<tr>
	<td style="text-align: left;">제 목</td>
	<td style="text-align: left;">${bbs.title}</td>
</tr>

<tr>
	<td style="text-align: left;">작성자</td>
	<td style="text-align: left;">
	<img src="./image/${bbs.user_profile}" style="width: 80px;">
	<b>${bbs.user_email}</b></td>
</tr>
<tr>
	<th colspan="2">내용</th>
</tr>
<tr>
	<td colspan="2" style="text-align: left;">
	<div style="text-align: right;">조회수 ${bbs.readcount}&nbsp;&nbsp;추천수 ${bbs.good}&nbsp;</div><br><br>
	${bbs.content}
	<br><br><br><br>	
	<div align="center">

		<c:if test="${flike.user_email == null}">
			<a href="bbslike.do?bbs_no=${bbs.bbs_no}&user_email=${login.user_email}"><img src="./image/like_btnd.gif"></a><br>
		</c:if>
		<c:if test="${flike.user_email != null}">
			<a href="bbslikedel.do?bbs_no=${bbs.bbs_no}&user_email=${login.user_email}"><img src="./image/like_btn.gif"></a><br>
		</c:if>
	 
	  	<input type = "hidden" id = "title" value ='${bbs.title}'>
    	<input type = "hidden" id = "content" value ='${bbs.content}'>
    	<input type = "hidden" id = "url" value ='http://211.238.142.129:8090/finalProject160203/bbsdetail.do?bbs_no=${bbs.bbs_no}'>
		
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
<form action="commentAf.do">
<input type="hidden" name="parent_no" value="${bbs.bbs_no}"/>
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
			<td style="text-align: left;"><textarea rows="5" cols="80" id="${comlist.comment_no}" readonly>${comlist.content}</textarea></td>
			<td style="text-align: right;" id="${comlist.comment_no}-2">
			${comlist.wdate}<br>
			<c:if test="${comlist.user_email == login.user_email}">
			<a href="#" onclick="editCom(${comlist.comment_no})" >
			<img src="./image/comment_edit.gif" /></a>&nbsp;<!-- 댓글수정 -->
			<a href="commentdel.do?comment_no=${comlist.comment_no}&bbs_no=${bbs.bbs_no}&mode=detail">
			<img src="./image/comment_del.gif"/></a><!-- 댓글삭제 -->
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

<c:if test="${empty bbslist}">
	<tr>
		<td colspan="7">작성된 글이 없습니다.</td>
	</tr>
</c:if>

<c:forEach items="${bbslist}" var="bbs" varStatus="vs">
<c:if test="${bbs.del == 0}">
	<tr class="_hover_tr">
		<td>${vs.count}</td> 
		<td>${bbs.topic}</td>
		<td style="text-align: left"><a href='bbsdetail.do?bbs_no=${bbs.bbs_no}'>${bbs.title}</a>
		&nbsp;&nbsp;
		 <a href="#" 
		 onclick="javascript:window.open('./commentlist.do?bbs_no=${bbs.bbs_no}','','location=0,status=0,scrollbars=1,width=750,height=300');">[${bbs.commentcount}]</a>
		</td>
		<td>${bbs.user_email}</td>
			<c:set var="rdate" value="${bbs.wdate}"/>
			<c:set var="len" value="${fn:length(wdate)}"/>
		<td>${fn:substring(bbs.wdate, 0, 10)}</td>  
		<td>${bbs.readcount}</td> 
		<td>${bbs.good}</td> 
	</tr>
</c:if>
<c:if test="${bbs.del == 1}">
	<tr class="_hover_tr">
		<td>${vs.count}</td> 
		<td></td>
		<td style="text-align: left">이 글은 삭제 되었습니다.</td>
		<td>${bbs.user_email}</td> 
		<td></td> 
		<td></td> 
		<td></td>
	</tr>
</c:if>	
</c:forEach>

<%-- 
<c:forEach items="${bbslist}" var="bbs" varStatus="vs">
	<tr class="_hover_tr">
		<td>${vs.count}</td> 
		<td style="text-align: left">
			<a href='bbsdetail.do?seq=${bbs.seq}'>${bbs.title}</a>
		</td>
		<td>${bbs.id}</td> 
	</tr>
</c:forEach>
--%>

</table>

<div id="buttons_wrap">
	<span class="button blue">
	<button type="button" id="_btnAdd">글쓰기</button></span>
</div>
<!-- <a href='bbswrite.do'>글쓰기</a> -->


<div id="paging_wrap">
<jsp:include page="/WEB-INF/views/common/paging.jsp" flush="false">
	<jsp:param value="${pageNumber}" name="pageNumber"/>
	<jsp:param value="${pageCountPerScreen}" name="pageCountPerScreen"/>
	<jsp:param value="${recordCountPerPage}" name="recordCountPerPage"/>
	<jsp:param value="${totalRecordCount}" name="totalRecordCount"/>							
</jsp:include>				
</div>
<form name="frmForm2" id="_frmForm" method="get" action="bbswrite.do">
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
	$("#_frmForm").attr({ "target":"_self", "action":"bbswrite.do" }).submit();
});

$("#_btnSearch").click(function() {
	//alert('search');						
	$("#_frmFormSearch").attr({ "target":"_self", "action":"bbslist.do" }).submit();
});

function goPage(pageNumber) {	
	$("#_pageNumber").val(pageNumber) ;
	$("#_frmFormSearch").attr("target","_self").attr("action","bbslist.do").submit();
}
</script>



