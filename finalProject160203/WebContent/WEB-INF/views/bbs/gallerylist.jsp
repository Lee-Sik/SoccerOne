<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<fmt:requestEncoding value="utf-8"/>
<link href="CSS/BBStable.css" rel="stylesheet" >

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
		
		<c:if test="${vs.count == 5 }">
		<tr>
		</c:if>
		
		<c:if test="${vs.count == 10 }">
		</tr>
		</c:if>
	</c:if>
</c:forEach>
	
		
		
		
		
		
		
		
<%-- 			<a href='gallerydetail.do?gallery_no=${gal.gallery_no}'> --%>
<!-- 			<div class="gallary" style="width: 150px; height: 150px;"> -->
<%-- 				<div><img src="file://211.238.142.152/공유/ryu/${gal.imageurl}" width="100px;" height="100px;" alt="이미지없음"/></div> --%>
<%-- 				<div align="left">${gal.title}</div> --%>
<%-- 				<div align="left">${gal.user_email}</div> --%>
<!-- 			</div></a> -->




<!-- 	<tr class="_hover_tr"> -->
<%-- 		<td>${vs.count}</td>  --%>
<%-- 		<td style="text-align: left"><a href='gallerydetail.do?gallery_no=${gal.gallery_no}'>${gal.title}</a> --%>
<!-- 		 &nbsp;&nbsp; -->
<!-- 		 <a href="#"  -->
<%-- 		 onclick="javascript:window.open('./commentlist.do?gallery_no=${gal.gallery_no}','','location=0,status=0,scrollbars=1,width=750,height=300');">[${gal.commentcount}]</a> --%>
<!-- 		</td> -->
<%-- 		<td>${gal.user_email}</td> --%>
<%-- 			<c:set var="rdate" value="${gal.wdate}"/> --%>
<%-- 			<c:set var="len" value="${fn:length(wdate)}"/> --%>
<%-- 		<td>${fn:substring(gal.wdate, 0, 10)}</td>   --%>
<%-- 		<td>${gal.readcount}</td>  --%>
<%-- 		<td>${gal.good}</td>  --%>
<!-- 	</tr> -->






<c:if test="${gal.del == 1}">
	<tr class="_hover_tr">
		<td>${vs.count}</td> 
		<td></td>
		<td style="text-align: left">이 글은 삭제 되었습니다.</td>
		<td>${gal.user_email}</td> 
		<td></td> 
		<td></td> 
		<td></td>
	</tr>
</c:if>	













<%-- <colgroup> --%>
<%-- 	<col style="width:5%;"/> --%>
<%-- 	<col style="width:auto;"/> --%>
<%-- 	<col style="width:20%;"/> --%>
<%-- 	<col style="width:13%;"/> --%>
<%-- 	<col style="width:7%;"/> --%>
<%-- 	<col style="width:7%;"/> --%>
<%-- </colgroup> --%>

<!-- <thead> -->
<!-- 	<tr> -->
<!-- 		<th>번호</th> <th>제목</th> <th>작성자</th>  <th>작성일</th>  <th>조회수</th>  <th>추천수</th>  -->
<!-- 	</tr> -->
<!-- </thead> -->

<%-- <c:if test="${empty gallerylist}"> --%>
<!-- 	<tr> -->
<!-- 		<td colspan="6">작성된 글이 없습니다.</td> -->
<!-- 	</tr> -->
<%-- </c:if> --%>

<%-- <c:forEach items="${gallerylist}" var="gal" varStatus="vs"> --%>
<%-- <c:if test="${gal.del == 0}"> --%>
<!-- 	<tr class="_hover_tr"> -->
<%-- 		<td>${vs.count}</td>  --%>
<%-- 		<td style="text-align: left"><a href='gallerydetail.do?gallery_no=${gal.gallery_no}'>${gal.title}</a> --%>
<!-- 		 &nbsp;&nbsp; -->
<!-- 		 <a href="#"  -->
<%-- 		 onclick="javascript:window.open('./commentlist.do?gallery_no=${gal.gallery_no}','','location=0,status=0,scrollbars=1,width=750,height=300');">[${gal.commentcount}]</a> --%>
<!-- 		</td> -->
<%-- 		<td>${gal.user_email}</td> --%>
<%-- 			<c:set var="rdate" value="${gal.wdate}"/> --%>
<%-- 			<c:set var="len" value="${fn:length(wdate)}"/> --%>
<%-- 		<td>${fn:substring(gal.wdate, 0, 10)}</td>   --%>
<%-- 		<td>${gal.readcount}</td>  --%>
<%-- 		<td>${gal.good}</td>  --%>
<!-- 	</tr> -->
<%-- </c:if> --%>
<%-- <c:if test="${gal.del == 1}"> --%>
<!-- 	<tr class="_hover_tr"> -->
<%-- 		<td>${vs.count}</td>  --%>
<!-- 		<td></td> -->
<!-- 		<td style="text-align: left">이 글은 삭제 되었습니다.</td> -->
<%-- 		<td>${gal.user_email}</td>  --%>
<!-- 		<td></td>  -->
<!-- 		<td></td>  -->
<!-- 		<td></td> -->
<!-- 	</tr> -->
<%-- </c:if>	 --%>
<%-- </c:forEach> --%>

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







