extends Node2D

var active = false

func _ready():
    pass

func action():
    active = !active
    if active == true:
        $Sprite/AnimationPlayer.play("open")
        $AudioStreamPlayer.play()
        get_node("/root/World/Players").add_item(1)
    else:
        return
