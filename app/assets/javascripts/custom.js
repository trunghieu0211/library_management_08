$(document).ready(function() {
  $('.dialog').fadeTo(2000, 500).slideUp(2000, function(){
    $('.dialog').slideUp(2000);
  });

  $('.dialog-2').fadeTo(2000, 500).slideUp(2000, function(){
    $('.dialog-2').slideUp(2000);
  });
  // $('#want').click(function(event) {
  //   $('#want').html('');
  // });
  // $('#want').html('<%= escape_javascript(render("books/index")) %>');
});
