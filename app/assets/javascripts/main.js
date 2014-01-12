$(document).ready(function () {
  $('#datepicker-container .input-append.date').datepicker({
    format: "dd/mm/yyyy",
    todayBtn: "linked",
    autoclose: true,
    todayHighlight: true
  });
});