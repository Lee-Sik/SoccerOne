<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<fmt:requestEncoding value="utf-8"/>
<link href="CSS/BBStable.css" rel="stylesheet" >

<head>
<script type="text/javascript">
// function del(){
// alert("댓글 완료!");
// opener.parent.location.reload();
// }
</script>

<style type="text/css">
body, table{
    font-size: 12px;
    font-family: Montserrat, sans-serif;
}

</style>

</head>

게임 시퀀스 번호 : ${record.game_no}<br>
경기일자 : ${record.game_date}<br>
홈팀 지역 : ${record.home_local}<br>
승리팀  : ${record.win_team}<br>
스코어 : ${record.score}<br>
패배팀 : ${record.lose_team}<br>
어웨이팀 지역: ${record.away_local}<br>


<body>


</body>

