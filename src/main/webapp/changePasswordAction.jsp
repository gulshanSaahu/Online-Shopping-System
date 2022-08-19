<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String email=session.getAttribute("email").toString();
String oldPassword=request.getParameter("oldPassword");
String newPassword=request.getParameter("newPassword");
String confirmPassword=request.getParameter("confirmPassword");

if(!confirmPassword.equals(newPassword))
	response.sendRedirect("changePassword.jsp?msg=notMatch");

else
{
	int check=0;
	try
	{
		  Class.forName("oracle.jdbc.driver.OracleDriver");
		  Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","gulshan");
		  Statement st=con.createStatement();
		  ResultSet rs = st.executeQuery("select * from users where email='"+email+"' and password='"+oldPassword+"'");
		  while(rs.next())
		  {
			  
			  check=1;
			  st.executeUpdate("update users set password='"+newPassword+"' where email='"+email+"'");
			  response.sendRedirect("changePassword.jsp?msg=done");
		  }
		if(check==0)
			response.sendRedirect("changePassword.jsp?msg=wrong");
	}
	catch(Exception e)
	{
		
		System.out.println(e);
		
	}
}



%>
</body>
</html>