extends HBoxContainer

onready var name_label = $Bar_ATB/HBoxContainer/Type
onready var atb_gauge = $Bar_ATB/Gauge

onready var pv_label = $Bar_PV/HBoxContainer/HBoxContainer/Value
onready var pv_gauge = $Bar_PV/Gauge
onready var pv_max_label = $Bar_PV/HBoxContainer/HBoxContainer/ValueMax


onready var pm_label = $Bar_PM/HBoxContainer/HBoxContainer/Value
onready var pm_gauge = $Bar_PM/Gauge
onready var pm_max_label = $Bar_PM/HBoxContainer/HBoxContainer/ValueMax

onready var tween_atb = $Bar_ATB/Tween
onready var tween_pm = $Bar_PM/Tween
var animated_atb = 0
var animated_pm = 0

func _process(delta):
    atb_gauge.value = animated_atb
    pm_gauge.value = animated_pm
    
func set_pv(value):
    pv_gauge.value = value
    pv_label.text = str(pv_gauge.value)

func pm_increase(value):
    pm_gauge.value += value
    pm_label.text = str(pm_gauge.value)
    tween_pm.interpolate_property(self, "animated_pm", animated_pm, value, 1, Tween.TRANS_LINEAR, Tween.EASE_IN)
    if not tween_pm.is_active():
        tween_pm.start()
    
func set_pm(value):
    pm_gauge.value = value
    animated_pm = value
    tween_pm.remove_all()
    set_atb(value)
    
func set_atb(value):
    atb_gauge.value += value
    tween_atb.interpolate_property(self, "animated_atb", animated_atb, value, 1, Tween.TRANS_LINEAR, Tween.EASE_IN)
    if not tween_atb.is_active():
        tween_atb.start()
        
func reset_atb(v):
    atb_gauge.value = 0
    animated_atb = 0
    tween_atb.remove_all()
    
func is_ready():
    $Sprite.show()
#	$Panel2.show()
