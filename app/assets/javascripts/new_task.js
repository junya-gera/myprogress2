$(document).on('turbolinks:load', function () {

  $('#new_event').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
    var url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.event__units').append(html);
      $('#event_title').val('');
      $('#event_content').val('');
      $('.event__form--btn').prop('disabled', false);
    })
    .fail(function(){
      alert('error');
    })
  })
})