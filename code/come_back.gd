extends Button    #返回主界面的按钮点击事件以及动画更新
func _ready() -> void:
	pass 

func _process(delta: float) -> void:
	pass

func _on_mouse_entered() -> void: #鼠标在按钮上为发亮图片
	icon=Statemanger.sprite1
	pass 

func _on_mouse_exited() -> void:
	icon=Statemanger.sprite      #离开按钮为正常图片
	pass 

func _on_button_down() -> void:
	var tween = create_tween()   #create_tween()函数为创建可以平滑动态实现节点属性动态变化的节点,为动画效果
	tween.tween_property(self, "position",position+Vector2(1.5,1.5) , 0.05)     #表示位置在0.05秒内向右下偏移1.5个像素
	pass 

func _on_button_up() -> void:    #此函数为返回位置
	var tween = create_tween()
	tween.tween_property(self, "position",position-Vector2(1.5,1.5) , 0.05)
	pass
 
func _on_pressed() -> void:      #按下松开后切换主界面场景
	var accept=load("res://tscn/meue.tscn")
	get_tree().change_scene_to_packed(accept)
	pass 
