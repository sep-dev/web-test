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
                && $('#select3').val().length > 0&& $('#select4').val().length > 0&&$('#span_check').text()!="正解に設定したい選択肢にチェックを入れてください。"&&
        		$('#span_check').text()!="正解に設定できる選択肢は３つまでです。") {
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
              && $('#select3').val().length > 0&& $('#select4').val().length > 0&&$('#span_check').text()!="正解に設定したい選択肢にチェックを入れてください。"&&
      		$('#span_check').text()!="正解に設定できる選択肢は３つまでです。") {
          $('#submit').removeAttr('disabled');
          $("#span_text").removeAttr();
      }else {
          $('#span_text').span("問題の本文を入力してください。");
          $('#submit').attr('disabled', 'disabled');
      }
  });
    //選択肢の入力
    $('#select1').bind('keydown keyup keypress change', function() {
        if ($(this).val().length > 0 ){
              $("#span_select1").text("");
        }else{
             $("#span_select1").text("問題の選択肢を入力してください。");
        }
        if ($('#text_title').val().length > 0 && $('#text_question').val().length > 0
                && $('#select1').val().length > 0&& $('#select2').val().length > 0
                && $('#select3').val().length > 0&& $('#select4').val().length > 0&&$('#span_check').text()!="正解に設定したい選択肢にチェックを入れてください。"&&
        		$('#span_check').text()!="正解に設定できる選択肢は３つまでです。") {
            $('#submit').removeAttr('disabled');
            $("#span_select1").removeAttr();
        }else {
            $('#span_select1').span("問題の選択肢を入力してください。");
            $('#submit').attr('disabled', 'disabled');
        }
    });
    $('#select2').bind('keydown keyup keypress change', function() {
        if ($(this).val().length > 0 ){
              $("#span_select2").text("");
        }else{
             $("#span_select2").text("問題の選択肢を入力してください。");
        }
        if ($('#text_title').val().length > 0 && $('#text_question').val().length > 0
                && $('#select1').val().length > 0&& $('#select2').val().length > 0
                && $('#select3').val().length > 0&& $('#select4').val().length > 0&&$('#span_check').text()!="正解に設定したい選択肢にチェックを入れてください。"&&
        		$('#span_check').text()!="正解に設定できる選択肢は３つまでです。") {
            $('#submit').removeAttr('disabled');
            $("#span_select2").removeAttr();
        }else {
            $('#span_select2').span("問題の選択肢を入力してください。");
            $('#submit').attr('disabled', 'disabled');
        }
    });
    $('#select3').bind('keydown keyup keypress change', function() {
        if ($(this).val().length > 0 ){
              $("#span_select3").text("");
        }else{
             $("#span_select3").text("問題の選択肢を入力してください。");
        }
        if ($('#text_title').val().length > 0 && $('#text_question').val().length > 0
                && $('#select1').val().length > 0&& $('#select2').val().length > 0
                && $('#select3').val().length > 0&& $('#select4').val().length > 0&&$('#span_check').text()!="正解に設定したい選択肢にチェックを入れてください。"&&
        		$('#span_check').text()!="正解に設定できる選択肢は３つまでです。") {
            $('#submit').removeAttr('disabled');
            $("#span_select3").removeAttr();
        }else {
            $('#span_select3').span("問題の選択肢を入力してください。");
            $('#submit').attr('disabled', 'disabled');
        }
    });
    $('#select4').bind('keydown keyup keypress change', function() {
        if ($(this).val().length > 0 ){
              $("#span_select4").text("");
        }else{
             $("#span_select4").text("問題の選択肢を入力してください。");
        }
        if ($('#text_title').val().length > 0 && $('#text_question').val().length > 0
                && $('#select1').val().length > 0&& $('#select2').val().length > 0
                && $('#select3').val().length > 0&& $('#select4').val().length > 0&&$('#span_check').text()!="正解に設定したい選択肢にチェックを入れてください。"&&
        		$('#span_check').text()!="正解に設定できる選択肢は３つまでです。") {
            $('#submit').removeAttr('disabled');
            $("#span_select4").removeAttr();
        }else {
            $('#span_select4').span("問題の選択肢を入力してください。");
            $('#submit').attr('disabled', 'disabled');
        }
    });
});
	//チェックボックスの入力チェック
	$('#check1').bind('keydown keyup keypress change', function() {
	    if ($(this).prop("checked")){
	          $("#span_check").text("");
	    }else if(!$('#check1').prop("checked")&&!$('#check2').prop("checked")&&!$('#check3').prop("checked")
	    		&&!$('#check4').prop("checked")){
	         $("#span_check").text("正解に設定したい選択肢にチェックを入れてください。");
	         $('#submit').attr('disabled', 'disabled');
	    }
	    if($('#check1').prop("checked")&&$('#check2').prop("checked")&&$('#check3').prop("checked")
	    		&&$('#check4').prop("checked")){
	    	 $("#span_check").text("正解に設定できる選択肢は３つまでです。");
	    	 $('#submit').attr('disabled', 'disabled');
	    }if(!$('#check1').prop("checked")&&$('#check2').prop("checked")&&$('#check3').prop("checked")
                &&$('#check4').prop("checked")){
            $("#span_check").text("");
        }
	    if ($('#text_title').val().length > 0 && $('#text_question').val().length > 0
	            && $('#select1').val().length > 0&& $('#select2').val().length > 0
	            && $('#select3').val().length > 0&& $('#select4').val().length > 0&&$('#span_check').text()!="正解に設定したい選択肢にチェックを入れてください。"&&
        		$('#span_check').text()!="正解に設定できる選択肢は３つまでです。") {
	        $('#submit').removeAttr('disabled');
	        $("#span_text").removeAttr();
	    }else {
	        $('#span_text').span("正解に設定したい選択肢にチェックを入れてください。。");
	        $('#submit').attr('disabled', 'disabled');
	    }
	});
	   $('#check2').bind('keydown keyup keypress change', function() {
	        if ($(this).prop("checked")){
	              $("#span_check").text("");
	        }else if(!$('#check1').prop("checked")&&!$('#check2').prop("checked")&&!$('#check3').prop("checked")
	                &&!$('#check4').prop("checked")){
	             $("#span_check").text("正解に設定したい選択肢にチェックを入れてください。");
	             $('#submit').attr('disabled', 'disabled');
	        }
	        if($('#check1').prop("checked")&&$('#check2').prop("checked")&&$('#check3').prop("checked")
	                &&$('#check4').prop("checked")){
	             $("#span_check").text("正解に設定できる選択肢は３つまでです。");
	             $('#submit').attr('disabled', 'disabled');
	        }if($('#check1').prop("checked")&&!$('#check2').prop("checked")&&$('#check3').prop("checked")
                    &&$('#check4').prop("checked")){
                $("#span_check").text("");
            }
	        if ($('#text_title').val().length > 0 && $('#text_question').val().length > 0
	                && $('#select1').val().length > 0&& $('#select2').val().length > 0
	                && $('#select3').val().length > 0&& $('#select4').val().length > 0&&$('#span_check').text()!="正解に設定したい選択肢にチェックを入れてください。"&&
	        		$('#span_check').text()!="正解に設定できる選択肢は３つまでです。") {
	            $('#submit').removeAttr('disabled');
	            $("#span_text").removeAttr();
	        }else {
	            $('#span_text').span("正解に設定したい選択肢にチェックを入れてください。");
	            $('#submit').attr('disabled', 'disabled');
	        }
	    });
	    $('#check3').bind('keydown keyup keypress change', function() {
	        if ($(this).prop("checked")){
	              $("#span_check").text("");
	        }else if(!$('#check1').prop("checked")&&!$('#check2').prop("checked")&&!$('#check3').prop("checked")
	                &&!$('#check4').prop("checked")){
	             $("#span_check").text("正解に設定したい選択肢にチェックを入れてください。");
	             $('#submit').attr('disabled', 'disabled');
	        }
	        if($('#check1').prop("checked")&&$('#check2').prop("checked")&&$('#check3').prop("checked")
	                &&$('#check4').prop("checked")){
	             $("#span_check").text("正解に設定できる選択肢は３つまでです。");
	             $('#submit').attr('disabled', 'disabled');
	        }if($('#check1').prop("checked")&&$('#check2').prop("checked")&&!$('#check3').prop("checked")
                    &&$('#check4').prop("checked")){
                $("#span_check").text("");
            }
	        if ($('#text_title').val().length > 0 && $('#text_question').val().length > 0
	                && $('#select1').val().length > 0&& $('#select2').val().length > 0
	                && $('#select3').val().length > 0&& $('#select4').val().length > 0&&$('#span_check').text()!="正解に設定したい選択肢にチェックを入れてください。"&&
	        		$('#span_check').text()!="正解に設定できる選択肢は３つまでです。") {
	            $('#submit').removeAttr('disabled');
	            $("#span_text").removeAttr();
	        }else {
	            $('#span_text').span("正解に設定したい選択肢にチェックを入れてください。");
	            $('#submit').attr('disabled', 'disabled');
	        }
	    });
	    $('#check4').bind('keydown keyup keypress change', function() {
	        if ($(this).prop("checked")){
	              $("#span_check").text("");
	        }else if(!$('#check1').prop("checked")&&!$('#check2').prop("checked")&&!$('#check3').prop("checked")
	                &&!$('#check4').prop("checked")){
	             $("#span_check").text("正解に設定したい選択肢にチェックを入れてください。");
	             $('#submit').attr('disabled', 'disabled');
	        }
	        if($('#check1').prop("checked")&&$('#check2').prop("checked")&&$('#check3').prop("checked")
	                &&$('#check4').prop("checked")){
	             $("#span_check").text("正解に設定できる選択肢は３つまでです。");
	             $('#submit').attr('disabled', 'disabled');
	        }if($('#check1').prop("checked")&&$('#check2').prop("checked")&&$('#check3').prop("checked")
                    &&!$('#check4').prop("checked")){
                $("#span_check").text("");
            }
	        if ($('#text_title').val().length > 0 && $('#text_question').val().length > 0
	                && $('#select1').val().length > 0&& $('#select2').val().length > 0
	                && $('#select3').val().length > 0&& $('#select4').val().length > 0&&$('#span_check').text()!="正解に設定したい選択肢にチェックを入れてください。"&&
	        		$('#span_check').text()!="正解に設定できる選択肢は３つまでです。") {
	            $('#submit').removeAttr('disabled');
	            $("#span_text").removeAttr();
	        }else {
	            $('#span_text').span("正解に設定したい選択肢にチェックを入れてください。");
	            $('#submit').attr('disabled', 'disabled');
	        }
	    });

