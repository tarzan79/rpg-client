extends Node2D

export var active = false
export var map_destination = ""

func _ready():
    map_destination = load("res://core/maps/" + map_destination + ".tscn")

func action():
    active = !active
    if active == true:
        $Sprite/AnimationPlayer.play("open")
        $AudioStreamPlayer.play()
        $CollisionPolygon2D.set_disabled(false)
        $CollisionPolygon2D2.set_disabled(true)
    else:
        $Sprite/AnimationPlayer.play("close")
        $AudioStreamPlayer2.play()
        $CollisionPolygon2D.set_disabled(true)
        $CollisionPolygon2D2.set_disabled(false)

func _on_Area2D_area_entered(area):
    var level = get_node("/root/Global/Map")
    level.set_name("truc") # faut changer de nom pour que le nom soit dispo
    #level.queue_free()
    level.call_deferred("free")
    # Add the next level
    var next_level = map_destination.instance()

    get_tree().get_root().get_node("Global").add_child(next_level)
    next_level.call_deferred("set_name", "Map")
