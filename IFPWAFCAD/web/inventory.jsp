<%-- 
    Document   : inventory
    Created on : Jul 7, 2015, 12:02:32 PM
    Author     : agupta
--%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import= "java.sql.Connection" %>
<%@page import= "java.sql.*" %>
<%--<%@page import= "java.sql.util.*" %>--%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
        <% 


            String Part1 = (String)request.getParameter("part1");

            String Product1 = (String)request.getParameter("product1");

            String abc = (String)request.getParameter("type1");
            String Uses1 = (String)request.getParameter("use1");
            String Approve1 = (String)request.getParameter("approve1");


            String sql = ("UPDATE Map_My_India SET Approved = ? WHERE Part = ? AND Product = ? AND Category = ? AND Uses = ?");
//            AND Product = ? AND Type = ? AND USES = ?
            Connection conn = null;
            String DB_URL = "jdbc:mysql://localhost:3306/MyNewDatabase";

            String USER = "root";
            String PASS = "user";
            conn = DriverManager.getConnection(DB_URL, USER, PASS);
            PreparedStatement preparedStatement = conn.prepareStatement(sql);
            
            System.out.print(abc);
            preparedStatement.setString(1, "Comeee on!");
            preparedStatement.setString(2, Part1);
            preparedStatement.setString(3, Product1);
            preparedStatement.setString(4,"Test1233");
            preparedStatement.setString(5, Uses1);
//            

            
            
//            preparedStatement.executeUpdate(); 
//            preparedStatement.close();
//            conn.close();
            
            try{
                System.out.print("Testing");
                preparedStatement.executeUpdate();
                preparedStatement.close();
             }
             catch(Exception kl)
             {
                kl.toString();
                System.out.println(kl);
                preparedStatement.close();
             }


%>
            
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inventory</title>
    </head>
    <body>
        <h1>This is the inventory</h1>
    </body>
</html>
