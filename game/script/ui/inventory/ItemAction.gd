extends Control

var ItemInfo = preload("res://game/scene/ui/inventory/ItemInfo.tscn")
# root/World/HUD/Menu
var item

func init(_item):
    item = _item

func _utiliser():
    pass

    
func _jeter():
    pass

func _info():
    queue_free()
    var info = ItemInfo.instance()
    info.get_node("VBoxContainer/name").text = item.name
    info.get_node("VBoxContainer/desc").text = item.desc
    info.get_node("VBoxContainer/prix").text = item.price
    get_node("/root/World/HUD/Menu").add_child(info)

func _quit():
    queue_free()
