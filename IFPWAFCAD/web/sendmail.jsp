<%-- 
    Document   : sendmail
    Created on : Jul 6, 2015, 8:03:43 AM
    Author     : agupta
--%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>


<jsp:useBean id="mail" scope="session" class="jmail.Mail" />
<jsp:setProperty name="mail" property="to" param="to" />
<jsp:setProperty name="mail" property="from" value="mapmyindia123@gmail.com" />
<jsp:setProperty name="mail" property="smtpServ" value="smtp.gmail.com" />
<jsp:setProperty name="mail" property="part" param="part" />
<jsp:setProperty name="mail" property="product" param="product" />
<jsp:setProperty name="mail" property="type" param="type" />
<jsp:setProperty name="mail" property="use" param="use" />


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<b>Print value defined in set tag :</b> <s:property value="#from" /> <br/>
 <%
String to = "mapmyindia123@gmail.com";
int abc = 123;

//<jsp:getProperty property="name" name="u"/>;
System.out.println("To "+ to) ;
int result;
result = mail.sendMail();
if(result == 0){
    out.println(" Mail Successfully Sent to "+to);
}
else{
    out.println(" Mail NOT Sent to "+to);
}  
%>
<sql:update var="Material" dataSource="jdbc/IFPWAFCAD">
    INSERT INTO Material (Id1, Part, Product, Type, Uses)
    VALUES (abc, '123','to','Type','Use');
</sql:update>

    
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>A Page</title>
    </head>
    <body>
        <h1></h1>
    </body>
</html>

