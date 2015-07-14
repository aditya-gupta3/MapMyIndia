<%-- 
    Document   : approve
    Created on : Jul 6, 2015, 2:25:37 PM
    Author     : agupta
--%>

<%@ page import="java.sql.*" %>

<%--<sql:query var="approval" dataSource="jdbc/IFPWAFCAD">
    SELECT * FROM Map_My_India;
</sql:query>--%>

    
    
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<HTML>
    <HEAD>
        <TITLE> Map My India </TITLE>
    </HEAD>

    <BODY>
        <H1> Pending Order's for Approval </H1>

        <% 




            String Part = (String)request.getParameter("part");

            String Product = (String)request.getParameter("product");


            String Type = (String)request.getParameter("type");
            String Uses = (String)request.getParameter("use");




            Connection conn = null;
            String DB_URL = "jdbc:mysql://localhost:3306/MapMyIndiadb";

            String USER = "root";
            String PASS = "";
            conn = DriverManager.getConnection(DB_URL, USER, PASS);
            Statement statement = conn.createStatement() ;
            ResultSet resultset = statement.executeQuery("select * from mapmyindia Where Approved ='No' ") ;


%>
            
            
            
        

        <TABLE BORDER="1">
            <TR>
                <TH>Part Number</TH>
                <TH>Category</TH>
                <TH>Model Name</TH>
                <TH>Trade/Raw/Spare</TH>
                <TH>Local/Import</TH>
                <TH>Quantity of Product </TH>
                <TH>Approval Status</TH>
                <TH>Date and Time Order was Passed</TH>
            </TR>
            <% while(resultset.next()){ %>
            <TR>
                <form action="inventory.jsp" method="POST">
                    <TD> <input type="text" name="part1" value="<%= resultset.getString(1) %>" readonly /></td>
                    <TD><input type="text" name="product1" value="<%= resultset.getString(2) %>" readonly /></TD>
                    <TD> <input type="text" name="type1" value=" <%= resultset.getString(3) %>" readonly /></TD>
                    <TD> <input type="text" name="use1" value="<%= resultset.getString(4) %>" readonly /></TD>
                    <TD><input type="text" name="status1" value=" <%= resultset.getString(5) %>" readonly /></TD>
                    <TD><input type="text" name="quantity1" value=" <%= resultset.getString(6) %>" readonly /></TD>
                    <TD><input type="text" name="approve1" value=" <%= resultset.getString(7) %>" readonly /></TD>
                    <TD><input type="text" name="time1" value=" <%= resultset.getString(9) %>" readonly /></TD>

                    <TD><input type="submit" value="Approve" name="approving" /></TD>
                </form>
                    <TD><form name="Reject" action="reject.jsp" method="POST">
                            <input type="hidden" name="part2" value="<%= resultset.getString(1) %>"/>
                            <input type="hidden" name="product2" value="<%= resultset.getString(2) %>"/>
                            <input type="hidden" name="type2" value="<%= resultset.getString(3) %>"/>
                            <input type="hidden" name="use2" value="<%= resultset.getString(4) %>"/>
                            <input type="hidden" name="status2" value="<%= resultset.getString(5) %>"/>
                            <input type="hidden" name="quantity2" value="<%= resultset.getString(6) %>"/>
                            <input type="hidden" name="approve2" value="<%= resultset.getString(7) %>"/>
                            <input type="hidden" name="time2" value="<%= resultset.getString(9) %>"/>
                            <input type="submit" value="Reject" name="reject" />
                        </form>
                    </TD>

            </TR>
            <% } %>
        </TABLE>
    </BODY>
</HTML>

      <%      conn.close();%>
