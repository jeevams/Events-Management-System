<%

String usr = (String)session.getAttribute("userid");
if(usr == null)
{
 response.sendRedirect("home.html");
}
else{
%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
 
<html>
    <head>
        <title>SELECT Operation</title>
        <script>
            function confirmGo(m,u) {
                if ( confirm(m) ) {
                    window.location = u;
                }
            }
        </script>
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
table{
	color:white;
	width:-moz-fit-content;
	height:-moz-fit-content;
		border:2px solid white;
	border-radius:15px;
	padding:20px;
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
		a{
			font-size:x-large;
			color:aqua;
			text-decoration:none;
		}
		</style>
    </head>
    <body>
 
        <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost/jeeva"
                           user="root"  password=""/>
 
        <sql:query dataSource="${dbsource}" var="result">
            SELECT * from event where eventtype='nontech';
        </sql:query>
    <div class="box" style="width:fit-content">
        <center>
        <form>
            <table cellspacing="20" cellpadding="3" bgcolor="black" style="margin-left:auto; margin-right:auto;">				<h1 style="color:white">Event List</h1>
                        <a href="logout.jsp"><button style="width: max-content;height: 40px;background: black;color: aliceblue;outline: none;border: 0;padding: 8px;border-radius: 5px;box-sizing: border-box;margin-top:-60px;margin-left:140px;position:absolute;">LOGOUT</button></a>
                <tr style="padding:8px;">
                    <th style="padding:8px;">EVENT NAME</th>
                    <th style="padding:8px;">EVENT TYPE</th>
                    <th style="padding:8px;">EVENT VENUE</th>
                    <th style="padding:8px;">EVENT TIME</th>
                </tr>
                <c:forEach var="row" items="${result.rows}">
                    <tr>
                        <td style="padding:8px;"><c:out value="${row.eventname}"/></td>
                        <td style="padding:8px;"><c:out value="${row.eventtype}"/></td>
                        <td style="padding:8px;"><c:out value="${row.eventvenu}"/></td>
                        <td style="padding:8px;"><c:out value="${row.eventtime}"/></td>     
                    </tr>
                </c:forEach>
            </table>
        </form>
		<c:if test="${not empty param.susMsg}">
         <font color="lightgreen" size="medium">   <h3><c:out value="${param.susMsg}" /></h3></font>
        </c:if>
		<c:if test="${not empty param.susMsgg}">
         <font color="lightgreen" size="medium">   <h3><c:out value="${param.susMsgg}" /></h3></font>
        </c:if>
        <a href="events.jsp">Go Home</a>
    </center>
	</div>
</body>
</html>
<%}%>
