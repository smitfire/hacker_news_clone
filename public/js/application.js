$(document).ready(function() {

  $('#postup').on("click", function(event){
    event.preventDefault();
    post_id = $(this).data('post-id');
    var that = this
    var url = ("/postup/" + post_id)
    $.post(url, function(data){
      $(that).parent('div.votes').children('h5').text(data);
    });
  });
  $('#postdown').on("click", function(event){
    event.preventDefault();
    post_id = $(this).data('post-id');
    var that = this
    var url = ("/postdown/" + post_id)
    $.post(url, function(data){
      $(that).parent('div.votes').children('h5').text(data);
    });
  });
  $('#commentup').on("click", function(event){
    event.preventDefault();
    comment_id = $(this).data('comment-id');
    var that = this
    var url = ("/commentup/" + comment_id)
    $.post(url, function(data){
      $(that).parent('div.comment_votes').children('h6').text(data);
    });
  });
  $('#commentdown').on("click", function(event){
    event.preventDefault();
    comment_id = $(this).data('comment-id');
    var that = this
    var url = ("/commentdown/" + comment_id)
    $.post(url, function(data){
      $(that).parent('div.comment_votes').children('h6').text(data);
    });
  });
  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
});
