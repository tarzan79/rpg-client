extends Resource

class_name Item

enum typeItem {WEAPON=1, OBJECT=2}

export (String) var sprite #la texture
export (String) var name 
export (typeItem) var type
export (float) var price #prix
export (String) var desc

func _init(s, n, p, t, d):
    sprite = s 
    name = n
    price = p
    type = t
    desc= d
