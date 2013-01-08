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
//= require knockout
//= require bootstrap
//= require_tree ./fullcalendar
//= require chosen.jquery
//= require bootstrap-colorpicker
//= require bootstrap-datepicker
//= require bootstrap-datepicker.pl.js
//= require bootstrap-timepicker
//= require_tree .

$(function() {
	$(document).ready(function() {
		$('.date-selector').datepicker({
			format: 'dd/mm/yyyy',
			weekStart: 1,
			todayBtn: true,
			todayHighlight: true,
			language: 'pl'
		})

		$('.time-selector').timepicker({
			defaultTime: 'value',	
			showMeridian: false,
			showInputs: false
		})
		
		$('.chsn-select').chosen()
	})
})

Math.zeroFill = function(number, width){
  width -= number.toString().length;
  if ( width > 0 )
  {
	return new Array( width + (/\./.test( number ) ? 2 : 1) ).join( '0' ) + number;
  }
  return number + "";
}

TimeHelper = {
	time2int: function(t){
		var tmp = t.split(":")
		return tmp[0] * 60 + tmp[1] * 1
	},
	int2time: function(i){
		return Math.zeroFill(Math.floor(i/60),2) + ":" + Math.zeroFill(i%60,2)
	}
}