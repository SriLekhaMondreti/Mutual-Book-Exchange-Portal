

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration Page</title>
</head>
<body>

<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
   int userid=200;//Integer.parseInt(request.getParameter("userid")); 
String user=request.getParameter("uname"); 
session.putValue("uname",user); 
String pwd=request.getParameter("pwd"); 
String fname=request.getParameter("fname"); 
String lname=request.getParameter("lname"); 
String email=request.getParameter("email"); 
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test",
"root",""); 
Statement st= con.createStatement(); 
ResultSet rs; 
String q="insert into users(userid,uname,pwd,email) values("+userid+",'"+user+"','"+pwd+"','"+email+"');";
st.executeUpdate(q); 

out.println("Registeration successful. Please login to start browsing"); 
response.sendRedirect("index.html");

%>
<a href ="Login.html">Login</a><br/><br/>
<a href="index.html">Home</a>


</body>
</html>
 
 
 
 
     
    
   
 
