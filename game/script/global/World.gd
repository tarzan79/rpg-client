extends Node
#########################
const SERVER_PORT = 10000
const SERVER_IP = "172.17.0.2"

var Player = preload("res://game/scene/game/player/Hero.tscn")
var Remote_player = preload("res://game/scene/game/player/Remote_player.tscn")
var Boat = preload("res://game/scene/game/player/Boat.tscn")

var startMap = "world/map_01"
var current_map
# Player info, associate ID to data
var players = {}
var selfPeerID


func _ready():      
    var peer = NetworkedMultiplayerENet.new()
    peer.create_client(SERVER_IP, SERVER_PORT)
    get_tree().set_network_peer(peer)
    selfPeerID = get_tree().get_network_unique_id()
    
    console.info("Mon ID: " + str(selfPeerID))
    _load()
    get_tree().connect("network_peer_connected", self, "_player_connected")
    get_tree().connect("network_peer_disconnected", self, "_player_disconnected")
    get_tree().connect("connected_to_server", self, "_connected_ok")
    get_tree().connect("connection_failed", self, "_connected_fail")
    get_tree().connect("server_disconnected", self, "_server_disconnected")
    
func _load():
    _goto_map("res://game/scene/game/map/" + startMap + ".tscn")
    add_player_main()
    _player_connected(selfPeerID)

func _goto_map(path):
    console.info("goto map")
    var scene = ResourceLoader.load(path)
    current_map = scene.instance()
    if $Map.get_child(1):
        $Map.get_child(1).replace_by(current_map)
    else:
        $Map.add_child(current_map)

remote func init_players(data):
    print(data)
    for p in data:
        add_player_remote(p, data[p])

func _player_connected(id):
    rpc_id(1, "enter_to_map", current_map.name)
    rpc_id(id, "register_player", [Session.player, current_map.name])

func _player_disconnected(id):
    players.erase(id) # Erase player from info.

func _connected_ok():
    print("connected ok") # Only called on clients, not server. Will go unused; not useful here.

func _server_disconnected():
    console.info("vous etes deconnecter du serveur")

func _connected_fail():
    console.info("la connection avec le serveur a échoué")
    
func add_player_main():
    var player = Player.instance()
    player.set_network_master(selfPeerID)
    player.set_name(str(selfPeerID))
    current_map.get_node("Players").add_child(player)
    rpc_id(selfPeerID, "register_player", [Session.player, current_map.name])
    
remote func add_player_remote(id, data):
    if !current_map.get_node("Players").has_node(str(id)):
        var player = Remote_player.instance()
        player.set_name(str(id))
        current_map.get_node("Players").add_child(player)
