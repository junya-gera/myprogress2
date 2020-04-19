$(document).on("turbolinks:load", function() {

  $('#task-modal-show').on('click', function(){
    $('.task-modal').fadeIn(250);
  })

  $('#modal-close').on('click', function(){
    $('.task-modal').fadeOut(250);
  })

})