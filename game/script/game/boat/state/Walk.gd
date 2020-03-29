extends Node

var fsm: StateMachine


var direction = Vector2(0,1)
var speed = 150 
var directions = ["right", "bottom", "left", "top"]
export var animation:NodePath = ""
var walk

func enter():
    print("Hello from State !")
    walk = get_node(animation)
   # exit("nom de la state")

func exit(next_state):
  fsm.change_to(next_state)

# Optional handler functions for game loop events
func process(delta):
  var move
  var velocity = Vector2(0, 0)
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
#    if Input.is_action_pressed('click'):
#        target = get_global_mouse_position() 
  if velocity.length() > 0:
    velocity = velocity.normalized()
                  
  move_direction.x = int(right) - int(left)
  move_direction.y = int(down) - int(up)        
  
  if left || right || up || down:
#        target = null
    direction = move_direction
    var animation = direction2str(direction)
    walk.play("default-" + animation + "-4x4")
    fsm.get_parent().get_node("Area2D").rotation = move_direction.angle()
    move = fsm.get_parent().move_and_slide(velocity * speed)
  else:
    walk.stop()
    pass


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
  var index = round(angle / PI * 2)
  if index == 4:
      index = 0
  return directions[index]
