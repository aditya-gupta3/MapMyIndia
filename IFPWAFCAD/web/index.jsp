<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : index
    Created on : Jun 23, 2015, 6:24:51 PM
    Author     : agupta
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to Map My India Homepage </title>
    </head>
    <body>

    
        <form action="sendmail.jsp" method="POST">
            <p> Part Number </p><input type="text" name="part" value="" />
            <p> Category </p><input type="text" name="product" value="" />
            <p> Model Name </p><input type="text" name="type" value="" />
            <p> Type </p>
            <select name="use">
                    <option>Trade</option>
                    <option>Raw</option>
                    <option>Spare</option>
                </select> 
            <p> Local/Import </p>
            <select name="status">
                <option>Local</option>
                <option>Import</option>
            </select>
            <p> Quantity </p><input type="number" name="quantity" value="" />
            <br>
            <br>
            <input type="submit" value="submit" name="submit" />
        </form>
    </body>
</html>
