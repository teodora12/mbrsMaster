<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>New Doctor form</title>
</head>
<body>
    <%@ include file="navigation.jsp"%>
    <c:url var="action" value="/addDoctor" />
    <div class="container">
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6 border p-4">
                <h5 class="text-center">Doctor form</h5>
                <form:form class="p-2" action="${action}" method="post" modelAttribute="doctor">
                    <div class="form-group">
                        <form:label path="id">Id</form:label>
                        <form:input cssClass="form-control" path="id" />
                    </div>
                    <div class="form-group">
                        <form:label path="surname">Surname</form:label>
                        <form:input cssClass="form-control" path="surname" />
                    </div>
                    <div class="form-group">
                        <form:label path="jmbg">Jmbg</form:label>
                        <form:input cssClass="form-control" path="jmbg" />
                    </div>
                    <div class="form-group">
                        <form:label path="phoneNumber">PhoneNumber</form:label>
                        <form:input cssClass="form-control" path="phoneNumber" />
                    </div>
                    <div class="form-group">
                        <form:label path="name">Name</form:label>
                        <form:input cssClass="form-control" path="name" />
                    </div>
                    <div class="form-group">
                        <form:label path="specialty">Specialty</form:label>
                        <form:input cssClass="form-control" path="specialty" />
                    </div>

                            <div class="form-group ">
                            <form:label path="patient">Patient</form:label>
                            <form:checkboxes items="${patients}" path="patient" element="div class='checkbox border rounded p-2' " itemValue="id"/>
                            </div>

                            <div class="form-group ">
                            <form:label path="examination">Examination</form:label>
                            <form:checkboxes items="${examinations}" path="examination" element="div class='checkbox border rounded p-2' " itemValue="id"/>
                            </div>

                            <div class="form-group ">
                            <form:label path="diagnosis">Diagnosis</form:label>
                            <form:checkboxes items="${diagnosiss}" path="diagnosis" element="div class='checkbox border rounded p-2' " itemValue="id"/>
                            </div>

                    <div>
                         <button class="btn btn-success float-right" type="submit">Save doctor</button>
                    </div>      
                 </form:form>
            </div>
            <div class="col-md-3"></div>
          </div>
     </div>
</body>
</html>