<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.*" %>
<%   
String email = request.getParameter("email");
String mobilenumber = request.getParameter("mobilenumber");
String SecurityQuestion = request.getParameter("SecurityQuestion");
String answer = request.getParameter("answer");
String newPassword = request.getParameter("newPassword");

int check = 0;
try
{

	 Class.forName("oracle.jdbc.driver.OracleDriver");
	 Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","gulshan");
	 Statement st=con.createStatement();
	 ResultSet rs =st.executeQuery("select * from users where email='"+email+"' and mobilenumber="+mobilenumber+" and SecurityQuestion='"+SecurityQuestion+"' and answer='"+answer+"'");
	 while(rs.next())
	 {
		 response.sendRedirect("forgotPassword.jsp?msg=invalid");
	 }
	 if(check==0)
	 {
		 
		
		 check=1;
		 st.executeUpdate("update users set password='"+newPassword+"'where email='"+email+"'");
		 response.sendRedirect("forgotPassword.jsp?msg=done");
	 }
}
catch(Exception e)
{
	System.out.println(e);
}
%>