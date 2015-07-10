<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import= "java.sql.Connection" %>
<%@page import= "java.sql.*" %>
<%--<%@page import= "java.sql.util.*" %>--%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : totalprod
    Created on : Jul 9, 2015, 2:56:34 PM
    Author     : agupta
--%>


<% 
    int quantity_prod = Integer.parseInt((String)request.getParameter("quantity"));
    
    String Part = (String)request.getParameter("part");
    
    String sql = "INSERT INTO MapMyIndiaProduction(Part, Quantity)"  +
                    "VALUES ( ?,?)";
    Connection conn = null;
    String DB_URL = "jdbc:mysql://localhost:3306/MyNewDatabase";
    
    String USER = "root";
    String PASS = "user";
    conn = DriverManager.getConnection(DB_URL, USER, PASS);
    PreparedStatement preparedStatement = conn.prepareStatement(sql);
    preparedStatement.setString(1, Part);
    preparedStatement.setInt(2, quantity_prod);

    preparedStatement.executeUpdate(); 
    preparedStatement.close();




%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
