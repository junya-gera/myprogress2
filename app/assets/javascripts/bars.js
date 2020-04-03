$(document).on("turbolinks:load", function() {
  $('#bars').on('click',function(){
    $('body').addClass('menu--open')
  });

  $('#close').on('click',function(){
    $('body').removeClass('menu--open')
  })
});