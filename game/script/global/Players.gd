extends Node
#le noeud qui reunit les players


var Player = preload("res://game/scene/game/player/Hero.tscn")
var UI = preload("res://game/scene/ui/hud/Player_0.tscn")
var list_foe = [] # liste des adversaire de l'equipe

func _ready():
    pass 

func add_player(data):
    var ui = UI.instance()
    get_parent().get_node("HUD/Player_UI/ATB/HBoxContainer").add_child(ui)
    
    var player = Player.instance()
    player.init(ui, data)
    add_child(player)
    
func del_player(node):
    node.queue_free()
    
func add_monster_list(value):
    print("add monster list")
    if !list_foe.has(value):
        list_foe.append(value)
        #update_monster_list()
    
func del_monster_list(value):
    var id = list_foe.find(value)
    print(id)
    if id >= 0:
        print("ennemi supprimer")
        list_foe.remove(id)
        update_monster_list()
        if list_foe.size() >= 1:
            print("plus d'un monstre'")
            return list_foe[0]
        else:
            print("pas de monstre")
            return null

func update_monster_list():
    print("update list foe")
    var item_list = $Player/HUD/Player_UI/ListEnemy/Tableau
    item_list.clear()
    if list_foe.size() >= 1:
        for i in list_foe:
            item_list.add_item(i.player.name)

func add_item(id):
    #var objet = sqlite.query("SELECT * FROM items WHERE id="+id)
    #Session.items.append(objet)
    pass

func del_item(id):
    Session.items.remove(id)
    
