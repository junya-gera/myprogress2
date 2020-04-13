$(function(){
  function buildHTML(event){
    var html = `<tr class="event__unit">
                  <td class="event__unit--title">${event.title}</td>
                  <td class="event__unit--content">${event.content}</td>
                  <td class="event__unit--start_date"><%= ${event.start}.to_s(:datetime_jp) %></td>
                  <td class="event__unit--end_date"><%= ${event.end}.to_s(:datetime_jp) %></td>
                  <td class="event__unit--btn"><%= link_to "詳細", user_event_path(current_user,event),class: "underline-none" %></td>
                  <td class="event__unit--btn"><%= link_to "編集", edit_user_event_path(current_user,event),class: "underline-none" %></td>
                  <td class="event__unit--btn delete--btn"><%= link_to "削除", user_event_path(current_user,event), method: :delete,class: "underline-none color-white" %></td>
                </tr>
                `
    return html;
  }
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