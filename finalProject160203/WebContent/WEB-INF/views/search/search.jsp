<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="CSS/find.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<!-- // jQuery 기본 js파일 -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<!-- // jQuery UI 라이브러리 js파일 -->
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$("#ids").click(function(){
		$("#ids").attr('class','on searchKind');
		$("#pws").attr('class','searchKind');
		$("#idsearch").css("display", "block");
		$("#pwsearch").css("display", "none");
	});
	$("#pws").click(function(){
		$("#ids").attr('class','searchKind');
		$("#pws").attr('class','on searchKind');
		$("#pwsearch").css("display", "block");
		$("#idsearch").css("display", "none");
		
	});
	$("#idresult").click(function(){
		
		var name = $("#id_user_name").val();
		var phone = $("#id_phone").val();
		
		if(name==""){
			alert("이름을 입력하십시오.");
			return;
		}else if(phone==""){
			alert("휴대폰을 입력하십시오.");
			return;
		}else{
			var count = 0;
			<c:forEach var="dto" items="${ulist}" >
			if(name == "${dto.user_name}" && phone == "${dto.user_phone}"){
				var email = "${dto.user_email}"
				alert("입력하신 정보와 일치하는 아이디는[ " + email + " ]입니다.");	
				count = 1;
				return;
			}
			</c:forEach>
			
			if(count==0){
				alert("입력하신 정보와 일치하는 아아디가 없습니다.");
				return;
			}
		}
	});
	
	$("#pwresult").click(function(){
		
		var email = $("#pw_user_email").val();
		var name = $("#pw_user_name").val();
		var phone = $("#pw_phone").val();
		
		if(email==""){
			alert("이메일을 입력하십시오.");
			return;
		}else if(name==""){
			alert("이름을 입력하십시오.");
			return;
		}else if(phone==""){
			alert("휴대폰을 입력하십시오.");
			return;
		}else{
			var count = 0;
			<c:forEach var="dto" items="${ulist}" >
			if(email == "${dto.user_email}" && name == "${dto.user_name}" && phone == "${dto.user_phone}"){
				var pw = "${dto.user_pw}"
				
				$("#emailFrame").fadeIn(350);
				$("#pwresult").attr("disabled",true);
							
				http = jQuery.ajax({
					url		: "./infoFind.do",
			   		type	: "POST",
					data 	: 'receive='+email+'&result='+pw,
					dataType: 'html',
			   		async	: true,
					success : function(msg) {

						alert("비밀번호가 입력하신 메일로 발송되었습니다.");
						
						if(!f.emai.value) {
							alert("이메일주소를 입력해주세요.");
							return;
						} 

						num = msg;	
					}
			  	});
				
				
				count = 1;
				return;
			}
			</c:forEach>
			
			if(count==0){
				alert("입력하신 정보와 일치하는 패스워드가 없습니다.");
				return;
			}
		}
	});
	
	
	
	
});

</script>

</head>
<body>
<form id="authForm" name="authForm" method="post" action="/member/search/id">
		<input type="hidden" name="encPsnlInfo" />
		<input type="hidden" name="is_auth" id="is_auth" value="F" />
		<input type="hidden" name="returnEncrypt" id="returnEncrypt" value="" />
		<input type="hidden" name="searchKind" id="searchKind" value="id" />
		<input type="hidden" name="inputJson" id="inputJson" value="" />
		<div class="JoinWr">
			<h2 class="find">싸커원 회원정보 찾기</h2>
			<div class="findForm">
				<div class="tab_id-or-pass">
					<ul class="tab-nav nav_ip">				
						<li class="on searchKind" go="find_id" searchKind="id" id="ids"> 이메일찾기 </li>
						<li class="searchKind" go="find_pass" searchKind="pw" id="pws">비밀번호찾기</li>
					</ul>
					<div class="find on find_id" to="find_id" id="idsearch">
						<div class="tab_recieve">
							<ul class="nav_rv">
								<li go="rv_hp"><label><input type="radio" name="search_method" value="P" checked /><span class="hp">휴대폰</span></label></li>
							<!-- 	<li go="rv_email"><label><input type="radio" name="search_method" value="E" /><span class="email">이메일</span></label></li> -->
							</ul>
							<div class="recieve on P" to="rv_hp">
								<dl class="input_list">
									<dt>이름</dt>
									<dd><input type="text" name="id_user_name" id="id_user_name"/></dd>
									<dt>휴대폰</dt>
									<dd><input type="text" name="id_phone" id="id_phone" class="phone" /></dd>
									
								</dl>
							</div>
						
						</div>
						<div class='btn_gr'>
							<!-- <a href="javascript:history.go(-1);" class="btn_prev"><span>이전단계</span></a> -->
							<a href="#none" class="btn_confirm searchBtn" id="idresult"><span>확인</span></a>
						</div>
					</div>
					
					<div class="find find_pw" to="find_pass" id="pwsearch">
						<div class="tab_recieve">
							<ul class="nav_rv">
								<li go="rv_hp"><label><input type="radio" name="search_method" value="P" checked="checked"/><span class="hp">휴대폰</span></label></li>
								<!-- <li go="rv_email"><label><input type="radio" name="search_method" value="E" /><span class="email">이메일</span></label></li>
								<li go="rv_ipin"><label><input type="radio" name="search_method" value="I" /><span class="ipin">i-PIN</span></label></li> -->							</ul>
							<div class="recieve on P" to="rv_hp">
								<dl class="input_list">
									<dt>아이디</dt>
									<dd><input type="text" name="pw_user_email" id="pw_user_email" /></dd>
									<dt>이름</dt>
									<dd><input type="text" name="pw_user_name" id="pw_user_name"/></dd>
									<dt>휴대폰</dt>
									<dd><input type="text" name="pw_phone" id="pw_phone" class="phone" /></dd>
									
								</dl>
							</div>
						
						</div>
						<div class='btn_gr'>
							<!-- <a href="javascript:history.go(-1);" class="btn_prev"><span>이전단계</span></a> -->
							<a href="#none" class="btn_confirm searchBtn" id="pwresult"><span>확인</span></a>
						</div>
					</div>
				</div>
				
			</div>
			
		</div>
	</form>
</body>
</html>