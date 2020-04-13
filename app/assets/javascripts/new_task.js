$(function(){
  $('#new_task').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
  })
})