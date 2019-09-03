<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header class="header">
    <div class="header_content d-flex flex-row align-items-center justify-content-start">
        <div class="logo"><a href="#">The River</a></div>
        <div class="ml-auto d-flex flex-row align-items-center justify-content-start">
            <nav class="main_nav">
                <ul class="d-flex flex-row align-items-start justify-content-start">
                    <li><a href="<c:url value="/reception/home"/>">Home</a></li>
                    <li><a href="<c:url value="/reception/checkin"/>">Check In</a></li>
                    <li><a href="<c:url value="/reception/checkout"/>">Check Out</a></li>
                    <li><a href="<c:url value="/reception/service"/>">Service</a></li>
                    <li><a href="<c:url value="/logout"/>"> Logout</a></li>
                </ul>
            </nav>


            <!-- Hamburger Menu -->
            <div class="hamburger"><i class="fa fa-bars" aria-hidden="true"></i></div>
        </div>
    </div>
</header>

<!-- Menu -->

<div class="menu trans_400 d-flex flex-column align-items-end justify-content-start">
    <div class="menu_close"><i class="fa fa-times" aria-hidden="true"></i></div>
    <div class="menu_content">
        <nav class="menu_nav text-right">
            <ul>
                <li><a href="<c:url value="/reception/home"/>">Home</a></li>
                <li><a href="<c:url value="/reception/checkin"/>">Check In</a></li>
                <li><a href="<c:url value="/reception/"/>">Check Out</a></li>
                <li><a href="<c:url value="/reception/service"/>">Service</a></li>
                <li><a href="<c:url value="/logout"/>"> Logout</a></li>
            </ul>
        </nav>
    </div>

</div>