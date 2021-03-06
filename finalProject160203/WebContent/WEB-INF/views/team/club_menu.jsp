<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<% request.setCharacterEncoding("utf-8"); %>
<style type="text/css">
#menu{background:#fcb040;}
.menulist {margin-left: 88px; padding-top:68px; height:81px;}
.menulist li {float:left; list-style:none; }
.menulist li a {padding:0; margin:0;}
.menulist li img {margin-top: -28px; width: 80px; border-right:1px solid #fff; border-top:1px solid #fff; border-bottom:1px solid #fff; background:#fff;}
.cl_b {clear:both; font-size:0px; height:0px;}
</style>

<div id='menu'>
	<jsp:include page="../menu.jsp"/>
	<ul class="menulist">
	
		<li><a href="club.do?user_address=${login.user_address}&user_team=${login.user_team}"><img src="./image/menu/club_off.png" class="image_rollover"></a></li>
		
		<c:if test="${empty team}"><!-- 팀X -->
				<li><a href="./clubsearch_no.do"><img src="./image/menu/clubsearch_off.png" class="image_rollover"></a></li>
				<c:if test="${not empty login }">
					<li><a href='team_create.do?user_email=${login.user_email }'><img src="./image/menu/clubmake_off.png" class="image_rollover"></a></li>
				</c:if>
		</c:if><!-- 팀X -->
		
		<c:if test="${not empty team}"> <!-- 팀 있을때 -->
			
			<li><a href='./clubsearch_yes.do'><img src="./image/menu/clubsearch_off.png" class="image_rollover"></a></li>
			<li><a href='./clubmyinform.do'><img src="./image/menu/clubmyinfo_off.png" class="image_rollover"></a></li>
				<c:if test="${login.user_email eq team.team_managerid }">
					<li><a href='./teamsetting.do'><img src="./image/menu/clubsetting_off.png" class="image_rollover"></a></li>
				</c:if>
		</c:if><!-- 팀 있을때 -->
		
		
		
	</ul>
</div>

<script type="text/javascript">
var menuNum = ${menuNum};
$(document).ready(function(){
	$(".menulist li img").eq(0).css("border-left","1px solid #fff");
	
	/*menu light*/
	
	var temp = $(".menulist li").eq(menuNum).find("img").attr("src");
	var length = temp.length;
	var file_name = temp.substring(0, length-6);
	var status = temp.substring(length-6).substring(0,2);
	var file_type = temp.substring(length-6).substring(3);
	if (status == "ff") $(".menulist li").eq(menuNum).find("img").attr("src", file_name + "n." + file_type);
});
$(".menulist li").mouseover(function(){
	if($(this).index() != menuNum) {
		var temp = $(this).find("img").attr("src");
		var length = temp.length;
		var file_name = temp.substring(0, length-6);
		var status = temp.substring(length-6).substring(0,2);
		var file_type = temp.substring(length-6).substring(3);
		if (status == "ff") $(this).find("img").attr("src", file_name + "n." + file_type);
	}
}).mouseout(function(){
	if($(this).index() != menuNum) {
	    var temp = $(this).find("img").attr("src");
	    var length = temp.length;
	    var file_name = temp.substring(0, length-6);
	    var status = temp.substring(length-6).substring(0,2); //on
	    var file_type = temp.substring(length-6).substring(3);
	    if (status == "on") $(this).find("img").attr("src", file_name + "off." + file_type);
	}
});

</script>
