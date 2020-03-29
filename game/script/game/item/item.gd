extends Node2D

export var id = 1
var objet

# Called when the node enters the scene tree for the first time.
func _ready():
    #objet = sqlite.array("SELECT * FROM items WHERE id="+ str(id))[0]
    #console.info(str(objet))
    #$Sprite.texture = load(objet.sprite)
    pass
    
func _on_Area2D_body_entered(body):
    var item = Item.new(objet.sprite, objet.name, objet.price, objet.type, objet.desc)
    Session.items.append(item)
    queue_free()
