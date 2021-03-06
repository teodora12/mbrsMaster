<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <title>List of diagnosiss</title>
    </head>
    <body>
        <%@ include file="navigation.jsp"%>
        <div class="container">
            <br/>
            <h3 class="text-center">List of diagnosiss</h3>
            <div>
                 <a class="btn btn-outline-primary btn-sm float-right mb-3" href="<c:url value="/diagnosis/new"/>">Add new diagnosis</a>
            </div>
            <div>
                 <table id="table_id" class="table table-sm table-hover table-bordered text-center mt-3">
                    <thead>
                    	<tr>
                        	<th>Id</th>
                        	<th>Name</th>
                        	<th>Description</th>
                        	<th>Action</th>
                    	</tr>
                    </thead>
                    <tbody>
                    	<c:forEach items="${diagnosiss}" var="diagnosis">
                    	<tr>
                            <td> ${diagnosis.id}</td>
                            <td> ${diagnosis.name}</td>
                            <td> ${diagnosis.description}</td>
                        	<td>
                                <a class="btn btn-sm btn-success" href="<c:url value="/diagnosis/${diagnosis.id}"/>">Detail</a>
                                <a class="btn btn-sm btn-warning" href="<c:url value="/diagnosis/edit?id=${diagnosis.id}"/>">Edit</a>
                                <a class="btn btn-sm btn-danger" href="<c:url value="/diagnosis/delete?id=${diagnosis.id}"/>">Delete</a>
                        	</td>
                    	</tr>
                    	</c:forEach>
                    </tbody>
                 </table>
            </div>
         </div>
   </body>
</html>