<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.sql.*" %>
     <%@ page import="java.lang.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>VIEW EMPLOYEE</title>
</head>
<body>
 <% try{
Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/courier","root","root");	

response.setContentType("text/html"); 
String b_id=request.getParameter("bid");



PreparedStatement st=con.prepareStatement("select * from employee where bid=?");
st.setString(1,b_id);


ResultSet rs=st.executeQuery();
while(rs.next())
  
	{
	String ename=rs.getString("ename");	
	String eid=rs.getString("eid");
	String address=rs.getString("address");
    String phone=rs.getString("phone");
    String email=rs.getString("email");
    String salary=rs.getString("salary");
    String position=rs.getString("position");
    String bid=rs.getString("bid");

	
	out.print("<table>");
	out.print("<tr>");
	out.print("<td>"+"EMPLOYEE NAME:"+ename+"</td>");
	out.print("</tr>");
	
	out.print("<table>");
	out.print("<tr>");
	out.print("<td>"+"EMPLOYEE ID:"+eid+"</td>");
	out.print("</tr>");
	
	out.print("<table>");
	out.print("<tr>");
	out.print("<td>"+"ADDRESS:"+address+"</td>");
	out.print("</tr>");
	
	out.print("<table>");
	out.print("<tr>");
	out.print("<td>"+"PHONE:"+phone+"</td>");
	out.print("</tr>");
	
	out.print("<table>");
	out.print("<tr>");
	out.print("<td>"+"EMAIL:"+email+"</td>");
	out.print("</tr>");
	
	out.print("<table>");
	out.print("<tr>");
	out.print("<td>"+"SALARY:"+salary+"</td>");
	out.print("</tr>");
	
	out.print("<table>");
	out.print("<tr>");
	out.print("<td>"+"POSITION:"+position+"</td>");
	out.print("</tr>");

	out.print("<table>");
	out.print("<tr>");
	out.print("<td>"+"BRANCH ID:"+bid+"</td>");
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