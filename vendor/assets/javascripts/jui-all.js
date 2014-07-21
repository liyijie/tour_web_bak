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
 				JUI._layout.Right.init({
 					layout : layout,
 					totoalHeight : totoalHeight
 				});
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
 				$(".accordionHeader").unbind("click");
 				$(".accordionHeader").bind("click", function() {
 					
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

 				// 设置高度
 				$(".jui_table_content").height($(".jui_table_content").height() + JUI._window.contentHeight);
 				
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
 				this._setSelectedAndMove();

 				// 全选和全不选操作
 				this._setTableCheckBox();
 			},

 			// 设置表格内容选中和划过状态
 			_setSelectedAndMove : function() {
 				var $tr = $(".jui_table_content .jui_table tr");
 				$tr.unbind('click');
 				$tr.bind('click',  function(event) {
 					$(".jui_table_content .jui_table tr").removeClass('selected');
 					$(this).removeClass('hover');
 					$(this).addClass('selected');
 				});
 				$tr.unbind('mouseover');
 				$tr.bind('mouseover',  function(event) {
 					// 如果TR已经被选中，则不改变
 					if(this.className == "selected") {
 						return;
 					}
 					$(this).addClass('hover');
 				});
 				$tr.unbind('mouseout');
 				$tr.bind('mouseout',  function(event) {
 					$(this).removeClass('hover');
 				});
 			},

 			// 全选和全不选操作
 			_setTableCheckBox : function() {
 				var $headerCheckbox = $(".jui_table_header .jui_table th:first input[type='checkbox']");
 				if($headerCheckbox.length > 0) {
 					$headerCheckbox.unbind('click');
 					$headerCheckbox.bind('click', function(event) {
 						$(".jui_table_content .jui_table tr").each(function(index, el) {
 							$(el).children('td:first').each(function(index, e) {
 								if($headerCheckbox.prop("checked")) {
 									$(e).children("input[type='checkbox']").prop("checked", true);
 								} else {
 									$(e).children("input[type='checkbox']").prop('checked', false);
 								}
 							});
 						});
 					});
 				}
 			},

 			// 如果有参数，则会把该参数作为ID切割符，默认为逗号
 			getCheckSelect: function() {
 				var s 	= ",",
 					ret = "";
				if(arguments[0] != undefined) {
					s = arguments[0];
				}
 				$(".jui_table_content .jui_table tr").each(function(index, el) {
					$(el).children('td:first').each(function(index, e) {
						var $checkbox = $(e).children("input[type='checkbox']");
						if($checkbox.prop("checked")) {
							ret += $checkbox.attr("value") + s;
						}
					});
				});
				if(ret != "") {
					ret = ret.substr(0, ret.length - 1);
				}
				return ret;
 			}

 		},

 		_window : {
 			// .jui_right .content 的宽度增加值
 			contentWidth : 0,
 			// .jui_right .content 的高度增加值
 			contentHeight : 0,

 			// 返回控件的高度，包含Margin的范围
			_getElementHeight : function(el) {
				var mt = parseInt(el.css("margin-top"),10) || 0,
					mb = parseInt(el.css("margin-bottom"),10) ||0,
					pt = parseInt(el.css("padding-top"),10) || 0,
					pb = parseInt(el.css("padding-bottom"), 10) ||0,
					borderTop = parseInt(el.css("border-top-width"), 10) || 0,
					borderBottom = parseInt(el.css("border-bottom-width"), 10) || 0;
				return el.height() + mt + mb + pt + pb + borderTop + borderBottom;
			}
 		}, 

 		_layout : {
 			
 			// 界面右边模块
 			Right : {

 				// 初始化右边菜单
 				init : function(p) {
 					JUI._window.contentHeight = p.layout.right.height();
	 				p.layout.right.height(p.totoalHeight - 4);
	 				var leftWidth = 5;
	 				if(p.layout.left != undefined) {
	 					leftWidth += p.layout.left.width() + 12;
	 				}
	 				JUI._window.contentWidth = p.layout.right.width();
	 				p.layout.right.width($(window).width() - leftWidth);
	 				JUI._window.contentWidth = p.layout.right.width() - JUI._window.contentWidth;
	 				if($(".jui_right .content").length > 0) {
	 					var titleHeight = $(".jui_right .title").height();
	 					$(".jui_right .content").height(p.layout.right.height() - titleHeight);
	 					JUI._window.contentHeight = p.layout.right.height() - JUI._window.contentHeight;
	 				}
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