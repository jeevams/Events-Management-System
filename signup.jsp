<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%@ page import="java.sql.*"%>
<html>
<head>
  <title>DATA BASE CONNECTIVITY</title>
</head>
<body>  <%
  try{  
        Class.forName("com.mysql.jdbc.Driver");  
		        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jeeva","root","");
                      String name=request.getParameter("name1");
		String mail=request.getParameter("mailid");
		String phone=request.getParameter("phonenum");
		String pass=request.getParameter("password");
    String repass=request.getParameter("reenter");
		Statement stmt=con.createStatement();
		stmt.execute("INSERT INTO signup1 values('"+name+"','"+mail+"','"+phone+"','"+pass+"','"+repass+"')");
                                   response.sendRedirect("login.html");        
        


		
     }catch(Exception e){ out.println(e);}  

  %>
  </body>
  </html>
  