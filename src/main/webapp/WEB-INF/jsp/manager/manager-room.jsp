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
        <title>Manager Room</title>
        <jsp:include page="../include/css-header.jsp"/>
        <link href="<c:url value="/webjars/bootstrap/3.4.1/css/bootstrap.min.css"/>" type="text/css" rel="stylesheet" />

    </head>
    <body>
        <div class="super_container">

            <jsp:include page="../include/manager1-menu.jsp"/>

            <div class="blog" style="padding-top: 200px">

                <div class="container">
                    <div class="row">
                        <div class="col-xs-12 col-sm-12" style="text-align: center">
                            <h2>Manager Room</h2>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-6 col-sm-12" style="padding-bottom: 10px; text-align: right">
                            <button class="btn btn-primary" onclick="location.href = '<c:url value="/manager/Add"/>'">Add Room </button>
                        </div>
                        <div class="col-xs-6 col-sm-6" style="padding-bottom: 10px; text-align: right">

                        </div>
                    </div>                
                    <c:if test="${status == 'fail'}">
                        <div class="alert alert-danger">${message}</div>
                    </c:if>
                    <c:if test="${status == 'ok'}">
                        <div class="alert alert-success">${message}</div>
                    </c:if>
                    <input class="form-control" id="myInput" type="text"placeholder="Search..">
                    <br>
                    <table class="table table-borde red table-striped">
                        <thead>
                            <tr>
                                <th>RoomNumber</th>
                                <th>RoomCategory</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody id="myTable">
                            <c:if test="${room != null && fn:length(room)>0}">
                                <c:forEach items="${room}" var="r">
                                    <tr>
                                        <td>${r.roomNumber}</td>
                                        <td>${r.roomCategory.name}</td>                               
                                        <td>${r.status}</td>
                                        <td>                                                                                                                        
                                            <button class="btn btn-warning" onclick="location.href = '<c:url value="/manager/Update/${r.id}"/>'">Update</button>
                                            <button class="btn btn-danger" onclick="location.href = '<c:url value="/manager/Delete/${r.id}"/>'">Delete</button>

                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:if>
                        </tbody>
                    </table>
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
