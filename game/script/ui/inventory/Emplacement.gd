extends TextureRect

var ItemAction = preload("res://game/scene/ui/inventory/ItemAction.tscn")
var item

func _ready():
    pass


func _on_Emplacement_mouse_entered():
    $AnimatedSprite.play("idle")
    $AnimatedSprite.show()



func _on_Emplacement_mouse_exited():
    $AnimatedSprite.stop()
    $AnimatedSprite.hide()


func _on_Emplacement_gui_input(event):
    if event is InputEventMouseButton && event.is_pressed():
        var action = ItemAction.instance()
        action.init(item)
        action.rect_global_position = rect_global_position + Vector2(20, 20)
        get_node("/root/World/HUD").add_child(action)
