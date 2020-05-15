<%@page import="com.wrlus.caac.Search"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>搜索航班</title>
</head>
<body>
<h1>看看出题人坐过哪些航班</h1>
<form method="GET" action="/CAAC-SQL-Injection/">
	<input name="id" />
	<button type="submit">查询</button>
</form>
<% 
Enumeration<String> parameters = request.getParameterNames();
if(parameters.hasMoreElements()==true && parameters.nextElement().equals("id")) {
	String airparamter=request.getParameter("id");
	try {
		String result = Search.doSearch(airparamter);
		out.println("<br>");
		out.println(result);
	} catch(SecurityException e) {
		response.sendRedirect("/CAAC-SQL-Injection/waf.jsp");
	}
} else {
	return;
}
%>
</body>
</html>