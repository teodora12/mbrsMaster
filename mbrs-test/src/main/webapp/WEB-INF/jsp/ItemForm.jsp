<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>New Item form</title>
</head>
<body>
    <%@ include file="navigation.jsp"%>
    <c:url var="action" value="/addItem" />
    <div class="container">
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6 border p-4">
                <h5 class="text-center">Item form</h5>
                <form:form class="p-2" action="${action}" method="post" modelAttribute="item">
                    <div class="form-group">
                        <form:label path="id">Id</form:label>
                        <form:input cssClass="form-control" path="id" />
                    </div>
                    <div class="form-group">
                        <form:label path="name">Name</form:label>
                        <form:input cssClass="form-control" path="name" />
                    </div>
                    <div class="form-group">
                        <form:label path="description">Description</form:label>
                        <form:input cssClass="form-control" path="description" />
                    </div>

                            <div class="form-group ">
                            <form:label path="report">Report</form:label>
                            <form:checkboxes items="${reports}" path="report" element="div class='checkbox border rounded p-2' " itemValue="id"/>
                            </div>

                    <div>
                         <button class="btn btn-success float-right" type="submit">Save item</button>
                    </div>      
                 </form:form>
            </div>
            <div class="col-md-3"></div>
          </div>
     </div>
</body>
</html>