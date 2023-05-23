<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%
String driver = "com.mysql.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/";
String database = "waaz";
String user = "root";
String password = "";

try {
    Class.forName(driver);
} catch (ClassNotFoundException e) {
    e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet rs = null;
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Insert title here</title>
</head>
<body>
    <table>
        <%
            try {
                connection = DriverManager.getConnection(url + database, user, password);
                statement = connection.createStatement();
                String sql = "CREATE TABLE IF NOT EXISTS users (PersonID int, LastName varchar(255), FirstName varchar(255), Address varchar(255), City varchar(255));";
                statement.executeUpdate(sql);
                String sql1 = "SELECT * FROM information_schema.tables WHERE table_schema = 'waaz' AND table_name = 'users' LIMIT 1";
                rs = statement.executeQuery(sql1);
                if (rs.next()) {
        %>
        <%= "Table exists." %>
                <% 
                } else {
        %>
        <%= "Table does not exist." %>
                <% 
                }
                connection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %>
    </table>
</body>
</html>
