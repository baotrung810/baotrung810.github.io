
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Room Form</title>
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
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12 col-sm-12" style="text-align: center">
                            <h2>Edit Form</h2>
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
                            <mvc:form action="${pageContext.request.contextPath}/admin/update-account" 
                                      method="post" modelAttribute="account" class="form-horizontal">

                                <input name="id" value="${account.id}" hidden>


                                <div class="form-group">
                                    <label class="control-label col-sm-2"> Name 
                                        <span class="ui-required">(*)</span></label>
                                    <div class="col-sm-8">
                                        <input name="fullname" required type="text" class="form-control"
                                               value="${account.fullname}"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="control-label col-sm-2"> 
                                        Email </label>
                                    <div class="col-sm-8">
                                        <input name="email" 
                                               class="form-control"
                                               value="${account.email}"/>
                                    </div>
                                </div>
                                     <div class="form-group">
                                    <label class="control-label col-sm-2"> 
                                        Passoword </label>
                                    <div class="col-sm-8">
                                        <input name="password"
                                               class="form-control"
                                               value="${account.password}"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Role</label>
                                    <div class="col-sm-8">
                                        <select class="form-control" name="accountRoles" row="3" >
                                            <c:forEach items="${roles}" var="role">
                                                <option value="${role.id}">${role.roles}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Gender</label>
                                    <div class="col-sm-8">
                                        <select name="gender" class="form-control">
                                            <option disabled="disabled" selected="selected">Gender</option>
                                            <c:forEach items="${gender}" var="gender">
                                                <option value="${gender}" required>${gender}</option>                                           
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-2"> 
                                        Phone </label>
                                    <div class="col-sm-8">
                                        <input name="phoneNumber" 
                                               class="form-control"
                                               value="${account.phoneNumber}"/>
                                    </div>
                                </div>  
                                <div class="form-group" style="text-align: center">
                                    <button class="btn btn-primary" type="submit">
                                        Update</button>
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
