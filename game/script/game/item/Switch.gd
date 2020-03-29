extends Node2D

var active = false
export var target = ""
export var groupe = ""

func _ready():
    pass

func action():
    print("Switch action to", !active)
    active = !active
    if active == true:
        $Sprite/AnimationPlayer.play("switch_on")
        $AudioStreamPlayer.play()
    else:
        $AudioStreamPlayer.play()
        $Sprite/AnimationPlayer.play("switch_off")
        
    if target != "":
        get_node("/root/World/Map/Map/Events/" + target).action()
    elif groupe != "":
        get_tree().call_group(groupe, "action")
    else:
        print("le switch n'a pas de destination valide")
