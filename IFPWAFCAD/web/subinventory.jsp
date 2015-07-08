<%-- 
    Document   : subinventory
    Created on : Jul 8, 2015, 12:56:49 PM
    Author     : agupta
--%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import= "java.sql.Connection" %>
<%@page import= "java.sql.*" %>
<%--<%@page import= "java.sql.util.*" %>--%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

 <%         String productname = "Product = '"  + (String)request.getParameter("productname")+"'";
            String DB_URL = "jdbc:mysql://localhost:3306/MyNewDatabase";

            String USER = "root";
            String PASS = "user";
            Connection conn = null;


            conn = DriverManager.getConnection(DB_URL, USER, PASS);
            Statement statement = conn.createStatement() ;
            Statement statements = conn.createStatement() ;
            ResultSet resultset = statement.executeQuery("select * from Map_My_India WHERE Approved ='Approved' AND "+ productname) ;
            ResultSet resultsets = statements.executeQuery("select * from Map_My_India WHERE Approved ='Approved' AND "+ productname) ; 
            int total = 0;

            
           
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <br>
        <br>
        <TABLE BORDER="1">
            <TR>
                <TH>Part Number</TH>
                <TH>Product</TH>
                <TH>Type</TH>
                <TH>Use</TH>
                <TH>Quantity of Product </TH>
                <TH>Approval Status</TH>
                <TH>Date and Time Order was Passed</TH>

            </TR>
            <% while (resultset.next()) {%>
            <TR>
                <TD> <%= resultset.getString(1)%> </td>
                <TD><%= resultset.getString(2)%></TD>
                <TD><%= resultset.getString(3)%></TD>
                <TD><%= resultset.getString(4)%></TD>
                <TD><%= resultset.getString(5)%></TD>
                
                <TD><%= resultset.getString(6)%></TD>
                <TD><%= resultset.getString(7)%></TD>
<%  total = total +  Integer.parseInt(resultset.getString(5));
    System.out.println(total);
%>
            </TR>
            <% }%>  

        </TABLE>
        <br>
        <br>
        <br>
        <p> Total Quantity of the product is <%= total %> </p>
    </body>
</html>
