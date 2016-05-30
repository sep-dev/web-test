<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
 <% request.setCharacterEncoding("UTF-8");  %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
 <title>テスト作成画面</title>
    <meta charset="UTF-8">
</head>
<body>
    <form:form modelAttribute="formModel">
    <div id ="header"><h1>webテスト<br>問題集</h1></div>
    <div id = "boxA">
     <div id="box1">
        <p>タイトルを入力してください。<form:errors path="title" id = "error"/><span id = "span_title"></span></p>
        <input type = "text" size = 30 maxlength="30" id = "text_title" name = "title">
        <p>問題の本文を入力してください。<form:errors path="text" id = "error"/><span id = "span_text"></span></p>
        <TEXTAREA name = "text" maxlength="200" id = "text_question" name = "text"
         style="resize:none;"></TEXTAREA>
     </div>
     <div id = "box2">
     <c:forEach begin="1" end="4" step="1" varStatus="status">
        <p id = "select">選択肢${status.index}&nbsp;
        <span id = "span_select${status.index}"></span><form:errors path="select${status.index}" id="error" /></p>
        <input type = "text" name= "select${status.index}" id = "select${status.index}" name ="select${status.index}"
        size = 30 maxlength="30"><input type = "checkbox" id = "check${status.index}" name = "check${status.index}">
     <br>
     </c:forEach>
     <span  id= "span_check"></span>
     </div>
     <div id = "box3">
     <input type = "submit" value = "送信" id = "submit"><br>
     <input type = "button" value = "作った問題へ" onClick ="location.href='http://localhost:8080/test/Q'" id = "button">
     </div>
     <div id= "box4"></div>
</div>
<div id = "footer"><a href = 'http://localhost:8080/test/'>君の問題を作ろう</a>${delete}</div>
</form:form>
</body>
</html>

<style type="text/css"><%@include file="../css/view.css" %></style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
    //入力チェック
    if ($('#text_title').val().length == 0) {
        $('#submit').attr('disabled', 'disabled');
        $("#span_title").text("問題のタイトルを入力してください。");
    }
    if ($('#text_question').val().length == 0) {
        $('#submit').attr('disabled', 'disabled');
        $("#span_text").text("問題の本文を入力してください。");
    }
    if ($('#select').val().length == 0) {
        $('#submit').attr('disabled', 'disabled');
        $("#span_select1").text("問題の選択肢を入力してください。");
        $("#span_select2").text("問題の選択肢を入力してください。");
        $("#span_select3").text("問題の選択肢を入力してください。");
        $("#span_select4").text("問題の選択肢を入力してください。");
    }
    if (!$(input =[type = 'checkbox']).prop('checked')) {
        $('#span_check').text("正解に設定したい選択肢にチェックを入れてください。");
        $('#submit').attr('disabled', 'disabled');
    }

    //タイトルの入力チェック
    $('#text_title').bind('keydown keyup keypress change', function() {
    	if ($('#text_title').val().length > 0 ){
    		  $("#span_title").text("");
    	}else{
    		 $("#span_title").text("問題のタイトルを入力してください。");
    	}
    	if ($('#text_title').val().length > 0 && $('#text_question').val().length > 0
                && $('#select1').val().length > 0&& $('#select2').val().length > 0
                && $('#select3').val().length > 0&& $('#select4').val().length > 0) {
            $('#submit').removeAttr('disabled');
            $("#span_title").removeAttr();
        }else {
        	$('#span_title').span("問題のタイトルを入力してください。");
            $('#submit').attr('disabled', 'disabled');
        }
    });
    //問題本文の入力チェック
    $('#text_question').bind('keydown keyup keypress change', function() {
        if ($(this).val().length > 0 ){
            $("#span_text").text("");
      }else{
           $("#span_text").text("問題の本文を入力してください。");
      }
      if ($('#text_title').val().length > 0 && $('#text_question').val().length > 0
              && $('#select1').val().length > 0&& $('#select2').val().length > 0
              && $('#select3').val().length > 0&& $('#select4').val().length > 0) {
          $('#submit').removeAttr('disabled');
          $("#span_text").removeAttr();
      }else {
          $('#span_text').span("問題の本文を入力してください。");
          $('#submit').attr('disabled', 'disabled');
      }
  });
    //選択肢の入力
    $('#select1').bind('keydown keyup keypress change', function() {
    	if ($('#text_title').val().length > 0 && $('#text_question').val().length > 0
                && $('#select1').val().length > 0&& $('#select2').val().length > 0
                && $('#select3').val().length > 0&& $('#select4').val().length > 0) {
            $('#submit').removeAttr('disabled');
        }else if((this).val().length > 0 ){

        }else {
            $('#submit').attr('disabled', 'disabled');
        }
    });
    $('#select2').bind('keydown keyup keypress change', function() {
        if ($('#text_title').val().length > 0 && $('#text_question').val().length > 0
                && $('#select1').val().length > 0&& $('#select2').val().length > 0
                && $('#select3').val().length > 0&& $('#select4').val().length > 0) {
            $('#submit').removeAttr('disabled');
        } else {
            $('#submit').attr('disabled', 'disabled');
        }
    });
    $('#select3').bind('keydown keyup keypress change', function() {
        if ($('#text_title').val().length > 0 && $('#text_question').val().length > 0
                && $('#select1').val().length > 0&& $('#select2').val().length > 0
                && $('#select3').val().length > 0&& $('#select4').val().length > 0) {
            $('#submit').removeAttr('disabled');
        } else {
            $('#submit').attr('disabled', 'disabled');
        }
    });
    $('#select4').bind('keydown keyup keypress change', function() {
        if ($('#text_title').val().length > 0 && $('#text_question').val().length > 0
                && $('#select1').val().length > 0&& $('#select2').val().length > 0
                && $('#select3').val().length > 0&& $('#select4').val().length > 0) {
            $('#submit').removeAttr('disabled');
        } else {
            $('#submit').attr('disabled', 'disabled');
        }
    });
});

</script>
