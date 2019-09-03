<%-- 
    Document   : home_admin
    Created on : Jun 30, 2019, 4:07:14 PM
    Author     : Administrator
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <jsp:include page="../include/css-header.jsp"/>
    </head>
    <body>
        <header class="header" >
            <div class="header_content d-flex flex-row align-items-center justify-content-start">
                <div class="logo" style="border: solid 2px #000"><a href="#"style="color: black">The River</a></div>
                <div class="ml-auto d-flex flex-row align-items-center justify-content-start">
                    <nav class="main_nav">
                        <ul class="d-flex flex-row align-items-start justify-content-start" >
                            <li><a href="<c:url value="/manager-service"/>" style="color: darkred">Manager Service</li>
                            <li><a href="<c:url value="/manager-promotion"/>"style="color: darkred">Manager Promotion</li>
                            <li><a href="<c:url value="/manager-room"/>"style="color: darkred">Manager Room</li>
                            <li><a href="<c:url value="/manager-category"/>"style="color: darkred">Manager RoomCategory</li>
                            <li><a href="<c:url value="/logout"/>"style="color: darkred">Logout</a></li>
                        </ul>
                    </nav>

                    <!-- Hamburger Menu -->
                    <div class="hamburger"><i class="fa fa-bars" aria-hidden="true"></i></div>
                </div>
            </div>
        </header>
                        <div>
                            
                        </div>
        <jsp:include page="../include/footer.jsp"/>
        <jsp:include page="../include/js-footer.jsp"/> 
    </body>
</html>
