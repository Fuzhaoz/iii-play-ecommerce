
$(document).ready(function () {
	  $.ajax({
			url : contextPath+"/product/CartCount",
			dataType : "json", 
			async : true, 	
			type : "GET", 
			success : function(req) {
				$('#cartcount').text(req)
				console.log(req)
			     const cartCount = $('#cartcount');
				 if (req > 0) {
                 	cartCount.addClass('red');
                   } else {
                 	cartCount.removeClass('red');
                   }      
			},
		});
       });