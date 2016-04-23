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

function getDegrees(lat1, long1, lat2, long2, headX) {

    var dLat = toRad(lat2-lat1);
    var dLon = toRad(lon2-lon1);

    lat1 = toRad(lat1);
    lat2 = toRad(lat2);

    var y = Math.sin(dLon) * Math.cos(lat2);
    var x = Math.cos(lat1)*Math.sin(lat2) -
            Math.sin(lat1)*Math.cos(lat2)*Math.cos(dLon);
    var brng = toDeg(Math.atan2(y, x));

    // fix negative degrees
    if(brng<0) {
        brng=360-Math.abs(brng);
    }

    return brng - headX;
}