$(document).on("turbolinks:load", function() {
  
  $('#task-modal-show').on('click', function(){
    $('.task-modal').fadeIn(250);
  })
})