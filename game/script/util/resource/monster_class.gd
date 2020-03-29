extends Resource
class_name Monster

export var name:String = "name"

var lvl:int = 1 setget set_lvl
var xp:int = 0 setget set_xp
var po:int = 0 setget set_po
var pv:int = 20 setget set_pv
var pv_max:int = 20 setget set_pv_max
var pm:int = 15 setget set_pm
var pm_max:int = 50 setget set_pm_max
var atb:int = 0 setget set_atb
var atb_max:int = 15
var stats = {
        "attack": 10,
        "defence": 10,
        "vitesse": 10,
        "magik_attack": 10,
        "magik_defence": 10
       }  
    
var hud  

# Called when the node enters the scene tree for the first time.
func _init(v):
    hud = v
#	hud.atb_max_label.text = str(pv_max)
#	hud.atb_gauge.value = atb
#	hud.atb_gauge.max_value = atb_max
#	hud.pv_max_label.text = str(pv_max)
    hud.value = pv
    hud.max_value = pv_max
#	hud.pm_max_label.text = str(pm_max)
#	hud.pm_gauge.value = pm
#	hud.pm_gauge.max_value = pm_max

func set_lvl(v):
    lvl = v

func set_xp(v):
    xp = v
    
func set_po(v):
    po = v
    
func set_pv(v):
    pv = v
    
func set_pm(v):
    pm = v
    
func set_atb(v):
    atb = v
    hud.set_atb(atb)
    if atb >= atb_max:
        hud.is_ready()
    
func set_atb_zero():
    atb = 0

func pm_increase(value):
    if pm + value >= pm_max:
        print("pm up 2")
        pm = pm_max
    else:
        pm += value
    
    
func pm_decrease(value):
    if pm - value <= 0:
        pm = 0
    else:
        pm -= value

func atb_increase(value):
    set_atb(atb + value)
    
func pv_increase(value):
    if pv + value >= pv_max:
        print("pv up 2")
        pv = pv_max
        hud.value = pv
    else:
        pv += value
        hud.value = pv
    
func pv_decrease(value):
    print(pv)
    print(value)
    if pv - value <= 0:
        pv = 0
        hud.value = pv
        return true
    else:
        pv -= value
        hud.value = pv
        return false
    
func set_pv_max(value):
    pass
    
func set_pm_max(value):
    pass
