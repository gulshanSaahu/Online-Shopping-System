 <%@page import="java.sql.*"%>

<% 
String id=request.getParameter("id");
String name=request.getParameter("name");
String category=request.getParameter("category");
String price=request.getParameter("price");
String active=request.getParameter("active");
try
{
	 Class.forName("oracle.jdbc.driver.OracleDriver");
	  Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","gulshan");
	  Statement st= con.createStatement();
	  st.executeUpdate("update product set name='"+name+"',category='"+category+"',price="+price+",active='"+active+"' where id="+id+"");
	 if(active.equals("No"))
			 {
		       st.executeUpdate("delete from cart where product_id="+id+" and address is NULL");
			 }
	 response.sendRedirect("allProductEditProduct.jsp?msg=done");
}
catch(Exception e)
{
	System.out.println(e);
	response.sendRedirect("allProductEditProduct.jsp?msg=wrong");
}
%>
