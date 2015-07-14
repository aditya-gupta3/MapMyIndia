<%-- 
    Document   : productionissue
    Created on : Jul 9, 2015, 2:42:08 PM
    Author     : agupta
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Production </title>
    </head>
    <h1> Please enter the product and quantity you want to take for production </h1>
    <body>

    
        <form action="totalprod.jsp" method="POST">
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
            <p> Taken From </p>
            <select name="taken_from">
                <option>Faulty</option>
                <option>Raw</option>
            </select>
            <p> Quantity </p><input type="text" name="quantity" value="" />
            <br>
            <br>
            <input type="submit" value="submit" name="submit" />
        </form>
    </body>
</html>
