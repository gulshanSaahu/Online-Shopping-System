<%@page import ="java.sql.*"%>
<%   
String email=session.getAttribute("email").toString();
String product_id=request.getParameter("id");
try
{
	  Class.forName("oracle.jdbc.driver.OracleDriver");
	  Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","gulshan");
	  Statement st =con.createStatement();
	  st.executeUpdate("delete from cart where email='"+email+"' and product_id='"+product_id+"' and address is NULL");
	  response.sendRedirect("myCart.jsp?msg=removed");
}
catch(Exception e)
{
	System.out.println(e);
}

%>