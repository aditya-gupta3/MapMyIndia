<%-- 
    Document   : pending
    Created on : Jul 13, 2015, 11:54:09 AM
    Author     : agupta
--%>
<%@ page import="java.sql.*" %>
<%


            Connection conn = null;
            String DB_URL = "jdbc:mysql://localhost:3306/MapMyIndiadb";

            String USER = "root";
            String PASS = "";
            conn = DriverManager.getConnection(DB_URL, USER, PASS);
            Statement statement = conn.createStatement() ;
            ResultSet resultset = statement.executeQuery("select * from mapmyindia Where Approved ='Pending' ") ; 

%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <TABLE BORDER="1">
            <TR>
                <TH>Part Number</TH>
                <TH>Product</TH>
                <TH>Type</TH>
                <TH>Use</TH>
                <TH>Status</TH>
                <TH>Quantity of Product </TH>
                <TH>Approval Status</TH>
                <TH>Date and Time Order was Passed</TH>
            </TR>
            <% while(resultset.next()){ %>
            <TR>
                <form action="pendingcalc.jsp" method="POST">
                    <TD> <input type="text" name="part" value="<%= resultset.getString(1) %>"  /></td>
                    <TD><input type="text" name="product" value="<%= resultset.getString(2) %>"  /></TD>
                    <TD> <input type="text" name="type" value=" <%= resultset.getString(3) %>"  /></TD>
                    <TD> <input type="text" name="use" value="<%= resultset.getString(4) %>"  /></TD>
                    <TD><input type="text" name="status" value=" <%= resultset.getString(5) %>"  /></TD>
                    <TD><input type="text" name="quantity" value=" <%= resultset.getString(6) %>"  /></TD>
                    <TD><input type="text" name="approve" value=" <%= resultset.getString(7) %>" readonly  /></TD>
                    <TD><input type="text" name="time" value=" <%= resultset.getString(9) %>" readonly /></TD>

                    <TD><input type="submit" value="Update" name="approving" /></TD>
                </form>
            </TR>
               <% } %>
    </body>
</html>
<% conn.close(); %>