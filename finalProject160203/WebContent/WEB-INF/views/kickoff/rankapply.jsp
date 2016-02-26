<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<p style="width: 100%;background-color: black; color: white; font-family: -윤고딕310; margin: 0; font-size: 14pt;">
대전 신청 메세지를 상대팀에게 보내겠습니까?</p>
<br>
${pmd.team_managerid }
<input type="button" value="신청" onclick="location.href='messagerankapply.do?game_no=${pmd.game_no}&receiver_user_email=${pmd.team_managerid }&team_managerid=${pmd.team_managerid}&team_name=${pmd.team_name }&game_location=${pmd.game_location}&game_date=${pmd.game_date}&ground=${pmd.ground}'">
<input type="button" value="닫기" onclick="window.close()">
</body>
</html>