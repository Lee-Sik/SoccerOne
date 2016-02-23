<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<fmt:requestEncoding value="utf-8"/>
<link href="CSS/BBStable.css" rel="stylesheet" >
<head>
<script type="text/javascript">
function openNewsWin(openUrl) {
    var winObj;
    winObj = window.open(openUrl,"sendNewsWin","width=1024, height=800");
}

function openNewsWin2(openUrl) {
    var winObj;
    winObj = window.open(openUrl,"recom_icon_pop","width=400, height=364, scrollbars=no, resizable=no");
}

function openNewsWin(openUrl) {
    var winObj;
    winObj = window.open(openUrl,"sendNewsWin","width=1024, height=800");
}

function openNewsWin2(openUrl) {
    var winObj;
    winObj = window.open(openUrl,"recom_icon_pop","width=400, height=364, scrollbars=no, resizable=no");
}

function sendNews(media) {
    var sendUrl,locUrl,message;
    locUrl = window.location.href;
    message = "대부분의 암이 남자가 여자보다 사망율이 높다던데요";
    switch(media) {
        case "twitter":
            sendUrl = "http://twitter.com/home?status="+encodeURIComponent(message)+"+"+escape(locUrl);
            openNewsWin(sendUrl);
            break;
        case "metoday":
            sendUrl = "http://me2day.net/posts/new?new_post[body]="+encodeURIComponent(message)+":"+escape(locUrl)+"&amp;new_post[tags]=%EB%8F%99%EC%95%84%EB%8B%B7%EC%BB%B4+%EB%89%B4%EC%8A%A4%EC%8A%A4%ED%81%AC%EB%9E%A9";
            openNewsWin(sendUrl);
            break;
        case "naver":
            sendUrl = "http://bookmark.naver.com/post?ns=1&amp;title="+encodeURIComponent(message)+"&amp;url="+escape(locUrl);
            openNewsWin(sendUrl);
            break;
        case "google":
            sendUrl = "http://www.google.com/bookmarks/mark?op=add&amp;title="+encodeURIComponent(message)+"&amp;bkmk="+escape(locUrl);
            openNewsWin(sendUrl);
            break;
        case "cyworld":
            sendUrl = "http://csp.cyworld.com/bi/bi_recommend_pop.php?url="+window.location.href+"&amp;title_nobase64=대부분의 암이 남자가 여자보다 사망율이 높다던데요&amp;title=64yA67aA67aE7J2YIOyVlOydtCDrgqjsnpDqsIAg7Jes7J6Q67O064ukIOyCrOunneycqOydtCDrhpLri6TrjZjrjbDsmpQ%3D&amp;thumbnail=&amp;summary_nobase64=&amp;summary=64yA67aA67aE7J2YIOyVlOydmCA164WE7IOd7KG0&amp;writer=&amp;corpid=65816299";
            openNewsWin2(sendUrl);
            break;
        case "facebook":
            sendUrl = "http://www.facebook.com/sharer.php?u="+encodeURIComponent(locUrl)+"&amp;t="+encodeURIComponent(message);
            openNewsWin2(sendUrl);
            break;
    }
}

</script>
</head>
<form name="frmForm" id="_frmForm" method="post" action="galupdate.do">
<table class="list_table" style="width:85%;">
<%-- <input type="hidden" name="seq" value="${bbs.bbs_no}"/> --%>

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

		<c:if test="${flike.user_email == null}">
			<a href="gallike.do?gallery_no=${gal.gallery_no}&user_email=${login.user_email}"><img src="./image/like_btnd.gif"></a><br>
		</c:if>
		<c:if test="${flike.user_email != null}">
			<a href="gallikedel.do?gallery_no=${gal.gallery_no}&user_email=${login.user_email}"><img src="./image/like_btn.gif"></a><br>
		</c:if>
	
	 <a href="javascript:sendNews('cyworld');"><img src="./image/cyworld_top.gif" width="16" height="16" alt="싸이월드 공감" border="0"></a>
     <a href="javascript:sendNews('facebook');"><img src="./image/facebook_top.gif" width="16" height="16" alt="페이스북" border="0"></a>
     <a href="javascript:sendNews('twitter');"><img src="./image/twitter_top.gif" width="16" height="16" alt="트위터" border="0"></a>
     <a href="javascript:sendNews('naver');"><img src="./image/naver_top.gif" width="16" height="16" alt="네이버" border="0"></a>
     <a href="javascript:sendNews('google');"><img src="./image/google_top.gif" width="16" height="16" alt="구글" border="0"></a>
	
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


<c:if test="${login.user_email eq gal.user_email}">
<form action="galleryupdate.do" method="post">
<input type="hidden" name="gallery_no"   value="${gal.gallery_no}" />
<input type="submit"  value="수정하기" />
</form>
</c:if>

<c:if test="${login.user_email eq gal.user_email}">
<form action="gallerydel.do" method="post">
<input type="hidden" name="gallery_no"   value="${gal.gallery_no}" />
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
			<c:if test="${comlist.user_email == login.user_email}">
			<a href="#" 
		 	onclick="javascript:window.open('./commentupdate.do?comment_no=${comlist.comment_no}','','location=0,status=0,scrollbars=1,width=750,height=300');">
			<img src="./image/comment_edit.gif"/></a>&nbsp;
			<a href="commentdel.do?comment_no=${comlist.comment_no}&bbs_no=${bbs.bbs_no}&mode=detail"><img src="./image/comment_del.gif"/></a>
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



<!-- 페이징 처리 부분 -->

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
</script>