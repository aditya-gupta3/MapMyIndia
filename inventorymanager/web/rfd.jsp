<%-- 
    Document   : rfd
    Created on : Jul 14, 2015, 4:13:50 PM
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
            ResultSet resultset = statement.executeQuery("select * from mapmyindia Where Approved ='Approved' AND (USES ='Trade' OR USES = 'Spare') AND QUANTITY>0") ;
            
            
            
            %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>RFD Page</title>
    <center><H1>READY FOR DISPATCH</H1>
    </head>
    <body>
                <TABLE BORDER="1">
            <TR>
                <TH>Part Number</TH>
                <TH>Category</TH>
                <TH>Model Name</TH>
                <TH>Trade/Raw/Spare</TH>
                <TH>Local/Import</TH>
                <TH>Quantity of Product </TH>
                <TH>Date and Time Order was Produced</TH>
            </TR>
            <% while(resultset.next()){ %>
            <TR>
                    <TD> <input type="text" name="part1" value="<%= resultset.getString(1) %>" readonly /></td>
                    <TD><input type="text" name="product1" value="<%= resultset.getString(2) %>" readonly /></TD>
                    <TD> <input type="text" name="type1" value=" <%= resultset.getString(3) %>" readonly /></TD>
                    <TD> <input type="text" name="use1" value="<%= resultset.getString(4) %>" readonly /></TD>
                    <TD><input type="text" name="status1" value=" <%= resultset.getString(5) %>" readonly /></TD>
                    <TD><input type="text" name="quantity1" value=" <%= resultset.getString(6) %>" readonly /></TD>
                    <TD><input type="text" name="time1" value=" <%= resultset.getString(9) %>" readonly /></TD>
    
<% } %>
            </TR>

 <%
    Connection conne = null;
    conne = DriverManager.getConnection(DB_URL, USER, PASS);
    Statement statements = conne.createStatement() ;
    ResultSet resultsets = statements.executeQuery("select * from map_my_india_final_produced") ;
 %>
 <% while(resultsets.next()){ %>
            <TR>
                    <TD> <input type="text" name="part1" value="<%= resultsets.getString(1) %>" readonly /></td>
                    <TD><input type="text" name="product1" value="<%= resultsets.getString(2) %>" readonly /></TD>
                    <TD> <input type="text" name="type1" value=" <%= resultsets.getString(3) %>" readonly /></TD>
                    <TD> <input type="text" name="use1" value="<%= resultsets.getString(4) %>" readonly /></TD>
                    <TD><input type="text" name="status1" value=" <%= resultsets.getString(5) %>" readonly /></TD>
                    <TD><input type="text" name="quantity1" value=" <%= resultsets.getString(6) %>" readonly /></TD>
                    <TD><input type="text" name="approve1" value=" <%= resultsets.getString(7) %>" readonly /></TD>
    
<% } %>
        </TR>
        </center>
    </body>
</html>
 <%      conn.close();
         conne.close();
 %>