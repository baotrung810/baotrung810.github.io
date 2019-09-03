<%-- 
    Document   : home
    Created on : May 8, 2019, 7:41:11 PM
    Author     : SaT_LoP
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc"  %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link href="<c:url value="/webjars/bootstrap/3.4.1/css/bootstrap.min.css"/>" type="text/css" rel="stylesheet" />
        <jsp:include page="../include/css-header.jsp"/>
    </head>
    <body>
        <div class="super_container">
            <jsp:include page="../include/manager-menu.jsp"/>
            <div class="blog" style="padding-top: 200px">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12 col-sm-12" style="text-align: center">
                            <h2>List BookingRoom</h2>
                        </div>
                    </div>
                    <c:if test="${status == 'fail'}">
                        <div class="alert alert-danger">${message}</div>
                    </c:if>
                    <c:if test="${status == 'ok'}">
                        <div class="alert alert-success">${message}</div>
                    </c:if>
                    <div class="row">

                        <div class="col-xs-12 col-sm-12">
                            <p><b>Check in:</b>${inDate}</p> 
                            <p><b>Check out:</b>${outDate}</p> 
                            <p><b>BookingDate:</b>${currentDate}</p>     
                            <div class="table-responsive">
                                <table class="table table-bordered">
                                    <tr>
                                    </th><th>RoomNumber</th>
                                <th>RoomCategory</th>
                                <th>Price</th>
                                <th>Image</th>
                                <th>Service</th>
                                <th>Action</th>

                            </tr>

                            <c:forEach items="${booking.bookingDetail}" var="b">
                                <tr>
                                    <td>${b.room.roomNumber}</td>

                                    <td>${b.room.roomCategory.name}</td>

                                    <td><fmt:formatNumber pattern="###,###" value="${b.room.roomCategory.price}"/> VNĐ</td>
                                    <td>
                                        <c:set var="size" value="${fn:length(b.room.roomCategory.images)}"/>
                                        <img src="<c:url value="/resources/images/${b.room.roomCategory.images[size-1].name}"/>" alt="" style="height: 211px">
                                    </td>
                                    <td>                                         
                                            <mvc:form action="${pageContext.request.contextPath}/reception/service-book/${b.room.id}" 
                                                                                            method="GET" class="form-inline">
                                                <div class="col-sm-8">
                                                    <select class="form-control" name="serviceId" >
                                                        <c:forEach items="${service}" var="s">                                                        
                                                            <option value="${s.id}">${s.name}</option>                                                                                                               
                                                        </c:forEach>
                                                    </select>
                                                    <div>
                                                        <c:forEach items="${b.services}" var="ss">
                                                            ${ss.name},
                                                        </c:forEach>
                                                    </div>

                                                    <button class="btn btn-primary" type="submit">
                                                        Update</button>
                                                </div>

                                            </mvc:form>                                     
                                        </td>
                                        <td>
                                            <button class="btn btn-warning" onclick="location.href = '<c:url value="/reception/remove/${b.room.id}"/>'">remove</button>
                                        </td>
                                    </tr>
                            </c:forEach>


                        </table> 
                        <p><strong>Total:</strong>${booking.totalPrice}</p>
                        <button class="btn btn-primary" onclick="location.href = '<c:url value="/reception/customer"/>'">Accept</button>
                        <button class="btn btn-primary" onclick="location.href = '<c:url value="/reception/return"/>'">Continue Booking</button>

                    </div>
                </div>
            </div>

        </div>
    </div>
    <jsp:include page="../include/footer.jsp"/>
    <jsp:include page="../include/js-footer.jsp"/>
</div>
</body>
</html>
