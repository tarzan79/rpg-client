extends Node2D

var active = true

func _ready():
    randomize()
    var r = randi()%6+1
    $Sprite/AnimationPlayer.seek(r, true)

func action():
    active = !active
    if active == true:
        $Sprite/AnimationPlayer.play("fire")
        $Light2D.set_enabled(true)
    else:
        $Sprite/AnimationPlayer.stop()
        $Light2D.set_enabled(false)
