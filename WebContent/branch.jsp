<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>BRANCH</title>
</head>
<style>a{tex-decoration:none;}</style>
<body>
<%
  try{
   String bid = request.getParameter("bid");
   String bname = request.getParameter("bname");
   String address = request.getParameter("address");
   String phone = request.getParameter("phone");
   String pincode = request.getParameter("pincode");
   String no_of_emp = request.getParameter("no_of_emp");    
   
   Class.forName("com.mysql.jdbc.Driver");
   Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/courier","root","root");
   
   PreparedStatement ps=con.prepareStatement("insert into branch values (?,?,?,?,?,?)");
   ps.setString(1,bid);  
   ps.setString(2,bname);  
   ps.setString(3,address);  
   ps.setString(4,phone); 
   ps.setString(5,pincode);
   ps.setString(6,no_of_emp);
      
  int i=ps.executeUpdate();
  if(i>0)
  {
 out.print("Branch added Sucessfully"); 
 out.print("<center><a href='Employee_home.html'>HOME</a>");
  
  }
  else
	  out.print("Branch Not Added");
  	 out.print("<center><a href='Add_Branch.html'>BACK</a>");
  }
catch(Exception e){out.print("Branch Not Added");
out.print("<center><a href='Add_Branch.html'>BACK</a>");}
%>  

</body>
</html>