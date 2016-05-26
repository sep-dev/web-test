    <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% request.setCharacterEncoding("UTF-8");  %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
 <title>答え合わせ</title>
    <meta charset="UTF-8">
    <style type="text/css"><%@include file="../css/view.css" %></style>
</head>
<body>
<div id ="header"><h1>webテスト<br>問題集</h1></div>
<form:form modelAttribute= "formModel">
<div id = "boxA">
      <c:forEach items = "${entrylist}" var = "entry" varStatus = "status">
      <c:forEach items = "${ans1}" var = "ans1" begin = "${status.index}" end="${status.index}">
      <c:forEach items = "${ans2}" var = "ans2" begin = "${status.index}" end="${status.index}">
      <c:forEach items = "${ans3}" var = "ans3" begin = "${status.index}" end="${status.index}">
      <c:forEach items = "${ans4}" var = "ans4" begin = "${status.index}" end="${status.index}">
      <c:forEach items = "${checklist}" var = "checklist" begin = "${status.index}" end="${status.index}">
	      <div id="question"><!-- 出題テンプレート -->
	      <div id="q_title"><h1 id = "daimon">第${status.index+1}問</h1>
	      <!-- 正解なら赤文字 不正解なら青文字 -->
          <c:set var="flag" value='0'/>
          <c:if test = "${ans1==checklist.check1}" >
           <c:if test = "${ans2==checklist.check2}" >
               <c:if test = "${ans3==checklist.check3}">
                   <c:if test = "${ans4==checklist.check4}" var="flag">
                        <p class="seikai">正解！</p>
                   </c:if>
                </c:if>
            </c:if>
            </c:if>
            <c:if test = "${flag=='0'}"><p class="fuseikai">不正解</p></c:if>
          <!-- ここまでが丸付け -->
          <div id = "box4"></div>
	      </div>
	      <p>${entry.title}</p>
	      <p>${entry.text}</p><!-- 設問本文 -->
	              <div id = "answer">
		                <label style = "color:FF0000;"><c:if test = "${checklist.check1=='0'}">× ${entry.select1}</c:if></label>
                                        <label><c:if test = "${checklist.check1=='1'}">○ ${entry.select1}</c:if></label>
                        <label style = ""><c:if test = "${ans1=='1'}">←あなたが選んだヤツ</c:if></label><br>

                        <label style = "color:FF0000;"><c:if test = "${checklist.check2=='0'}">× ${entry.select2}</c:if></label>
                                        <label><c:if test = "${checklist.check2=='1'}">○ ${entry.select2}</c:if></label>
                        <label style = ""><c:if test = "${ans2=='1'}">←あなたが選んだヤツ</c:if></label><br>

                        <label style = "color:FF0000;"><c:if test = "${checklist.check3=='0'}">× ${entry.select3}</c:if></label>
                                        <label><c:if test = "${checklist.check3=='1'}">○ ${entry.select3}</c:if></label>
                        <label style = ""><c:if test = "${ans3=='1'}">←あなたが選んだヤツ</c:if></label><br>

                        <label style = "color:FF0000;"><c:if test = "${checklist.check4=='0'}">× ${entry.select4}</c:if></label>
                                        <label><c:if test = "${checklist.check4=='1'}">○ ${entry.select4}</c:if></label>
                        <label style = ""><c:if test = "${ans4=='1'}">←あなたが選んだヤツ</c:if></label><br>
		          </div>
        <div id = "box4"></div>
                </div>
         </c:forEach>
         </c:forEach>
         </c:forEach>
         </c:forEach>
         </c:forEach>
         </c:forEach>

         <div id = "questions">
         <input type = "button" value = "問題にもどる" id = "button" onClick ="history.go(-1)" >
         <input type = "button" value = "登録画面へ" onClick ="location.href='http://localhost:8080/test/'" id = "button">
     </div>
          </div>






<div id = "footer"><a href='http://localhost:8080/test/'>君も問題を作ろう！</a></div>
${delete}
</form:form>
</body>
</html>