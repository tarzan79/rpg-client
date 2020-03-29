extends Node2D

onready var req = $Panel/HTTPRequest

func _ready():
    pass

func _on_Button_pressed():
    #on recupere toute les variables
    var errors = []
    var data = {}
    var headers = ["Content-Type: application/json"]
    data.email = $Panel/MarginContainer/VBoxContainer/LineEdit2.text
    data.password = $Panel/MarginContainer/VBoxContainer/LineEdit3.text
    req.request("http://127.0.0.1:9000/login", headers, true, HTTPClient.METHOD_POST, JSON.print(data))
    
func show_errors(object):
    for i in object:
        print(i)

func _on_HTTPRequest_request_completed(result, response_code, headers, body):
    var json = JSON.parse(body.get_string_from_utf8())
    if json.result.success == true:
        #GlobalWorld.goto_map("res://core/maps/Map01.tscn")
        print("auth ok")
        Loader.goto_scene("res://game/scene/global/World.tscn")
    else:
        print(json.result)
