<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
 <% request.setCharacterEncoding("UTF-8");  %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
 <title>出題画面</title>
    <meta charset="UTF-8">
</head>
<body>
    <form:form modelAttribute="formModel">
    <div id ="header"><h1>webテスト<br>問題集</h1></div>
    <div id = "boxA">
     <div id="box1">
        <p>タイトルを入力してください。<form:errors path="title" id = "error"/></p>
        <input type = "text" size = 30 maxlength="30" id = "text_title" name = "title" class="validate[required]">
        <p>問題の本文を入力してください。<form:errors path="text" id = "error"/></p>
        <TEXTAREA name = "text" maxlength="200" id = "text_question" name = "text"
        class="validate[required]" style="resize:none;"></TEXTAREA>
     </div>
     <div id = "box2">
     <c:forEach begin="1" end="4" step="1" varStatus="status">
        <p id = "select">選択肢${status.index}<form:errors path="select${status.index}" id="error" /></p>
        <input type = "text" name= "select${status.index}" id = "select" name ="select${status.index}"
        size = 30 maxlength="30" class="validate[required]"><input type = "checkbox" id = "check" name = "check${status.index}">
     <br>
     </c:forEach>
     <p  id= "error">${message1}</p>
     </div>
     <div id = "box3">
     <input type = "submit" value = "送信" id = "button"><br>
     <input type = "button" value = "作った問題へ" onClick ="location.href='http://localhost:8080/test/Q'" id = "button">
     </div>
     <div id= "box4"></div>
</div>
<div id = "footer"><a href = 'http://localhost:8080/test/'>君の問題を作ろう</a>${delete}</div>
</form:form>
</body>
</html>

<style type="text/css"><%@include file="../css/view.css" %></style>
<style type="text/css"><%@include file="../css/validationEngine.jquery.css" %></style>
<script src="js/jquery-1.8.2.min.js"></script>
<script src="js/jquery.validationEngine.js"></script>
<script src="js/jquery.validationEngine-ja.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script type="text/javascript">

(function(){


});
</script>

