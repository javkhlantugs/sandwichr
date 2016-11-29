// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .


$(document).on("ready", function() {
		$(".js-ingredient").on('click', AddIngredient);

});




function AddIngredient (event) {
	event.preventDefault();
		var ingredientId = $(this).data("ingredient-id");
		var sandwichId = $(this).data("sandwich-id");
		var apiData = {ingredient_id: ingredientId};
		console.log(apiData)
		$.ajax({
			type: 'POST',
			url: `/api/sandwiches/${sandwichId}/ingredients/add`,
			data: apiData,
			success: function(){    
                        location.reload();   
                    },
            error: handleError,

		});
}


function handleError(error) {
	console.log("eror")
	console.log(error)
}

