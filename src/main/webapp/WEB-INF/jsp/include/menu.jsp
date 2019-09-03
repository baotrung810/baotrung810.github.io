<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/security/tags"
          prefix="sec"%>

<p><a href="<c:url value="/home"/>">Home</a></p>
<sec:authorize access="!isAuthenticated()">
    <p><a href="<c:url value="/login"/>">Login</a></p>
</sec:authorize>
    
<sec:authorize access="isAuthenticated()">
    <strong><sec:authentication property="principal.email"/></strong> <!-- authentication: xac thuc -->
    <sec:authorize access="hasAnyRole('ROLE_USER','ROLE_ADMIN')">
        <p><a href="<c:url value="user/user_home"/>">User Home</a></p>
    </sec:authorize>
    <sec:authorize access="hasRole('ROLE_ADMIN')">
        <p><a href="<c:url value="/admin/home"/>">Admin Home</a></p>
    </sec:authorize>
    <p><a href="<c:url value="/logout"/>">Logout</a></p>
</sec:authorize>