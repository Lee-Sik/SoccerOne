<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="soccer.co.DTO.foot_team_DTO"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="CSS/teamview.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>팀 정보</title>
</head>
<body>
	<c:if test="${empty teamViewDTO}">
		팀 정보가 비공개 입니다.
	</c:if>
	<c:if test="${not empty teamViewDTO}">
		<table class="list_table" style="width: 70%;">	
			<tr>
				<td colspan="2">클럽 정보</td>
			</tr>
			<tr>	
				<th rowspan="2">클럽명</th>
				<td><img src="./image/${teamViewDTO.team_logo}" width="100px;"></td>
			</tr>
			<tr>	
				<td>${teamViewDTO.team_name}</td>
			</tr>
			<tr>	
				<th>클럽장</th>
				<td>${teamViewDTO.team_managerid}</td>
			</tr>
			<tr>	
				<th>팀소개</th>
				<td>${teamViewDTO.team_intro}</td>
			</tr>
			<tr>	
				<th>총원</th>
				<td>${teamViewDTO.team_menbernum}</td>
			</tr>
			
			<tr>	
				<th>홈구장</th>
				<td>${teamViewDTO.team_home}</td>
			</tr>
			<tr>	
				<th>지역구</th>
				<td>${teamViewDTO.team_location1}</td>
			</tr>
		</table>
		
		
		
	</c:if>

</body>
</html>