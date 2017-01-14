$(document).ready(function() {
  increaseVoteCount();
});

var increaseVoteCount = function() {
  var listeningSection = $('#container');
  listeningSection.on("click", '.upvote', function(e){
    e.preventDefault();
    console.log("I been clicked!")
    var url = $(this).attr('action')
    var method = $(this).attr('method')
    var data = $(this).serialize()

    $.ajax({
      url: url,
      method: method,
      data: data
    }).done(function(response){
      console.log($(this).siblings('span .vote_value'))
      $(this).siblings('span .vote_value').first().html(response)
    })
  })
};
