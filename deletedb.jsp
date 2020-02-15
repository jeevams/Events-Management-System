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
    </head>
    <body>
        <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost/jeeva"
                           user="root"  password=""/>
        <sql:update dataSource="${dbsource}" var="count">
            DELETE FROM event
            WHERE eventname='${param.eventname}'
        </sql:update>
        <c:if test="${count>=1}">
			<c:redirect url="display.jsp" >
                <c:param name="susMsg" value="Event deleted
            successfully." />
            </c:redirect>		
        </c:if>
    </body>
</html>
<%}%>