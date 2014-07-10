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

	$("#btnTicketMin").click ->
		ticketNum = parseInt($("#txtTicketNum").val(),10)
		ticketPrice = parseInt($("#ticketPrice").html(),10)
		if ticketNum > 1
			ticketNum -= 1;
			$("#txtTicketNum").val(ticketNum)
			$("#totalTicketPrice").html(ticketPrice * ticketNum)

	$("#btnTicketAdd").click ->
		ticketNum = parseInt($("#txtTicketNum").val(),10)
		ticketPrice = parseInt($("#ticketPrice").html(),10)
		ticketNum += 1
		$("#txtTicketNum").val(ticketNum)
		$("#totalTicketPrice").html(ticketPrice * ticketNum)

	$("#txtTicketNum").change -> 
		if $(this).val() < 1 
			$(this).val(1)
		ticketNum = parseInt($("#txtTicketNum").val(),10)
		ticketPrice = parseInt($("#ticketPrice").html(),10)
		$("#totalTicketPrice").html(ticketPrice * ticketNum)

	$("#txtPlayTime").cxCalendar()

reset = () ->
	$(".order_list_div").hide()
	$(".first .org").removeClass("active")