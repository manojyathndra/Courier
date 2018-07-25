<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*" %>
     <%@ page import="java.lang.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>COURIER</title>
</head>
<body>
 <% try{
Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/courier","root","root");	

response.setContentType("text/html"); 


PreparedStatement st=con.prepareStatement("select * from pickup");


ResultSet rs=st.executeQuery();
while(rs.next())
  
	{
	String pid=rs.getString("pid");	
	String username=rs.getString("username");
	String bid=rs.getString("bid");
    String parcel_name=rs.getString("parcel_name");
    String parcel_weight=rs.getString("parcel_weight");
    String pickup_date=rs.getString("pickup_date");
    String from_address=rs.getString("from_address");
    String to_address=rs.getString("to_address");

	
	out.print("<table>");
	out.print("<tr>");
	out.print("<td>"+"PARCEL ID:"+pid+"</td>");
	out.print("</tr>");
	
	out.print("<table>");
	out.print("<tr>");
	out.print("<td>"+"USER NAME:"+username+"</td>");
	out.print("</tr>");
	
	out.print("<table>");
	out.print("<tr>");
	out.print("<td>"+"BRANCH ID:"+bid+"</td>");
	out.print("</tr>");
	
	out.print("<table>");
	out.print("<tr>");
	out.print("<td>"+"PARCEL NAME:"+parcel_name+"</td>");
	out.print("</tr>");
	
	out.print("<table>");
	out.print("<tr>");
	out.print("<td>"+"PARCEL WEIGHT:"+parcel_weight+"</td>");
	out.print("</tr>");
	
	out.print("<table>");
	out.print("<tr>");
	out.print("<td>"+"PICK UP DATE:"+pickup_date+"</td>");
	out.print("</tr>");
	
	out.print("<table>");
	out.print("<tr>");
	out.print("<td>"+"FROM ADDRESS:"+from_address+"</td>");
	out.print("</tr>");

	out.print("<table>");
	out.print("<tr>");
	out.print("<td>"+"TO ADDRESS:"+to_address+"</td>");
	out.print("</tr>");

	out.print("</table>");
	out.print("<br/>");  
	out.print("<br/>");
	}

out.print("<center><a href='Employee_home.html'>HOME</a>");
 
}
catch(Exception e)
{
out.println(e+"<center><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><h1><font face='Imprint MT Shadow' color='black'>UNABLE TO FETCH!!</h1></center>");

}	%>

</body>
</html>