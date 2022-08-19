
<%@page import="java.sql.*" %>
<%@include file="adminHeader.jsp" %>
<%@include file="../footer.jsp" %>
<html>
<head>
<link rel="stylesheet" href="../css/addNewProduct-style.css">
<title>Add New Product</title>
</head>
<body>
<%
String msg=request.getParameter("msg");
if("done".equals(msg))
{
%>
<h3 class="alert">Product Added Successfully!</h3>
<%} %>

<%
if("wrong".equals(msg))
{
%>
<h3 class="alert">Some thing went wrong! Try Again!</h3>
<%} %>
<%

try
{
	Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","gulshan");
    Statement st =con.createStatement();
    ResultSet rs =st.executeQuery("select max(id) from product");
    while(rs.next())
    	
    {
    	%>
    
<form action="addNewProductAction.jsp" method="post">


<input class="input-style" type="number" name="id" placeholder="Enter Id" required>
<div class="left-div">
 <h3>Enter Name</h3>
 <input class="input-style"  type ="text" name="name" placeholder="Enter Name" required>
<hr>
</div>

<div class="right-div">
<h3>Enter Category</h3>
 <input class="input-style"  type ="text" name="category" placeholder="Enter Category" required>
<hr>
</div>

<div class="left-div">
<h3>Enter Price</h3>
 <input class="input-style"  type ="number" name="price" placeholder="Enter Price" required>
<hr>
</div>

<div class="right-div">
<h3>Active</h3>
  
   <select class="input-style" name="active">
<option value="Yes">Yes</option>
<option value="No">No</option>

</select>
<hr>
</div>
 <button class="button">Save <i class='far fa-arrow-alt-circle-right'></i></button>
</form>
<% 
}
}
catch(Exception e)
{
	System.out.println(e);
}
%>
</body>
<br><br><br>
</body>
</html>