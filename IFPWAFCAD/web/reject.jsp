<%-- 
    Document   : reject
    Created on : Jul 8, 2015, 10:58:50 AM
    Author     : agupta
--%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import= "java.sql.Connection" %>
<%@page import= "java.sql.*" %>
<%
 String Part = (String)request.getParameter("part2");
 
 String Product = (String)request.getParameter("product2");
 String Time = (String) request.getParameter("time2");
 String Type = (String)request.getParameter("type2");
 String Uses = (String)request.getParameter("use2");
 String Status = (String)request.getParameter("status2");

 String Quantity = (String)request.getParameter("quantity2");


            String sql = ("UPDATE Map_My_India SET Approved = ? WHERE Part = ? AND Product = ? AND Uses = ? AND TIME = ? LIMIT 1");
//            AND Product = ? AND Type = ? AND USES = ?
            Connection conn = null;
            String DB_URL = "jdbc:mysql://localhost:3306/MyNewDatabase";

            String USER = "root";
            String PASS = "user";
            conn = DriverManager.getConnection(DB_URL, USER, PASS);
            PreparedStatement preparedStatement = conn.prepareStatement(sql);
            
            preparedStatement.setString(1, "Pending");
            preparedStatement.setString(2, Part);
            preparedStatement.setString(3, Product);
//            preparedStatement.setString(4,"Test1233");
            preparedStatement.setString(4, Uses);
            preparedStatement.setString(5, Time);
            System.out.print(Part);
            System.out.print(Product);
            System.out.print(Uses);
            System.out.print(Time);
            try{
                preparedStatement.executeUpdate();
                preparedStatement.close();
             }
             catch(Exception kl)
             {
                kl.toString();
                System.out.println(kl);
                preparedStatement.close();
             }


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
                    <td><b><b><input type="text" name="mail" value="abhinay@mapmyindia.com" readonly/><br/>
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
                    The part number was <%=Part%>. The Category name was <%=Product%>. The Model Number was <%=Type%>. The type was <%=Uses%> and <%=Status%>. It is The quantity was <%=Quantity%>. 
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


