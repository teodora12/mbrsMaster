<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>New ReportItem form</title>
</head>
<body>
    <%@ include file="navigation.jsp"%>
    <c:url var="action" value="/reportItem" />		
    <div class="container">
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6 border p-4">
                <h5 class="text-center">New ReportItem form</h5>
                <form:form class="p-2" action="${action}" method="post" modelAttribute="reportItem">
                    <div class="form-group">
                        <form:label path="id">Id</form:label>
                        <form:select path="id" cssClass="form-control">
                            <option value="-1">Select a id</option>
                            <form:options items="${ids}" itemValue="id"/>
                        </form:select>	
                    </div>
                    <div class="form-group">
                        <form:label path="name">Name</form:label>
                        <form:select path="name" cssClass="form-control">
                            <option value="-1">Select a name</option>
                            <form:options items="${names}" itemValue="id"/>
                        </form:select>	
                    </div>
                    <div class="form-group">
                        <form:label path="descriptioin">Descriptioin</form:label>
                        <form:select path="descriptioin" cssClass="form-control">
                            <option value="-1">Select a descriptioin</option>
                            <form:options items="${descriptioins}" itemValue="id"/>
                        </form:select>	
                    </div>
                    <div>
                         <button class="btn btn-success float-right" type="submit">Add reportItem</button>
                    </div>      
                 </form:form>
            </div>
            <div class="col-md-3"></div>
          </div>
     </div>
</body>
</html>