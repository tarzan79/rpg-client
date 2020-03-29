extends Resource
class_name Player

var main = false
var name:String = "no name"
var lvl:int = 1 setget set_lvl
var xp:int = 0 setget set_xp
var po:int = 0 setget set_po
var pv:int = 20 setget set_pv
var pv_max:int = 50 setget set_pv_max
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
func _init(node_hud, caract):
    if caract != null:
        name = caract.name
        lvl = caract.lvl
        xp = caract.xp
        po = caract.po
        pv = caract.pv
        pv_max = caract.pv_max
        pm = caract.pm
        pm_max = caract.pm_max
        atb = 0
        atb_max = caract.atb
        stats = caract.stats
    hud = node_hud
    hud.atb_gauge.value = atb
    hud.atb_gauge.max_value = atb_max
    hud.pv_max_label.text = str(pv_max)
    hud.pv_gauge.value = pv
    hud.pv_gauge.max_value = pv_max
    hud.pm_max_label.text = str(pm_max)
    hud.pm_gauge.value = pm
    hud.pm_gauge.max_value = pm_max

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
    
func set_atb_zero(v):
    hud.reset_atb(v)
    atb = 0

func pm_increase(value):
    if pm + value >= pm_max:
        pm = pm_max
        hud.set_pm(pm)
    else:
        pm += value
        hud.pm_increase(pm)
    
    
func pm_decrease(value):
    if pm - value <= 0:
        pm = 0
        hud.set_pm(pm)
    else:
        pm -= value
        hud.set_pm(pm)

func atb_increase(value):
    set_atb(atb + value)
    
func set_pv_max(value):
    pass
    
func set_pm_max(value):
    pass

func fire():
    if atb >= atb_max:
        if pm - 2 >= 0:
            set_atb_zero(2)
            pm_decrease(8)
            return true
        else:
            return false
    
    
    
