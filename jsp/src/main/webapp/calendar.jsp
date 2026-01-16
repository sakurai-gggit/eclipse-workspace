<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,java.time.*"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%
LocalDate targetDate;
String yearStr = request.getParameter("year");
String monthStr = request.getParameter("month");
String dayStr = request.getParameter("day");
if (yearStr != null && monthStr != null && dayStr != null &&
!yearStr.isEmpty() && !monthStr.isEmpty() && !dayStr.isEmpty() ) {
	targetDate = 
			LocalDate.of(Integer.parseInt(yearStr), 
					Integer.parseInt(monthStr), 
					Integer.parseInt(dayStr));
} else {
	targetDate = LocalDate.now();
}
Date targetDateForJSTL = 
	Date.from(targetDate.atStartOfDay(ZoneId.systemDefault()).toInstant());
request.setAttribute("targetDate", targetDateForJSTL);

Map<String, String> eventMap = new HashMap<>();

eventMap.put("01-01", "元旦");
eventMap.put("02-14", "バレンタイン");
eventMap.put("04-01", "エイプリルフール");
eventMap.put("04-08", "花祭り");
eventMap.put("10-31", "ハロウィン");
eventMap.put("12-25", "クリスマス");
eventMap.put("12-24", "クリスマスイブ");
eventMap.put("12-31", "大晦日");
eventMap.put("12-30", "晦日");
eventMap.put("05-04", "工藤新一の誕生日");
eventMap.put("06-21", "黒羽快斗の誕生日");
eventMap.put("01-05", "テレンス・T・ダービーの誕生日");
eventMap.put("01-30", "吉良吉影");
eventMap.put("04-16", "ジョルノ");
eventMap.put("05-13", "シーザー");
eventMap.put("01-19", "ツェペリ");
eventMap.put("03-25", "アバッキオ");
eventMap.put("03-28", "広瀬康一");
eventMap.put("04-04", "ジョナサン");
eventMap.put("09-27", "ジョセフ");

String key = String.format("%02d-%02d",
	targetDate.getMonthValue(),targetDate.getDayOfMonth());
if (eventMap.containsKey(key)) {
	request.setAttribute("event", eventMap.get(key));
}

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>カレンダー</title>
</head>
<body>
<c:set var="dateStr" >
<fmt:formatDate value="${targetDate}" pattern="yyyy/MM/dd-E" />
</c:set>
<c:out value="${fn:replace(dateStr,'-',' (')}" />)
	<%--<fmt:formatDate value="${targetDate}" pattern="yyyy/MM/dd (E)" />  --%><br>
		<c:if test="${not empty event}">
			<c:out value="${event}" />
		</c:if>
		<hr>
		<form method="post" action="calendar.jsp">
			年<input type="text" name="year" maxlength=4 /> 
			月<input type="text" name="month" maxlength=2 /> 
			日<input type="text"name="day" maxlength=2 /><br> 
			<input type="submit" value="送信" />
		</form>
</body>
</html>
