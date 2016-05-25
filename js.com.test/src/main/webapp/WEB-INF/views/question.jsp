	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<% request.setCharacterEncoding("UTF-8");  %>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
 <title>問題画面</title>
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
            <c:if test = "${button=='checkbox'}">
                 <label><input type = "${button}" name = "ans${status.index}-1" value = "check1"> ${entry.select1}</label><br>
                 <label><input type = "${button}" name = "ans${status.index}-2" value = "check2"> ${entry.select2}</label><br>
                 <label><input type = "${button}" name = "ans${status.index}-3" value = "check3"> ${entry.select3}</label><br>
                 <label><input type = "${button}" name = "ans${status.index}-4" value = "check4"> ${entry.select4}</label><br>
            </c:if>
            <c:if test = "${button=='radio'}">
                 <label><input type = "${button}" name = "ans${status.index}-1" value = "check1"> ${entry.select1}</label><br>
                 <label><input type = "${button}" name = "ans${status.index}-1" value = "check2"> ${entry.select2}</label><br>
                 <label><input type = "${button}" name = "ans${status.index}-1" value = "check3"> ${entry.select3}</label><br>
                 <label><input type = "${button}" name = "ans${status.index}-1" value = "check4"> ${entry.select4}</label><br>
            </c:if>
            </c:forEach>
            </div>
      </c:forEach>
      <div id = "questions">
      <input type = "submit" value = "答え合わせ" id = "button">
      <input type = "button" value = "登録画面へ" onClick ="location.href='http://localhost:8080/test/'" id = "button">
      </div>
</div>
<div id = "footer"><a href='http://localhost:8080/test/'>君も問題を作ろう！</a></div>
${delete}
<input type = "hidden" name = "button" value ="${button}">
</form:form>
</body>
</html>