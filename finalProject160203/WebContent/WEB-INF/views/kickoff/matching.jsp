<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>


<!DOCTYPE html>
<style type="text/css">
.public_Btn,.free_Btn {
	
	text-decoration:none;
	box-shadow:inset #787878 0px -5px 8px -1px,#333333 0px 3px 0px;
	o-box-shadow:inset #787878 0px -5px 8px -1px,#333333 0px 3px 0px;
	-moz-box-shadow:inset #787878 0px -5px 8px -1px,#333333 0px 3px 0px;
	-webkit-box-shadow:inset #787878 0px -5px 8px -1px,#333333 0px 3px 0px;
	background:#4f4f4f;
	background:-o-linear-gradient(90deg, #4f4f4f, #5e5e5e);
	background:-moz-linear-gradient( center top, #4f4f4f 5%, #5e5e5e 100% );
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #4f4f4f), color-stop(1, #5e5e5e) );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#4f4f4f', endColorstr='#5e5e5e');
	background:-webkit-linear-gradient(#4f4f4f, #5e5e5e);
	background:-ms-linear-gradient(#4f4f4f, #5e5e5e);
	background:linear-gradient(#4f4f4f, #5e5e5e);
	text-indent:0px;
	line-height:21px;
	-moz-border-radius:10px;
	-webkit-border-radius:10px;
	border-radius:10px;
	text-align:center;
	vertical-align:middle;
	display:inline-block;
	font-size:20px;
	font-family: "Nanum Gothic", sans-serif;
	color:#ffffff;
	width:105px;
	height:50px;
	padding:12px;
	text-shadow:#7d7d7d 0px 0px 0px;
	border-color:#ffffff;
	border-width:0px;
	border-style:solid;
}

.public_Btn:active, .free_Btn:active{
	box-shadow:inset #787878 0px -5px 8px -1px,#333333 0px 0 0px;
	o-box-shadow:inset #787878 0px -5px 8px -1px,#333333 0px 0 0px;
	-moz-box-shadow:inset #787878 0px -5px 8px -1px,#333333 0px 0 0px;
	-webkit-box-shadow:inset #787878 0px -5px 8px -1px,#333333 0px 0 0px;
	position:relative;
	top:3px
}

.public_Btn:hover, .free_Btn:hover {
	background:#5e5e5e;
	background:-o-linear-gradient(90deg, #5e5e5e, #4f4f4f);
	background:-moz-linear-gradient( center top, #5e5e5e 5%, #4f4f4f 100% );
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #5e5e5e), color-stop(1, #4f4f4f) );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#5e5e5e', endColorstr='#4f4f4f');
	background:-webkit-linear-gradient(#5e5e5e, #4f4f4f);
	background:-ms-linear-gradient(#5e5e5e, #4f4f4f);
	background:linear-gradient(#5e5e5e, #4f4f4f);
}
</style>

<body>

<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<table style="text-align: center;">
<tr>
<td><button class="public_Btn" onclick="location.href='./publicgame.do'">공식경기   </button></td>

<td><button class="free_Btn" onclick="location.href='./freegame.do'">친선경기</button></td>
</tr>

</table>
</body>