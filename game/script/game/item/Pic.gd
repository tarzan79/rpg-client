extends StaticBody2D

var active = false

func _ready():
    pass

func action():
    active = !active
    if active == true:
        $Sprite/AnimationPlayer.play("off")
        $CollisionShape2D.set_disabled(true)
        $AudioStreamPlayer.play()
    else:
        $Sprite/AnimationPlayer.play("on")
        $CollisionShape2D.set_disabled(false)
        $AudioStreamPlayer.play()
