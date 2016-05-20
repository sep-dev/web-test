<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@	taglib prefix="form" uri = "http://www.springframework.org/tags/form" %>
<html>
	<head>
		<meta charset="utf-8">
		<title>住所録システム</title>
	</head>
	<body>

	<h1>${message}</h1>
	<p>${echoName}</p>
	<form:form modelAttribute="formModel">
	<input type =  button  value = ${message2} onClick ="location.href='http://localhost:8080/db/${message3}'">
	<br/>
		</form:form>
	</body>
</html>
