<%@page import="soccer.co.DTO.foot_user_DTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
  
</head>
<body>
	<h1>createTeam</h1>
	<form action="createTeamAf.do" method="post">
		<table>
			<tr>
				<td>팀장 명</td>
				<td>${login.user_email}(${login.user_name})</td>
			</tr>
			<tr>
				<td>팀 명</td>
				<td><input type="text" name="team_name"></td>
			</tr>
			<tr>
				<td>팀 소개</td>
				<td><textarea name="team_intro" rows="5" cols="50"></textarea>
				</td>
			</tr>

			<tr>
				<td>주 활동 지역</td>
				<td><select name="team_location1">
				<c:forEach items="${list}" var="vo">
					<option>${vo}</option>				
				</c:forEach>
				</select>
				</td>
			</tr>
			<tr>
				<td>활동 지역</td>
				<td><select name="team_location2">
				<c:forEach items="${list}" var="vo">
					<option>${vo}</option>				
				</c:forEach>
				</select>
				</td>
			</tr>
			<tr>
				<td>활동 지역</td>
				<td><select name="team_location3">
				<c:forEach items="${list}" var="vo">
					<option>${vo}</option>				
				</c:forEach>
				</select>
				</td>
			</tr>

			<tr>
				<td>팀 모집 유무</td>
				<td><input type="text" name="team_join"></td>
			</tr>
			<tr>
				<td>팀 정보 공개 유무</td>
				<td><input type="text" name="team_open"></td>
			</tr>
			<tr>
				<td>홈구장 유무</td>
				<td><input type="text" name="team_home"></td>
			</tr>
			<tr>
				<td>팀로고</td>
				<td><input type="file" name="team_logo"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="팀 생성"></td>
			</tr>
		</table>
	</form>
	      <div class="switch">
            <input id="cmn-toggle-1" class="cmn-toggle cmn-toggle-round" type="checkbox">
            <label for="cmn-toggle-1"></label>
          </div>
</body>
</html>