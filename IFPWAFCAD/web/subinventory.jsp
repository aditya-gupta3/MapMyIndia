<%-- 
    Document   : subinventory
    Created on : Jul 8, 2015, 12:56:49 PM
    Author     : agupta
--%>

<%@page import= "java.sql.*" %>
<%--<%@page import= "java.sql.util.*" %>--%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<CENTER>
<FORM>
<input type="button" value="Enter Protected Area" onClick="passWord()">
</FORM>
</CENTER>
 <%         String productname = (String)request.getParameter("productname");
            String productcategory = (String)request.getParameter("productcategory");
            String productuse = (String)request.getParameter("productuse");
            String DB_URL = "jdbc:mysql://localhost:3306/MyNewDatabase";

            String USER = "root";
            String PASS = "user";
            Connection conn = null;
            
            String query = "select * from MAP_MY_INDIA WHERE Approved ='Approved'";
            if(null != productname && !"".equals(productname)) {
                  query += " AND Product = '"  +productname+"'";
            }
            if(null != productcategory && !"".equals(productcategory)) {
                  query += " AND CATEGORY = '"  +productcategory+"'";
            }
            if(null != productuse && !"".equals(productuse)) {
                  query += " AND USES = '"  +productuse+"'";
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
                System.out.println(total_before1);
                total_before = total_before +  Integer.parseInt(resultset.getString(6));
                faulty = faulty + (resultset.getInt(8));
            }


Connection conne = null;
Statement statements = conn.createStatement() ;
conne = DriverManager.getConnection(DB_URL, USER, PASS);
  
ResultSet resultsets = statements.executeQuery("Select Quantity from MapMyIndiaProduction WHERE Part = '"+productname +"'");
while (resultsets.next()) {
        quantity_taken = quantity_taken + resultsets.getInt(1);
         }
quantity_left = total_before - quantity_taken;
System.out.println(quantity_left);
System.out.println(quantity_taken);
System.out.println(total_before);


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
                <TH>Faulty Quantity</TH>

            </TR>
            <TR>
                <TD> <%= productname %> </td>
                <TD><%= productname%></TD>
                <TD><%= productcategory %></TD>
                <TD><%=  productuse%></TD>
                <TD><%= quantity_left%></TD>
                
                <TD><%= faulty%></TD>
</html>
