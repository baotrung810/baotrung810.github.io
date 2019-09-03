<%-- 
    Document   : home_admin
    Created on : Jun 30, 2019, 4:07:14 PM
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
            <header class="header" style="background-color: black">
                <div class="header_content d-flex flex-row align-items-center justify-content-start">
                    <div class="logo"><a href="#">The River</a></div>
                    <div class="ml-auto d-flex flex-row align-items-center justify-content-start">
                        <nav class="main_nav">
                            <ul class="d-flex flex-row align-items-start justify-content-start">                   
                                <li><a href="<c:url value="/logout"/>">Logout</a></li>
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
                            <li><a href="<c:url value="/logout"/>">Logout</a></li>
                        </ul>
                    </nav>
                </div>

            </div>
            <div class="blog" style="padding-top: 200px">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12 col-sm-12" style="text-align: center">
                            <h2>Manager Account</h2>
                        </div>
                    </div>  
                    <div class="row">
                        <div class="col-xs-6 col-sm-12" style="padding-bottom: 10px; text-align: right">
                            <button class="btn btn-primary" onclick="location.href = '<c:url value="/admin/add"/>'">Add User</button>
                        </div>
                    </div>
                    <input class="form-control" id="myInput" type="text"placeholder="Search.."><br>
                    <c:if test="${status == 'fail'}">
                        <div class="alert alert-danger">${message}</div>
                    </c:if>
                    <c:if test="${status == 'ok'}">
                        <div class="alert alert-success">${message}</div>
                    </c:if>
                    <div class="row">
                        <div class="col-xs-12 col-sm-12">
                            <div class="table-responsive" style="color: black">
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th>FullName</th>  

                                            <th>Email</th>

                                            <th>PhoneNumber</th>

                                            <th>Gender</th>

                                            <th>BirthDate</th>
                                            <th>Role</th>
                                            <th>Action</th>
                                        </tr>
                                    <thead>
                                    <tbody id="myTable">
                                        <c:if test="${account != null && fn:length(account)>0}">
                                            <c:forEach items="${account}" var="a">
                                                <tr>
                                                    <td>${a.fullname}</td>

                                                    <td>${a.email}</t>

                                                    <td>${a.phoneNumber}</td>

                                                    <td>${a.gender}</td>
                                                    <td>${a.birthDate}</td>                                        
                                                    <td>  <c:forEach items="${a.accountRoles}" var="role">${role.roles}, </c:forEach> </td>
                                                        <td>
                                                            <button class="btn btn-warning" onclick="location.href = '<c:url value="/admin/update/${a.id}"/>'">Update</button>

                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </c:if>
                                    </tbody>
                                    <c:if test="${account == null || fn:length(account)<=0}">
                                        <tr>
                                            <td class="bg-warning" colspan="9" style="color: red; text-align: center">No record</td>
                                        </tr>
                                    </c:if>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <jsp:include page="../include/footer.jsp"/>
            <jsp:include page="../include/js-footer.jsp"/> 
        </div>
        <script>
            $(document).ready(function () {
                $("#myInput").on("keyup", function () {
                    var value = $(this).val().toLowerCase();
                    $("#myTable tr").filter(function () {
                        $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                    });
                });
            });
        </script>
    </body>
</html>
