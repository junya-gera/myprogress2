$(function () {
  
  function eventCalendar() {
      return $('#calendar').fullCalendar({});
  };
  function clearCalendar() {
      $('#calendar').html('');
  };
  $(document).on('turbolinks:load', function () {
  eventCalendar();
  });
  $(document).on('turbolinks:before-cache', clearCalendar);

  $('#calendar').fullCalendar({
    events: window.event_datas,
    eventClick: function(info) {
      alert('タイトル:' + info.title);
    },
    dayClick: function(){
      $(this).css('background-color', '#f5fcc1');
    },
    
    header: {
      left: 'prev,next today',
      center: 'title',
      right: 'month,agendaWeek,agendaDay'
    },
    buttonText: {
      prevYear: '前年',
      nextYear: '翌年',
      today: '今日',
      month: '月',
      week: '週',
      day: '日'
      },
      height: 650,
      locale: 'ja',
      monthNames: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月'],
      dayNames: ['日曜日', '月曜日', '火曜日', '水曜日', '木曜日', '金曜日', '土曜日'],
      monthNamesShort: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月'],
      dayNamesShort: ['日', '月', '火', '水', '木', '金', '土'],


  
  });
  
});
