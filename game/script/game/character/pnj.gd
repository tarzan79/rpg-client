extends KinematicBody2D

var diag = null
var boxDialogue
var player
export var pseudo:String = "name"

func _ready():
    player = load("res://game/script/util/resource/monster_class.gd").new($Control/TextureProgress)
    player.name = pseudo

func action():
    print("pnj !!!")

func hit(value):
        $Sprite/AnimationPlayer.play("hit")
        if player.pv_decrease(value) == true:
            queue_free()
    
func action2():
    if diag == null:
        var box = load("res://game/scene/menu/DialogueBox.tscn")
        boxDialogue = box.instance()
        get_tree().get_root().get_node("World/HUD").add_child(boxDialogue)
        boxDialogue.call_deferred("set_name", "DialogueBox")

    print("click pnj 2")
    boxDialogue.diag([
        "bonjour",
        "je suis ton pere",
        "mais osef de ca",
        "en tout cas, bienvenue ici"
        ])
