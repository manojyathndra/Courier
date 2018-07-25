<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>FEEDBACK</title>
</head>
<body>
<%
try{
   String fid = request.getParameter("feedbackid");
   String feedback = request.getParameter("fb");
   String rating = request.getParameter("rating");
   String username =  request.getParameter("username");
   String eid ="e03";
         
   Class.forName("com.mysql.jdbc.Driver");
   Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/courier","root","root");
   
   PreparedStatement ps=con.prepareStatement("insert into feedback values (?,?,?,?,?)");
   ps.setString(1,fid);  
   ps.setString(2,feedback);  
   ps.setString(3,rating); 
   ps.setString(4,null);
   ps.setString(5,username);
         
  int i=ps.executeUpdate();
  if(i>0)
  {
 out.print("Feedback Sent Successfully!!"); 
 out.print("<center><a href='Home.html'>HOME</a>");
  
  }
  else
	  out.print("Try Again"); 
  out.print("<center><a href='feedback.html'>BACK</a>");
}
catch(Exception e){out.print("Try Again");
out.print("<center><a href='feedback.html'>BACK</a>");}
%>  
</body>
</html>