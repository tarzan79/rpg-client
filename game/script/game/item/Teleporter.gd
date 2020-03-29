extends Node2D

export var map_destination = ""
var next_map

func _ready():
    if next_map != null:
        print(next_map)

func _on_Area2D_body_entered(body):
    if body.name == "Player":
        get_node("/root/World").goto_scene("res://game/scene/game/map/" + map_destination + ".tscn")
