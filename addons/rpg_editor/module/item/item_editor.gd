tool
extends EditorPlugin

var dock_item
var db

func _init(db):
    self.db = db
    print('yeah the fucking bitch 2')
    dock_item = preload("res://addons/rpg_editor/module/item/item_editor.tscn").instance()
    dock_item.get_node("HBoxContainer2/VBoxContainer/VBoxContainer/HBoxContainer/Button").connect("pressed", self, "_open_file")
    dock_item.get_node("FileDialog").connect("file_selected", self, "_edit_file_path")
    dock_item.get_node("HBoxContainer2/VBoxContainer/VBoxContainer2/Button").connect("pressed", self, "new_item")
    dock_item.get_node("HBoxContainer2/VBoxContainer/VBoxContainer2/Button2").connect("pressed", self, "save_item")
    dock_item.get_node("HBoxContainer2/VBoxContainer/VBoxContainer2/Button3").connect("pressed", self, "del_item")
    
    var dropdown = dock_item.get_node("HBoxContainer2/VBoxContainer/VBoxContainer/HBoxContainer3/OptionButton")
    dropdown.add_item("objet")
    dropdown.add_item("arme")
    
    list_item()
    dock_item.get_node("HBoxContainer2/Panel/ItemList").connect("item_selected", self, "_show_item")
    #item_selected

#affiche tout les items dans la liste
func list_item():
    var itemlist = dock_item.get_node("HBoxContainer2/Panel/ItemList")
    itemlist.clear()
    var items = db.array("SELECT * FROM items")
    for i in items:
        itemlist.add_item(i.name)
        
func _show_item(id):
    var s = dock_item.get_node("HBoxContainer2/Panel/ItemList").get_item_text(id)
    var item = db.array("SELECT * FROM items WHERE name='%s'" % [s])
    print(item[0])
    dock_item.get_node("HBoxContainer2/VBoxContainer/VBoxContainer/HBoxContainer7/LineEdit").text = str(item[0].id)
    dock_item.get_node("HBoxContainer2/VBoxContainer/VBoxContainer/HBoxContainer/LineEdit").text = item[0].sprite
    dock_item.get_node("HBoxContainer2/VBoxContainer/VBoxContainer/HBoxContainer2/LineEdit").text = item[0].name
    dock_item.get_node("HBoxContainer2/VBoxContainer/VBoxContainer/HBoxContainer3/OptionButton").selected = item[0].type
    dock_item.get_node("HBoxContainer2/VBoxContainer/VBoxContainer/HBoxContainer4/LineEdit").text = item[0].price
    dock_item.get_node("HBoxContainer2/VBoxContainer/VBoxContainer/HBoxContainer6/TextEdit").text = item[0].desc
    show_image_item()
    
func _open_file():
    dock_item.get_node("FileDialog").popup()
    
func _edit_file_path(path):
    dock_item.get_node("HBoxContainer2/VBoxContainer/VBoxContainer/HBoxContainer/LineEdit").text = path
    show_image_item()
    
func new_item():
    print("new item")
    dock_item.get_node("HBoxContainer2/VBoxContainer/VBoxContainer/HBoxContainer/LineEdit").text = ""
    dock_item.get_node("HBoxContainer2/VBoxContainer/VBoxContainer/HBoxContainer2/LineEdit").text = ""
    dock_item.get_node("HBoxContainer2/VBoxContainer/VBoxContainer/HBoxContainer3/OptionButton").selected = -1
    dock_item.get_node("HBoxContainer2/VBoxContainer/VBoxContainer/HBoxContainer4/LineEdit").text = ""
    dock_item.get_node("HBoxContainer2/VBoxContainer/VBoxContainer/HBoxContainer6/TextEdit").text = ""
    dock_item.get_node("HBoxContainer2/VBoxContainer/Panel2/ScrollContainer/Sprite").texture = null
    
func save_item():
    print("save item")
    var name = dock_item.get_node("HBoxContainer2/VBoxContainer/VBoxContainer/HBoxContainer2/LineEdit").text
    var type = dock_item.get_node("HBoxContainer2/VBoxContainer/VBoxContainer/HBoxContainer3/OptionButton").selected
    var sprite_file = dock_item.get_node("HBoxContainer2/VBoxContainer/VBoxContainer/HBoxContainer/LineEdit").text
    var price = dock_item.get_node("HBoxContainer2/VBoxContainer/VBoxContainer/HBoxContainer4/LineEdit").text
    var desc = dock_item.get_node("HBoxContainer2/VBoxContainer/VBoxContainer/HBoxContainer6/TextEdit").text
    db.query("INSERT INTO items (sprite, name, desc, type, price) VALUES ('%s', '%s', '%s', '%s', '%s');" % [sprite_file, name, desc, type, price]);
    list_item()
    
func del_item():
    var id = dock_item.get_node("HBoxContainer2/VBoxContainer/VBoxContainer/HBoxContainer7/LineEdit").text
    db.query("DELETE FROM items WHERE id=%s" %[id])
    list_item()
    
func edit_item():
    pass
    
func show_image_item():
    var path = dock_item.get_node("HBoxContainer2/VBoxContainer/VBoxContainer/HBoxContainer/LineEdit").text
    var texture = ImageTexture.new()
    texture.load(path);
    dock_item.get_node("HBoxContainer2/VBoxContainer/Panel2/ScrollContainer/Sprite").texture = texture
    
func region_change():
    pass

func generate_dropdown_item_type():
    pass
