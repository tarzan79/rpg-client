extends Node

var fsm: StateMachine


var direction = Vector2(0,1)
var speed = 150 
var directions = ["right", "bottom-right", "bottom", "bottom-left", "left", "top-left", "top", "top-right"]
export var animation:NodePath = ""
var walk
slave var velocity = Vector2(0, 0)

func enter():
    rset_config("velocity", 4)  
    print("State walk !")
    print(fsm.get_parent().get_node("Area2D").rotation)
    walk = get_node(animation)
   # exit("nom de la state")

func exit(next_state):
  fsm.change_to(next_state)

# Optional handler functions for game loop events
func process(delta):
    velocity = Vector2(0, 0)
    var move_direction = Vector2(0, 0)
    var left = Input.is_action_pressed("ui_left")
    var right = Input.is_action_pressed("ui_right")
    var up = Input.is_action_pressed("ui_up")
    var down = Input.is_action_pressed("ui_down")
    
    if right:
        velocity.x += 1
    if left:
        velocity.x -= 1
    if down:
        velocity.y += 1
    if up:
        velocity.y -= 1   
    
    if velocity.length() > 0:
        velocity = velocity.normalized()
    
        move_direction.x = velocity.x
        move_direction.y = velocity.y     
        
    if left || right || up || down:
        direction = move_direction
        var animation = direction2str(direction)
        fsm.get_parent().get_node("walk/walk").play("default-" + animation + "-8")
        fsm.get_parent().get_node("Area2D").rotation = move_direction.angle()
        fsm.get_parent().move_and_slide(velocity * speed)
    elif fsm.get_parent().get_node("walk/walk").is_playing():
        fsm.get_parent().get_node("walk/walk").stop()
        
    rset("velocity", velocity)  
    return delta

func input(event):
  if event.is_action_pressed("menu"):
    exit("Menu")
    return event

func unhandled_input(event):
    return event

func unhandled_key_input(event):
    return event

func notification(what, flag = false):
  return [what, flag]
  
func direction2str(_direction):
    var angle = _direction.angle()
    if angle < 0:
        angle += 2 * PI
    var index = round(angle / PI * 4)
    if index == 8:
        index = 0
    return directions[index]
