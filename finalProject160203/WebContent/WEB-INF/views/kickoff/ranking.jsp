<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<fmt:requestEncoding value="utf-8"/>
<link href="CSS/KICKOFF.css" rel="stylesheet" >

<form action="./rankingAf.do" method="post">
	<input type="hidden" name="team_location" value="강서구">
	<input type="submit" value="강서구">
</form>
<form action="./rankingAf.do" method="post">
	<input type="hidden" name="team_location" value="마포구">
	<input type="submit" value="마포구">
</form>
<form action="./rankingAf.do" method="post">
	<input type="hidden" name="team_location" value="강남구">
	<input type="submit" value="강남구">
</form>
<form action="./rankingAf.do" method="post">
	<input type="hidden" name="team_location" value="영등포구">
	<input type="submit" value="영등포구">
</form>
<form action="./rankingAf.do" method="post">
	<input type="hidden" name="team_location" value="광진구">
	<input type="submit" value="광진구">
</form>
<form action="./rankingAf.do" method="post">
	<input type="hidden" name="team_location" value="송파구">
	<input type="submit" value="송파구">
</form>