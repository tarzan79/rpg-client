extends KinematicBody2D

var Bullet = preload("res://game/scene/game/action/Laser.tscn")
var class_target = preload("res://addons/curve/curve_node.tscn")
var node_hud = preload("res://game/scene/ui/hud/Player_0.tscn")
var player_class = preload("res://game/script/util/resource/player_class.gd")
onready var ui = $HUD/Player_UI/ATB/HBoxContainer/Player_0

var stat #player data and control
var contact
var occuped
var selected_target
var node_target
slave var pos = Vector2(0,0)

func _process(delta):
    pass

func _ready():
    var data = Session.player
    stat = player_class.new(ui, data)
    rset_config("pos", 4) 
    
    
func _action():
    if contact != null && contact.is_in_group("action"):
        if occuped == false:
            contact.action()
   
func fire(velocity):
    var path
    if selected_target != null:
        path = selected_target.global_position - $Area2D/Nuzzle.global_position
        if stat.fire() == true:
            var a = Bullet.instance()
            a.start($Area2D/Nuzzle.global_position, path.normalized())
            get_parent().add_child(a)
        else:
            print("fail")
    else:
        if stat.fire() == true:
            print("ok")
            var a = Bullet.instance()
            a.start($Area2D/Nuzzle.global_position, velocity.normalized())
            get_parent().add_child(a)
    
func _on_Area2D_body_entered(body):
#    print("Player touch -> " + body.get_name())
    contact = body
    
func _on_Area2D_body_exited(body):
    contact = null
    
func _on_Area2D_area_entered(area):
#    print("Player touch -> " + area.get_name())
    contact = area.get_parent()
    
func _on_Area2D_area_exited(area):
    contact = null

#le timer toute les seconde
func _on_Timer_timeout():
    stat.atb_increase(30)
    stat.pm_increase(2)

#quand un monstre approche
func _on_Area2D3_body_entered(body):
    print("_on_Area2D3_body_entered")
    print(body.player.name)
    if body.is_in_group("monster"):
        get_parent().add_monster_list(body)
        if selected_target == null:
            pass
            selected_target = _make_target(body)

#quand un monstre s'eloigne
func _on_Area2D3_body_exited(body):
    if body.is_in_group("monster"):
        var foe = get_parent().del_monster_list(body)
        if node_target != null:
            if foe != null:
                node_target.queue_free()
                node_target = null
                print(foe)
                selected_target = _make_target(foe)
            else:
                node_target.queue_free()
                node_target = null
                selected_target = null

# créer une ligne de ciblage du joueur vers l'ennemie ciblé
func _make_target(node):
    print("node_target")
    node_target = class_target.instance()
    node_target.width = 6.0
    node_target.set_start($Position2D)
    node_target.set_end(node.get_node("Position2D"))
    add_child(node_target)
    return node


func _on_Timer2_timeout():
    pass # Replace with function body.
