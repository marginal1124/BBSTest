<%@ page pageEncoding="GB18030"%>
<%@ page import="java.sql.*,com.bbs.*"%>

<%
request.setCharacterEncoding("GBK");
String action = request.getParameter("action");
if (action != null && action.trim().equals("login")) {
	String  username = request.getParameter("username");
	String password = request.getParameter("password");
	
	if(username==""||!username.equals("admin")){
		out.println("username not correct!");
	} else if(password == null || !password.trim().equals("admin")) {
		out.println("password not correct!");
	}else{
		session.setAttribute("adminLogin", "true");
		response.sendRedirect("article.jsp");
	}
}


%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
	<head>
		<title>����Ա��¼</title>

	</head>
	<body>

		<form action="login.jsp" method="post">
			<input type="hidden" name="action" value="login"/>
			�û�����
			<input type="text" name="username" />
			<br>
			���룺
			<input type="password" name="password" />
			<br>
			<input type="submit" value="login" />
		</form>


	</body>
</html>
