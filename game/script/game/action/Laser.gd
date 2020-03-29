extends KinematicBody2D

var speed = 750
var velocity = Vector2()
var position_base
var position_end = 200
var degats = 8
var touched = false

func start(pos, dir):
    rotation = dir.angle()
    position = pos
    position_base = pos
    velocity = dir * speed

func _physics_process(delta):
    if touched == false:
        var collision = move_and_collide(velocity * delta)
        if collision:
            $Sprite.hide()
            $Sprite2.show()
            $Sprite2/AnimationPlayer.play("boom")
            velocity = Vector2(0, 0)
            touched = true
    #		queue_free()
            if collision.collider.has_method("hit"):
                collision.collider.hit(degats)
    #			queue_free()

func _on_VisibilityNotifier2D_screen_exited():
    queue_free()


func _on_AnimationPlayer_animation_finished(anim_name):
    queue_free()
