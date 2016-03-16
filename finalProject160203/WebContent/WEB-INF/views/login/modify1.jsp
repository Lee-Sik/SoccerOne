<%@ page import="soccer.co.DTO.foot_user_DTO"%>
<%@ page import ="java.util.StringTokenizer" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link href="CSS/styles.css" rel="stylesheet" >
<link href="CSS/myinfo.css" rel="stylesheet" >
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style>
.Join_Btn,.Cancel_Btn {
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
	font-size:13px;
	vertical-align:middle;
	font-family: "Nanum Gothic", sans-serif;
	color:#ffffff;
	width:68px;
	height:25px;
	padding:2px;
	text-shadow:#7d7d7d 0px 0px 0px;
	border-color:#ffffff;
	border-width:0px;
	border-style:solid;
}

.Join_Btn:active, .Cancel_Btn:active{
	box-shadow:inset #787878 0px -5px 8px -1px,#333333 0px 0 0px;
	o-box-shadow:inset #787878 0px -5px 8px -1px,#333333 0px 0 0px;
	-moz-box-shadow:inset #787878 0px -5px 8px -1px,#333333 0px 0 0px;
	-webkit-box-shadow:inset #787878 0px -5px 8px -1px,#333333 0px 0 0px;
	position:relative;
	top:3px
}

.Join_Btn:hover, .Cancel_Btn:hover {
	background:#5e5e5e;
	background:-o-linear-gradient(90deg, #5e5e5e, #4f4f4f);
	background:-moz-linear-gradient( center top, #5e5e5e 5%, #4f4f4f 100% );
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #5e5e5e), color-stop(1, #4f4f4f) );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#5e5e5e', endColorstr='#4f4f4f');
	background:-webkit-linear-gradient(#5e5e5e, #4f4f4f);
	background:-ms-linear-gradient(#5e5e5e, #4f4f4f);
	background:linear-gradient(#5e5e5e, #4f4f4f);
}

@import url(http://fonts.googleapis.com/css?family=Montserrat:400,700);
body, table{
	font-size: 10pt;
	font-family: "Nanum Gothic", sans-serif;
}
.wow1{
	text-align: center;
	color:black;
	font-size: 25pt;
	font-family: "Nanum Gothic", sans-serif;
}
.wow2{
	text-align: center;
	color:black;
	font-size: 13pt;
	font-family: "Nanum Gothic", sans-serif;
}
</style>

<script type="text/javascript">
function function1(val){
	var pw = document.getElementsByName('user_pw');
	var name = document.getElementsByName('user_name');
	var age = document.getElementsByName('user_age');
	
	if(pw[0].value.length<=5||pw[0].value.length>=10){
		alert("비밀번호는 6자리부터 9자리까지만 입력하셔야합니다.");
		pw[0].focus();
	}
	else if(name[0].value.length<=1||name[0].value.length>=6){
		alert("이름은 2자리부터 5자리까지 입력하셔야합니다.");
		name[0].focus();
	} else{
		var foot1 = document.f.user_foot1.value;
		var foot = document.f.user_foot;
		foot.value = foot1;
		
		var helper = document.f.user_helper.value;
		var user_helper = document.f.user_helper;
		if(helper=="on"){
			user_helper.value=1;
		}else if(helper=="off"){
			user_helper.value=0;
		}
		
		var enabled = document.f.user_enabled.value;
		var user_enabled = document.f.user_enabled;
		if(enabled=="on"){
			user_enabled.value=1;
		}else if(enabled=="off"){
			user_enabled.value=0;
		}
		
		var position11 = document.f.user_position11.value;
		var position12 = document.f.user_position12.value;
		var position13 = document.f.user_position13.value;
		var position1 = document.f.user_position1;
		var position2 = document.f.user_position2;
		var position3 = document.f.user_position3;
		position1.value = position11;
		position2.value = position12;
		position3.value = position13;

		var phone1 = document.f.user_phone1.value;
		var phone1 = document.f.user_phone1.value;

		var phone1 = document.f.user_phone1.value;
		var phone2 = document.f.user_phone2.value;
		var phone3 = document.f.user_phone3.value;
		var phone = document.f.user_phone;
		var a = phone3 + "-" + phone1 + "-" + phone2;
		phone.value = a;

		var birth1 = document.f.user_birth1.value;
		var birth2 = document.f.user_birth2.value;
		var birth3 = document.f.user_birth3.value;
		var birth = document.f.user_birth;
		var b = birth1 + "-" + birth2 + "-" + birth3;
		birth.value = b;

		
		var address1 = document.f.user_address1.value;
		var address2 = document.f.user_address2.value;
		var address3 = document.f.user_address3.value;
		var address = document.f.user_address;
		var c = address1 + "-" + address2 + "-" + address3;
		address.value = c;
		
		document.f.submit(); 
	}
}
</script>

<body>
<div class="center" align="center">
<p class="wow1"><img src="image/join.png"><b> 회원 정보 수정</b></p>
<form action="modify2.do" name="f" method="post" enctype="multipart/form-data">
<table class="list_table">
<colgroup>
<col style="width:30%;"/>
<col style="width:auto;"/>
</colgroup>

<tr>
<th>프로필 사진</th>
<td colspan="5"><img alt="" src="image/${login.user_profile }" style="width: 150px;"> </td>
</tr>

<tr>
<th>비밀번호</th>
<td colspan="5" style="text-align: left">
<input type="password" name="user_pw" value="${login.user_pw }" maxlength="8"></td>
</tr>

 <tr>
<th>이 름</th>
<td colspan="5" style="text-align: left">
<input type="text" name="user_name" value="${login.user_name }"></td>
</tr>
<tr>
<th>생년월일</th>
<%
	foot_user_DTO fudto = (foot_user_DTO)session.getAttribute("login");
	String user_birth = fudto.getUser_birth();
	String s1 =user_birth;
	String s[]=s1.split("-");
%>
<td colspan="5" style="text-align: left">
<input type="text" name="user_birth1" maxlength="4" size="4" value="<%=s[0]%>"onkeyPress="if ((event.keyCode<48) || (event.keyCode>57)) event.returnValue=false;">년

<input type="text" name="user_birth2"maxlength="2"size="2" value="<%=s[1]%>" onkeyPress="if ((event.keyCode<48) || (event.keyCode>57)) event.returnValue=false;">월

<input type="text" name="user_birth3" maxlength="2"size="2" value="<%=s[2]%>" onkeyPress="if ((event.keyCode<48) || (event.keyCode>57)) event.returnValue=false;">일
<input type="hidden" name="user_birth">
</td>
</tr>

<tr>
<th>나 이</th>
<td colspan="5" style="text-align: left"><input type="text" value="${login.user_age }"name="user_age"size="2" onkeyPress="if ((event.keyCode<48) || (event.keyCode>57)) event.returnValue=false;"></td>
</tr>
<tr>
<th>휴대폰</th>
<%
	
	String user_phone = fudto.getUser_phone();
	String s2 =user_phone;
	String ss[]=s2.split("-");
	
%>
<td colspan="5" style="text-align: left">
<select name="user_phone3">
<option><%=ss[0] %></option>
<option value="010">010</option>
<option value="011">011</option>
<option value="016">016</option>
<option value="019">019</option>
<option value="">기타</option>
</select> -
<input type="text" name="user_phone1" size="4" value="<%=ss[1] %>" maxlength="4"onkeyPress="if ((event.keyCode<48) || (event.keyCode>57)) event.returnValue=false;">-
<input type="text" name="user_phone2" size="4" value="<%=ss[2] %>" maxlength="4"onkeyPress="if ((event.keyCode<48) || (event.keyCode>57)) event.returnValue=false;">
<input type="hidden" name="user_phone">
</td>
</tr>
<tr>
<th>신 장</th>
<td colspan="5" style="text-align: left"><input type="text" value="${login.user_high }"name="user_high" onkeyPress="if ((event.keyCode<48) || (event.keyCode>57)) event.returnValue=false;" size="8px;">cm</td>
</tr>
<tr>
<th>체 중</th>
<td colspan="5" style="text-align: left"><input type="text" value="${login.user_weight }"name="user_weight" onkeyPress="if ((event.keyCode<48) || (event.keyCode>57)) event.returnValue=false;" size="8px;">kg</td>
</tr>
<tr>
<th>주 발</th>


<td colspan="5" style="text-align: left">
<select name="user_foot1">
<option value="${login.user_foot }">
<c:if test="${login.user_foot eq 0 }">
왼발
</c:if>
<c:if test="${login.user_foot eq 1 }">
오른발
</c:if>
<c:if test="${login.user_foot eq 2 }">
양발
</c:if>
</option>
<option value="0">왼발</option>
<option value="1">오른발</option>
<option value="2">양발</option>
</select>
<input type="hidden" name="user_foot">
</td>
</tr>

<tr>
<td colspan="6" style="text-align: left">
<img alt="" src="image/join1.png" width="5%">주포지션
<%
	String user_position1 = fudto.getUser_position1();
	String user_position2 = fudto.getUser_position2();
	String user_position3 = fudto.getUser_position3();
%>
<select name="user_position11">
								<option value="<%=user_position1%>"><%= user_position1%></option>
								<option value="GK">GK(골키퍼)</option>
								<option value="RB">RB(오른쪽 수비수)</option>
								<option value="LB">LB(왼쪽 수비수)</option>
								<option value="CB">CB(중앙 수비수)</option>
								<option value="CM">CM(중앙 미드필더)</option>
								<option value="CAM">CAM(공격형 미드필더)</option>
								<option value="CDM">CDM(수비형 미드필더)</option>
								<option value="LM">LM(왼쪽 윙어)</option>
								<option value="RM">RM(오른쪽 윙어)</option>
								<option value="ST">ST(스트라이커)</option>
								<option value="LWF">LWF(왼쪽 공격수)</option>
								<option value="RWF">RWF(오른쪽 공격수)</option>
</select>
<input type="hidden" name="user_position1"><br>
<img alt="" src="image/join1.png" width="5%">서브포지션1
<select name="user_position12">
								<option value="<%=user_position2%>"><%=user_position2%></option>
								<option value="GK">GK(골키퍼)</option>
								<option value="RB">RB(오른쪽 수비수)</option>
								<option value="LB">LB(왼쪽 수비수)</option>
								<option value="CB">CB(중앙 수비수)</option>
								<option value="CM">CM(중앙 미드필더)</option>
								<option value="CAM">CAM(공격형 미드필더)</option>
								<option value="CDM">CDM(수비형 미드필더)</option>
								<option value="LM">LM(왼쪽 윙어)</option>
								<option value="RM">RM(오른쪽 윙어)</option>
								<option value="ST">ST(스트라이커)</option>
								<option value="LWF">LWF(왼쪽 공격수)</option>
								<option value="RWF">RWF(오른쪽 공격수)</option>
</select>
<input type="hidden" name="user_position2"><br>


<img alt="" src="image/join1.png" width="5%">서브포지션2
<select name="user_position13">
								<option value="<%=user_position3%>"><%=user_position3%></option>
								<option value="GK">GK(골키퍼)</option>
								<option value="RB">RB(오른쪽 수비수)</option>
								<option value="LB">LB(왼쪽 수비수)</option>
								<option value="CB">CB(중앙 수비수)</option>
								<option value="CM">CM(중앙 미드필더)</option>
								<option value="CAM">CAM(공격형 미드필더)</option>
								<option value="CDM">CDM(수비형 미드필더)</option>
								<option value="LM">LM(왼쪽 윙어)</option>
								<option value="RM">RM(오른쪽 윙어)</option>
								<option value="ST">ST(스트라이커)</option>
								<option value="LWF">LWF(왼쪽 공격수)</option>
								<option value="RWF">RWF(오른쪽 공격수)</option>
</select>
<input type="hidden" name="user_position3">
</td>
</tr>
<tr>

<%
	
	String user_address = fudto.getUser_address();
	String s3 =user_address;
	String sss[]=s3.split("-");
	
%>




<th><img alt="" src="image/join2.png" width="15%">활동지역</th>
<td colspan="5" style="text-align: left">
<select name="user_address1">
<option value="<%=sss[0]%>"><%=sss[0]%></option>
<option value="강남구">강남구</option>
<option value="강동구">강동구</option>
<option value="강북구">강북구</option>
<option value="강서구">강서구</option>
<option value="관악구">관악구</option>
<option value="광진구">광진구</option>
<option value="구로구">구로구</option>
<option value="금천구">금천구</option>
<option value="노원구">노원구</option>
<option value="도봉구">도봉구</option>
<option value="동대문구">동대문구</option>
<option value="동작구">동작구</option>
<option value="마포구">마포구</option>
<option value="서대문구">서대문구</option>
<option value="서초구">서초구</option>
<option value="성동구">성동구</option>
<option value="성북구">성북구</option>
<option value="송파구">송파구</option>
<option value="양천구">양천구</option>
<option value="영등포구">영등포구</option>
<option value="용산구">용산구</option>
<option value="은평구">은평구</option>
<option value="종로구">종로구</option>
<option value="중구">중구</option>
<option value="중랑구">중랑구</option>
</select>

<select name="user_address2">
<option value="<%=sss[1]%>"><%=sss[1]%></option>
<option value="강남구">강남구</option>
<option value="강동구">강동구</option>
<option value="강북구">강북구</option>
<option value="강서구">강서구</option>
<option value="관악구">관악구</option>
<option value="광진구">광진구</option>
<option value="구로구">구로구</option>
<option value="금천구">금천구</option>
<option value="노원구">노원구</option>
<option value="도봉구">도봉구</option>
<option value="동대문구">동대문구</option>
<option value="동작구">동작구</option>
<option value="마포구">마포구</option>
<option value="서대문구">서대문구</option>
<option value="서초구">서초구</option>
<option value="성동구">성동구</option>
<option value="성북구">성북구</option>
<option value="송파구">송파구</option>
<option value="양천구">양천구</option>
<option value="영등포구">영등포구</option>
<option value="용산구">용산구</option>
<option value="은평구">은평구</option>
<option value="종로구">종로구</option>
<option value="중구">중구</option>
<option value="중랑구">중랑구</option>
</select>

<select name="user_address3">
<option value="<%=sss[0]%>"><%=sss[0]%></option>
<option value="강남구">강남구</option>
<option value="강동구">강동구</option>
<option value="강북구">강북구</option>
<option value="강서구">강서구</option>
<option value="관악구">관악구</option>
<option value="광진구">광진구</option>
<option value="구로구">구로구</option>
<option value="금천구">금천구</option>
<option value="노원구">노원구</option>
<option value="도봉구">도봉구</option>
<option value="동대문구">동대문구</option>
<option value="동작구">동작구</option>
<option value="마포구">마포구</option>
<option value="서대문구">서대문구</option>
<option value="서초구">서초구</option>
<option value="성동구">성동구</option>
<option value="성북구">성북구</option>
<option value="송파구">송파구</option>
<option value="양천구">양천구</option>
<option value="영등포구">영등포구</option>
<option value="용산구">용산구</option>
<option value="은평구">은평구</option>
<option value="종로구">종로구</option>
<option value="중구">중구</option>
<option value="중랑구">중랑구</option>
</select>
<input type="hidden" name="user_address">
</td>
</tr>
<tr>
         <th>용병 유무</th>
         <td style="text-align: left" colspan="5" >
			<c:if test="${login.user_helper == 0}">
			<input id="cmn-toggle-1"
			   class="cmn-toggle cmn-toggle-round" name="team_join"
			   type="checkbox"><label for="cmn-toggle-1"></label>
			</c:if>
			
			<c:if test="${login.user_helper == 1}">
				<input id="cmn-toggle-1"
				class="cmn-toggle cmn-toggle-round" name="team_join"
				type="checkbox" checked="checked"><label for="cmn-toggle-1"></label>   
			</c:if>
		</td>
</tr>
<tr>
         <th>정보 공개 유무</th>
         <td style="text-align: left" colspan="5">
         	<c:if test="${login.user_enabled == 0}">
			<input id="cmn-toggle-2"
			   class="cmn-toggle cmn-toggle-round" name="team_join"
			   type="checkbox"><label for="cmn-toggle-2"></label>
			</c:if>
			
			<c:if test="${login.user_enabled == 1}">
				<input id="cmn-toggle-2"
				class="cmn-toggle cmn-toggle-round" name="team_join"
				type="checkbox" checked="checked"><label for="cmn-toggle-2"></label>   
			</c:if>
         </td>
</tr>
<tr>
            <th>프로필사진</th> 
            <td colspan="5"><input type="file" name="file"></td>
         
         </tr>
<tr>
	<td class="btn" colspan="6">
		<button class="Join_Btn" value="수정" onclick="function1(this)">수정하기</button>&nbsp;&nbsp;&nbsp;
		<input type="button" class="Cancel_Btn" value="취소" value="취소" onclick="location.href='myinform.do'">
	</td>
</tr>

</table>

</form>
</div>
</body>