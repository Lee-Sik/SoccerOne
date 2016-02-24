<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link href="CSS/clubview.css" rel="stylesheet" type="text/css">
<head>
<!-- <style type="text/css"> -->
<!-- table.bbslistta { -->
<!-- 	border: 1px solid #E6E6E6; -->
<!-- 	border-collapse: collapse; -->
<!-- } -->

<!-- th { -->
<!-- 	border-bottom: 1px solid #E6E6E6; -->
<!-- 	border-collapse: collapse; -->
<!-- 	padding-top: 10px; -->
<!-- 	padding-bottom: 10px; -->
<!-- 	font-family: -윤고딕330; -->
<!-- 	font-size: 10pt; -->
<!-- } -->

<!-- td { -->
<!-- 	border-bottom: 1px solid #E6E6E6; -->
<!-- 	border-collapse: collapse; -->
<!-- 	font-family: -윤고딕320; -->
<!-- 	font-size: 10pt; -->
<!-- 	padding-top: 5px; -->
<!-- 	padding-bottom: 5px; -->
<!-- 	text-align: center; -->
<!-- } -->
<!-- </style> -->

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- <link href="CSS/styles.css" rel="stylesheet"> -->
</head>

<body>

		<form action="teamsetting1.do" method="post" name="f"
			enctype="multipart/form-data">
			<table class="list_table" style="width:70%;">
				<colgroup>
				<col width="15%"/>
				<col width="70%"/>
				</colgroup>
				<tr>
					<th>팀로고</th>
					<td><img alt="" src="image/${team.team_logo }"
						style="width: 20%"><br> <input type="file" name="file">
					</td>
				</tr>
				<tr>
					<th>팀이름</th>
					<td style="text-align: left;"><input type="text" name="team_name"
						value="${team.team_name}" size="40"></td>
				</tr>
				<tr>
				<th>팀 관리자</th>
				<td style="text-align: left;">
				<select name="team_managerid">
				 <c:forEach var="j" items="${getteammember }">
				<option value="${j.user_email }">${j.user_email }(${j.user_name })</option>
				</c:forEach>
				</select>
				
				</td>
				
				</tr>
				<tr>
					<th>팀정보</th>
					<td style="text-align: left;"><textarea name="team_intro" cols="40" rows="10">${team.team_intro}</textarea>
					</td>
				</tr>
				<tr>
					<th>팀인원</th>
					<td style="text-align: left;">${team.team_menbernum}</td>
				</tr>
				<tr>
					<th><img alt="" src="image/join2.png" width="15%">활동지역</th>
					<td  style="text-align: left;"><select name="team_location1">
							<option value="${team.team_location1 }">${team.team_location1 }</option>
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
					</select> <select name="team_location2">
							<option value="${team.team_location2 }">${team.team_location2 }</option>
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
					</select> <select name="team_location3">
							<option value="${team.team_location3 }">${team.team_location3 }</option>
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
					</select> <input type="hidden" name="user_address"></td>
				</tr>
				<tr>
					<th>팀 구장</th>
					<c:if test="${not empty team.team_home}">
						<td style="text-align: left;"><input type="text" name="team_home"
							value="${team.team_home }" id="addr1" size="70"><a href="#"
							onclick="javascript:window.open('./post.do','','location=0,status=0,scrollbars=1,width=530,height=330');">
								<img src="image/wofun.png">
						</a> </td>
					</c:if>
					<c:if test="${empty team.team_home}">
						<td style="text-align: left;"><input type="text" name="team_home" value="no home"
							id="addr1" size="50"><a href="#"
							onclick="javascript:window.open('./post.do','','location=0,status=0,scrollbars=1,width=530,height=330');">
								<br><img src="image/wofun.png">
						</a> </td>
					</c:if>
				</tr>
				
				<tr>
					<th>팀원 구인 유무</th>
					
					<td style="text-align: center">
					<c:if test="${team.team_join == 0}">
					<input id="cmn-toggle-1"
						class="cmn-toggle cmn-toggle-round" name="team_join"
						type="checkbox"><label for="cmn-toggle-1"></label>
					</c:if>
					
					<c:if test="${team.team_join == 1}">
					<input id="cmn-toggle-1"
					class="cmn-toggle cmn-toggle-round" name="team_join"
					type="checkbox" checked="checked"><label for="cmn-toggle-1"></label>	
					</c:if>
					</td>
				</tr>
				
				<tr>
					<th>팀 정보 공개 유무</th>
					<td style="text-align: center">
					<c:if test="${team.team_open == 0}">
					<input id="cmn-toggle-2"
						class="cmn-toggle cmn-toggle-round" name="team_open"
						type="checkbox"> <label for="cmn-toggle-2"></label>
					</c:if>
					
					<c:if test="${team.team_open == 1}">
					<input id="cmn-toggle-2"
					class="cmn-toggle cmn-toggle-round" name="team_open"
					type="checkbox" checked="checked"><label for="cmn-toggle-2"></label>
					</c:if>
					</td>
				</tr>

			</table>
			<script type="text/javascript">
				var join = document.f.team_join.value;
				var team_join = document.f.team_join;
				if (join == "on") {
					team_join.value = 1;
				} else if (join == "off") {
					team_join.value = 0;
				}

				var open = document.f.team_open.value;
				var team_open = document.f.team_open;
				if (open == "on") {
					team_open.value = 1;
				} else if (open == "off") {
					team_open.value = 0;
				}
			</script>
			<input type="submit" value="수정">
			<br><br><br>
			
		</form>
</body>
</html>