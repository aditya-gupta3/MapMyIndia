<%-- 
    Document   : inventory
    Created on : Jul 7, 2015, 12:02:32 PM
    Author     : agupta
--%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import= "java.sql.Connection" %>
<%@page import= "java.sql.*" %>
<%--<%@page import= "java.sql.util.*" %>--%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
        <% 


            String Part1 = (String)request.getParameter("part1");

            String Product1 = (String)request.getParameter("product1");

            String Uses1 = (String)request.getParameter("use1");
            String Approve1 = (String)request.getParameter("approve1");
            String Time = (String)request.getParameter("time1");
            System.out.print(Part1);
            System.out.print(Product1);
            System.out.print(Time);
            System.out.print(Uses1);

            String sql = ("UPDATE Map_My_India SET Approved = ? WHERE Part = ? AND Product = ? AND Uses = ? AND TIME = ? LIMIT 1");
//            AND Product = ? AND Type = ? AND USES = ?
            Connection conn = null;
            String DB_URL = "jdbc:mysql://localhost:3306/MyNewDatabase";

            String USER = "root";
            String PASS = "user";
            conn = DriverManager.getConnection(DB_URL, USER, PASS);
            PreparedStatement preparedStatement = conn.prepareStatement(sql);
            
            preparedStatement.setString(1, "Approved");
            preparedStatement.setString(2, Part1);
            preparedStatement.setString(3, Product1);
//            preparedStatement.setString(4,"Test1233");
            preparedStatement.setString(4, Uses1);
            preparedStatement.setString(5, Time);


            
            

            
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
            
<!--PART
PRODUCT
CATEGORY
USES
STATUS
QUANTITY
APPROVED
TIME
FAULTY-->
 <% 
            Connection conne = null;

            conne = DriverManager.getConnection(DB_URL, USER, PASS);
            Statement statement = conne.createStatement() ;
            ResultSet resultset = statement.executeQuery("select * from Map_My_India Where Approved ='Approved' ") ; 



%>
            
            
            
<HTML>
    <body>
    <h1> The Inventory is as follows: </h1>
    <br>
    <br>
    <b> Product Name </b>
    <form name="subinventory" action="subinventory.jsp" method="POST">
    <select name="productname">
        <option></option>
        <option>A</option>
        <option>B</option>
        <option>C</option>
        <option>D</option>
        <option>X</option> 
    </select>
         <b> Product Category </b>
    <select name="productcategory">
        <option></option>
        <option>A</option>
        <option>B</option>
        <option>C</option>
        <option>D</option>
        <option>X</option> 
    </select>
          <b> Product Use </b>
    <select name="productuse">
        <option></option>
        <option>A</option>
        <option>B</option>
        <option>C</option>
        <option>D</option>
        <option>X</option> 
    </select>
        <input type="submit" value="submit" />
    </form>


        <TABLE BORDER="1">
            <TR>
                <TH>Part Number</TH>
                <TH>Product</TH>
                <TH>Type</TH>
                <TH>Use</TH>
                <TH>Status</TH>
                <TH>Quantity of Product </TH>
                <TH>Approval Status</TH>
                <TH>Date and Time Order was Passed</TH>
                
            </TR>
            <% while(resultset.next()){ %>
            <TR>
                    <TD> <%= resultset.getString(1) %> </td>
                    <TD><%= resultset.getString(2) %></TD>
                    <TD><%= resultset.getString(3) %></TD>
                    <TD><%= resultset.getString(4) %></TD>
                    <TD><%= resultset.getString(5) %></TD>
                    <TD><%= resultset.getString(6) %></TD>
                    <TD><%= resultset.getString(7) %></TD>
                    <TD><%= resultset.getString(9) %></TD>

            </TR>
            <% } %>
        </TABLE>
        <br>
        <br>
        <br>
        <form name="Import_Excel" action="test.jsp" method="POST">
            <input type="submit" value="Import in Excel" name="Excel.import" />
        </form>
    </BODY>
</HTML>