<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<%
String Driver = "com.mysql.jdbc.Driver";
String con= "jdbc:mysql://localhost:3306/";
String dB= "waaz";
String uName= "root";
String pW="";
Connection connection=null;
PreparedStatement statement=null;
ResultSet rs=null;
try{
	Class.forName(Driver);
}
catch(ClassNotFoundException e)
{
	e.printStackTrace();
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1>Registration Form</h1>
	
	<%

			String UserName=request.getParameter("UserName");
			String Email=request.getParameter("Email");
			String password=request.getParameter("password");
			String Cnp=request.getParameter("Cpw");
			String Phone=request.getParameter("Number");
		try{
			connection=DriverManager.getConnection(con+dB,uName,pW);
			String sql="INSERT INTO student (UserNsme, email, password, confirmPassword, Phone) VALUES (?,?,?,?,?)";
			statement=connection.prepareStatement(sql);
			statement.setString(1,UserName);
			statement.setString(2,Email);
			statement.setString(3,password);
			statement.setString(4,Cnp);
			statement.setString(5,Phone);
			statement.executeUpdate();
			
				response.sendRedirect("login.html");
				
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
            try {
                if (statement != null) statement.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                out.println("Error: "+e.getMessage());
            }
        }

		
	%>
</body>
</html>