extends Node2D

onready var req = $Panel/HTTPRequest

func _ready():
    pass

func _on_Button_pressed():
    #on recupere toute les variables
    var data = {}
    data.username = $Panel/MarginContainer/VBoxContainer/LineEdit2.text
    data.password = $Panel/MarginContainer/VBoxContainer/LineEdit5.text
    data.confirm = $Panel/MarginContainer/VBoxContainer/LineEdit6.text
    data.email = $Panel/MarginContainer/VBoxContainer/LineEdit3.text
    data.email_confirm = $Panel/MarginContainer/VBoxContainer/LineEdit4.text
    data.birth = $Panel/MarginContainer/VBoxContainer/LineEdit7.text
    data.newletter = $Panel/MarginContainer/VBoxContainer/CheckBox.is_pressed()
    var errors = []
    #on verifie si les entrées sont correct
    if data.password != data.confirm:
        errors.append("la confirmation du mot de passe diffère") 
    if data.email != data.email_confirm:
        errors.append("la confirmation du mail diffère")
    # TODO: verifier avec une regex
    #test si l'adresse mail ou le pseudo n'est pas deja utiliser
    var headers = ["Content-Type: application/json"]
    req.request("http://127.0.0.1:9000/signup", headers, true, HTTPClient.METHOD_POST, JSON.print(data))
    
func show_errors(object):
    for i in object:
        print(i)

func _on_HTTPRequest_request_completed(result, response_code, headers, body):
    var json = JSON.parse(body.get_string_from_utf8())
    if json.result.success == true:
        #GlobalWorld.goto_map("res://core/maps/Map01.tscn")
        pass
    else:
        print(json.result)
