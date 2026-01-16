<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String clear = request.getParameter("clear");
if ("true".equals(clear)) {
	session.invalidate();
	return;
}
String message = (String) request.getParameter("message");

if (message != null) {
	session.setAttribute("message", message);
}

message = (String) session.getAttribute("message");
if (message == null) {
	message = "";
}

session.setMaxInactiveInterval(60 * 3);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>registerMessage</title>
<style>
ul {
	list-style: none;
}
</style>

</head>
<body>
	<form method="get" action="registerMessage.jsp">
		<ul>
			<li><p>メッセージ</p> <textarea name="message">${sessionScope["message"]}</textarea></li>
			<li><input type="submit" value="登録" /></li>
			<li><a href="registerMessage.jsp?clear=true">セッション破棄</a></li>
		</ul>

	</form>
</body>
</html>