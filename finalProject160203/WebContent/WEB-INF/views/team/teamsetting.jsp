<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="CSS/styles.css" rel="stylesheet" >
</head>
<body>
<table>
<tr>
<td>팀로고</td>
<td><img alt="" src="image/${team.team_logo }"></td>
</tr>
<tr>
<td>팀이름</td>
<td>${team.team_name}</td>
</tr>
<tr>
<td>팀정보</td>
<td>${team.team_intro}</td>
</tr>
<tr>
<td>팀인원</td>
<td>${team.team_menbernum}</td>
</tr>
<tr>
<td>팀 활동지역</td>
<td>${team.team_position1}/${team.team_position2}/${team.team_position3}</td>
</tr>
<tr>
<td>팀 구장</td>
<td>${team.team_home}</td>
</tr>
<tr>
         <th>팀원 구인 유무</th>
         <td style="text-align: left" colspan="5" ><input id="cmn-toggle-1" class="cmn-toggle cmn-toggle-round" name="team_join" type="checkbox">
         <label for="cmn-toggle-1"></label></td>
</tr>
<tr>
         <th>팀 정보 공개 유무</th>
         <td style="text-align: left" colspan="5"><input id="cmn-toggle-2" class="cmn-toggle cmn-toggle-round" name="team_open" type="checkbox">
         <label for="cmn-toggle-2"></label></td>
</tr>
</table>
</body>
</html>