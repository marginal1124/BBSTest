<%@page pageEncoding="GB18030"%>
<%@ page import="java.sql.*, com.bbs.*, java.util.*"%>
<%!
private void  dele(Connection conn,int id,boolean isleaf){
	//删除所有的叶子节点
	//需要得到所有的叶子节点的id
	//delete(conn,child'id)
	//然后删除自己
	if(!isleaf){
		String sql = "select * from article  where pid = "+id;
		Statement stmt = DB.createStmt(conn);
		ResultSet  rs = DB.executeQuery(stmt, sql);
		
		
		try{
		while(rs.next()){
			dele(conn,rs.getInt("id"),rs.getInt("isleaf")==0);								
		}}catch(SQLException e){
			e.printStackTrace();
		}finally{
			DB.close(rs);
			DB.close(stmt);
		}
	}
	
	
	DB.executeUpdate(conn,"delete  from article where id ="+id);
	
	
}
%>
<!-- 链接数据库 -->
<%
int id = Integer.parseInt(request.getParameter("id"));
String url = request.getParameter("from");
System.out.println(url+"---2");
boolean isleaf = Boolean.parseBoolean(request.getParameter("isleaf"));

Connection conn = DB.getConn();

dele(conn, id, isleaf);

DB.close(conn);

response.sendRedirect(url);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>

</html>
