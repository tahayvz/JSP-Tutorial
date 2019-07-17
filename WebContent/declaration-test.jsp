<html>

<body>
<%-- This is JSP comment --%>
<%-- This is JSP comment --%>
<%-- This is JSP comment --%>

<%!
	String makeItLower(String data) {
		return data.toLowerCase();
	}
%>

<%! int i = 0; %> 
<% out.print(i);%> <br/>

<%= makeItLower("Hello World") %>

</body>
</html>