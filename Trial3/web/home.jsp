
<jsp:useBean id="user" scope="session"  class="obs.User" />
<jsp:useBean id="cart" scope="session"  class="obs.Cart" />


<%@ page import="java.util.*"%>

<style>
h2{color:beige;font:700 19pt arial;text-align:center}
    h4 {color:#422829;font:700 11pt verdana;text-align:center}
    td {font:15pt verdana;text-align:center}
    a {font:12pt verdana;color:black;text-align:center}
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

<html>
<body bgcolor="beige">


<table width=100%>
<tr style="font:700 15pt verdana;background-color:green;color:white">
<td>
Welcome!<b><jsp:getProperty name="user" property="uname"/> </b> 
</tr>

<tr style="font:10pt verdana">
<td>
<h2>Shopping Cart</h2>


<table  width=100%; margin-left=auto; margin-right=auto; >
<tr>
<td width=70%>

<form action="home.jsp" method="get">
<table border=1 style="background-color:lightgreen" width="100%">  
<tr>
<th>Book Title
<th>Price
<th>Quantity
<th>Amount
<th>&nbsp;
</tr>

<%
 obs.Item item;
 
 ArrayList items = cart.getItems();
 Iterator  itr = items.iterator();
 int total = 0;

 while (  itr.hasNext())
 {
    item = (obs.Item) itr.next();
    total += item.getQty() * item.getPrice();
%>

<tr>
<td>
<input type=hidden value=<%=item.getIsbn()%> name=isbn>
<%= item.getTitle()%>
<td align="right"><%= item.getPrice()%>
<td align="center"><input type=text name=qty  size=5 value=<%=item.getQty()%>>
<td align="right"><%=item.getQty() * item.getPrice()%>
<td align="center"><a href=home.jsp?act=remove&isbn=<%=item.getIsbn()%>>Remove</a>
</tr>

<%
 }
 String act = request.getParameter("act");
	
 if ( act != null )
 {
  if( act.equals("Finalize Order"))
  {
    boolean orderid;
    String isb[] = (String []) request.getParameterValues("isbn");
   	
     orderid =  cart.finalizeOrder(user.getUserid(),total );
     if ( orderid == false)
     {
    	 //out.println(item.getIsbn());
   	  out.println("Sorry! Order Cannot be finalized.");
        return;
     }
     else
     {
        out.println("Order Has Been Finalized. Order id : " + orderid );
        //out.println(isb);
        out.println("<a href=home.jsp>Continue...</a>");
        cart.clearAll();
        return;
     }

      
  }   

  if ( act.equals("remove"))
  {
   cart.removeItem( request.getParameter("isbn"));
  }
  else 
   if ( act.equals("Update Cart"))
   {
 
     String isbn[] = (String []) request.getParameterValues("isbn");
     String qty[] = (String []) request.getParameterValues("qty");

     for (int i = 0 ;i < isbn.length ;i ++)
        cart.updateQty(isbn[i], Integer.parseInt( qty[i]));

   }
   else
    if ( act.equals("Clear Cart"))
         cart.clearAll();
  } // end of outer if


%>
<tr>
<td colspan=5 style="text-align:center;font:700 12pt verdana;color:navy">
Total Amount : <%=total%>
</tr>


</table>

</td>
<td>

<input type=submit value="Update Cart"  name="act">
<p>
<input type=submit value="Clear Cart"  name="act">
<p>
<input type=submit value="Finalize Order"  name="act">

</tr>
</table>

</form>
  
</td>
</tr>

<tr>
<td>
[<a href="changeprofile.jsp">Change User Details</a>] &nbsp;&nbsp;
[<a href="browsebooks.jsp">Browse Books</a>] &nbsp;&nbsp;
[<a href="querybooks.jsp">Query Books</a>] &nbsp;&nbsp;
[<a href="ordershistory.jsp">Orders History</a>] &nbsp;&nbsp;
[<a style="color:beige" href=logout.jsp> Logout </a>]
</td>
</tr>

</table>

</body>
</html>