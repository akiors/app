extends Control
@export var come_back:PackedScene
@export var text:PackedScene
var isadmin:bool=false

func _ready() -> void:
	$creat_sucess.visible=false
	var tui=come_back.instantiate()
	get_tree().get_root().add_child(tui)
	pass

func _process(delta: float) -> void:
	pass

func _on_creat_pressed() -> void:
	if $user_name.text==""||$user_password.text==""||$user_password_again.text=="":
		var tui=text.instantiate()
		tui.position=Vector2(332,432)
		tui.text="内容不能为空"
		get_tree().get_root().add_child(tui)
		return
	var data:user_data
	if FileAccess.file_exists("user://user_data.res"):
		data=load("user://user_data.res")
	else:   data=user_data.new()
	if $user_name.text in data.userdata:
		var tui=text.instantiate()
		tui.position=Vector2(297,432)
		tui.text="您已经注册了这个账号！"
		get_tree().get_root().add_child(tui)
		return		
	if $user_password.text!=$user_password_again.text:
		var tuip=text.instantiate()
		tuip.position=Vector2(300,432)
		tuip.text="两次输入的密码不同！"
		get_tree().get_root().add_child(tuip)
		return
	data.userdata[$user_name.text]=$user_password.text
	data.dict[$user_name.text]=[]
	data.newmoney[$user_name.text]=0
	data.inway[$user_name.text]={"薪资":[0,0,0],"奖金":[0,0,0],"津贴":[0,0,0],"经营收入":[0,0,0],"存款收益":[0,0,0],"股票股息":[0,0,0],"基金分红":[0,0,0],"资产转让":[0,0,0],"其它":[0,0,0]}
	data.outway[$user_name.text]={"食品":[0,0,0],"水电":[0,0,0],"燃气":[0,0,0],"物业":[0,0,0],"交通":[0,0,0],"通讯":[0,0,0],"贷款":[0,0,0],"租金":[0,0,0],"娱乐":[0,0,0],"旅游":[0,0,0],"保险":[0,0,0],"购物":[0,0,0],"其它":[0,0,0]}
	data.budget[$user_name.text]=-1
	data.current_budget[$user_name.text]=-1
	$creat_sucess.visible=true
	Statemanger.bud=data.budget[$user_name.text]
	Statemanger.current_bud=data.current_budget[$user_name.text]
	data.isadmin[$user_name.text]=isadmin
	Statemanger.isadmin=isadmin
	ResourceSaver.save(data,"user://user_data.res")
	await get_tree().create_timer(1).timeout
	var accept=load("res://tscn/meue.tscn")
	get_tree().change_scene_to_packed(accept)
	Statemanger.isload=true
	Statemanger.user_name=$user_name.text
	pass 

func _on_check_box_pressed() -> void:
	isadmin=(isadmin==false)
	pass 
