extends Button
func _ready() -> void:
	pass 

func _process(delta: float) -> void:
	pass

func _on_mouse_entered() -> void:
	icon=Statemanger.sprite1
	pass 

func _on_mouse_exited() -> void:
	icon=Statemanger.sprite
	pass 

func _on_button_down() -> void:
	var tween = create_tween()
	tween.tween_property(self, "position",position+Vector2(1.5,1.5) , 0.05)
	pass 

func _on_button_up() -> void:
	var tween = create_tween()
	tween.tween_property(self, "position",position-Vector2(1.5,1.5) , 0.05)
	pass

func _on_pressed() -> void:
	var accept=load("res://tscn/meue.tscn")
	get_tree().change_scene_to_packed(accept)
	pass 
