<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<% request.setCharacterEncoding("utf-8"); %>
<style type="text/css">
#menu{background:#d7df21;}
.menulist {padding-top:68px; height:81px;}
.menulist li {float:left; list-style:none; }
.menulist li a {padding:0; margin:0;}
.menulist li img {margin-top: -28px; width: 80px; border-right:1px solid #fff; border-top:1px solid #fff; border-bottom:1px solid #fff; background:#fff;}
.cl_b {clear:both; font-size:0px; height:0px;}
</style>



<div id='menu'>
	<jsp:include page="../menu.jsp"/>
	<ul class="menulist">
		<li id="m1"><a href="./kickoff.do"><img src="./image/menu/addmatch_off.png" class="image_rollover"></a></li>
		<li id="m11" style="display: none;"><a href="./publicgame.do?mode=m11"><img src="./image/menu/rankingadd_off.png" class="image_rollover"></a></li>
		<li id="m12" style="display: none;"><a href="./freegame.do?mode=m12"><img src="./image/menu/freematchadd_off.png" class="image_rollover"></a></li>
	
		<li id="m2"><a href="./kickoff.do"><img src="./image/menu/matchingsearch_off.png" class="image_rollover"></a></li>
		<li id="m21" style="display: none;"><a href="./publicms.do?mode=m21"><img src="./image/menu/rankingsearch_off.png" class="image_rollover"></a></li>
		<li id="m22" style="display: none;"><a href="./freems.do?mode=m22"><img src="./image/menu/freematchsearch_off.png" class="image_rollover"></a></li>
		
		<li id="m3"><a href="./ranking.do"><img src="./image/menu/rank_off.png" class="image_rollover"></a></li>
		
	</ul>
</div>

<script type="text/javascript">
var menuNum = ${menuNum};
$(document).ready(function(){
	
	var mode = "${mode}";
	
	if(!(mode=="" || mode==null)){
	 	if(mode=="m11" || mode=="m12"){
			$("#m11").css("display", "block");
			$("#m12").css("display", "block");
		} 
		if(mode=="m21" || mode=="m22"){
			$("#m21").css("display", "block");
			$("#m22").css("display", "block");
		}
	}
	
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
$("#m1").mouseover(function(){
	$("#m21").hide(500);
	$("#m22").hide(500);
	$("#m11").show(500);
	$("#m12").show(500);
});
$("#m2").mouseover(function(){
	$("#m11").hide(500);
	$("#m12").hide(500);
	$("#m21").show(500);
	$("#m22").show(500);	
});
$("#m3").mouseover(function(){
	$("#m11").hide(500);
	$("#m12").hide(500);
	$("#m21").hide(500);
	$("#m22").hide(500);		
});

</script>
