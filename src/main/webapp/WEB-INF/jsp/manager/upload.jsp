<%-- 
    Document   : upload
    Created on : Jun 23, 2018, 10:27:01 AM
    Author     : AnhLe
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc"  %>   
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Upload File Request Page</title>
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
                    <h2>Image Form</h2>
                </div>
            </div>

            <c:if test="${message!=null && message!=''}">
                <div class="row">
                    <div class="col-xs-12 col-sm-12">
                        <div class="alert alert-danger">
                            ${message}
                        </div>
                    </div>
                </div>
            </c:if>

            <div class="row">
                <div class="col-xs-12 col-sm-12">
                    <mvc:form action="${pageContext.request.contextPath}/uploadFile" enctype="multipart/form-data" 
                              method="post" modelAttribute="image" class="form-horizontal">
                     
                        <div class="form-group">
                            <label class="control-label col-sm-2"> Name 
                                <span class="ui-required">(*)</span></label>
                            <div class="col-sm-8">
                              <input type="file" name="file">
                            </div>
                        </div>
                       <div class="form-group">
                            <label class="col-sm-2 control-label">Service</label>
                            <div class="col-sm-8">
                                <select class="form-control" name="service.id" >
                                    <c:forEach items="${service}" var="s">
                                        <c:if test="${s.id==image.service.id}">
                                            <option value="${c.id}" selected>${s.name}</option>
                                        </c:if>
                                        <c:if test="${s.id!=image.service.id}">
                                            <option value="${s.id}">${s.name}</option>
                                        </c:if>    
                                    </c:forEach>
                                </select>
                            </div>
                        </div>                     
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
                        <div class="form-group" style="text-align: center">                            
                             
                                <button class="btn btn-success" type="submit">
                                    Upload</button>
                        

                        </div>
                    </mvc:form>
                </div>
            </div>
        </div>
                           </div>
            <jsp:include page="../include/footer.jsp"/>
            <jsp:include page="../include/js-footer.jsp"/> 
        </div>
<!--        <form method="POST" action="uploadFile" enctype="multipart/form-data">
            File to upload: <input type="file" name="file"><br /> 
            <input type="submit" value="Upload"> Press here to upload the file!
        </form>	
        <br>

        <a href="multipleUpload">upload multiple file</a>-->
    </body>
</html>
