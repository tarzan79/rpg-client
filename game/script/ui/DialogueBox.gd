extends Panel

var text
var i

func _ready():
    pass
    get_node("/root/World/CurrentMap/Player").occuped = true
    
func _process(delta):
    if get_tree().get_root().get_node("World/CurrentMap/Player").occuped == true:
        if Input.is_action_just_pressed("ui_select"):
            if typeof(text) == TYPE_ARRAY:
                if i == text.size()-1:
                    #hide()
                    get_node("/root/World/CurrentMap/Player").occuped = false
                    queue_free()
                else:
                    i += 1
                    $Text.clear()
                    $Text.add_text(text[i])
            else:
                get_node("/root/World/CurrentMap/Player").occuped = false
                hide()

func diag(text1):
    text = text1
    $Text.clear()
    show()
    if typeof(text) == TYPE_ARRAY: # pour des dialogue de plusieurs phrases
        i = 0
        $Text.add_text(text[i])
    else:
        $Text.add_text(text)

#func _on_DialogueBox_gui_input(event):
#    if (event.button_mask == 1): # si c'est un click gauche
#        if typeof(text) == TYPE_ARRAY:
#            if i == text.size()-1:
#                hide()
#            else:
#                i += 1
#                $Text.clear()
#                $Text.add_text(text[i])
#        else:
#            hide()
#            get_node("/root/World/CurrentMap/Player").occuped = false
