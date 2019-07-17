<%@ page import="java.io.*,java.util.*" %>
<%
   Date createTime = new Date(session.getCreationTime());
   Date lastAccessTime = new Date(session.getLastAccessedTime());

   String title = "Welcome Back";
   Integer visitCount = new Integer(0);
   String visitCountKey = "visitCount";
   String userIDKey = new String("userID");
   String userID = new String("Java2s_ID");

   if (session.isNew()){
      title = "Welcome";
      session.setAttribute(userIDKey, userID);
      session.setAttribute(visitCountKey,  visitCount);
   } 
   visitCount = (Integer)session.getAttribute(visitCountKey);
   visitCount = visitCount + 1;
   userID = (String)session.getAttribute(userIDKey);
   session.setAttribute(visitCountKey,  visitCount);
%>
<html>
<body>
id:<% out.print( session.getId()); %><br/>
Creation Time:<% out.print(createTime); %><br/>
Time of Last Access:<% out.print(lastAccessTime); %><br/>
User ID:<% out.print(userID); %>
Number of visits:<% out.print(visitCount); %><br/>
</body>
</html>