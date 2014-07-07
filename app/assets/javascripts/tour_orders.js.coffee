# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$ ->
	$(".btnAll").click -> 
		reset()
		$(".orderDiv").show()
		$(this).addClass("active")

	$(".btnTour").click -> 
		reset()
		$(".tourDiv").show()
		$(this).addClass("active");

	$(".btnHotel").click -> 
		reset()
		$(".hotelDiv").show()
		$(this).addClass("active");


reset = () ->
	$(".order_list_div").hide()
	$(".first .org").removeClass("active")