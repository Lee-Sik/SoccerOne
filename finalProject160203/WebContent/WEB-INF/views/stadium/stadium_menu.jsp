<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<% request.setCharacterEncoding("utf-8"); %>
<style type="text/css">
#menu{background:#67c4ea;}
.menulist {margin-left: 62px; padding-top:70px; height:81px;}
.menulist li {float:left; list-style:none; }
.menulist li a {padding:0; margin:0;}
.menulist li img {margin-top: -28px; width: 80px; border-right:1px solid #fff; border-top:1px solid #fff; border-bottom:1px solid #fff; background:#fff;}
.cl_b {clear:both; font-size:0px; height:0px;}
</style>

<div id='menu'>
	<jsp:include page="../menu.jsp"/>
	<ul class="menulist">
		<li><a href="./bookingList.do"><img src="./image/menu/publicbooking_off.png" class="image_rollover" /></a></li>
		<li><a href="./fbookingList.do"><img src="./image/menu/freebooking_off.png" class="image_rollover" /></a></li>
		<li><a href="./faManList.do"><img src="./image/menu/faplayer_off.png" class="image_rollover" /></a></li>
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
