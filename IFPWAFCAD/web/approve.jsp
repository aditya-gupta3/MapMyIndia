<%-- 
    Document   : approve
    Created on : Jul 6, 2015, 2:25:37 PM
    Author     : agupta
--%>

<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%--<sql:query var="approval" dataSource="jdbc/IFPWAFCAD">
    SELECT * FROM Map_My_India;
</sql:query>--%>

    
    
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>


<HTML>
    <HEAD>
        <TITLE>The tableName Database Table </TITLE>
    </HEAD>

    <BODY>
        <H1>The tableName Database Table </H1>

        <% 
            Connection connection = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/MyNewDatabase", "root", "user");

            Statement statement = connection.createStatement() ;
            ResultSet resultset = 
                statement.executeQuery("select * from Map_My_India") ; 
        %>

        <TABLE BORDER="1">
            <TR>
                <TH>ID</TH>
                <TH>Name</TH>
                <TH>City</TH>
                <TH>State</TH>
                <TH>Country</TH>
            </TR>
            <% while(resultset.next()){ %>
            <TR>
                <TD> <%= resultset.getString(1) %></td>
                <TD> <%= resultset.getString(2) %></TD>
                <TD> <%= resultset.getString(3) %></TD>
                <TD> <%= resultset.getString(4) %></TD>
                <TD> <%= resultset.getString(5) %></TD>
            </TR>
            <% } %>
        </TABLE>
    </BODY>
</HTML>
