 $(document).ready(function(){

	 $('input[name = delete]').click(function(){
		 if(!confirm('本当に削除してもよろしかったでしょうか？')){
		 return false;
	 }else{

	 }
	 });
 });
 function pageselectCallback(page_index, jq){
	    var new_content = jQuery('#hiddenresult div.result:eq('+page_index+')').clone();
	    $('#Searchresult').empty().append(new_content);
	    return false;
	  }
	  function initPagination() {
	      var num_entries = jQuery('#hiddenresult div.result').length;
	      $(".Pagination").pagination(num_entries, {
	          callback: pageselectCallback,
	          items_per_page:1,
	      });
	  }
	  $(document).ready(function(){
	      initPagination();
	  });