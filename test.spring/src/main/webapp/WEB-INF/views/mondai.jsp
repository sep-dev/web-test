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
   <div id="main">
    <h1>webテスト</h1>
	<h2>問題集</h2>
   </div>

	<p id="question">問題１</p>
   <p>
    ここに問題文を記入(単数問題)	<br>
	<input type=radio name=radio>解答1	<br>
	<input type=radio name=radio>解答2   <br>
	<input type=radio name=radio>解答3   <br>
	<input type=radio name=radio>解答4   <br>
   </p>

	<p id="question">問題２</p>

   <p>
	ここに問題文を記入(複数問題)	<br>
	<input type=checkbox name=check>解答1<br>
	<input type=checkbox name=check>解答2<br>
	<input type=checkbox name=check>解答3<br>
	<input type=checkbox name=check>解答4<br>
   </p><br>

	<div id=post><input id=sub type=submit value="送信"></div>
	<br>
  <footer>
	<a href="http://localhost:8080/test/" >君も問題を作ろう！</a>
  </footer>
 </body>
 </html>