<%-- 
    Document   : subinventory
    Created on : Jul 8, 2015, 12:56:49 PM
    Author     : agupta
--%>
<%@page import= "java.sql.*" %>
<%--<%@page import= "java.sql.util.*" %>--%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>


 <%         String productnumber = (String)request.getParameter("productnumber");
            String productmodel = (String)request.getParameter("productmodel");
            String productcategory = (String)request.getParameter("productcategory");
            String producttype = (String)request.getParameter("producttype");
            String productuse = (String)request.getParameter("productuse");
            String DB_URL = "jdbc:mysql://localhost:3306/MapMyIndiadb";
            String fromdate = (String)request.getParameter("fromdate");
            String todate = (String)request.getParameter("todate");
            String USER = "root";
            String PASS = "";
            Connection conn = null;
            String subquery = "Select Quantity from mapmyindiaproduction WHERE Approved = 'Approved'";
            String query = "select * from mapmyindia WHERE Approved ='Approved'";
            String subsubquery = "Select Faulty from mapmyindia Where Approved ='Approved'";
            if(null != productcategory && !"".equals(productcategory)) {
                  query += " AND Part = '"  +productnumber+"'";
                  subquery += " AND Part = '"  +productnumber+"'";
                  subsubquery += " AND Part = '"  +productnumber+"'";
                  
            }
            if(null != productcategory && !"".equals(productcategory)) {
                  query += " AND Product = '"  +productcategory+"'";
                  subquery += " AND Product = '"  +productcategory+"'";
                  subsubquery += " AND Product = '"  +productcategory+"'";
                  
            }
            if(null != productmodel && !"".equals(productmodel)) {
                  query += " AND CATEGORY = '"  +productmodel+"'";
                  subquery += " AND CATEGORY = '"  +productmodel+"'";
                  subsubquery += " AND CATEGORY = '"  +productmodel+"'";
            }
            if(null != producttype && !"".equals(producttype)) {
                  query += " AND USES = '"  +producttype+"'";
                  subquery += " AND USES = '"  +producttype+"'";
                  subsubquery += " AND USES = '"  +producttype+"'";
            }
            if(null != productuse && !"".equals(productuse)) {
                  query += " AND STATUS = '"  +productuse+"'";
                  subquery += " AND STATUS = '"  +productuse+"'";
                  subsubquery += " AND STATUS = '"  +productuse+"'";
            }
            if(null != fromdate && !"".equals(fromdate)) {
                  query += " AND TIME >= '"  +fromdate+"'";
                  
            }
            if(null != todate && !"".equals(todate)) {
                  query += " AND TIME <= '"  +todate+"'";
                  
            }
            conn = DriverManager.getConnection(DB_URL, USER, PASS);
            Statement statement = conn.createStatement() ;
            ResultSet resultset = statement.executeQuery(query) ;
            int total_before = 0;
            
            int quantity_taken = 0;
            int quantity_left;
            int faulty = 0;
%>


            <% while (resultset.next()) {
                
                String total_before1 = resultset.getString(6);
                total_before = total_before +  Integer.parseInt(resultset.getString(6));
            }
            conn.close();


            Connection conne = null;
            
            conne = DriverManager.getConnection(DB_URL, USER, PASS);
            Statement statements = conne.createStatement() ;
            
            ResultSet resultsets = statements.executeQuery(subquery);
            while (resultsets.next()) {
                    quantity_taken = quantity_taken + resultsets.getInt(1);
                     }
            conne.close();

            quantity_left = total_before - quantity_taken;
            
            
            Connection connect = null;
            connect = DriverManager.getConnection(DB_URL, USER, PASS);
            Statement statements1 = connect.createStatement() ;
            
            ResultSet resultsets1 = statements1.executeQuery(subsubquery);
            while (resultsets1.next()) {
                    faulty = faulty + (resultsets1.getInt(1));
                     }
            connect.close();
%>  
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <center>
    <h1>The requested order is as follows </h1>
    <body>
        <br>
        <br>
        <Table BORDER="1">
            <TR>
                <TH>Part Number</TH>
                <TH>Product</TH>
                <TH>Category</TH>
                <TH>Use</TH>
                <TH>Quantity of Product in Inventory</TH>
                <TH>Quantity of Product that came </TH>
                <TH>Faulty Quantity</TH>

            </TR>
            <TR>
                <TD> <%= productnumber %> </td>
                <TD><%= productcategory%></TD>
                <TD><%= producttype %></TD>
                <TD><%=  productuse%></TD>
                <TD><%= quantity_left%></TD>
                <TD><%= total_before%></TD>
                <TD><%= faulty%></TD>
            </TR>
        </Table>
    </center>
</html>
