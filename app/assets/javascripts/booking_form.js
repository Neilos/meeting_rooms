$(document).ready(function(){
  console.log('booking form executing...')

  var toggle_repeats_yearly_on = function(speed){
    if($('#booking_repeats_yearly_on').is(':checked')){
      $('#booking_repeats_yearly_on_options').show(speed);
    } else {
      $('#booking_repeats_yearly_on_options').hide(speed);
    }
  }
  toggle_repeats_yearly_on();
  $('#booking_repeats_yearly_on').on('change',function(){
    toggle_repeats_yearly_on("medium");
  });

  var toggle_booking_times = function(speed){
    if($('#booking_is_all_day').is(':checked')){
      $('.booking_time').hide(speed);
    } else {
      $('.booking_time').show(speed);
    }
  }
  toggle_booking_times("");
  $('#booking_is_all_day').on('change',function(){
    toggle_booking_times("medium");
  });

  var toggle_booking_options = function(speed){
    $('.booking_option').hide(speed);
    switch ($('#booking_repeats').val())
    {
    case 'never':
      // Nothing
      $('#repeats_options').hide(speed);
      break;
    case 'daily':
      $('#repeats_options').show(speed);
      $('#repeats_daily_options').show(speed);
      break;
    case 'weekly':
      $('#repeats_options').show(speed);
      $('#repeats_weekly_options').show(speed);
      break;
    case 'monthly':
      $('#repeats_options').show(speed);
      $('#repeats_monthly_options').show(speed);
      break;
    case 'yearly':
      $('#repeats_options').show(speed);
      $('#repeats_yearly_options').show(speed);
      break;
    }
  }
  toggle_booking_options();
  $('#booking_repeats').on('change',function(){
    toggle_booking_options("medium");
  });

  var toggle_repeat_ends_on = function(speed){
    switch ($('#booking_repeat_ends').val())
    {
    case 'never':
      $('#booking_repeat_ends_on').hide(speed);
      break;
    case 'on':
      $('#booking_repeat_ends_on').show(speed);
      break;
    }
    console.log('finished function...')
  }
  toggle_repeat_ends_on();
  $('#booking_repeat_ends').on('change',function(){
    toggle_repeat_ends_on("medium");
  });

  var toggle_repeats_monthly = function(speed){
    switch ($('#booking_repeats_monthly').val())
    {
    case 'each':
      $('#booking_repeats_monthly_each').show(speed);
      $('#booking_repeats_monthly_on').hide(speed);
      break;
    case 'on':
      $('#booking_repeats_monthly_each').hide(speed);
      $('#booking_repeats_monthly_on').show(speed);
      break;
    }
  }
  toggle_repeats_monthly();
  $('#booking_repeats_monthly').on('change',function(){
    toggle_repeats_monthly("medium");
  });

  console.log('booking form finished executing...')

});