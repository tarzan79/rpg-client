extends KinematicBody2D

export var speed = 150  # How fast the player will move (pixels/sec).
var directions = ["right", "bottom", "left", "top"]
var walk
var direction = Vector2(0,1)
var debarquable = false

func _ready():
    walk = get_node("Sprite/AnimationPlayer")

func _process(delta):
    pass
#     var move
#     var velocity = Vector2(0, 0)
#     var move_direction = Vector2(0, 0)
#     var left = Input.is_action_pressed("ui_left")
#     var right = Input.is_action_pressed("ui_right")
#     var up = Input.is_action_pressed("ui_up")
#     var down = Input.is_action_pressed("ui_down")
    
    
#     if right:
#         velocity.x += 1
#     if left:
#         velocity.x -= 1
#     if down:
#         velocity.y += 1
#     if up:
#         velocity.y -= 1   
# #    if Input.is_action_pressed('click'):
# #        target = get_global_mouse_position() 
#     if velocity.length() > 0:
#         velocity = velocity.normalized()
                    
#     move_direction.x = int(right) - int(left)
#     move_direction.y = int(down) - int(up)        
    
#     if left || right || up || down:
# #        target = null
#         direction = move_direction
#         var animation = direction2str(direction)
#         walk.play("default-" + animation + "-4x4")
#         $Area2D.rotation = move_direction.angle()
#         move = move_and_slide(velocity * speed)
#     else:
#         walk.stop()
        
func direction2str(_direction):
    var angle = _direction.angle()
    if angle < 0:
        angle += 2 * PI 
    var index = round(angle / PI * 2)
    if index == 4:
        index = 0
    return directions[index]

func _on_Area2D_body_entered(body):
    #$StateMachine.change_to("Accost")
    print("2")
    print($Area2D/CollisionShape2D.global_position)
    print(body)
