<%@taglib uri="http://www.springframework.org/security/tags"
          prefix="sec"%>

<div class="menu trans_400 d-flex flex-column align-items-end justify-content-start">
    <div class="menu_close"><i class="fa fa-times" aria-hidden="true"></i></div>
    <div class="menu_content">
        <nav class="menu_nav text-right">
            <ul>
                <sec:authorize access="isAuthenticated()">
                <li><a href="index.html">Home</a></li>
                <li><a href="about.html">About us</a></li>
                <li><a href="#">Rooms</a></li>
                <li><a href="blog.html">Blog</a></li>
                <li><a href="contact.html">Contact</a></li>
                <sec:authorize access="hasAnyRole('ROLE_USER')">
                    <li><a href="/edit_user">${username}</a></li>
                </sec:authorize>
                    <li><a href="/logout">Logout</a></li>
                </sec:authorize>
                <sec:authorize access="!isAuthenticated()">
                <li><a href="index.html">Home</a></li>
                <li><a href="about.html">About us</a></li>
                <li><a href="#">Rooms</a></li>
                <li><a href="blog.html">Blog</a></li>
                <li><a href="contact.html">Contact</a></li>
                <li><a href="/login">Login</a></li>
                <li><a href="contact.html">Register</a></li>
                </sec:authorize>
                
            </ul>
        </nav>
    </div>
    <div class="menu_extra">
        <div class="menu_book text-right"><a href="#">Book online</a></div>
        <div class="menu_phone d-flex flex-row align-items-center justify-content-center">
            <img src="../resources/images/phone-2.png" alt="">
            <span>0183-12345678</span>
        </div>
    </div>
</div>