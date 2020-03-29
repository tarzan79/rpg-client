extends Control

var Item = preload("res://game/script/util/resource/item_class.gd")
var emplacement = preload("res://game/scene/ui/inventory/Emplacement.tscn")

var items = []

func _ready():
	for i in Session.items:
		add_item(i)
	
func add_item(item):
	print(item)
	var e = emplacement.instance()
	e.item = item
	e.hint_tooltip = "nom : "+ item.name
	e.hint_tooltip += "\ndescription : "+ item.desc
	e.hint_tooltip += "\ntype : "+ str(item.type)
	e.hint_tooltip += "\nprix : "+ str(item.price) + " or"
	e.get_node("Sprite").texture = load(item.sprite)    
	$Panel/VBoxContainer/ScrollContainer/GridContainer3.add_child(e)
#  HUD/Menu
