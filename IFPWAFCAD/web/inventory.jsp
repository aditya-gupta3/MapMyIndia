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
    <center><b> Modify Your Search </b></CENTER>
    <br>
    <br>
    <form name="subinventory" action="subinventory.jsp" method="POST">
        <CENTER><b> Part Number </b>
        <input type="text" name="productnumber" value="" />
         <b> Category </b>
    <input type="text" name="productcategory" value="" />
          <b> Model Name </b>
    <input type="text" name="productmodel" value="" />
         <b> Trade/Raw/Spares </b>
         <select name="producttype">
             <option></option>
             <option>Trade</option>
             <option>Raw</option>
             <option>Spare</option>
         </select>
        <br>
        <br>
         <b> Local/Import </b>
         <select name="productuse">
             <option></option>
             <option>Local</option>
             <option>Import</option>
         </select>
    <b> From Date </b><input type="date" name="fromdate" value="" />
    <b> To Date </b><input type="date" name="todate" value="" />
    <input type="submit" value="submit" />
        </CENTER>

    </form>
    


        <TABLE BORDER="1">
            <TR>
                <TH>Part Number</TH>
                <TH>Category</TH>
                <TH>Model Name</TH>
                <TH>Trade/Raw/Spare</TH>
                <TH>Local/Import</TH>
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