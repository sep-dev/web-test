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
    <div id = "boxA">
     <div id="box1">

     </div>
     <div id = "box2">

     </div>
     <div id = "box3">
     <input type = "submit" value = "送信">
     <input type = "button" value = "一覧画面">
     </div>
  <div id = "footer">ふったー</div>

</div>
</body>


</html>
