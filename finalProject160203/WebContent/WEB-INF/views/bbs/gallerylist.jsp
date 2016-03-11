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
