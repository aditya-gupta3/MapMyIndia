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
    Connection conn = null;
    String DB_URL = "jdbc:mysql://localhost:3306/MyNewDatabase";
    
    String USER = "root";
    String PASS = "user";
    conn = DriverManager.getConnection(DB_URL, USER, PASS);
    int quantity_prod = (Integer.parseInt((String)request.getParameter("quantity")));
    System.out.print(quantity_prod);
    
    String taken_from = (String)request.getParameter("taken_from");
    System.out.print(taken_from);
    String Part = (String)request.getParameter("part");
    String Product = (String)request.getParameter("product");
    String Type = (String)request.getParameter("type");
    String Status = (String)request.getParameter("status");
    String Uses = (String)request.getParameter("use");
    String sql;
    if (taken_from.equals("Raw")){
        sql = "INSERT INTO MapMyIndiaProduction(Part,Product, Uses, Quantity)"  +
                    "VALUES ( ?,?,?,?)";
        PreparedStatement preparedStatement = conn.prepareStatement(sql);
        preparedStatement.setString(1, Part);
        preparedStatement.setString(2, Product);
        preparedStatement.setString(3, Uses);
        preparedStatement.setInt(4, quantity_prod);
        preparedStatement.executeUpdate(); 
        preparedStatement.close();
    }
    else if (taken_from.equals("Faulty")) {
        sql = "INSERT INTO Map_My_India(Part,Product,Category, Uses, Status, Faulty)"  +"VALUES ( ?,?,?,?,?,?)";
        PreparedStatement preparedStatement = conn.prepareStatement(sql);
        quantity_prod = -(quantity_prod);
        preparedStatement.setString(1, Part);
        preparedStatement.setString(2, Product);
        preparedStatement.setString(3, Type);
        preparedStatement.setString(4, Uses);
        preparedStatement.setString(5, Status);
        preparedStatement.setInt(6, quantity_prod);
        preparedStatement.executeUpdate(); 
        preparedStatement.close();
    }

    





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
