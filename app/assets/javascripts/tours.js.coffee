# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).ready(function(){
	
	$(".showall").toggle(
		function(){
			$(this).parent().parent().children(".hide").slideDown(300);
			$(this).children("img").attr("src", "images/arrow_up.png");
		},
		function(){
			$(this).parent().parent().children(".list:gt(1)").slideUp(300);
			$(this).children("img").attr("src", "images/arrow_down.png");
		}
	);

});