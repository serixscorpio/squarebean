// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery_nested_form
//= require foundation.min.js
//= require jquery.easing.1.3
//= require jquery.transit.min
//= require main
//= require segmentio
$(document).foundation();
$(document).ajaxStart(function() {
  $(".js-inquiry-response").text("Sending your message, please wait");
});
$(document).on('nested:fieldRemoved', function(event){
  var field = event.field;
  var checkbox = field.find("[id*='remove_path'],[type='checkbox']");
  checkbox.attr('checked', true);
});
