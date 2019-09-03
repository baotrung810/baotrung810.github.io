<%-- 
    Document   : book-form
    Created on : May 22, 2019, 7:41:28 PM
    Author     : AnhLe
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Service Form</title>
        <link href="<c:url value="/webjars/bootstrap/3.4.1/css/bootstrap.min.css"/>" 
              type="text/css" rel="stylesheet" />
        <jsp:include page="../include/css-header.jsp"/>
        <style>
            .ui-required{
                color: red;
            }
        </style>
    </head>
    <body>
        <div class="super_container">

            <jsp:include page="../include/manager1-menu.jsp"/>

            <div class="blog" style="padding-top: 200px">
                <!--        <footer class="footer">
                            <div class="footer_content">
                                <div class="container">
                                    <div class="row">
                                        <div class="col">
                                            <div class="footer_logo_container text-center">
                                                <div class="footer_logo">
                                                    <div>The River</div>
                                                    <div>since 1945</div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                
                                </div>
                            </div>
                        </footer>-->
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12 col-sm-12" style="text-align: center">
                            <h2>RoomCategory Form</h2>
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
                            <mvc:form action="${pageContext.request.contextPath}/manager/${action}" 
                                      method="post" modelAttribute="category" class="form-horizontal">
                                <c:if test="${action=='update-category'}">
                                    <input name="id" value="${category.id}" hidden>

                                </c:if>
                                <div class="form-group">
                                    <label class="control-label col-sm-2"> Name 
                                        <span class="ui-required">(*)</span></label>
                                    <div class="col-sm-8">
                                        <input name="name" required type="text" class="form-control"
                                               value="${category.name}"/>
                                    </div>
                                </div>



                                <div class="form-group">
                                    <label class="control-label col-sm-2"> 
                                        Description </label>
                                    <div class="col-sm-8">
                                        <textarea name="decription" class="form-control" rows="3"/>
                                        ${category.decription}
                                        </textarea>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-2"> 
                                        Price </label>
                                    <div class="col-sm-8">
                                        <input name="price" 
                                               class="form-control"
                                               value="${category.price}"/>
                                    </div>

                                </div>                      
                                <div class="form-group">
                                    <label class="control-label col-sm-2"> 
                                        Status </label>
                                    <div class="col-sm-8">
                                        <input name="status" 
                                               class="form-control"
                                               value="${category.status}"/>
                                    </div>
                                </div>                           
                                <div class="form-group" style="text-align: center">
                                    <c:if test="${action=='update-category'}">
                                        <button class="btn btn-primary" type="submit">
                                            Update</button>
                                        </c:if>
                                        <c:if test="${action=='add-category'}">
                                        <button class="btn btn-success" type="submit">
                                            Add Category</button>
                                        </c:if>

                                </div>
                            </mvc:form>
                        </div>
                    </div>
                </div>


            </div>
            <jsp:include page="../include/footer.jsp"/>
            <jsp:include page="../include/js-footer.jsp"/> 
        </div>

    </body>
</html>
