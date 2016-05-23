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
    <form:form modelAttribute="formModel">
    <div id ="header"><h1>webテスト<br>問題集</h1></div>
    <div id = "boxA">
     <div id="box1">
        <p>タイトルを入力してください。</p>
        <input type = "text" size = 30 id = "text_title">
        <p>問題の本文を入力してください。</p>
        <TEXTAREA name = "text" wrap = "soft" id = "text_question"></TEXTAREA>
     </div>
     <div id = "box2">
     <c:forEach begin="1" end="4" step="1" varStatus="status">
        <p>選択肢${status.index}</p>
        <input type = "text" name= "select${status.index}" id = "select"><input type = "checkbox" id = "check">
     </c:forEach>
     </div>
     <div id = "box3">
     <input type = "submit" value = "送信">
     <input type = "button" value = "作った問題へ" onClick ="location.href='http://localhost:8080/test/Q'">
     </div>
     <div id= "box4"></div>
</div>
<div id = "footer">君の問題を作ろう</div>
</form:form>
</body>


</html>
