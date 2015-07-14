<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : pendingcalc
    Created on : Jul 13, 2015, 12:04:26 PM
    Author     : agupta
--%>
<%@page import= "java.sql.*" %>
<%
 String Part = (String)request.getParameter("part");
 
 String Product = (String)request.getParameter("product");

 String Type = (String)request.getParameter("type");
 String Uses = (String)request.getParameter("use");
 String Quantity = (String)request.getParameter("quantity");
 String Status = (String)request.getParameter("status");
 String Time = (String)request.getParameter("time");

    
%>
<%--<sql:update var="Material" dataSource="jdbc/IFPWAFCAD">
<!--    INSERT INTO Material (Id1, Part, Product, Type, Uses)
    VALUES ('abc', '123','to','Type','Use');-->
<sql:update var="" dataSource="">
UPDATE table_name
SET column_name = new_value
WHERE column_name = some_value
</sql:update>

</sql:update>--%>
 <%
    String sql = "UPDATE mapmyindia SET PART = ?, PRODUCT = ?, CATEGORY = ?, USES = ?, STATUS=?, QUANTITY=?, APPROVED=? WHERE TIME = ?";
    Connection conn = null;
    String DB_URL = "jdbc:mysql://localhost:3306/MapMyIndiadb";
    
    String USER = "root";
    String PASS = "";
    conn = DriverManager.getConnection(DB_URL, USER, PASS);
    String order = "no";
    PreparedStatement preparedStatement = conn.prepareStatement(sql);
    preparedStatement.setString(1, Part);
    preparedStatement.setString(2, Product);
    preparedStatement.setString(3, Type);
    preparedStatement.setString(4, Uses);
    preparedStatement.setString(5, Status);
    preparedStatement.setString(6, Quantity);
    preparedStatement.setString(7, order);
    preparedStatement.setString(8, Time);
    preparedStatement.executeUpdate(); 
    preparedStatement.close();
   conn.close();
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
