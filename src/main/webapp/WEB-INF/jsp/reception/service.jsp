<%-- 
    Document   : service
    Created on : Jul 16, 2019, 9:09:28 PM
    Author     : Administrator
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc"  %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Service</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <jsp:include page="../include/css-header.jsp"/>
    </head>
    <body>
        <div class="super_container">

            <jsp:include page="../include/manager-menu.jsp"/>

            <div class="blog" style="padding-top: 200px">
                <div class="container">
                    <div class="row">
                        <c:forEach items="${service}" var="s">
                            <div class="col-md-4">
                                <c:set var="size" value="${fn:length(s.images)}"/>
                                <img src="<c:url value="/resources/images/${s.images[size-1].name}"/>" alt="" style="height: 211px">
                                <div class="caption">
                                    <p><b> ${s.name}</b></p>
                                    <p> Descreption: ${s.description}</p>
                                    <p> Price: <fmt:formatNumber pattern="###,###" value="${s.price}"/> VNĐ</p>                                
                                </div>

                            </div>   
                        </c:forEach>                            
                    </div>
                </div>
            </div>
            <jsp:include page="../include/footer.jsp"/>
            <jsp:include page="../include/js-footer.jsp"/>
        </div>
    </body>
</html>

