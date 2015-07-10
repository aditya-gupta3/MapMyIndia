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
            <p> Product Name </p><input type="text" name="product" value="" />
            <p> Trade/Raw/Spares </p><input type="text" name="type" value="" />
            <p> Local/Import </p><input type="text" name="use" value="" />
            <p> Quantity Produced </p><input type="number" name="quantity" value="" />
            <p> Faulty Quantity </p><input type="number" name="faulty" value="" />
            <br>
            <br>
            <input type="submit" value="submit" name="submit" />
        </form>
    </body>
</html>