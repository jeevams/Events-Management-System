<%

String usr = (String)session.getAttribute("userid");
if(usr == null)
{
 response.sendRedirect("home.html");
}
else{
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
		<style>
				body{
			background:#5c2be2bd;
		}
		.box{
			background:#0006;
			width: -moz-fit-content;
			height: -moz-fit-content;
			top: auto;
			margin-left: auto;
			margin-right: auto;
			margin-top: auto;
			margin-bottom: initial;
			position: absolute;
			left: 50%;
			top: 50%;
			-webkit-transform: translate(-50%, -50%);
			transform: translate(-50%, -50%);
			padding:20px;
			border-radius:15px;
			font-size:16px;
	
			-webkit-box-shadow: 9px 9px 35px 9px rgba(227,167,107,1);
			-moz-box-shadow: 9px 9px 35px 9px rgba(227,167,107,1);
			box-shadow: 9px 9px 35px 9px rgba(227,167,107,1);
		}
form{
			color:#2cffffed;
}
a{
color:aqua;
font-size:x-large;
text-decoration:none;
}
table{
	color:white;
	width:-moz-fit-content;
	height:-moz-fit-content;
	padding:20px;
}
input[type="password"],input[type="text"],input[type="email"],input[type="tel"],textarea{
  		color: black;
  		background-color: orange;
  		border-radius: 8px;
  		width:200px;
  		font-size: inherit;
  		height: 40px;
      	outline: none;
  	}
tr{
	padding:5px;
}
th{
	font-size:x-large;
}
td{
	font-size:x-large;
}
		</style>
    </head>
    <body>
        <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost/jeeva"
                           user="root"  password=""/>
 
        <sql:query dataSource="${dbsource}" var="result">
            SELECT * from event where eventname=?;
            <sql:param value="${param.eventname}" />
        </sql:query>
 <div class="box">       <form action="updatedb.jsp" method="post">
            <table border="0" width="40%">
                <h1 style="color:white">Update Events</h1>
                    	<a href="logout.jsp"><button style="width: max-content;height: 40px;background: black;color: aliceblue;outline: none;border: 0;padding: 8px;border-radius: 5px;box-sizing: border-box;margin-top:-60px;margin-left:240px;position:absolute;">LOGOUT</button></a>
                <tr>
 					<th>Event Type</th>
 					<th>Event Venue</th>
 					<th>Event Time</th>
                </tr>
                <c:forEach var="row" items="${result.rows}">
                    <tr>
                        <td><input type="text" value="${param.eventname}" name="ename" readonly /></td>
                          <td>  <input type="text" value="${row.eventtype}" name="etype"/></td>
                        <td><input type="text" value="${row.eventvenu}" name="evenu"/></td>
                        <td><input type="text" value="${row.eventtime}" name="etime"/></td>
                        <td><input type="submit" style="width: max-content;height: 40px;background: black;color: aliceblue;outline: none;border: 0;padding: 8px;border-radius: 5px;box-sizing: border-box;" value="Update"/></td>
                    </tr>
                </c:forEach>
            </table>
            <a href="company.jsp">Go Home</a>
        </form>
		</div>
    </body>
</html>
<%}
%>