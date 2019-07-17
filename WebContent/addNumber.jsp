<html>
 
<body>
 
<%
	String command = request.getParameter("command");
	
	int firstNumber = Integer.parseInt(request.getParameter("firstNumber"));
	int secondNumber = Integer.parseInt(request.getParameter("secondNumber"));
 
	String operation = null;
	int result = 0;
	
	switch (command) {
	
		case "Add":
			operation = "+";
			result = firstNumber + secondNumber;
			break;
		case "Subtract":
			operation = "-";
			result = firstNumber - secondNumber;
			break;
		default:
			operation = "Unknown";
	}
%>
 
Calculator result: <%= firstNumber %> <%= operation %> <%= secondNumber %> = <%= result %>
</body>
</html>