<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<style>
h2{
    color:white;
    font:700 20pt arial
    
}
h4 {color:brwon;font:700 11pt verdana}
td {font:10pt verdana}
a {font:12pt verdana;color:white}
td{color:beige }
p{font:14pt verdana}
body {
      background-image: url('books.jpg');
      background-repeat: no-repeat;
      background-attachment: fixed;
      background-size: cover;
    }

</style>

<body bgcolor="beige">

<center><h2>Your Dashboard</h2>

<form action="browsebooks.jsp" method="post" >

<nav>
 <a href="querybooks.jsp">Borrow Books </a>
 <br>
<a href="publish.html">Publish Books </a>
<br>
<a href="index.html">Home </a>
</nav>

</form>
    </center>

<%
 String cat = request.getParameter("cat");
 if ( cat == null)
    request.setAttribute("cond","1=1");
else
  if (!cat.equals("all") )
   request.setAttribute("cond", "cat='" + cat + "'");

%>
 



</body>
</html>   