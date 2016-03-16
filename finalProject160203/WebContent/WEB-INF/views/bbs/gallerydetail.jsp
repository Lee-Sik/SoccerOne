<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<fmt:requestEncoding value="utf-8"/>
<link href="CSS/bbstable.css" rel="stylesheet" >
<head>
<script type="text/javascript">
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
<form name="frmForm" id="_frmForm" method="post" action="galupdate.do">
<table class="list_table" style="width:85%;">

<colgroup>
<col style="width:100px;" />
<col style="width:auto;" />
</colgroup>

<tbody>	
<tr>
	<td style="text-align: left;">작성일</td>
	<td style="text-align: left;">${gal.wdate}</td>
</tr>

<tr>
	<td style="text-align: left;">제 목</td>
	<td style="text-align: left;">${gal.title}</td>
</tr>

<tr>
	<td style="text-align: left;">작성자</td>
	<td style="text-align: left;">
	<img src="./image/${gal.user_profile}" style="width: 80px;">
	<b>${gal.user_email}</b></td>
</tr>
<tr>
	<th colspan="2">내용</th>
</tr>
<tr>
	<td colspan="2" style="text-align: left;">
	<div style="text-align: right;">조회수 ${gal.readcount}&nbsp;&nbsp;추천수 ${gal.good}&nbsp;</div><br><br>
	${gal.content}<br>
	<a href="javascript:window.open('file://211.238.142.152/공유/ryu/${bbs.imageurl}', 'resizable=no, scrollbars=yes, status=no;')"><img src="file://211.238.142.152/공유/ryu/${gal.imageurl}" width="50%;" alt="이미지없음"/></a>
	<br><br><br><br>	
	<div align="center">
		<c:if test="${login.user_email != null}">
			<c:if test="${flike.user_email == null}">
				<a href="gallike.do?gallery_no=${gal.gallery_no}&user_email=${login.user_email}"><img src="./image/like_btnd.gif"></a><br>
			</c:if>
			<c:if test="${flike.user_email != null}">
				<a href="gallikedel.do?gallery_no=${gal.gallery_no}&user_email=${login.user_email}"><img src="./image/like_btn.gif"></a><br>
			</c:if>
		</c:if>
		
		<input type = "hidden" id = "title" value ='${gal.title}'>
    	<input type = "hidden" id = "content" value ='${gal.content}'>
    	<input type = "hidden" id = "url" value ='http://211.238.142.129:8090/finalProject160203/bbsdetail.do?bbs_no=${bbs.bbs_no}'>
		
	 <a href="#"><img onClick="fnShareFb();" src="./image/facebook_top.gif" width="16" height="16" alt="페이스북" border="0"></a>
     <a href="#"><img onclick="fnShareTw();" src="./image/twitter_top.gif" width="16" height="16" alt="트위터" border="0"></a>
     
	</div>
	
	</td>
</tr>
</tbody>		
</table>

</form>


<c:if test="${login.user_email eq gal.user_email}">
	<input type="submit"  value="수정" onclick="update1('${sellbuy.sellbuy_no}')"/>
	<input type="submit" value="삭제" onclick="delete1('${sellbuy.sellbuy_no}')"/>
</c:if>

<script type="text/javascript">
$("#_btnUpdate").click(function() {	
	alert('글수정하기');	
	submitContents($("#_frmForm"));
//	$("#_frmForm").attr({ "target":"_self", "action":"bbswriteAf.do" }).submit();
});
</script>


<form action="galcommentAf.do">
<input type="hidden" name="parent_no" value="${gal.gallery_no}"/>
<input type="hidden" name="user_email" value="${login.user_email}"/>

<table class="list_table" style="width:85%;">

<col width="8%"/>
<col width="auto"/>
<col width="10%"/>

<br>

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
			<c:if test="${login.user_email != null}">
				<c:if test="${comlist.user_email == login.user_email}">
				<a href="#" 
			 	onclick="javascript:window.open('./commentupdate.do?comment_no=${comlist.comment_no}','','location=0,status=0,scrollbars=1,width=750,height=300');">
				<img src="./image/comment_edit.gif"/></a>&nbsp;
				<a href="commentdel.do?comment_no=${comlist.comment_no}&bbs_no=${bbs.bbs_no}&mode=detail"><img src="./image/comment_del.gif"/></a>
				</c:if>
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
<a href="http://sports.news.naver.com/videoCenter/index.nhn?uCategory=wfootball&category=champs&id=176972">
<img src="./image/bbs_video.png"/></a>
<br>


<!-- 게시판 이어지기 -->
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

<table class="list_table" style="width:85%;">

<c:if test="${empty gallerylist}">
	<tr>
		<td colspan="5">작성된 글이 없습니다.</td>
	</tr>
</c:if>

<tr>
<c:forEach items="${gallerylist}" var="gal" varStatus="vs">
	<c:if test="${gal.del == 0}">
		<td style="text-align: center; width: 170px; height: 170px;" >
		<div class="gallery_list">
			<ul style="padding-left: 0px;">
				<li class="gallery_img" style="list-style:none;">
				<a href='gallerydetail.do?gallery_no=${gal.gallery_no}'><img src="file://211.238.142.152/공유/ryu/${gal.imageurl}" width="100px;" height="100px;" alt="이미지없음"/>
				</a></li>
				<li class="gallery_title" style="list-style:none;">
				<a href='gallerydetail.do?gallery_no=${gal.gallery_no}'>${gal.title}
				</a></li>
				<li class="gallery_name" style="list-style:none;">
				<span>${gal.user_email}</span><br>댓글 : [${gal.commentcount}] &nbsp; 추천수 : ${gal.good}	</li>
			</ul>
        </div>
		</td>
	</c:if>


	<c:if test="${gal.del == 1}">
	
			<td style="text-align: center; width: 170px; height: 170px;" >
			<div class="gallery_list">
			<ul style="padding-left: 0px;">
				<li class="gallery_img" style="list-style:none; height: 100px; vertical-align: middle;">이 글은 삭제 되었습니다.</li>
				<li class="gallery_title" style="list-style:none;">
				${gal.title}
				</li>
				<li class="gallery_name" style="list-style:none;">
				<span>${gal.user_email}</span><br>댓글 : [${gal.commentcount}] &nbsp; 추천수 : ${gal.good}	</li>
			</ul>
	        </div>
			</td>

	</c:if>	

	<c:if test="${vs.count == 5 }">
			</tr>
			<tr>
	</c:if>
		
	<c:if test="${vs.count == 10 }">
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
	$("#_frmForm").attr({ "target":"_self", "action":"gallerywrite.do" }).submit();
});

$("#_btnSearch").click(function() {
	//alert('search');						
	$("#_frmFormSearch").attr({ "target":"_self", "action":"gallerylist.do" }).submit();
});

function goPage(pageNumber) {	
	$("#_pageNumber").val(pageNumber) ;
	$("#_frmFormSearch").attr("target","_self").attr("action","gallerylist.do").submit();
}

function update1(no) {
	location.href = "galleryupdate.do?gallery_no=" + no;
	
}
function delete1(no) {
	location.href = "gallerydel.do?gallery_no=" + no;
}
</script>