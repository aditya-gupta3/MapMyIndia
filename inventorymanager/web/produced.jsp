<%-- 
    Document   : produced
    Created on : Jul 9, 2015, 3:51:56 PM
    Author     : agupta
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Please enter the product and quantity you want to take for production </title>
    </head>
    <body>

    
        <form action="producedfinal.jsp" method="POST">
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
            <p> Quantity </p><input type="text" name="quantity" value="" />
            <p> Faulty Quantity </p><input type="number" name="faulty" value="" />
            <br>
            <br>
            <input type="submit" value="submit" name="submit" />
        </form>
    </body>
</html>