<%-- 
    Document   : approve
    Created on : Jul 6, 2015, 2:25:37 PM
    Author     : agupta
--%>

<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<sql:query var="approval" dataSource="jdbc/IFPWAFCAD">
    SELECT Part,product,type,uses FROM Material;
</sql:query>

    
    
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <table border="1">
    <!-- column headers -->
    <tr>
    <c:forEach var="columnName" items="${approval.columnNames}">
        <th><c:out value="${columnName}"/></th>
    </c:forEach>
    </tr>
<!-- column data -->
    <c:forEach var="row" items="${approval.rowsByIndex}">
    <tr>
    <c:forEach var="column" items="${row}">
        <td><c:out value="${column}"/></td>
    </c:forEach>
    </tr>
</c:forEach>
</table>
</html>
