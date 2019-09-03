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

        <title>Manager Service</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">        
        <jsp:include page="../include/css-header.jsp"/>
    </head>
    <body>
        <div class="super_container">
            <jsp:include page="../include/manager1-menu.jsp"/>
            <div class="blog" style="padding-top: 200px">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12 col-sm-12" style="text-align: center">
                            <h2>Manager Service</h2>
                        </div>   
                        <c:if test="${status == 'fail'}">
                            <div class="alert alert-danger">${message}</div>
                        </c:if>
                        <c:if test="${status == 'ok'}">
                            <div class="alert alert-success">${message}</div>
                        </c:if>
                        <button class="btn btn-primary" style="padding: 5px 0px; margin-right: 5px; float: right "  onclick="location.href = '<c:url value="/manager/add"/>'">Add Service </button><br>
                        <button class="btn btn-primary" style="padding: 5px 0px"  onclick="location.href = '<c:url value="/manager/uploadImage"/>'">Upload Image</button> 
                        <c:if test="${action == 'uploadFile'}">
                            <div class="col-xs-12 col-sm-12" style="margin-top: 10px">
                                <mvc:form action="${pageContext.request.contextPath}/uploadFile" enctype="multipart/form-data" 
                                          method="post" modelAttribute="image" class="form-horizontal">                                  
                                        <label> Name 
                                            <span class="ui-required">(*):</span></label>                                       
                                            <input  type="file" name="file">
                                            <label style="color: black">Service:</label>
                                            <select name="service.id" style="padding: 2.5px;">
                                                <c:forEach items="${service}" var="s">
                                                    <c:if test="${s.id==image.service.id}">
                                                        <option value="${c.id}" selected>${s.name}</option>
                                                    </c:if>
                                                    <c:if test="${s.id!=image.service.id}">
                                                        <option value="${s.id}">${s.name}</option>
                                                    </c:if>    
                                                </c:forEach>
                                            </select>
                                    <!--                        <div class="form-group">
                                                                <label class="col-sm-2 control-label">RoomCategory</label>
                                                                <div class="col-sm-8">
                                                                    <select class="form-control" name="roomCategory.id" >
                                    <c:forEach items="${category}" var="c">
                                        <c:if test="${c.id==room.roomCategory.id}">
                                            <option value="${c.id}" selected>${c.name}</option>
                                        </c:if>
                                        <c:if test="${c.id!=room.roomCategory.id}">
                                            <option value="${c.id}">${c.name}</option>
                                        </c:if>    
                                    </c:forEach>
                                </select>
                            </div>
                        </div>-->
                                        <button  type="submit">  Upload</button>
                                </mvc:form>
                            </div>
                        </c:if>
                        <input class="form-control" id="myInput" style="margin: 20px 0px;" type="text"placeholder="Search..">

                        <table class="table table-borde red table-striped" style="color: black">
                            <thead>
                                <tr>

                                    <th>Name</th>
                                    <th>Image</th>
                                    <th>Description</th>
                                    <th>Price</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody id="myTable">
                                <c:if test="${service != null && fn:length(service)>0}">
                                    <c:forEach items="${service}" var="s">
                                        <tr>
                                            <td><strong>${s.name}</strong></td>
                                            <c:set var="size" value="${fn:length(s.images)}"/>
                                            <td><img src="<c:url value="/resources/images/${s.images[size-1].name}"/>" alt="" style="height: 150px"></td>                                            
                                            <td>${s.description}</td>
                                            <td><fmt:formatNumber pattern="###,###" value="${s.price}"/> VNĐ</td>
                                            <td>                                                                                                                        
                                                <button class="btn btn-warning" onclick="location.href = '<c:url value="/manager/update/${s.id}"/>'">Update</button>
                                                <button class="btn btn-danger" onclick="location.href = '<c:url value="/manager/delete/${s.id}"/>'">Delete</button>

                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                            </tbody>
                        </table>
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
