import java.sql.*;
import java.util.*;


public class CreateTable {
	
	public static void branch() throws SQLException,ClassNotFoundException 
	{
	
		Connection con=prepareConnection();
		Statement st=con.createStatement();
		
		String query="create table branch(bid varchar(10),branch_name varchar(20),branch_address varchar(30),phone varchar(10),pincode varchar(10),primary key(bid));";
		
		st.executeUpdate(query);
		
		System.out.println("Branch Table Created Successfully");
		
	}
	
	
	
	public static void employee() throws SQLException,ClassNotFoundException 
	{
	
		Connection con=prepareConnection();
		Statement st=con.createStatement();
		
		String query="create table employee(ename varchar(20),eid varchar(10),address varchar(25),phone varchar(10),email varchar(40),salary varchar(10),position varchar(20),bid varchar(10), primary key(eid), foreign key (bid) references branch(bid) on delete cascade);";
		
		st.executeUpdate(query);
		
		System.out.println("Employee Table Created Successfully");
		
	}
	
	
	public static void customer() throws SQLException,ClassNotFoundException 
	{
	
		Connection con=prepareConnection();
		Statement st=con.createStatement();
		
		String query="create table customer(username varchar(10),password varchar(10),email varchar(40),phone varchar(10),address varchar(30),primary key(username));";
		
		st.executeUpdate(query);
		
		System.out.println("Customer Table Created Successfully");
		
	}
	
	public static void pickup() throws SQLException,ClassNotFoundException 
	{
	
		Connection con=prepareConnection();
		Statement st=con.createStatement();
		
		String query="create table pickup(pid varchar(10),username varchar(10),bid varchar(10),parcel_name varchar(10),parcel_weight varchar(10),pickup_date varchar(15),from_address varchar(30),to_address varchar(30),primary key(pid),foreign key(username) references customer(username) on delete cascade,foreign key (bid) references branch(bid) on delete cascade);";
		
		st.executeUpdate(query);
		
		System.out.println("Pickup Table Created Successfully");
		
	}
	
	public static void feedback() throws SQLException,ClassNotFoundException 
	{
	
		Connection con=prepareConnection();
		Statement st=con.createStatement();
		
		String query="create table feedback(fid varchar(10),message varchar(50),rating int,eid varchar(10),username varchar(10),primary key(fid),foreign key(eid) references employee(eid),foreign key(username) references customer(username));";
		
		st.executeUpdate(query);
		
		System.out.println("Feedback Table Created Successfully");
		
	}
	
	public static void main(String args[])throws SQLException, ClassNotFoundException
		{
		
		Scanner s=new Scanner(System.in);
		boolean y=true;
		while(y)
		{
			
		
		System.out.println("TO create table Enter The no of Your Choice \n"+
				"1.Branch \t 2.Employee \t 3.Customer \t 4.Pickup \t 5.Feedback \t 7.Exit");
		int n=s.nextInt();
		switch(n)
		{
		case 1:branch();break;
		case 2:employee();break;
		case 3:customer();break;
		case 4:pickup();break;
		case 5:feedback();break;
		default: y=false;break;
		
		}
		}
		System.out.println("Thank you");	

	}
	
	public static Connection prepareConnection()throws SQLException,ClassNotFoundException
	{
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/courier","root","root");
        return con;	
	}

}
