<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
 
	<%
			String UserName=request.getParameter("uname");
			
			String password=request.getParameter("pwd");

		try{
			connection=DriverManager.getConnection(con+dB,uName,pW);
		
			String sql = "select * from student where UserNsme=? and password=?";
			statement = connection.prepareStatement(sql);
			statement.setString(1, UserName);
			statement.setString(2, password);
			rs = statement.executeQuery();

			if(rs.next()){
				response.sendRedirect("home.html");
				
			}
			else{
				out.print("invalid");
			}

			
			
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