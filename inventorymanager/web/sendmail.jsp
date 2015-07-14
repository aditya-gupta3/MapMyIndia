<%-- 
    Document   : sendmail
    Created on : Jul 6, 2015, 8:03:43 AM
    Author     : agupta
--%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import= "java.sql.Connection" %>
<%@page import= "java.sql.*" %>
<%--<%@page import= "java.sql.util.*" %>--%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>


<jsp:useBean id="mail" scope="session" class="jmail.Mail" />
<jsp:setProperty name="mail" property="to" value="bsingh@mapmyindia.com" />
<jsp:setProperty name="mail" property="from" value="mapmyindia123@gmail.com" />
<jsp:setProperty name="mail" property="smtpServ" value="smtp.gmail.com" />
<jsp:setProperty name="mail" property="part" param="part" />
<jsp:setProperty name="mail" property="quantity" param="quantity" />
<jsp:setProperty name="mail" property="product" param="product" />
<jsp:setProperty name="mail" property="type" param="type" />
<jsp:setProperty name="mail" property="use" param="use" />


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <%

int result;
result = mail.sendMail();
if(result == 0){
    out.println(" Mail Successfully Sent");
}
else{
    out.println(" Mail NOT Sent");
}  
%>
<%
 String Part = (String)request.getParameter("part");
 
 String Product = (String)request.getParameter("product");

 String Type = (String)request.getParameter("type");
 String Uses = (String)request.getParameter("use");
 String Quantity = (String)request.getParameter("quantity");
 String Status = (String)request.getParameter("status");

    
%>
<%--<sql:update var="Material" dataSource="jdbc/IFPWAFCAD">
<!--    INSERT INTO Material (Id1, Part, Product, Type, Uses)
    VALUES ('abc', '123','to','Type','Use');-->


</sql:update>--%>
 <%
    String sql = "INSERT INTO mapmyindia(Part, Product, Category, Uses, Status, Quantity, Approved)"  +
                    "VALUES ( ?,?,?,?,?,?,?)";
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



    preparedStatement.executeUpdate(); 
    preparedStatement.close();
    conn.close();

%>
    
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>A Page</title>
    </head>
    <body>
        <h1></h1>
    </body>
</html>

