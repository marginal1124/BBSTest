<%@page pageEncoding="GB18030"%>
<%@ page import="java.sql.*, com.bbs.*, java.util.*"%>
<%!
private void  dele(Connection conn,int id,boolean isleaf){
	//ɾ�����е�Ҷ�ӽڵ�
	//��Ҫ�õ����е�Ҷ�ӽڵ��id
	//delete(conn,child'id)
	//Ȼ��ɾ���Լ�
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
<!-- �������ݿ� -->
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
