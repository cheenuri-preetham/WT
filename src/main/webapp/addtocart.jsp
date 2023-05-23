<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%
String Driver="com.mysql.jdbc.Driver";
String cUrl="jdbc:mysql://localhost:3306/";
String Db="cart";
String um="root";
String pw="";
try{
	Class.forName(Driver);
}
catch(Exception e)
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
	try{
		Connection con=DriverManager.getConnection(cUrl+Db,um,pw);
		String name=request.getParameter("bn");
		String sql="select * from cart_table where name=?";
		PreparedStatement stmt=con.prepareStatement(sql);
		stmt.setString(1,name);
		ResultSet rs=stmt.executeQuery();
		if(rs.next()){
			String namee=rs.getString(1);
			int valuee=rs.getInt(2);
			String sql3="select * from exist where name=?";
			
			PreparedStatement ps2=con.prepareStatement(sql3);
			ps2.setString(1,namee);
			ResultSet rs1=ps2.executeQuery();
			if(rs1.next()){
				response.sendRedirect("cse.html");
			}
			else{
			String sql2="insert into exist values(?,?)";
			PreparedStatement st2=con.prepareStatement(sql2);
			st2.setString(1,namee);
			st2.setInt(2,valuee);
			st2.executeUpdate();
			response.sendRedirect("cse.html");
			}
		}
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
%>
</body>
</html>