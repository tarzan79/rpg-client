extends Node

var fsm: StateMachine

func enter():
    print("debarquement immediat")

func exit():
    pass

# Optional handler functions for game loop events
func process(delta):
    return delta

func physics_process(delta):
    return delta

func input(event):
    return event

func unhandled_input(event):
    return event

func unhandled_key_input(event):
    return event

func notification(what, flag = false):
    return [what, flag]
