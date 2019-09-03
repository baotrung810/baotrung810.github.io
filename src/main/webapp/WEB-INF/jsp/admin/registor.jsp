
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="Colorlib Templates">
        <meta name="author" content="Colorlib">
        <meta name="keywords" content="Colorlib Templates">
        <title>Registor Form</title>        

        <link href="<c:url value="../resources-registor/vendor/mdi-font/css/material-design-iconic-font.min.css"/>" rel="stylesheet" media="all">
        <link href="<c:url value="../resources-registor/vendor/font-awesome-4.7/css/font-awesome.min.css"/>" rel="stylesheet" media="all">
        <!-- Font special for pages-->
        <link href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

        <!-- Vendor CSS-->
        <link href="<c:url value="../resources-registor/vendor/select2/select2.min.css"/>" rel="stylesheet" media="all">
        <link href="<c:url value="../resources-registor/vendor/datepicker/daterangepicker.css"/>" rel="stylesheet" media="all">

        <!-- Main CSS-->
        <link href="<c:url value="../resources-registor/css/main.css"/>" rel="stylesheet" media="all">
    </head>
    <body>
        <div class="page-wrapper bg-gra-01 p-t-180 p-b-100 font-poppins">
            <div class="wrapper wrapper--w780">
                <div class="card card-3">
                    <div class="card-heading"></div>
                    <div class="card-body">
                        <h2 class="title">Registration Info</h2>
                        <form method="POST" action="<c:url value="/admin/add-account"/>" class="form-horizontal">
                            <div class="input-group">
                                <input class="input--style-3" type="text" placeholder="Name" name="fullName">
                            </div>
                            <!--                            <div class="input-group">
                                                            <input class="input--style-3 js-datepicker" type="text" placeholder="Birthdate" name="birthday">
                                                            <i class="zmdi zmdi-calendar-note input-icon js-btn-calendar"></i>
                                                        </div>-->
                            <div class="input-group">
                                <div class="rs-select2 js-select-simple select--no-search">
                                    <select name="gender">
                                        <option disabled="disabled" selected="selected">Gender</option>
                                        <c:forEach items="${gender}" var="gender">
                                            <option value="${gender}" required>${gender}</option>                                           
                                        </c:forEach>
                                    </select>
                                    <div class="select-dropdown"></div>
                                </div>
                            </div>
                            <div class="input-group">
                                <div class="rs-select2 js-select-simple select--no-search">
                                    <select name="role" required>
                                        <option disabled="disabled" selected="selected">Role</option>
                                        <c:forEach items="${roles}" var="role">
                                            <option value="${role.id}">${role.roles}</option>
                                        </c:forEach>
                                    </select>
                                    <div class="select-dropdown"></div>
                                </div>
                            </div>
                            <div class="input-group">
                                <input class="input--style-3" type="email" placeholder="Email" name="email">
                            </div>
                            <div class="input-group">
                                <input class="input--style-3" type="password" placeholder="Password" name="password">
                            </div>
                            <div class="input-group">
                                <input class="input--style-3" type="text" placeholder="Phone" name="phoneNumber">
                            </div>
                            <div class="p-t-10">
                                <button class="btn btn--pill btn--green" type="submit">Submit</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <!-- Jquery JS-->
        <script src="<c:url value="../resources-registor/vendor/jquery/jquery.min.js"/>"></script>
        <!-- Vendor JS-->
        <script src="<c:url value="../resources-registor/vendor/select2/select2.min.js"/>"></script>
        <script src="<c:url value="../resources-registor/vendor/datepicker/moment.min.js"/>"></script>
        <script src="<c:url value="../resources-registor/vendor/datepicker/daterangepicker.js"/>"></script>
        <script src="<c:url value="../resources-registor/js/global.js"/>"></script>
        
    </body>
</html>
