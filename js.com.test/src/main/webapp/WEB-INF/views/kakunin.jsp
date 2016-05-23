<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
 <% request.setCharacterEncoding("UTF-8");  %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
 <title>${message1}</title>
    <meta charset="UTF-8">
    <style type="text/css"><%@include file="../css/view.css" %></style>
</head>
<body>
    <form:form modelAttribute="formModel">
    <div id ="header"><h1>${message2}</h1></div>
    <div id = "boxA">
        <div id="box1">
        <p>${message3}</p>
        </div>
     <div id = "box4"></div>
    </div>
<div id = "footer">ふったー${delete}</div>
</form:form>
</body>


</html>
