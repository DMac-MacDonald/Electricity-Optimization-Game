extends AnimatedSprite2D
const QINFO = preload("res://assets/scenes/levels/quick_info_panel.tscn")
var dragging = false
var plant_type
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if dragging and Global.control_mode == "drag":
		position = get_viewport().get_mouse_position()



func _on_button_button_down() -> void:
	dragging = true
	
func _on_button_button_up() -> void:
	dragging = false


func _on_button_pressed() -> void:
	var temp = false
	if Global.control_mode == "cursor":
		for n in get_children():
			if n.is_in_group("info_popup"):
				temp = true
				remove_child(n)
				n.queue_free()
		if !temp:
			var info = QINFO.instantiate()
			add_child(info)
		
func set_color(rgb):
	modulate = rgb
	
func set_type(type):
	plant_type = type
	#"plant_types" : ["Solar", "Nuclear", "Concentrating Solar", "Hydro", "Wind"]
	match type:
		"Solar":
			play("solar")
		"Nuclear":
			play("nuclear")
		"Concentrating Solar":
			play("conc_solar")
		"Hydro":
			play("hydro")
		"Wind":
			play("wind")
		"Coal":
			play("coal")
