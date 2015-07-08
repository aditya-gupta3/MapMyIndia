<%-- 
    Document   : reject
    Created on : Jul 8, 2015, 10:58:50 AM
    Author     : agupta
--%>

<%
 String Part = (String)request.getParameter("part2");
 
 String Product = (String)request.getParameter("product2");

 String Type = (String)request.getParameter("type2");
 String Uses = (String)request.getParameter("use2");
 String Quantity = (String)request.getParameter("quantity2");


    
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Sending Mail Through JSP</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width">
    </head>
        <body bgcolor="khaki">
        <form action="rejectmail.jsp">
            <table>
                <tr><td><b><font color="red">To:
                    </td>
                    <td><b><b><input type="text" name="mail" value="mapmyindia123@gmail.com" readonly/><br/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <b><font color="red">Subject:
                    </td>
                    <td>
                        <input type="text" name="sub" value="Following order was not Approved." ><br/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <b><font color="red">Message Text:
                    </td>
                    <td>
                        <textarea rows="12" cols="80" name="mess">
                    The part number was <%=Part%>. The Product name was <%=Product%>. The category was <%=Uses%>. The quantity was <%=Quantity%>
                        </textarea><br/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="submit" value="Send">
                    </td>
                    <td>
                        <input type="reset" value="Reset">
                    </td>
                </tr>
            </table>
        </form>
    </body>
</html>


