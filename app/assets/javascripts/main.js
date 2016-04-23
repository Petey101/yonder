$( document).ready(function(){

	$('#water .button_to').on('click',function(event){
		event.preventDefault();

		$.ajax({
      	method: "GET",
        dataType: "json",
      	url: getLocation("water")
    	}).done(function(response){
        console.log(response)
    		$('.data-div').html(response);
    	})
	})

  $('#weather .button_to').on('click',function(event){
    event.preventDefault();

    $.ajax({
        method: "GET",
        dataType: "json",
        url: getLocation("weather")
      }).done(function(response){
        console.log(response)
        $('.data-div').html(response);
      })
  })




//   var x = document.getElementById("demo");
//   function getLocation() {
//    if (navigator.geolocation) {
//        navigator.geolocation.getCurrentPosition(showPosition);
//    } else {
//        x.innerHTML = "Geolocation is not supported by this browser.";
//    }
// }

// function setPosition(position) {
//    var waterurl = "https://data.waterpointdata.org/resource/gihr-buz6.json?$where=within_circle(location," + position.coords.latitude + "," + position.coords.longitude + "," 10000)
// }

})
