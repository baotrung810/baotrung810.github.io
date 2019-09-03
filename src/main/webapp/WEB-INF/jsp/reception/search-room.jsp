<%-- 
    Document   : reception_home
    Created on : Jul 1, 2019, 2:18:13 PM
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
        <title>JSP Page</title>
        <jsp:include page="../include/css-header.jsp"/>
    </head>
    <body>
        <div class="super_container">

            <jsp:include page="../include/manager-menu.jsp"/>
            <div class="blog" style="padding-top: 200px">
                <div class="container">

                    <br>

                    <table class="table table-borde red table-striped">

                        <tr>
                            <th>RoomNumber</th>
                            <th>RoomCategory</th>
                            <th>Price</th>
                            <th>Image</th>
                            <th>Description</th>
                            <th>Action</th>
                        </tr>

                        <c:if test="${room != null && fn:length(room)>0}">
                            <c:forEach items="${room}" var="r">

                                <tr>
                                    <td>${r.roomNumber}</td>
                                    <td>${r.roomCategory.name}</td>                               
                                    <td>${r.roomCategory.price}</td>
                                    <td>
                                        <c:set var="size" value="${fn:length(r.roomCategory.images)}"/>
                                        <img src="<c:url value="/resources/images/${r.roomCategory.images[size-1].name}"/>" alt="" style="height: 211px">

                                    </td>
                                    <td>${r.roomCategory.decription}</td>

                                    <td>
                                        <form action="${pageContext.request.contextPath}/reception/booking" method="post" class="booking_form" id="booking_form" >
                                            <input type="hidden" name="id" value="${r.id}">
                                            <input type="hidden" name="checkin" value="${checkin}">
                                            <input type="hidden" name="checkout" value="${checkout}">
                                            <input type="Submit"  value="Booking"> 
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:if>

                    </table>
                </div>
            </div>
            <jsp:include page="../include/footer.jsp"/>
            <jsp:include page="../include/js-footer.jsp"/>
        </div>
    </body>
</html>
