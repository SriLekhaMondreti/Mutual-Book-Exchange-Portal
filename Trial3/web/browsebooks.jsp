<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<style>
h2{color:beige;font:700 20pt arial;text-align:center}
    h4 {color:#422829;font:700 11pt verdana;text-align:center}
    td {font:12pt verdana;text-align:center}
    a {font:12pt verdana;color:beige;text-align:center}
    td{color:beige }
    p{font:14pt verdana}
    form {font:12pt verdana;color:beige;text-align:center}
body {
      background-image: url('books.jpg');
      background-repeat: no-repeat;
      background-attachment: fixed;
      background-size: cover;
    }
</style>

<body bgcolor="beige">

<h2>Browse Available Books</h2>

<form action="browsebooks.jsp" method="post" >
Select Category : 
<select name="cat">
<option value="all">All Categories
<option value="ora">Oracle
<option value=".net">.NET 
<option value="java">Java 
</select>
<input type=submit value="Browse">

<a href="querybooks.jsp">Query Books</a> &nbsp;&nbsp;<a href="publish.html">Publish Books</a> &nbsp;&nbsp;<a href="gohome.jsp">Home </a>

</form>

<%
 String cat = request.getParameter("cat");
 if ( cat == null)
    request.setAttribute("cond","1=1");
else
  if (!cat.equals("all") )
   request.setAttribute("cond", "cat='" + cat + "'");

%>
 
<jsp:include  page="listbooks.jsp" flush="true"/>


</body>
</html>   