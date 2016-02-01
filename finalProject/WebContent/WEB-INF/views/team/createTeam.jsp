<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>createTeam</h1>
<!-- create table team(  --순수 팀에 대한 정보  -->
<!-- team_managerid varchar2(50) not null,   --팀장 아이디 foreign key -->
<!-- team_name varchar2(50) PRIMARY KEY,        --팀이름 -->
<!-- team_intro varchar2(500) not null,      --팀소개 -->
<!-- team_menbernum number(2) not null,      --팀맴버 수 -->
<!-- team_location1 varchar2(50) not null,   --팀지역 주활동1 -->
<!-- team_location2 varchar2(50) not null,   --팀지역 주활동2 -->
<!-- team_location3 varchar2(50) not null,   --팀지역 주활동3 -->
<!-- team_message number(10) default 0,    	--팀 메시지 수 -->
<!-- team_join number(2) not null,		        --팀원 모집 유(1)무(0) -->
<!-- team_open number(2) not null,           --공개비공개 유무 -->
<!-- team_home varchar(50),                  --팀홈구장 유무 예)null, 수원시 팔달구 우만초등학교 운동장 -->
<!-- team_logo varchar2(50)                  --로고 이미지 위치 -->
<!-- ); -->
<form action="createTeamAf.do" method="post">

team_managerid<input type="text" name="team_managerid"><br>
team_name<input type="text" name="team_name"><br>
team_intro<input type="text" name="team_intro"><br>
team_menbernum<input type="text" name="team_menbernum"><br>
team_location1<input type="text" name="team_location1"><br>
team_location2<input type="text" name="team_location2"><br>
team_location3<input type="text" name="team_location3"><br>
team_message<input type="text" name="team_message"><br>
team_join<input type="text" name="team_join"><br>
team_open<input type="text" name="team_open"><br>
team_home<input type="text" name="team_home"><br>
team_logo<input type="text" name="team_logo"><br>
<input type="submit" name="팀 생성">

</form>
</body>
</html>