# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$ -> 
	$("#txtCity").click ->
		$cityDiv = $("#cityDiv")
		$cityDiv.show()
		$cityDiv.css("top", $(this).position().top + $(this).height())
		return false
	
	$("#cityDiv li").click ->
		$("#txtCity").val($(this).html())
		$("#cityDiv").hide()

	$(document).bind("click",
		(e) ->
			target = $(e.target)
			if target.closest(".dialogDiv").length is 0
				$(".dialogDiv").hide()
	)


	$("#cal_start").cxCalendar()
	$("#cal_end").cxCalendar()
	
