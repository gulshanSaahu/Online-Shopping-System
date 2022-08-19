<%@page import="java.sql.*" %>
<%
String email=session.getAttribute("email").toString();
if(email.equals(null)){
response.sendRedirect("changeMobileNumber.jsp?msg=wrong")	;
}
String moblieNumber=request.getParameter("mobileNumber");
String password=request.getParameter("password");

int check=0;
try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	  Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","gulshan");
	  Statement st=con.createStatement();
	  ResultSet rs=st.executeQuery("select * from users where email='"+email+"' and password='"+password+"'");
	  while(rs.next())
	  {
		  
		  check=1;
		  st.executeUpdate("update users set mobileNumber='"+ moblieNumber+"' where email='"+email+"'");
		  response.sendRedirect("changeMobileNumber.jsp?msg=done");
	  }
	  if(check==0)
		  response.sendRedirect("changeMobileNumber.jsp?msg=wrong");
}
catch(Exception e)
{
	System.out.println(e);
}
%>