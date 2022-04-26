<%-- 
    Document   : publish
    Created on : 26-Apr-2022, 12:17:02 pm
    Author     : Aishwarya Kalluri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Publish JSP Page</title>
    </head>
    <body>
        

<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
String user=request.getParameter("uname"); 
session.putValue("uname",user); 
String BookName =request.getParameter("BookName");
String Author =request.getParameter("Author"); 
String Publisher=request.getParameter("Publisher"); 
String YearofPublishing =request.getParameter("YearofPublishing"); 
int Edition =Integer.parseInt(request.getParameter("Edition")); 
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test",
"root",""); 
Statement st= con.createStatement(); 
ResultSet rs; 
String q="insert into books(BookName,Author,Publisher,YearofPublishing,Edition) values('"+BookName+"','"+Author+"','"+Publisher+"','"+YearofPublishing+"',"+Edition+");";
st.executeUpdate(q); 
//out.println("Book Added"); 
response.sendRedirect("browsebooks.jsp");


%>


</body>
</html>
 --%>
    </body>
</html>
