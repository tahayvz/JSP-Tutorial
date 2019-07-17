<%@ page import="java.util.*" %> <!--  We make use of the List and ArrayList from this package. -->

<html>
<body>

<!-- each browser have unique session object and session stored in tomcat server. Each user have own 
session ID and tomcat assign it-->

<!-- Step 1: Create HTML form -->
<!-- This code creates an HTML form. The action will point back to the same JSP. So effectively, 
we are submitting form data back to ourselves. This form will read a text input from the user. 
The field is named "theItem". We'll read this field later to add it to your list. The form also includes 
a submit button. -->

<form action="todo-demo.jsp">
	Add new item: <input type="text" name="theItem" />
	
	<input type="submit" value="Submit" />
</form>

<!-- Step 2: Add new item to "To Do" list -->
<%
	// get the TO DO items from the session 
	List<String> items = (List<String>) session.getAttribute("myToDoList");

/*This section of code access the JSP session object. The session object is unique for each web user. 
We attempt to get the TO DO items from the session. We make use of the attribute name "myToDoList". 
This is basically the key/label to look up data from the session.
The session.getAttribute method will always return something of type java.lang.Object. We downcast this
to List<String> because we are making use of strings to keep track of our to do items.
This is assigned to the variable "items". This variable holds an object reference to the data that we 
retrieved from the session object. We can use this variable later in the program to add items and also 
display items.*/

	// if the TO DO items doesn't exist, then create a new one
	if (items == null) {
		items = new ArrayList<String>();
		session.setAttribute("myToDoList", items);
	}
	
	// see if there is form data to add
	String theItem = request.getParameter("theItem");
	if ((theItem != null) && (!theItem.trim().equals("")) ) {
		items.add(theItem);
		response.sendRedirect("todo-demo.jsp"); 

	}
%>

<!-- Step 3: Display all "To Do" item from session -->
<hr>
<b>To List Items:</b> <br/>

<ol>
<%
	for (String temp : items) {
		out.println("<li>" + temp + "</li>");
	}

%>

</ol>

<% out.print( session.getId());%> <br/>
	${pageContext.session.id} 
	
<!-- 
A PageContext instance provides access to all the namespaces associated with a JSP page, provides access to several 
page attributes, as well as a layer above the implementation details. Implicit objects are added to the pageContext 
automatically.  The PageContext provides a number of facilities to the developer, including:
 a single API to manage the various scoped namespaces
 a number of convenience API's to access various public objects
 a mechanism to obtain the JspWriter for output
 a mechanism to manage session usage by the page
 a mechanism to expose page directive attributes to the scripting environment
 mechanisms to forward or include the current request to other active components in the application
 a mechanism to handle errorpage exception processing  -->
 
 <!-- And how is pageContext.setAttribute("name", value) different from session.setAttribute("name", value).
PageContext has a set of attributes that are different from the Session object.
The attributes set on PageContext are only available for a given page. The attributes are not available to other pages 
or servlets in the application.Session attributes are created per each user's session. The session attributes are 
unique to a given session id. Session attributes are available to other pages and servlets in the application for a 
given session id. -->

 <!-- Your session ID is: ${pageContext.session.id}, why do this if we could get the session ID doing this: 
 session.getId().
As stated above, PageContext has a handle to the session object. You can access the session object via the pageContext 
or you can access the session object directly. Two different mechanisms for accessing the same object. -->

<!--  Please also include how it's instantiated and where it comes from besides its purpose.
The PageContext is implicitly instantiated by the application server.
The JSP page will always have access to the PageContext.  -->


</body>

</html>
