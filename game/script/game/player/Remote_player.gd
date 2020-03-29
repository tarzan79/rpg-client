extends KinematicBody2D

var Bullet = preload("res://game/scene/game/action/Laser.tscn")
var class_target = preload("res://addons/curve/curve_node.tscn")


var stat #player data and control
var contact
var occuped
var selected_target
var node_target
slave var pos = Vector2(0,0)

func _ready():
    rset_config("pos", 4)
    var data = Session.player
    position = pos
    
func _process(delta):
    #position = pos
#    if pos.x - position.x > 30 || pos.y - position.y > 30:
#         position = pos
#    if pos.x - position.x < 30 || pos.y - position.y < 30:
#         position = pos
    pass
    
func _action():
    print("action remote player")
   


# créer une ligne de ciblage du joueur vers l'ennemie ciblé
func _make_target(node):
    print("node_target")
    node_target = class_target.instance()
    node_target.width = 6.0
    node_target.set_start($Position2D)
    node_target.set_end(node.get_node("Position2D"))
    add_child(node_target)
    return node
