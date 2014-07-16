/**
 * JUI
 */
 (function($, window, document, undefined) {

 	// 创建JUI对象
 	var JUI = window.JUI = {
 		/**
 		 * 初始化方法
 		 */
 		init : function() {

 			var layout = {
 				top : $(".jui_top"),
 				topBar : $(".jui_menu"),
 				bottom : $(".jui_bottom"),
 				left : $(".jui_left"),
 				right : $(".jui_right")
 			};
 			
 			var tHeight = layout.top != undefined ? layout.top.height() : 0,
 				tMenuHeight = layout.topBar != undefined ? layout.topBar.height() : 0,
 				bHeight = layout.bottom != undefined ? layout.bottom.height() : 0;
 			var totoalHeight = $(window).height() - tHeight - tMenuHeight - bHeight -10;
 			if(layout.left != undefined) {
 				layout.left.height(totoalHeight);
 			}
 			// 以下所有数字代表边框的宽度和Padding的宽度
 			if(layout.right != undefined) {
 				layout.right.height(totoalHeight - 4);
 				var leftWidth = 5;
 				if(layout.left != undefined) {
 					leftWidth += layout.left.width() + 12;
 				}
 				layout.right.width($(window).width() - leftWidth);
 			}

 			/**
 			 * 初始化左边树形菜单
 			 */
 			this.Accordion.init();

 			/**
 			 * 初始化表格
 			 */
 			this.Table.init();
 		},


 		Accordion : {
 			init : function() {
 				// 检查元素是否存在
 				if($(".accordion").length < 1) {
 					return;
 				}
 				// 获得accordion的高度
 				var accHeight = $(".jui_left").height() - $(".toggleCollapse").height() - 5;
 				// 循环获取Content
 				$(".accordionContent").each(function(index, el) {
 					if(index > 0) {
 						// 隐藏除了第一个之后的节点
 						$(el).hide();
 					}
 					// 显示层的高度根据jui_left的高度 - 每个Hander的高度
 					accHeight = accHeight - $(el).prev().height();
 				});
 				// 给Content设置高度
 				$(".accordionContent:first").height(accHeight);
 				// 设置点击事件
 				$(".accordionHeader").click(function() {
 					// 如果已经展开则取消操作
 					if($(this).children('h2').get(0).className == "collapsable") {
 						return;
 					}
 					// 收起显示层
 					$(".collapsable").parent().next(".accordionContent:first").slideUp();
 					// 删除原来的点击效果
 					$(".collapsable").removeClass('collapsable');
 					// 显示Content
 					$(this).next(".accordionContent").height(accHeight).slideDown();
 					$(this).children('h2').addClass('collapsable');
 				});
 			}
 		},

 		// Table 不支持横向滚动
 		Table : {

 			init : function() {

 				// 自动调整表格高度, 累加jui_right内一级内容高度
 				var rightHeight = 0;
 				$(".jui_right > *").each(function(index, el) {
 					if($(el).attr("class") == "jui_table_content") {
 						return;
 					}
 					rightHeight += $(el).height();
 				});
 				$(".jui_table_content").height($(".jui_right").height() - rightHeight - 20);
 				// 开始对表格进行初始化
 				var $tableHeader = $(".jui_table_header .jui_table");
 				var tableDiv = $(".jui_table_content").get(0);
 				// 判断是否有滚动条
 				if(tableDiv != undefined && (tableDiv.scrollHeight > tableDiv.clientHeight 
 					|| tableDiv.offsetHeight > tableDiv.clientHeight)) { 
 					// 如果产生滚动条，则标题栏减去17
 					$tableHeader.width($tableHeader.width() - 17);
 				}
 				// 设置标题列宽和内容列宽等宽
 				$(".jui_table_content .jui_table tr").eq(0).children('td').each(function(index, el) {
 					$(".jui_table_header .jui_table th").eq(index).width($(el).width());
 				});
 				// 设置表格内容选中和划过状态
 				$(".jui_table_content .jui_table tr").click(function(event) {
 					$(".jui_table_content .jui_table tr").removeClass('selected');
 					$(this).removeClass('hover');
 					$(this).addClass('selected');
 				}).mouseover(function(event) {
 					// 如果TR已经被选中，则不改变
 					if(this.className == "selected") {
 						return;
 					}
 					$(this).addClass('hover');
 				}).mouseout(function(event) {
 					$(this).removeClass('hover');
 				});

 				// 全选和全不选操作
 				var $headerCheckbox = $(".jui_table_header .jui_table th:first input[type='checkbox']");
 				if($headerCheckbox.length > 0) {
 					$headerCheckbox.click(function(event) {
 						$(".jui_table_content .jui_table tr").each(function(index, el) {
 							$(el).children('td:first').each(function(index, e) {
 								if($headerCheckbox.attr("checked")) {
 									$(e).children("input[type='checkbox']").attr("checked", "checked");
 								} else {
 									$(e).children("input[type='checkbox']").removeAttr('checked');
 								}
 							});
 						});
 					});
 				}
 			}

 		}

 	};

 	// 初始化进入
 	$(document).ready(function() {
 		JUI.init();
 		var resizeCount = 1;
 		$(window).resize(function(event) {
 			if(resizeCount-- == 0) {
 				JUI.init();
 				resizeCount = 1;
 			}
 		});
 	});


 })(jQuery, window, document, undefined);