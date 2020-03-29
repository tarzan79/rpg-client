extends CanvasLayer

var player_ui = preload("res://game/scene/ui/hud/Player_0.tscn")
onready var minimap = $MiniMap
onready var panel_monster_list = $Player_UI/ListEnemy
onready var monster_list = $Player_UI/ListEnemy/Tableau
onready var ui_player = $Player_UI/ATB/HBoxContainer

var players = []
var showed = false

func _ready():
    pass


func add_player_to_ui():
    var player = player_ui.instance()
    ui_player.add_child(player)
    players.append(player)
    return player
    
func del_player_to_ui():
    pass
    
func show_action():
    pass

func hide_action():
    pass
    
func show_monster_list():
    pass
    
func hide_monster_list():
    pass
    
func show_minimap():
    pass
    
func hide_minimap():
    pass
