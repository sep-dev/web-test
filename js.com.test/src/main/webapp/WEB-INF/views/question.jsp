	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<% request.setCharacterEncoding("UTF-8");  %>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
 <title>出題画面</title>
    <meta charset="UTF-8">
    <style type="text/css"><%@include file="../css/view.css" %></style>
</head>
<body>
<div id ="header"><h1>webテスト<br>問題集</h1></div>
<form:form modelAttribute= "formModel">
<div id = "boxA">
      <c:forEach items = "${entrylist}" var = "entry" varStatus = "status">
        <div id="question"><!-- 出題テンプレート -->
            <div id="q_title"><h1>第${status.index+1}問</h1></div>
            <p>${entry.title}</p><!-- 設問本文 -->
            <c:forEach items = "${button}" var = "button" begin = "${status.index}" end="${status.index}">
                 <label><input type = "${button}" name = "radio${status.index}" value = "" > ${entry.select1}</label><br>
                 <label><input type = "${button}" name = "radio${status.index}" value = ""> ${entry.select2}</label><br>
                 <label><input type = "${button}" name = "radio${status.index}" value = ""> ${entry.select3}</label><br>
                 <label><input type = "${button}" name = "radio${status.index}" value = ""> ${entry.select4}</label><br>
            </c:forEach>
            </div>
      </c:forEach>
</div>
<div id = "footer">${delete}<br>
      <a href = "http://localhost:8080/test/">君も問題を作ろう</a></div>
</form:form>
</body>
</html>