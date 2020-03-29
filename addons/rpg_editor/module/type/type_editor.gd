tool
extends EditorPlugin

var dock_type
var config


func _init(config):
    self.config = config
    dock_type = preload("res://addons/rpg_editor/module/type/type_editor.tscn").instance()
  