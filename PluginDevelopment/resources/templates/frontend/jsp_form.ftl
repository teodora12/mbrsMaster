<#import "commons/utils.ftl" as u>
<#assign class_name_cap = class.name?cap_first>
<#assign class_name = class.name?uncap_first>
<#assign class_name_id = "${" + class_name + ".id" + "}">
<#assign class_name_plural = class_name + "s">

<#assign opening_bracket = "${">
<#assign closing_bracket = "}">
<#macro print_complex_property prop>
	<#local property_name_url = prop.type.name?uncap_first />
	<#local property_name = prop.name />
    <#local property_name_plural = property_name + "s">
	<#local property_name_cap = property_name?cap_first />
	<#local property_id = "${" + class_name + "." + property_name + ".id" + "}" />
                        <td><a href="<c:url value="/${property_name_url}/${property_id}"/>">${property_name_cap} ${property_id}</a></td>
</#macro>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>New ${class_name_cap} form</title>
</head>
<body>
    <%@ include file="navigation.jsp"%>
    <c:url var="action" value="/add${class_name_cap}" />
    <div class="container">
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6 border p-4">
                <h5 class="text-center">${class_name_cap} form</h5>
                <form:form class="p-2" action="${opening_bracket}action${closing_bracket}" method="post" modelAttribute="${class_name}">
                <#list properties as property>
                    <#assign label= "<form:label path=\"${property.name}\">${property.name?cap_first}</form:label>">
                    <#if enum_types?seq_contains(property.type)>
                    	${label}
                        <form:select path="${property.name}" cssClass="form-control">
                            <option value="">Select a ${property.name}</option>

                            <c:set var="enum_val"><#list enum_values[property.type] as val>${val}<#sep>,</#sep></#list></c:set>
                            <c:forEach items="${opening_bracket}enum_val${closing_bracket}" var="val">
        				        <option value="${opening_bracket}val${closing_bracket}" <c:if test="${opening_bracket} val == ${class_name}.${property.name} ${closing_bracket}">selected</c:if>  >${opening_bracket}val${closing_bracket}</option>
       				        </c:forEach>
                        </form:select>	
                    <#else>
                    <#-- simple data type -->
                    <#-- checkbox -->
                    <#if property.type == "Boolean" || property.type == "boolean">
                    <div class="form-group">
                        <form:checkbox path="${property.name}" />
                        ${label}
                    </div>
                    <#elseif property.type == "String" || property.type == "string" || property.type == "Long" || property.type == "long" || property.type == "date" || property.type == "Date">
                    <#-- text -->
                    <div class="form-group">
                        ${label}
                        <form:input cssClass="form-control" path="${property.name}" />
                    </div>
                    </#if>
                    </#if>
                </#list>

                    <#list  class.FMLinkedProperty as property>
                        <#assign label= "<form:label path=\"${property.name}\">${property.name?cap_first}</form:label>">
                        <#-- ManyToOne or OneToOne -->
                        <#if property.upper == 1 && property.oppositeEnd== -1>
                            <div class="form-group">
                                ${label}
                                <form:select path="${property.name}" cssClass="form-control">
                                    <option value="-1">Select a ${property.name}</option>
                                    <form:options items="${opening_bracket}${property.name}s${closing_bracket}" itemValue="id"/>
                                </form:select>
                            </div>
                        <#-- ManyToMany or OneToMany -->
                         <#elseif property.upper == -1>
                            <div class="form-group ">
                            ${label}
                            <form:checkboxes items="${opening_bracket}${property.name}s${closing_bracket}" path="${property.name}" element="div class='checkbox border rounded p-2' " itemValue="id"/>
                            </div>
                        </#if>

                    </#list>
                    <div>
                         <button class="btn btn-success float-right" type="submit">Save ${class_name}</button>
                    </div>      
                 </form:form>
            </div>
            <div class="col-md-3"></div>
          </div>
     </div>
</body>
</html>