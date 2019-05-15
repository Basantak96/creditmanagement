<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title> "HumanyWelcomePage" </title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/arial.js"></script>
<script type="text/javascript" src="js/cuf_run.js"></script>
</head>
    <body bgcolor="skyblue">
<%@page import="java.sql.*"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<table align="center">
<th>NAME</th><th>userid</th><th>Balance</th><th>Email</th>
 <%
              String uid=request.getParameter("uid");
 String sql="select * from uinfo ";
 Connection con=null;
        PreparedStatement ps=null;
        Class.forName("oracle.jdbc.OracleDriver");
        con=DriverManager.getConnection("Jdbc:Oracle:thin:@localhost:1521:XE","system","system");
 Statement st=con.createStatement();
  ResultSet rs=st.executeQuery(sql);
  while(rs.next()){
  %>
  <tr>
  <td><%=rs.getString(4)%></td>
  <td><%=rs.getString(1)%></td>
  <td><%=rs.getString(2)%></td>
  <td><%=rs.getString(3)%></td>

  
  </tr>
  <%
  }    


    %>
</table> 
 <form action="transfer.jsp" method="post">
<table border="2"align="center"><tr><td>TO  TRANSFER THE MONEY GIVE THE USER_ID</td></tr>
    <tr><td>USER_ID<input name="actno" type="text"  placeholder="userid"></td></tr>
    <tr><td><input type="submit" value="view""></tr>
</table>
 </form>
</body>
</html>