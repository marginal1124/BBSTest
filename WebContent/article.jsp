<%@page pageEncoding="GB18030"%>
<%@ page import="java.sql.*, com.bbs.*, java.util.*"%>

<%
boolean logined = false;
String adminLogin = (String)session.getAttribute("adminLogin");
if(adminLogin!=null&&adminLogin=="true"){
	logined =true;
}


%>

<%!
private void  tree(List<Article> articles,Connection conn,int id,int grade){
	String sql = "select * from article  where pid = "+id;
	Statement stmt = DB.createStmt(conn);
	ResultSet  rs = DB.executeQuery(stmt, sql);
	
	
	try{
	while(rs.next()){
		
		Article a = new Article();
		a.innitFormRs(rs);
		
		a.setGrade(grade);
		
		articles.add(a);
		if(!a.isLeaf()){
			tree(articles,conn,rs.getInt("id"),grade+1);
		}
	}}catch(SQLException e){
		e.printStackTrace();
	}finally{
		DB.close(rs);
		DB.close(stmt);
	}
}
%>
<!-- �������ݿ� -->
<%
List<Article>  articles = new ArrayList<Article>();
Connection conn = DB.getConn();

tree(articles,conn,0,0);

DB.close(conn);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
<title>Java|Java����_������̳|ChinaJavaWorld������̳ : Java����*������</title>
<meta http-equiv="content-type" content="text/html; charset=GBK">
<link rel="stylesheet" type="text/css" href="images/style.css" title="Integrated Styles">
<script language="JavaScript" type="text/javascript" src="images/global.js"></script>
<link rel="alternate" type="application/rss+xml" title="RSS" href="http://bbs.chinajavaworld.com/rss/rssmessages.jspa?forumID=20">
<script language="JavaScript" type="text/javascript" src="images/common.js"></script>
</head>
<body>
<table border="0" cellpadding="0" cellspacing="0" width="100%">
  <tbody>
    <tr>
      <td width="140"><a href="http://bbs.chinajavaworld.com/index.jspa"><img src="images/header-left.gif" alt="Java|Java����_������̳|ChinaJavaWorld������̳" border="0"></a></td>
      <td><img src="images/header-stretch.gif" alt="" border="0" height="57" width="100%"></td>
      <td width="1%"><img src="images/header-right.gif" alt="" border="0"></td>
    </tr>
  </tbody>
</table>
<br>
<div id="jive-forumpage">
  <table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tbody>
      <tr valign="top">
        <td width="98%"><p class="jive-breadcrumbs">��̳: ������
            (ģ��)</p>

          </td>
      </tr>
    </tbody>
  </table>
  <div class="jive-buttons">
    <table summary="Buttons" border="0" cellpadding="0" cellspacing="0">
      <tbody>
        <tr>
          <td class="jive-icon"><a href="http://bbs.chinajavaworld.com/post%21default.jspa?forumID=20"><img src="images/post-16x16.gif" alt="����������" border="0" height="16" width="16"></a></td>
          <td class="jive-icon-label">
          <a id="jive-post-thread" href="new.jsp">
                       ����������</a> <a href="http://bbs.chinajavaworld.com/forum.jspa?forumID=20&amp;isBest=1"></a></td>
        </tr>
      </tbody>
    </table>
  </div>
  <br>
  <table border="0" cellpadding="3" cellspacing="0" width="100%">
    <tbody>
      <tr valign="top">
        <td><span class="nobreak"> ҳ:
          1,316 - <span class="jive-paginator"> [ <a href="http://bbs.chinajavaworld.com/forum.jspa?forumID=20&amp;start=0&amp;isBest=0">��һҳ</a> | <a href="http://bbs.chinajavaworld.com/forum.jspa?forumID=20&amp;start=0&amp;isBest=0" class="">1</a> <a href="http://bbs.chinajavaworld.com/forum.jspa?forumID=20&amp;start=25&amp;isBest=0" class="jive-current">2</a> <a href="http://bbs.chinajavaworld.com/forum.jspa?forumID=20&amp;start=50&amp;isBest=0" class="">3</a> <a href="http://bbs.chinajavaworld.com/forum.jspa?forumID=20&amp;start=75&amp;isBest=0" class="">4</a> <a href="http://bbs.chinajavaworld.com/forum.jspa?forumID=20&amp;start=100&amp;isBest=0" class="">5</a> <a href="http://bbs.chinajavaworld.com/forum.jspa?forumID=20&amp;start=125&amp;isBest=0" class="">6</a> | <a href="http://bbs.chinajavaworld.com/forum.jspa?forumID=20&amp;start=50&amp;isBest=0">��һҳ</a> ] </span> </span> </td>
      </tr>
    </tbody>
  </table>
  <table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tbody>
      <tr valign="top">
        <td width="99%"><div class="jive-thread-list">
            <div class="jive-table">
              <table summary="List of threads" cellpadding="0" cellspacing="0" width="100%">
                <thead>
                  <tr>
                    <th class="jive-first" colspan="3"> ���� </th>
                    <th class="jive-author"> <nobr> ����
                      &nbsp; </nobr> </th>
                    <th class="jive-view-count"> <nobr> ���
                      &nbsp; </nobr> </th>
                    <th class="jive-msg-count" nowrap="nowrap"> �ظ� </th>
                    <th class="jive-last" nowrap="nowrap"> �������� </th>
                  </tr>
                </thead>
                <tbody>
               <%
               System.out.print("ok");
               for(Iterator<Article> it = articles.iterator(); it.hasNext(); ) {
               	Article a = it.next();
      
               %>
                  <tr class="jive-even">
                    <td class="jive-first" nowrap="nowrap" width="1%"><div class="jive-bullet"> <img src="images/read-16x16.gif" alt="�Ѷ�" border="0" height="16" width="16">
                        <!-- div-->
                      </div></td>
                    <td nowrap="nowrap" width="1%">
                    <!--  ɾ��   ɾ��ĳ���ڵ㣬����Ƿ�Ҷ�ӽڵ㣬�������е��ӽڵ�ɾ�� -->
                   <%
                   /* ���Խ�URL ���ݵ�delete ҳ���У�Ȼ���ض��򵽸�ҳ�棬�����URL���в������Ϳ����������ݣ�û�в����Ļ��Ϳ���ֱ����delete �����ض��� */
                   String  url = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort();
                   url += request.getContextPath();
                   url += request.getServletPath();
                   url += (request.getQueryString()== null)?"":("?"+request.getQueryString()); 
                  
                   %>
                   <%if(logined){ %>
                    <a  href="delete.jsp?id=<%=a.getId() %>&isleaf =?<%=a.isLeaf() %>&pid=?<%=a.getPid() %>&from=<%=url %>" >Delete</a>
                    <%} %>
                    </td>
                    <td class="jive-thread-name" width="95%"><a id="jive-thread-1" href="articleDetail.jsp?id=<%= a.getId()%>"><%= a.getTitle() %></a></td>
                    <td class="jive-author" nowrap="nowrap" width="1%"><span class=""> <a href="http://bbs.chinajavaworld.com/profile.jspa?userID=226030">fei870407</a> </span></td>
                    <td class="jive-view-count" width="1%"> 104</td>
                    <td class="jive-msg-count" width="1%"> 5</td>
                    <td class="jive-last" nowrap="nowrap" width="1%"><div class="jive-last-post"> <%= new java.text.SimpleDateFormat("yyyy-MM-dd  HH:mm:ss").format(a.getPdate())%> <br>
                        by: <a href="http://bbs.chinajavaworld.com/thread.jspa?messageID=780182#780182" title="jingjiangjun" style="">jingjiangjun &#187;</a> </div></td>
                  </tr>
                  
                 <!--  <tr class="jive-odd">
                    <td class="jive-first" nowrap="nowrap" width="1%"><div class="jive-bullet"> <img src="images/read-16x16.gif" alt="�Ѷ�" border="0" height="16" width="16">
                        div
                      </div></td>
                    <td nowrap="nowrap" width="1%">&nbsp;
                      
                      &nbsp;</td>
                    <td class="jive-thread-name" width="95%"><a id="jive-thread-2" href="http://bbs.chinajavaworld.com/thread.jspa?threadID=744234&amp;tstart=25">�� �ֵ���ָ�������� ���󣬣���</a></td>
                    <td class="jive-author" nowrap="nowrap" width="1%"><span class=""> <a href="http://bbs.chinajavaworld.com/profile.jspa?userID=226028">403783154</a> </span></td>
                    <td class="jive-view-count" width="1%"> 52</td>
                    <td class="jive-msg-count" width="1%"> 2</td>
                    <td class="jive-last" nowrap="nowrap" width="1%"><div class="jive-last-post"> 2007-9-13 ����8:40 <br>
                        by: <a href="http://bbs.chinajavaworld.com/thread.jspa?messageID=780172#780172" title="downing114" style="">downing114 &#187;</a> </div></td>
                  </tr> -->
                   <%
                  } 
                  %> 
                  
                </tbody>
              </table>
            </div>
          </div>
          <div class="jive-legend"></div></td>
      </tr>
    </tbody>
  </table>
  <br>
  <br>
</div>
</body>
</html>