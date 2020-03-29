extends Node2D

func _ready():
    pass

func _process(delta):
    #$ParallaxBackground/ParallaxLayer.set_motion_offset(Vector2(0,0))
    $ParallaxBackground/ParallaxLayer.motion_offset.x += 1
    $ParallaxBackground/ParallaxLayer2.motion_offset.x += 2
    $ParallaxBackground/ParallaxLayer3.motion_offset.x += 3
    $ParallaxBackground/ParallaxLayer4.motion_offset.x += 4
    $ParallaxBackground/ParallaxLayer5.motion_offset.x += 5


func _on_Button_start_pressed():
    #Global.goto_scene("res://game/scene/game/world/map/Map01.tscn")
    #resource_loader.goto_scene("res://game/scene/launcher/connect.tscn")
    pass

func _on_Button_quitter_pressed():
    get_tree().quit()
