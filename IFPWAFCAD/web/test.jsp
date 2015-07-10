<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page import="java.io.FileOutputStream"%>
<%-- 
    Document   : test
    Created on : Jul 7, 2015, 4:19:00 PM
    Author     : agupta
--%>
<%--<%@page import= "java.io.*" %>--%>
<%@page import= "java.sql.*" %>
<%--<%@page import= "org.apache.hssf.usermodel.HSSFSheet" %>--%>
<%@page import= "org.apache.poi.hssf.usermodel.*"%>
<%--<%@page import= "org.apache.poi.hssf.usermodel.HSSFRow"%>
<%@page import= "org.apache.poi.hssf.usermodel.HSSFCell"%>--%>
<%--<sql:update var="insertquery" dataSource="jdbc/IFPWAFCAD">
    INSERT INTO OPENROWSET 
    ('Microsoft.Jet.OLEDB.4.0', 
    'Excel 8.0;Database=c:\Test.xls;','SELECT * FROM Map_My_India')

</sql:update>--%>
<% 

                
                        Class.forName("com.mysql.jdbc.Driver").newInstance();
                        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/MyNewDatabase", "root", "user");
                        PreparedStatement psmnt = null;
                        Statement st = connection.createStatement();
                        ResultSet rs = st.executeQuery("Select * from Map_My_India Where Approved = 'Approved' ");

                        HSSFWorkbook wb = new HSSFWorkbook();
                        HSSFSheet sheet = wb.createSheet("Excel Sheet");
                        HSSFRow rowhead = sheet.createRow((short) 0);
                        rowhead.createCell((short) 0).setCellValue("Part Number");
                        rowhead.createCell((short) 1).setCellValue("Product Name");
                        rowhead.createCell((short) 2).setCellValue("Category");
                        rowhead.createCell((short) 3).setCellValue("Uses");
                         rowhead.createCell((short) 3).setCellValue("Status");
                        rowhead.createCell((short) 4).setCellValue("Quantity");
                        rowhead.createCell((short) 5).setCellValue("Time order was Passed");

                        int index = 1;
                        while (rs.next()) 
                            {

                                HSSFRow row = sheet.createRow((short) index);
                                row.createCell((short) 0).setCellValue(rs.getString(1));
                                System.out.print(rs.getString(1));
                                row.createCell((short) 1).setCellValue(rs.getString(2));
                                row.createCell((short) 2).setCellValue(rs.getString(3));
                                row.createCell((short) 3).setCellValue(rs.getString(4));
                                row.createCell((short) 4).setCellValue(rs.getString(5));
                                row.createCell((short) 4).setCellValue(rs.getString(6));
                                row.createCell((short) 5).setCellValue(rs.getString(9));
                                index++;
                            }
                        FileOutputStream fileOut = new FileOutputStream("/users/agupta/desktop/production.xls");
                        wb.write(fileOut);
                        fileOut.close();
                        System.out.println("Data is saved in excel file.");
                        rs.close();
                        connection.close();
                    
%> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>It has been imported in Excel in a file called production.xls </h1>
    </body>
</html>
