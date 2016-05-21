	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<% request.setCharacterEncoding("UTF-8");  %>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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

	<p id="question">問題1</p>

	<p>ここに問題文を記入<br>
       解答1			 <br>
	   問題1の答え       <br></p>

	<p id="question">問題2</p>

	<p>ここに問題文を記入<br>
	   解答2 				 <br>
	   解答3     			 <br>
	   問題2の答え           <br></p>

	<div id=post><input id=sub type=button value="戻る"
	onclick="location.href='http://localhost:8080/test/'"></div>

	<footer>
	<a href="http://localhost:8080/test/" >君も問題を作ろう！</a>
	</footer>
	</body>
	</html>
