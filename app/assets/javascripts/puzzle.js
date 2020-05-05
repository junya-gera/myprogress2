$(document).on("turbolinks:load", function() {

  const image = new Image();
  image.onload = function(e){
    const canvas = document.getElementById("stage");
    const ctx = canvas.getContext("2d");
    

    
    const a = ctx.drawImage(image,
      0, 0, 540, 540,
      0, 0, 540, 540);

    const top_left = document.getElementById("top-left");
    const TLCtx = top_left.getContext("2d");
    TLCtx.fillStyle = "rgb(0, 0, 255)";
    TLCtx.fillRect(  0,  0,180,180); // 1_1

    const top_center = document.getElementById("top-center");
    const TCCtx = top_center.getContext("2d");
    TCCtx.fillStyle = "rgb(0, 130, 0)";
    TCCtx.fillRect(0,  0,180,180); // 1_2

    const top_right = document.getElementById("top-right");
    const TRCtx = top_right.getContext("2d");
    TRCtx.fillStyle = "rgb(255, 0, 255)";
    TRCtx.fillRect(0,  0,180,180); // 1_3

    const center_left = document.getElementById("center-left");
    const CLCtx = center_left.getContext("2d");
    CLCtx.fillStyle = "rgb(255, 0, 0)";
    CLCtx.fillRect(  0,0,180,180); // 2_1

    const center_center = document.getElementById("center-center");
    const CCCtx = center_center.getContext("2d");
    CCCtx.fillStyle = "rgb(0, 255, 255)";
    CCCtx.fillRect(0,0,180,180); // 2_2

    const center_right = document.getElementById("center-right");
    const CRCtx = center_right.getContext("2d");
    CRCtx.fillStyle = "rgb(130, 0, 130)";
    CRCtx.fillRect(0,0,180,180); // 2_3

    const bottom_left = document.getElementById("bottom-left");
    const BLCtx = bottom_left.getContext("2d");
    BLCtx.fillStyle = "rgb(130, 130, 0)";
    BLCtx.fillRect(  0,0,180,180); // 3_1

    const bottom_center = document.getElementById("bottom-center");
    const BCCtx = bottom_center.getContext("2d");
    BCCtx.fillStyle = "rgb(255, 0, 120)";
    BCCtx.fillRect(0,0,180,180); // 3_2

    const bottom_right = document.getElementById("bottom-right");
    const BRCtx = bottom_right.getContext("2d");
    BRCtx.fillStyle = "rgb(0, 255, 0)";
    BRCtx.fillRect(0,0,180,180); // 3_3
    
    const lineCtx = line.getContext("2d");
    lineCtx.strokeStyle = "rgb(255,255,255,0.7)";
    lineCtx.beginPath();
    lineCtx.moveTo(180,0);
    lineCtx.lineTo(180,540);
    lineCtx.stroke();

    lineCtx.beginPath();
    lineCtx.moveTo(360,0);
    lineCtx.lineTo(360,540);
    lineCtx.stroke();

    lineCtx.beginPath();
    lineCtx.moveTo(0,180);
    lineCtx.lineTo(540,180);
    lineCtx.stroke();

    lineCtx.beginPath();
    lineCtx.moveTo(0,360);
    lineCtx.lineTo(540,360);
    lineCtx.stroke();
  };
    
  image.src = "/public/usagi2.png";

  $('#task-btn-1').click(function(){
    let task1 = $('#input-task-1').val();
    $('#task-show-1').text(task1);
  });
  $('.BC-btn').click(function(){
    $(this).toggleClass('is-checked');
    $('#top-left').toggle('shake');
  });

  $('#task-btn-2').click(function(){
    let task2 = $('#input-task-2').val();
    $('#task-show-2').text(task2);
  });
  $('.TR-btn').click(function(){
    $(this).toggleClass('is-checked');
    $('#top-center').toggle('shake');
  });

  $('#task-btn-3').click(function(){
    let task3 = $('#input-task-3').val();
    $('#task-show-3').text(task3);
  });
  $('.CL-btn').click(function(){
    $(this).toggleClass('is-checked');
    $('#top-right').toggle('shake');
  });

  $('#task-btn-4').click(function(){
    let task4 = $('#input-task-4').val();
    $('#task-show-4').text(task4);
  });
  $('.CC-btn').click(function(){
    $(this).toggleClass('is-checked');
    $('#center-left').toggle('shake');
  });

  $('#task-btn-5').click(function(){
    let task5 = $('#input-task-5').val();
    $('#task-show-5').text(task5);
  });
  $('.BL-btn').click(function(){
    $(this).toggleClass('is-checked');
    $('#center-center').toggle('shake');
  });

  $('#task-btn-6').click(function(){
    let task6 = $('#input-task-6').val();
    $('#task-show-6').text(task6);
  });
  $('.TL-btn').click(function(){
    $(this).toggleClass('is-checked');
    $('#center-right').toggle('shake');
  });

  $('#task-btn-7').click(function(){
    let task7 = $('#input-task-7').val();
    $('#task-show-7').text(task7);
  });
  $('.BR-btn').click(function(){
    $(this).toggleClass('is-checked');
    $('#bottom-left').toggle('shake');
  });

  $('#task-btn-8').click(function(){
    let task8 = $('#input-task-8').val();
    $('#task-show-8').text(task8);
  });
  $('.TC-btn').click(function(){
    $(this).toggleClass('is-checked');
    $('#bottom-center').toggle('shake');
  });

  $('#task-btn-9').click(function(){
    let task9 = $('#input-task-9').val();
    $('#task-show-9').text(task9);
  });
  $('.CR-btn').click(function(){
    $(this).toggleClass('is-checked');
    $('#bottom-right').toggle('shake');
  });

    

})