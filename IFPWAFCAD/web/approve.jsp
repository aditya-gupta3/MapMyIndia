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
            System.out.print(Part);
            System.out.print(Product);

            String Type = (String)request.getParameter("type");
            String Uses = (String)request.getParameter("use");
            System.out.print(Type);
            System.out.print(Uses);



            Connection conn = null;
            String DB_URL = "jdbc:mysql://localhost:3306/MyNewDatabase";

            String USER = "root";
            String PASS = "user";
            conn = DriverManager.getConnection(DB_URL, USER, PASS);
            Statement statement = conn.createStatement() ;
            ResultSet resultset = statement.executeQuery("select * from Map_My_India Where Approved ='No' ") ; 


%>
            
            
            
        

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
            <% while(resultset.next()){ %>
            <TR>
                <form action="inventory.jsp" method="POST">
                    <TD> <input type="text" name="part1" value="<%= resultset.getString(1) %>" readonly /></td>
                    <TD><input type="text" name="product1" value="<%= resultset.getString(2) %>" readonly /></TD>
                    <TD> <input type="text" name="type1" value=" <%= resultset.getString(3) %>" readonly /></TD>
                    <TD> <input type="text" name="use1" value="<%= resultset.getString(4) %>" readonly /></TD>
                    <TD><input type="text" name="approved1" value=" <%= resultset.getString(5) %>" readonly /></TD>
                    <TD><input type="text" name="date1" value=" <%= resultset.getString(6) %>" readonly /></TD>
                    <TD><input type="text" name="quantity1" value=" <%= resultset.getString(7) %>" readonly /></TD>
                    <TD><input type="submit" value="Approve" name="approving" /></TD>
                </form>
                    <TD><form name="Reject" action="reject.jsp" method="POST">
                            <input type="hidden" name="part2" value="<%= resultset.getString(1) %>"/>
                            <input type="hidden" name="product2" value="<%= resultset.getString(2) %>"/>
                            <input type="hidden" name="type2" value="<%= resultset.getString(3) %>"/>
                            <input type="hidden" name="use2" value="<%= resultset.getString(4) %>"/>
                            <input type="hidden" name="quantity2" value="<%= resultset.getString(5) %>"/>
                            <input type="hidden" name="time2" value="<%= resultset.getString(6) %>"/>
                            <input type="submit" value="Reject" name="reject" />
                        </form>
                    </TD>

            </TR>
            <% } %>
        </TABLE>
    </BODY>
</HTML>
