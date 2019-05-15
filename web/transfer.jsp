<!DOCTYPE html>
<!-- Website template by freewebsitetemplates.com -->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.3.2.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/arial.js"></script>
<script type="text/javascript" src="js/cuf_run.js"></script>
</head>
<body>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<table align="center">
<th>NAME</th><th>userid</th><th>Balance</th><th>Email</th>
 <%
              String uid=request.getParameter("actno");
 String sql="select * from uinfo where userid=' " +uid+" '";
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
</body>

<head>
	<meta charset="UTF-8">
	<title>MultiBanking Portal</title>
	<link rel="stylesheet" href="css/style.css" type="text/css">
</head>
<body>
	<div id="background">
		<div id="page">
			<div id="header">
				<div id="logo">
						</div>
				<div id="navigation">
					<ul>
						<li class="selected">
							<a href="index.jsp">            Home</a>
						</li>
						<li>
							<a href="profiledb.jsp">view user</a>
						</li>
						
					</ul>
                
				</div>
			</div>
                    
                                    <form action="transferdb.jsp" method="post">
			<table width="298" height="124" border="0" align="center" size="100">
  <tr>
    <td>From user no</td>
    <td><input name="acntno" type="text" required="true" placeholder="from account no"></td>
  </tr>
 
  <tr>
    <td>To user no</td>
    <td><input name="acntno1" type="text" required="true" placeholder="To account no"></td>
  </tr>
   <tr>
    <td>Amount</td>
    <td><input name="amnt" type="number" required="true" placeholder="Amount"></td>
  </tr>               
  <tr>
    <td>&nbsp;</td>
    <td><input type="submit" value="pay"></td>
  </tr>
</table>

			</form>
				</div>
				
</body>
</html>