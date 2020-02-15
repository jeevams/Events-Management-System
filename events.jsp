<%
String usr = (String)session.getAttribute("userid");
if(usr == null)
{
 response.sendRedirect("home.html");
}
else{
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
		<style>
				body{
					background-image: linear-gradient(to right, #00dbde 0%, #fc00ff 100%);
		}
		.box{
			background:#0006;
			width: 500px;
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
			color:white;
			-webkit-box-shadow: 9px 9px 35px 9px rgba(227,167,107,1);
			-moz-box-shadow: 9px 9px 35px 9px rgba(227,167,107,1);
			box-shadow: 9px 9px 35px 9px rgba(227,167,107,1);
			align-items:center;
		}
		a{
			font-size:x-large;
			color:aqua;
			text-decoration:none;
		}
		</style>
    </head>
    <body>
	<div class="box">
        <center><h1 style="color:white;">Welcome <%=usr%></h1>
    	<a href="logout.jsp"><button style="width: max-content;height: 40px;background: black;color: aliceblue;outline: none;border: 0;padding: 8px;border-radius: 5px;box-sizing: border-box;margin-top:-60px;margin-left:140px;position:absolute;">LOGOUT</button></a>
        </center> 
      <table>
		<tbody>
			<tr>
				<td style="padding-left:45px">
					<a href="tech.jsp"><b>TECH EVENTS </b>
					<img src="tech.jpg" style="height:18%;padding-left:20px;">
					</a>
				</td>
				<td style="padding-left:20px">
					<a href="nontech.jsp"><b>NON-TECH EVENTS</b>
					<img src="nontech.png" style="height:20%;padding-left:20px;">
					</a>
				</td>
			</tr>
		</tbody>
      </table>
		</div>
    </body>
</html>
<%}
%>