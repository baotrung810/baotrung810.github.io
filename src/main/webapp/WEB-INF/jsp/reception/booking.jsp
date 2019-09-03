<%-- 
    Document   : manager-service
    Created on : Jul 3, 2019, 3:25:35 PM
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
        <title>JSP Page</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>-->
        <jsp:include page="../include/css-header.jsp"/>
    </head>
    <body>
        <div class="super_container">

            <jsp:include page="../include/reception-menu.jsp"/>

            <div class="home">
                <div class="background_image" style="background-image:url(../resources/images/booking.jpg)"></div>
                <div class="home_container">
                    <div class="container">
                        <div class="row">
                            <div class="col">
                                <div class="home_content text-center">
                                    <div class="home_title">Book a room</div>
                                    <div class="booking_form_container">
                                        <form  action="${pageContext.request.contextPath}/reception/search" method="post" class="booking_form" id="booking_form" >
                                            <div class="d-flex flex-xl-row flex-column align-items-start justify-content-start">
                                                <div class="booking_input_container d-flex flex-row align-items-start justify-content-start flex-wrap">
                                                    <div><input name="checkIn" type="text" class="datepicker booking_input booking_input_a booking_in" placeholder="Check in" required="required"></div>
                                                    <div><input name="checkOut" type="text" class="datepicker booking_input booking_input_a booking_out" placeholder="Check out" required="required"></div>
                                                    <div>
                                                        <select class="booking_input booking_input_b"  name="category">
                                                            <c:forEach items="${category}" var="c">                                                            
                                                                <option style="color: darkblue" value="${c.id}" >${c.name}</option>                                                               
                                                            </c:forEach>
                                                        </select>                                                            
                                                    </div>
                                                    <div><button class="booking_button trans_200">Book Now</button></div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
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
