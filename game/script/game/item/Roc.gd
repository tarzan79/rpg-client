extends KinematicBody2D

export var speed = 2  # How fast the player will move (pixels/sec).

var walk # naimation of walk
var direction = Vector2(0,1)
var contact # body to player entered
var occuped = false
var charge = 0

func _ready():
    pass
    #walk = get_node("walk/walk")

func _process(delta):
    pass

func push(velocity):
    _move(velocity)
    
func _move(velocity):
    var move = move_and_slide(velocity)

    if velocity.x > 0:
        $Sprite/AnimationPlayer.play("left")
        print(velocity)
    elif velocity.x < 0:
        $Sprite/AnimationPlayer.play("right")
        print(velocity)
    elif velocity.y > 0:
        $Sprite/AnimationPlayer.play("top")
        print(velocity)
    elif velocity.y < 0:
        $Sprite/AnimationPlayer.play("bottom")
    
    

func _on_Area2D_body_entered(body):
    print("Player touch -> " + body.get_name())
    contact = body

func _on_Area2D_body_exited(body):
    contact = null


func _on_Area2D_area_entered(area):
    print("Player touch -> " + area.get_name())
    contact = area.get_parent()


func _on_Area2D_area_exited(area):
    contact = null
