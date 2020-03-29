extends Node

var fsm: StateMachine

func enter():
    var node = load("res://game/scene/ui/Menu.tscn")
    var menu = node.instance()
    get_node("/root/World/HUD").add_child(menu)
  

func exit(next_state):
    fsm.change_to(next_state)

# Optional handler functions for game loop events
func process(delta):
    return delta

func physics_process(delta):
    return delta

func input(event):
    if event.is_action_pressed("menu"):
        get_node("/root/World/HUD/Menu").queue_free()
        exit("walk")
    return event

func unhandled_input(event):
    return event

func unhandled_key_input(event):
    return event

func notification(what, flag = false):
    return [what, flag]
