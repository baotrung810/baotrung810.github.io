<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/security/tags"
          prefix="sec"%>
<header class="header">
    <div class="header_content d-flex flex-row align-items-center justify-content-start">
        <div class="logo"><a href="#">The River</a></div>
        <div class="ml-auto d-flex flex-row align-items-center justify-content-start">
            <nav class="main_nav">
                <ul class="d-flex flex-row align-items-start justify-content-start">
                    <li class="active"><a href="index.html">Home</a></li>
                    <li><a href="about.html">About us</a></li>
                    <li><a href="#">Rooms</a></li>
                    <li><a href="blog.html">Promotion</a></li>
                    <li><a href="contact.html">Service</a></li>
                        <sec:authorize access="!isAuthenticated()">
                        <li><a href="<c:url value="/login"/>">Login</a></li>
                        <li><a href="contact.html">Register</a></li>
                        </sec:authorize>
                        <sec:authorize access="isAuthenticated()">
                            <li><a href="<c:url value="/logout"/>">Logout</a></li>
                        </sec:authorize>

                </ul>
            </nav>
            <div class="book_button"><a href="booking.jsp">Book Online</a></div>
            <div class="header_phone d-flex flex-row align-items-center justify-content-center">
                <img src="../resources/images/phone.png" alt="">
                <span>0183-12345678</span>
            </div>

            <!-- Hamburger Menu -->
            <div class="hamburger"><i class="fa fa-bars" aria-hidden="true"></i></div>
        </div>
    </div>
</header>
