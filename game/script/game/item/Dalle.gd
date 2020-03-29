extends Area2D

var active = false
export var auto = true
export var switch_groupe = ""
export var target = ""
export var target_groupe = ""

func _ready():
    pass

func action():
    if active == false:
        active = true
        print("dalle action to", !active)
        $Sprite/AnimationPlayer.play("on")
        $AudioStreamPlayer.play()
        if check_group() == true:
            print("check group: ok")
            if target != "":
                get_node("/root/Map/Events/" + target).action()
            elif target_groupe != "":
                get_tree().call_group(target_groupe, "action")
    else:
        active = !active
        print("dalle action to", !active)
        $Sprite/AnimationPlayer.play("off")
        $AudioStreamPlayer.play()
    

func check_group():
    var check_all_node = true
    var list_nodes = get_tree().get_nodes_in_group(switch_groupe)

    for i in list_nodes:
        if i.active == false:
            check_all_node = false
    return check_all_node
        

func _on_Dalle_body_entered(body):
    action()


func _on_Dalle_body_exited(body):
    print("out of dalle")
    if auto == true:
        action()
