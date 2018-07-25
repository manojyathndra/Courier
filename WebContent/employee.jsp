<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ADD EMPLOYEE</title>
</head>
<body>
<%
try{
   String ename = request.getParameter("ename");
   String eid = request.getParameter("eid");
   String address = request.getParameter("address");
   String phone = request.getParameter("phone");
   String email = request.getParameter("email");
   String salary = request.getParameter("salary");
   String position = request.getParameter("position");
   String bid = request.getParameter("bid");
   
   Class.forName("com.mysql.jdbc.Driver");
   Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/courier","root","root");
   
   PreparedStatement ps=con.prepareStatement("insert into employee values (?,?,?,?,?,?,?,?)");
   ps.setString(1,ename);  
   ps.setString(2,eid);  
   ps.setString(3,address);  
   ps.setString(4,phone); 
   ps.setString(5,email);
   ps.setString(6,salary);
   ps.setString(7,position);
   ps.setString(8,bid);
   
  int i=ps.executeUpdate();
  if(i>0)
  {
 out.print("Employee ADDED Successfully"); 
 out.print("<center><a href='Employee_home.html'>HOME</a>");
  
  }
  else
	  out.print("Employee NOT ADDED"); 
  out.print("<center><a href='Add_Employee.html'>BACK</a>");
}
catch(Exception e){out.print("Employee NOT ADDED");
out.print("<center><a href='Add_Employee.html'>BACK</a>");}

%>  
</body>
</html>