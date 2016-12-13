function centerModals(){
	$('.modal').each(function(i){   //遍历每一个模态框
		var $clone = $(this).clone().css('display', 'block').appendTo('body');    
		var top = Math.round(($clone.height() - $clone.find('.modal-content').height()) / 2);
		top = top > 0 ? top : 0;
		$clone.remove();
		$(this).find('.modal-content').css("margin-top", top-30);  //修正原先已经有的30个像素
		});
	}
	$('.modal').on('show.bs.modal', centerModals);      //当模态框出现的时候
	$(window).on('resize', centerModals);               //当窗口大小变化的时候
