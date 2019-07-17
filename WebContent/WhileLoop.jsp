<%! int fontSize; %>
<html><head><title>WHILE LOOP EXAMPLE</title></head>

<body>

<%while ( fontSize <= 3){ %>
   <font color="green" size="<%= fontSize %>">
    JSP Tutorial
   </font><br />
<%fontSize++;%>
<%}%>
</body> 
</html>