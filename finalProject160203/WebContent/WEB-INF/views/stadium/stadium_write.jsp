<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="CSS/booking.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="CSS/styles.css">
<SCRIPT LANGUAGE="JavaScript" SRC="https://www.ionnuri.org/ks20/js/jquery/jquery.js"></SCRIPT>
<script type="text/javascript">
	
var num;

$(document).ready(function() {
	
	/* var count = 0; */
	
	$("#submitBt").click(function() {
		
		if($("#stadium_name").val() == ''){
			alert("구장명을 입력해주세요.");
			$("#stadium_name").focus();
			return;
		}
		if($("#addr1").val() == ''){
			alert("구장주소를 입력해주세요.");
			$("#addr1").focus();
			return;
		}
		if($("#s_content").val() == ''){
			alert("축구장사용 참고내용을 입력해주세요.");
			$("#s_content").focus();
			return;
		}
		if($("#findway").val() == ''){
			alert("찾아오는방법을 입력해주세요.");
			$("#findway").focus();
			return;
		}
		if($("#simg4").val() == ''){
			alert("구장사진은  4개 전부 넣어주어야 합니다.");
			$("#simg4").focus();
			return;
		}
		if($("#stadium_phone").val() == ''){
			alert("구장연락처를 입력해주세요.");
			$("#stadium_phone").focus();
			return;
		}
	/* 	if(count==0){
			alert("이메일을 인증해주세요.");
			return;
		} */
		alert("구장등록을 완료하였습니다.");
		
		$("#f1").submit();
	});
	
	/* $("#btnPnumber").click(function() {
		
		if($("#email").val() == '') {
			alert("이메일을 입력해주세요.");
			return;
		}
		<c:forEach var="dto" items="${ulist}" >
		if($("#email").val() == "${dto.user_email}" ){
			alert("중복된 이메일 입니다.");
			$("#email").val().focus();
			return;
		}
		</c:forEach>
		
		

		$("#emailFrame").fadeIn(350);
		$("#btnPnumber").attr("disabled",true);
					
		http = jQuery.ajax({
			url		: "./email.do",
	   		type	: "POST",
			data 	: 'receive='+$("#email").val()+'&result=${result}',
			dataType: 'html',
	   		async	: true,
			success : function(msg) {

				alert("인증번호가 메일로 발송되었습니다.");
				
				if(!f.emai.value) {
					alert("이메일주소를 입력해주세요.");
					return;
				} 

				num = msg;	
			}
	  	});

	}); */
	
	/* $("#btnresult").click(function() {
		
		var email_num = "${result}";
		alert(email_num);
		if($("#eresult").val()==email_num){
			alert("인증완료");
			count = 1;
		}else{
			alert("인증이 안됨.");
		}
	}); */

});


</script>

<style type="text/css">

td.td1 {
	background-color: #f4f4f4; 
	text-align: center;
	
}
td.td2 {
	background-color: #ffffff;
	text-align: left;
}

</style>

</head>



<form action="stadium_write_ok.do" method="post" enctype="multipart/form-data" id="f1" name="f1">

				<div class="hb_wrap booking_wrap">
							
							<div class="book_write" style="width: 95%; margin-top: -3%;">
					

                                    <ul class="input_list">
                                    	<li>
                                            <span class="title">등록자</span>
                                            <input type="text" class="title" id="user_email" name="user_email" value="${login.user_email}" vname="등록자" required="required" readonly="readonly" style="margin-left: -70%;"/>
                                        </li>
                                        <li>
                                            <span class="title">구장명</span>
                                            <input type="text" class="title" id="stadium_name" name="stadium_name" value="${dto.stadium_name}" vname="구장명" required="required" style="margin-left: -70%;"/>
                                        </li>
                                        <li><span class="title">구장주소</span>
                                            <a href="#" class="plusbtn" id="postBtn" style="margin-left: -87%;" onclick="javascript:window.open('./zipsearch.do','','location=0,status=0,scrollbars=1,width=530,height=330');">우편번호검색</a><br />                           
                                            <input type="text" readonly name="addr1" id="addr1"  value="${dto.addr}" class="zip" vname="주소" style="margin-left: -24%;" size="50"/> 
                                            <input type="text" name="addr2" value="상세주소" class="zip" vname="주소추가" required="required"/>
                                        </li>
                                        
                                        <li>
                                            <span class="title">축구장사용 참고내용</span>
                                            <div class="textwr" style="margin-left: -1.2%;">
                                                <textarea class="row5" name="s_content" id="s_content" vname="야구장사용 참고내용" required="required">${dto.s_content}</textarea>
                                            </div>
                                        </li>
                                        <li>
                                            <span class="title">찾아오는 방법</span>
                                            <div class="textwr" style="margin-left: -1.2%;">
                                                <textarea class="row6" name="findway" id="findway" vname="찾아오는 방법" required="required" >${dto.findway}</textarea>
                                            </div>
                                        </li>
                                        <li>
                                            <span class="title">구장사진</span>
                                            <ul class="inner_list">
                                                <li>
                                                    <span class="title" style="margin-left: -1.2%;">축구장 사진 1</span> 
                                                    <div class="file_wr"><input type="text" id="simg1" name="simg1" readonly value="${dto.stadium_img1}"/> 
                                                    <span class="btn_img">이미지첨부</span>
                                                    <input type="file" name="stadium_img11" class="groundimg" onchange="document.getElementById('simg1').value=this.value;"/>
                                                    <a href="#" class="del wdel" target_input="groundimg2">삭제</a></div>   
                                                </li>
                                                <li>
                                                    <span class="title" style="margin-left: -1.2%;">축구장 사진 2</span> 
                                                    <div class="file_wr"><input type="text" id="simg2" name="simg2" readonly value="${dto.stadium_img2}"/> 
                                                    <span class="btn_img">이미지첨부</span>
                                                    <input type="file" name="stadium_img22" class="groundimg" onchange="document.getElementById('simg2').value=this.value;"/>
                                                    <a href="#" class="del wdel" target_input="groundimg2">삭제</a></div>                                                </li>
                                                <li>
                                                    <span class="title" style="margin-left: -1.2%;">축구장 사진 3</span> 
                                                    <div class="file_wr"><input type="text" id="simg3" name="simg3" readonly value="${dto.stadium_img3}"/> 
                                                    <span class="btn_img">이미지첨부</span>
                                                    <input type="file" name="stadium_img33" class="groundimg" onchange="document.getElementById('simg3').value=this.value;"/>
                                                    <a href="#" class="del wdel" target_input="groundimg2">삭제</a></div>   
                                                <li>
                                                    <span class="title" style="margin-left: -1.2%;">축구장 사진 4</span> 
                                                    <div class="file_wr"><input type="text" id="simg4" name="simg4" readonly value="${dto.stadium_img4}"/> 
                                                    <span class="btn_img">이미지첨부</span>
                                                    <input type="file" name="stadium_img44" class="groundimg" onchange="document.getElementById('simg4').value=this.value;"/>
                                                    <a href="#" class="del wdel" target_input="groundimg2">삭제</a></div>   
                                            </ul>
                                        </li>
                                        <li>
                                            <span class="title">구장연락처</span>
                                            <input type="text" class="tel" name="stadium_phone" id="stadium_phone" value="${dto.stadium_phone}" vname="구장연락처" required="required" style="margin-left: -55%;"/>
                                        	<input type="hidden" name="mode" value="${mode}">
                                        	<c:if test="${mode == 'update'}">
                                        	<input type="hidden" name="stadium_seq" value="${dto.stadium_seq}">
                                        	</c:if>
                                        </li>
                                   <!--       <li>
                                            <span class="title">이메일 인증</span>
                                            <div class="textwr" style="margin-left: -1.2%;">
                                               	<input type="text" size="" name="email" id="email" value="" style="width: 200px; height: 20px;"/>
												<input type="button" name="btnPnumber" value="메일인증요청" id="btnPnumber" style="cursor:pointer;"/>
                                            </div>
                                        </li>
                                         <li>
                                            <span class="title">이메일 인증</span>
                                            <div class="textwr" style="margin-left: -1.2%;">
                                              <input type="text" name="eresult" id="eresult" size="" value="" style="width: 200px; height: 20px;"/>
											  <input type="button" name="btnresult" value="확인" id="btnresult" style="cursor:pointer;"/>
                                            </div>
                                        </li> -->
                                        
                                    </ul>


                               
								<div class="btn_group">
									<div class="right">
										<a href="#" class="bbtn" id="submitBt" onclick="">구장정보 등록하기</a>
										<a href="/booking/stadium/manage" class="sbbtn">목록보기</a>
									</div>
								</div>
							</div>
				</div>
</form>






















