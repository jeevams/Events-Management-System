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
        <title>JINSERT Operation</title>
    </head>
    <body>
        <a href="logout.jsp"><button>LOGOUT</button></a>
        <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost/jeeva"
                           user="root"  password=""/>
 
 
        <sql:update dataSource="${dbsource}" var="result">
            INSERT INTO event(eventname,eventtype,eventvenu,eventtime) VALUES (?,?,?,?);
            <sql:param value="${param.event_name}" />
            <sql:param value="${param.event_type}" />
            <sql:param value="${param.event_venu}" />
            <sql:param value="${param.event_time}" />
        </sql:update>
        <c:if test="${result>=1}">
            <c:redirect url="display.jsp" >
                <c:param name="susMsg" value="Event Added successfully !" />
            </c:redirect>
        </c:if> 
 
 
    </body>
</html>
<%}
%>