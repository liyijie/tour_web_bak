# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


# $(document).ready(function(){
	
# 	$(".showall").toggle(
# 		function(){
# 			$(this).parent().parent().children(".hide").slideDown(300);
# 			$(this).children("img").attr("src", "images/arrow_up.png");
# 		},
# 		function(){
# 			$(this).parent().parent().children(".list:gt(1)").slideUp(300);
# 			$(this).children("img").attr("src", "images/arrow_down.png");
# 		}
# 	);

# });

$ ->

	$(".showall").click -> 
		isShow = false
		isShow = true if $(this).attr("isShow")
		if !isShow
			$(this).parent().parent().children(".hide").slideDown(300)
			$(this).children("img").attr("src","images/arrow_up.png")
			$(this).attr("isShow", true)
		else
			$(this).parent().parent().children(".list:gt(1)").slideUp(300)
			$(this).children("img").attr("src", "images/arrow_down.png")
			$(this).attr("isShow", false)
		



