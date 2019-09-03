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
        <title>Information Customer Form</title>
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

            <jsp:include page="../include/manager-menu.jsp"/>
            <div class="blog" style="padding-top: 200px">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12 col-sm-12" style="text-align: center">
                            <h2>Information Customer Form</h2>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-xs-12 col-sm-12">
                            <mvc:form action="${pageContext.request.contextPath}/reception/confirm" 
                                      method="post" modelAttribute="customer" class="form-horizontal">                   
                                <div class="form-group">
                                    <label class="control-label col-sm-2"> Name 
                                        <span class="ui-required">(*)</span></label>
                                    <div class="col-sm-8">
                                        <input name="name" required type="text" class="form-control"/>                                    
                                    </div>
                                </div>                                                                       
                                <div class="form-group">
                                    <label class="control-label col-sm-2"> 
                                        Email  <span class="ui-required">(*)</span> </label>
                                    <div class="col-sm-8">
                                        <input type="email" name="email" class="form-control" required/>
                                        </input>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-2"> 
                                        Phone  <span class="ui-required">(*)</span> </label>
                                    <div class="col-sm-8">
                                        <input type="number" name="phoneNumber" class="form-control"   />                                                                           
                                    </div>
                                </div>                      
                                <div class="form-group">
                                    <label class="control-label col-sm-2">Birth Date</label>
                                    <div class="col-sm-8">
                                        <input type="date"  name="birthDate" class="form-control"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">Gender</label>
                                    <div class="col-sm-8">
                                        <c:forEach items="${gender}" var="gender">
                                            <label class="radio-inline">
                                                <input type="radio" value="${gender}" name="gender">
                                                ${gender}
                                            </label>
                                        </c:forEach>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="control-label col-sm-2">Status</label>
                                    <div class="col-sm-8">
                                        <textarea name="status" rows="3"  class="form-control"></textarea>
                                    </div>
                                </div>
                                <div class="form-group" style="text-align: center">                            
                                    <button class="btn btn-primary" type="submit">
                                        Confirm</button>                                                            
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
