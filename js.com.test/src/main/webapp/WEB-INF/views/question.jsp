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
                 <label><input type = "radio" name = "radio${status.index}" value = "" > ${entry.select1}</label><br>
                 <label><input type = "radio" name = "radio${status.index}" value = ""> ${entry.select2}</label><br>
                 <label><input type = "radio" name = "radio${status.index}" value = ""> ${entry.select3}</label><br>
                 <label><input type = "radio" name = "radio${status.index}" value = ""> ${entry.select4}</label><br>
            </div>
            ${button}
      </c:forEach>

      <!--<c:forEach begin="1" end="5" step="1" varStatus="status">
	  <div id="question">
	        <div id="q_title"><h1>第${status.index}問</h1></div>
	        <p>あああああああああああああ</p>
	        <ol>
	            <c:forEach begin="1" end="4" step="1" varStatus="check">
	                <li><label><input type = "radio" name = "radio${status.index}" value = "">選択肢：${check.index}</label></li>
	            </c:forEach>
	        </ol>
	    </div>
	 </c:forEach> -->
</div>
<div id = "footer">ふったー${delete}</div>
</form:form>
</body>


</html>