tool
extends EditorPlugin

var SQL
var PATH

var config

func _init(config):
    self.config = config
    SQL = load(config.sqlite.driver)
    PATH = config.sqlite.bdd

func test_db():
    var dir = Directory.new()
    var file = File.new()
    if !dir.dir_exists("res://game/database/"):
        dir.make_dir("res://game/database/")
    if !file.file_exists(PATH):
        file.open(PATH, File.WRITE)
        file.close()
    return true

func query(query):
    var db = SQL.new()
    db.open_db(PATH)
    var result = db.query(query)
    db.close()
    print(str(result) + ":" + str(query))
    return result

func array(query):
    var db = SQL.new()
    db.open_db(PATH)
    print(query)
    var list = db.fetch_array(query)
    db.close()
    return list

func count(query):
    var db = SQL.new()
    db.open_db(PATH)
    var list = db.fetch_array(query)
    print(str(list[0]["COUNT(*)"]) + ":" + str(query))
    db.close()
    return list[0]["COUNT(*)"]
