extends Control

var regex

func _ready():
    regex = RegEx.new()
    regex.compile(".*?time=(.*?ms).*")

func _on_Timer_timeout():
    var output = []
    OS.execute('ping', ['-c', '1', 'godotengine.org'], true, output)
    var output2 = PoolStringArray(output)
    var result = regex.search(output2.join(" "))
    if result:
        #console.info("ping " + result.get_string(1))
        $VBoxContainer/HBoxContainer/Label2.text = result.get_string(1)
