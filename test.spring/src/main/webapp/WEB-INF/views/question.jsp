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
    <c:forEach items = "${Entrylist}" var="i" varStatus="loop" >
    <p>${i.select1}</p>
    </c:forEach>
     <c:forEach begin="1" end="5" step="1" varStatus="status"><!-- 設問出力 -->
	    <div id="question"><!-- 出題テンプレート -->
	        <div id="q_title"><h1>第${status.index}問</h1></div>
	        <p>あああああああああああああ</p><!-- 設問本文 -->
	        <ol>
	            <c:forEach begin="1" end="4" step="1" varStatus="check">
	                <li><label><input type = "radio" name = "radio${status.index}" value = "">選択肢：${check.index}</label></li>
	            </c:forEach>
	        </ol>
	    </div>
	 </c:forEach><!-- 設問出力ここまで -->
	 <div id = "footer">ふったー</div>

</div>
</form:form>
</body>


</html>