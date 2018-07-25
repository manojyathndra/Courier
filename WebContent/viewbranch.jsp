<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*" %>
     <%@ page import="java.lang.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>VIEW BRANCH</title>
</head>
<body>
 <% try{
Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/courier","root","root");	

response.setContentType("text/html"); 
String pcode=request.getParameter("pincode");



PreparedStatement st=con.prepareStatement("select * from branch where pincode=?");
st.setString(1,pcode);


ResultSet rs=st.executeQuery();
while(rs.next())
  
	{
	String bid=rs.getString("bid");	
	String branch_name=rs.getString("branch_name");
	String branch_address=rs.getString("branch_address");
    String phone=rs.getString("phone");
    String pincode=rs.getString("pincode");
    	
	out.print("<table>");
	out.print("<tr>");
	out.print("<td>"+"BRANCH ID:"+bid+"</td>");
	out.print("</tr>");
	
	out.print("<table>");
	out.print("<tr>");
	out.print("<td>"+"BRANCH NAME:"+branch_name+"</td>");
	out.print("</tr>");
	
	out.print("<table>");
	out.print("<tr>");
	out.print("<td>"+"BRANCH ADDRESS:"+branch_address+"</td>");
	out.print("</tr>");
	
	out.print("<table>");
	out.print("<tr>");
	out.print("<td>"+"PHONE:"+phone+"</td>");
	out.print("</tr>");
	
	out.print("<table>");
	out.print("<tr>");
	out.print("<td>"+"PINCODE:"+pincode+"</td>");
	out.print("</tr>");
	
	out.print("</table>");
	out.print("<br/>");  
	out.print("<br/>");
	}

out.print("<center><a href='Home.html'>HOME</a>");
 
}
catch(Exception e)
{
out.println(e+"<center><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><h1><font face='Imprint MT Shadow' color='black'>UNABLE TO FETCH!!</h1></center>");

}	%>

</body>
</html>