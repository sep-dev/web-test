	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<% request.setCharacterEncoding("UTF-8");  %>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<html>
	<head>
	<style type="text/css"><%@include file="../css/view.css" %></style>
	<meta charset="UTF-8">
	  <title>回答画面</title>
	</head>
	<body>
	<div id="header">
	<h1>webテスト</h1>
	<h2>解答</h2>
    </div>
      <c:forEach items = "${entrylist}" var = "entry" varStatus = "status">
        <div id="question"><!-- 出題テンプレート -->
            <div id="q_title"><h1>第${status.index+1}問</h1></div>
            <p>${entry.title}</p><!-- 設問本文 -->
            <c:forEach items = "${button}" var = "button" begin = "${status.index}" end="${status.index}">
                 <label><input name = "ans${status.index}" value = ""> ${entry.select1}</label><br>
                 <label><input name = "ans${status.index}" value = ""> ${entry.select2}</label><br>
                 <label><input name = "ans${status.index}" value = ""> ${entry.select3}</label><br>
                 <label><input name = "ans${status.index}" value = ""> ${entry.select4}</label><br>
            </c:forEach>
            </div>
      </c:forEach>
	<div id=post><input id=sub type=button value="戻る"
	onclick="location.href='http://localhost:8080/test/Q'"></div>

	<footer>
	<div id = "footer"><a href = 'http://localhost:8080/test/'>君の問題を作ろう</a>${delete}</div>
	</footer>
	</body>
	</html>
