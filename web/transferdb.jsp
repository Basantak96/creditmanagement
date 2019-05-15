<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<% 
    String amt1=new String();
    String amt2=new String();
    String fromaccno=request.getParameter("acntno");
    String toaccno=request.getParameter("acntno1");
    String amt=request.getParameter("amnt");
     //int t=Integer.parseInt(cr);
    try
               {
        Connection con=null;
        PreparedStatement ps=null;
        PreparedStatement ps1=null;
        
        Class.forName("oracle.jdbc.OracleDriver");
        con=DriverManager.getConnection("Jdbc:Oracle:thin:@localhost:1521:XE","system","system");
        Statement st=con.createStatement();
         ResultSet rs=st.executeQuery("select cr from uinfo where userid='"+fromaccno+"'");
        while(rs.next())
                   {
            amt1=rs.getString(1);
        }                        
                           
			/*if(rs.next()){
			dataamount1=rs.getInt(2)-t;
                         String t1=String.valueOf(dataamount1); */               
        String sql="select cr from uinfo where userid =' "+toaccno+"  ' ";
        String sql2="update uinfo set cr=? where userid=' "+fromaccno+" ' ";
        String sql3="update uinfo set cr=? where userid=' "+toaccno+" ' ";
        Statement st1=con.createStatement ();
            ResultSet rs1=st1.executeQuery(sql);
         while(rs1.next())
         {
             amt2=rs1.getString(1);
         }                         
          amt1=Integer.toString(Integer.parseInt(amt1)-Integer.parseInt(amt));
          amt2=Integer.toString(Integer.parseInt(amt2)+Integer.parseInt(amt));                       
        ps=con.prepareStatement(sql2);
         ps.setString(1,amt1);
                 
       int i= ps.executeUpdate();
       ps1=con.prepareStatement(sql3);
       ps1.setString(1,amt2);
       int j=ps1.executeUpdate();
       //con=DriverManager.getConnection("Jdbc:Oracle:thin:@localhost:1521:XE","system","system");
       //ResultSet rs1=st.executeQuery("select cr from uinfo where userid='"+userid+"'");
        //int dataamount=0;
			/*if(rs1.next()){
			dataamount=rs.getInt(0)+t;
                           String t2=String.valueOf(dataamount1);  */                 
       /*String sql1="update uinfo set cr= where userid='"+userid1+"'";
        ps=con.prepareStatement(sql1);
        ps.setString(1,cr);
        
       int i1= ps.executeUpdate();*/
       
    if(i>0 && j>0)
    {
          %>
        <script>
            alert("transfer successful");
            window.location="index.jsp";
        </script>
        <%            
    }
    else
    {
        %>
        <script>
            alert("transfer unsuccessful");
            window.location="transfer.jsp";
        </script>
        
        <%
    
     }
           // }}
}
                       catch(Exception e)
    {
            out.println(e);
    }
        
%>