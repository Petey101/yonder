$( document).ready(function(){

	$('.button_to').on('click',function(event){
		event.preventDefault();
		$.ajax({
      	method: "GET",
      	url: event.currentTarget.action
    	}).done(function(response){
    		$('.data-div').html(response);
    	})
	})

})