<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<html>
<body>
<%@ page import ="java.sql.*" %>
<%

    String userid = request.getParameter("name1");    
    String pwd = request.getParameter("password");
    if(userid.equals("admin") && pwd.equals("admin"))
          {
            session.setAttribute("userid", userid);
          response.sendRedirect("company.jsp");}
   else
{

    Class.forName("com.mysql.jdbc.Driver");  
		        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jeeva","root","");Statement st = con.createStatement();
   
    ResultSet rs;
    rs = st.executeQuery("select * from signup1  where name='" +userid+ "' and pass='" +pwd+ "'");	
     if (rs.next()) 
        {
            
            session.setAttribute("userid", userid);
            response.sendRedirect("events.jsp");
           
        } 

    else 
         {%>
           <script type="text/javascript">
               window.alert("invalid username or password");    </script>
               <% response.sendRedirect("signup.html"); %>
       
  <%
        
        
         }
}

%>
</body>
</html>