$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
addQuestion();
ansQuestion();

});


var addQuestion = function(){
	$("#add-button").on("click", function(e){
		e.preventDefault()
		var url = $(this).attr("href")
		var method = "GET"
		var form = $(this) 

		$.ajax({
			url : url,
			method :method
		}).done(function(res){
			$("#button").html(res)
		})
	})
}

var ansQuestion = function(){
	$("#answer-link").children("a").on("click", function(e){
		e.preventDefault()
		console.log(this)
		var url = $(this).attr("href")
		var method = "GET"

		$.ajax({
			url : url,
			method :method
		}).done(function(res){
			$("#answer-form").html(res)
		})

	})
}

 