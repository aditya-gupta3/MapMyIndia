<%-- 
    Document   : producedfinal
    Created on : Jul 9, 2015, 3:54:14 PM
    Author     : agupta
--%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import= "java.sql.Connection" %>
<%@page import= "java.sql.*" %>

<%
    String Part = (String)request.getParameter("part"); 
    String Product = (String)request.getParameter("product");
    String Type = (String)request.getParameter("type");
    String Uses = (String)request.getParameter("use");
    int Quantity = Integer.parseInt((String)request.getParameter("quantity"));
    int faulty = Integer.parseInt((String)request.getParameter("faulty"));
    System.out.println(Quantity);
    
    Connection conn = null;
    String DB_URL = "jdbc:mysql://localhost:3306/MyNewDatabase";
    String sql = "INSERT INTO Map_My_India_Final_Produced(Part, Product, Category, Uses, Quantity)"  +
                    "VALUES ( ?,?,?,?,?)";
    String USER = "root";
    String PASS = "user";
    conn = DriverManager.getConnection(DB_URL, USER, PASS);
    PreparedStatement preparedStatement = conn.prepareStatement(sql);
    preparedStatement.setString(1, Part);
    preparedStatement.setString(2, Product);
    preparedStatement.setString(3, Type);
    preparedStatement.setString(4, Uses);
    preparedStatement.setInt(5, Quantity);
    preparedStatement.executeUpdate(); 
%>
<%
    Connection conne = null;
//    Statement statements = conne.createStatement() ;
    conne = DriverManager.getConnection(DB_URL, USER, PASS);
    String sqll = "INSERT INTO Map_My_India(Part, Product, Category, Uses,Approved, Quantity, Faulty)" + "VALUES ( ?,?,?,?,?,?,?)";
    PreparedStatement preparedStatements = conne.prepareStatement(sqll);
    preparedStatements.setString(1, Part);
    preparedStatements.setString(2, Product);
    preparedStatements.setString(3, Type);
    preparedStatements.setString(4, Uses);
    preparedStatements.setString(5, "Approved");
    preparedStatements.setString(6, "0");
    preparedStatements.setInt(7, faulty);
    preparedStatements.executeUpdate(); 
    preparedStatements.close();
    
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
