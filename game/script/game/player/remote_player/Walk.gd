extends Node

var fsm: StateMachine


var direction = Vector2(0,1)
var speed = 150 
var directions = ["right", "bottom-right", "bottom", "bottom-left", "left", "top-left", "top", "top-right"]
export var animation:NodePath = ""
var walk
slave var velocity = Vector2(0, 0)

func enter():
    print("State walk !")
    walk = get_node(animation)
   # exit("nom de la state")

func exit(next_state):
  fsm.change_to(next_state)

# Optional handler functions for game loop events
func process(delta):
  

  if velocity.length() > 0:
    velocity = velocity.normalized()            
 
    direction = velocity
    var animation = direction2str(direction)
    fsm.get_parent().get_node("walk/walk").play("default-" + animation + "-8")

    fsm.get_parent().move_and_slide(velocity * speed)

  else:
    fsm.get_parent().get_node("walk/walk").stop()
    fsm.get_parent().position = fsm.get_parent().pos
  return delta

func physics_process(delta):
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
