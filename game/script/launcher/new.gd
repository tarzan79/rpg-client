extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
#   $HTTPRequest.request("https://api.github.com/repos/tarzan79/prototype/commits")
    pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass
func _on_HTTPRequest_request_completed(result, response_code, headers, body):
    var json = JSON.parse(body.get_string_from_utf8())

    for item in json.result:
        var label = Label.new()
        label.set_text(item.commit.message)
        print(item.commit.message)
        $Panel/MarginContainer/ScrollContainer/VBoxContainer.add_child(label)
