<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>        
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	function delete1(del,id) {
		alert(id);
		if (confirm("정말 삭제하시겠습니까??") == true){    //확인
			location.href="./stadiumDelete.do?stadium_seq=" + del + "&user_email=" + id;
		}else{   //취소
		    return;
		}
	}
</script>

<link href="CSS/booking.css" rel="stylesheet" type="text/css" />
</head>
<body>

			<!-- 콘텐츠 -->

				<div class="hb_wrap booking_wrap">
							
							<div class="book_list_top" style="width: 82.8%; margin-left: 30px;">
								<div class="manage_list">
									<ul>
                                           <c:forEach var="dto" items="${slist}" varStatus="vs">                                                                                     
                                            <li>
                                                <span class="num">${vs.count}</span>
                                                <span class="name">${dto.stadium_name}</span>
                                                <span class="btn"><a href="./stadium_write.do?mode=update&seq=${dto.stadium_seq}" class="sbbtn">축구장정보</a></span>
                                                <span class="btn"><a href="./booking_write.do?stadium_seq=${dto.stadium_seq}&stadium_name=${dto.stadium_name}" class="sbbtn">부킹등록</a></span>
                                                <span class="btn"><a href="#" class="del" onclick="delete1('${dto.stadium_seq}','${user_email}')">삭제</a></span>
                                            </li>
                                            </c:forEach>                                                                                       										<!---->
									</ul>
								</div>
								<div class="btn_group">
									<div class="right">
										<a href="./stadium_write.do" class="bbtn">구장등록</a>
									</div>
								</div>
							</div>
</div>


</body>
</html>