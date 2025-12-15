extends Label

func _ready() -> void:
	$disappear.play("anim")
	if text=="你当前未登入，注销失败"||text=="注销成功"||text=="您还没登录"||text=="还有未填的元素"||text=="没有这个时间"||text=="输入框不能为空"||text=="您当前未选中类型,删除失败"||text=="无法筛选"||text=="您的预算有问题"||text=="修改成功"||text=="修改失败":
		add_theme_font_size_override("font_size",26)
	pass 

func _process(delta: float) -> void:
	pass

func _on_disappear_animation_finished(anim_name: StringName) -> void:
	self.queue_free()
	pass 
