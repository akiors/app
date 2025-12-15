extends Control
@export var a:ItemList
@export var b:ItemList
var choose1:String
var choose2:String
var id1:int
var id2:int

func _ready() -> void:
	$in.connect("pressed",additems.bind(false))
	$out.connect("pressed",additems.bind(true))
	$delect.connect("pressed",delectitems.bind(false))
	$delect2.connect("pressed",delectitems.bind(true))
	var datap=load("user://user_data.res")
	if datap==null||!datap.dict.has(Statemanger.user_name): return 
	var text=str(datap.newmoney[Statemanger.user_name])+"元"
	$pop.text=text
	var arr=datap.inway[Statemanger.user_name]
	for i in arr:
		var y=13-i.length()-str(arr[i][0]).length()
		if arr[i][0]==0:
			a.add_item(i+":"+str(arr[i][0])+"元"+"   ".repeat(y)+" "+str(arr[i][1])+"次")
		else:
			a.add_item(i+":+"+str(arr[i][0])+"元"+"   ".repeat(y)+" "+str(arr[i][1])+"次")
	var arr1=datap.outway[Statemanger.user_name]
	for i in arr1:
		var y=13-i.length()-str(arr1[i][0]).length()
		b.add_item(i+":"+str(arr1[i][0])+"元"+"   ".repeat(y)+" "+str(arr1[i][1])+"次")
	pass 

func _process(delta: float) -> void:
	pass
	
func additems(cmp:bool):
	var datap=load("user://user_data.res")
	if datap==null||!datap.dict.has(Statemanger.user_name): return 
	var map={false:datap.inway[Statemanger.user_name],true:datap.outway[Statemanger.user_name]}
	var map1={false:a,true:b}
	var map2={false:$TextEdit,true:$TextEdit2}
	if map2[cmp].text=="":
		var text=load("res://tscn/text.tscn")
		var tui=text.instantiate()
		tui.position=Vector2(330,570)
		tui.text="输入框不能为空"
		get_tree().get_root().add_child(tui)
		return 0
	map[cmp][map2[cmp].text]=[0,0,0]
	var y=12-map2[cmp].text.length()
	map1[cmp].add_item(map2[cmp].text+":"+"0元"+"   ".repeat(y)+" "+"0次")
	ResourceSaver.save(datap,"user://user_data.res")
	pass 
	
func delectitems(cmp:bool):
	var datap=load("user://user_data.res")
	if datap==null||!datap.dict.has(Statemanger.user_name): return 
	var map={false:datap.inway[Statemanger.user_name],true:datap.outway[Statemanger.user_name]}
	var map3={false:id1,true:id2}
	if map3[cmp]==-1:
		var text=load("res://tscn/text.tscn")
		var tui=text.instantiate()
		tui.position=Vector2(250,570)
		tui.text="您当前未选中类型,删除失败"
		get_tree().get_root().add_child(tui)
		return 0
	var map1={false:choose1,true:choose2}
	var map2={false:a,true:b}
	map[cmp].erase(map1[cmp])
	map2[cmp].remove_item(map3[cmp])
	ResourceSaver.save(datap,"user://user_data.res")
	id1=-1
	id2=-1
	pass

func _on_income_item_selected(index: int) -> void:
	choose1=$income.get_item_text(index)
	var count=0
	for i in choose1:
		if i==":":
			choose1=choose1.left(count)
			break
		count+=1
	id1=index
	pass 

func _on_pay_item_selected(index: int) -> void:
	choose2=$pay.get_item_text(index)
	var count=0
	for i in choose2:
		if i==":":
			choose2=choose2.left(count)
			break
		count+=1
	id2=index
	pass 
