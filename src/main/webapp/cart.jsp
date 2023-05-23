<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "cart";
String userid = "root";
String password = "";
int summ=0;
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
<head>
<style >

table{
border-collapse: collapse;
width:100%
}
td,th{
border:1px solid black;
text-align: center;
padding: 8px;
}
tr:nth-child(even) {
	background-color: #dddddd;
}



</style>


</head>
<body>

<h1>Retrieve data from database in jsp</h1>
<table border="1"   >
<tr>
<td>Name</td>
<td>cost</td>
</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from exist";
resultSet = statement.executeQuery(sql);

while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("name") %></td>
<td><%=resultSet.getInt("cost") %></td>

</tr>
<%
summ+=resultSet.getInt("cost");
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
<tr>

<td>Total</td>
<td><%=summ %></td>
</tr>
</table> 



</body>
</html>