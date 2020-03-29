extends Node2D

var visibility_subscribe = false

func _ready():
    $HTTPRequest.request("http://127.0.0.1:9000/status")
    $Inscription.hide()

func _on_LinkToSubscribe_pressed():
    $Inscription.show()
    $Connexion.hide()

func _on_LinkToConnect_pressed():
    $Inscription.hide()
    $Connexion.show()


func _on_HTTPRequest_request_completed(result, response_code, headers, body):
    print("code status: "+ str(response_code))
    if response_code != 200:
        $Panel.show()
    
