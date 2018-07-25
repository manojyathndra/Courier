<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>UPDATE FEEDBACK</title>
</head>
<body>
<%
try{
   String eid = request.getParameter("eid");
         
   Class.forName("com.mysql.jdbc.Driver");
   Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/courier","root","root");
   
   PreparedStatement ps=con.prepareStatement("delete from employee where eid=?");
   ps.setString(1,eid);  
    

         
   int i=ps.executeUpdate();
   if(i>0)
   {
  out.print("Employee Deleted Successfully!!"); 
  out.print("<center><a href='Employee_home.html'>HOME</a>");
  
   
   }
   else
 	  out.print("EMPLOYEE NOT DELETED!!"); 
   	  out.print("<center><a href='deleteemp.html'>BACK</a>");
}
 catch(Exception e){
	 out.print("EMPLOYEE NOT DELETED!!");
	 
 }
	   
%>  
</body>
</html>