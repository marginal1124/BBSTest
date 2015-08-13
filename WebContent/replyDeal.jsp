<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@ page  import="java.util.*,java.sql.*,com.bbs.*" %>
<%
   request.setCharacterEncoding("GBK");

   int pid = Integer.parseInt(request.getParameter("pid"));
   int rootId = Integer.parseInt(request.getParameter("rootId"));

   String title = request.getParameter("title");
   //System.out.println(title);
   String cont = request.getParameter("cont");
   //System.out.println(cont);
    
   
  
   
   //向数据库插入
   Connection  conn = DB.getConn();
   String sql = "insert into article values (null, ?, ?, ?, ?, now(), ?)";
   PreparedStatement pstmt = DB.prepaStmt(conn, sql);
   pstmt.setInt(1, pid);
   pstmt.setInt(2, rootId);
   pstmt.setString(3, title);
   pstmt.setString(4, cont);
   pstmt.setInt(5, 0);
   pstmt.executeUpdate();
   
   Statement stmt = DB.createStmt(conn);
   stmt.executeUpdate("update article set isleaf = 1 where id =" + pid);
   
   DB.close(pstmt);
   DB.close(conn);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>Insert title here</title>
</head>
<body>
回复成功
</body>
</html>