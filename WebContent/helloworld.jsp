<html>

<body>

<h3>Hello World of Java!</h3>

The time on the server is <%= new java.util.Date() %>
<br/>
<%
out.println("Your IP address is " + request.getRemoteAddr());
%>
<br/>

</body>

</html>