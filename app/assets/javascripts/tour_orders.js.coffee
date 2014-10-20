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

	# tour_order_new 
	$("#btnTicketMin").click ->
		ticketNum = parseInt($("#txtTicketNum").val(),10)
		ticketPrice = parseFloat($("#ticketPrice").html(),10)
		if ticketNum > 1
			ticketNum -= 1;
			$("#txtTicketNum").val(ticketNum)
			$("#totalTicketPrice").html(ticketPrice * ticketNum)

	$("#btnTicketAdd").click ->
		ticketNum = parseInt($("#txtTicketNum").val(),10)
		ticketPrice = parseFloat($("#ticketPrice").html(),10)
		ticketNum += 1
		$("#txtTicketNum").val(ticketNum)
		$("#totalTicketPrice").html(ticketPrice * ticketNum)

	$("#txtTicketNum").change -> 
		if $(this).val() < 1 
			$(this).val(1)
		ticketNum = parseInt($("#txtTicketNum").val(),10)
		ticketPrice = parseFloat($("#ticketPrice").html(),10)
		$("#totalTicketPrice").html(ticketPrice * ticketNum)

	$("#txtTicketNum").change()

	$("#txtPlayTime").cxCalendar()
	playDate = new Date()
	playDate.setTime(playDate.getTime() + (1000 * 60 * 60 * 24))
	$("#txtPlayTime").val(playDate.getFullYear() + "-" + (playDate.getMonth() + 1) + "-" + playDate.getDate());


	$("#btnCopy").click ->
		$("#txtNUser").val($("#txtName").val());
		$("#txtNTel").val($("#txtTel").val());

	$(".accordion .item div").click ->
		$(this).next().show();


	$("#range").change ->
		document.getElementById("queryForm").submit();

	$("#state").change ->
		document.getElementById("queryForm").submit();


reset = () ->
	$(".order_list_div").hide()
	$(".first .org").removeClass("active")